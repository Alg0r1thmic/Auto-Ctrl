#include<iostream>
#include"neural.hpp"
#include<chrono>
#include<vector>
#include<stdlib.h>

#define kph 0.27
typedef double speed_t;

/*
 * Average velocity not curve 250 kph
 * average velocity curve 80 kph
 */

void race(std::vector<double> &vel, std::vector<double> &angles, std::vector<double> &curves, double len, size_t laps, size_t index){
	speed_t speed = 0, len_now = 0;
	speed_t ace = 30;
	size_t j = 0, size = curves.size(), cars = vel.size();
	int ii = 0;
	vector<int> capas = {3,1};
	Network red(capas);
	vector<vector<double>> train1 = {{3.4,6.4,1.2},{9.2,4.7,0.4},{8.0,4.5,0.3},{6.0,4.0,1.0},{5.0,5.0,3.7},{10.0,5.0,0.67},{10.5,4.0,2.3},{10.0,6.8,0.4},{8.0,5.0,6.0},{12.0,10.0,4.7},{9.5,6.0,0.96}};
	vector<vector<double>> train2 = {{2.25882},{0.20434},{0.16875},{0.6666667},{3.7000},{0.33500},{0.876190},{0.272},{3.75},{3.916666},{0.616315}};
	vector<double> distances(cars,0), v_cars(cars,0);
	red.train(train1,train2);
	red.Mostrar_Pesos();
	while(laps > 0){
		auto start = std::chrono::steady_clock::now();
		while(std::chrono::steady_clock::now() - start < std::chrono::seconds(1));
		std::cout << ii++ << "segs, vel:  " << v_cars[index] << ", distance: " << distances[index] << ", curve coming: " << curves[j] << '\n';
		for(size_t i = 0; i < cars; ++i){
			if(distances[i] + 300 > curves[j]){
				if(index == i){
					vector<double> input = {v_cars[index]/10,distances[index]/10,(angles[j]-60)/10};
					input = red.Calcular_Output(input);
					std::cout << 2.0 *(double)input[0] << '\n';
					v_cars[index] += (2.0 * double (input[0])) - 10;
					std::cout << "optimize speed car" << '\n';
				}
				v_cars[i] -= rand() % 10 + int(distances[i] - curves[j])/10;
			}
			else{
				if(v_cars[i] < 250)
					v_cars[i] += vel[i];
			}
			v_cars[i] += rand() % 11 - 5;
			distances[i] += v_cars[i] * kph;
			if(distances[i] >= len){
				distances[i] -= len;
				if(i == index)
				--laps;
			}

		}
		if(distances[index] > curves[j])
			if(++j == size)
				j = 0;
	}
}

main(){
	std::vector<double> curves = {1000,1550,2700,3050,4400,5000,6800,7100,8600,9400};
	std:vector<double> angles = {100.4,80  ,91.4,120.2,76.0,60.3,110.0,121.0,89.0,140.0};
	std::vector<double> vel = {37.5,38.2,37.5,39.3,38.2,28.6,39.3,38.6};
	race(vel,angles,curves,10000,3,0);
}
