#include<iostream>
#include<chrono>
#include<vector>
#include<stdlib.h>
#define kph 0.27
typedef double speed_t;
typedef double distance;

/*
 * Average velocity not curve 150 kph
 * average velocity curve 80 kph
 */

void race(std::vector<distance> curves, distance len, size_t laps){
	speed_t speed = 0, len_now = 0;
	speed_t ace = 30;
	size_t i = 0, size = curves.size();
	int ii = 0;
	while(laps > 0){
		auto start = std::chrono::steady_clock::now();
		while(std::chrono::steady_clock::now() - start < std::chrono::seconds(1));
		if(speed < 140)
			speed += ace;
		speed = (rand() % int(speed-5)) + speed;
		len_now += speed * kph;
		std::cout << ii++ << "segs, vel:  " << speed << ", distance: " << len_now << '\n';
		if(len_now > curves[i]){
			std::cout << "optimize speed car" << '\n';
			speed = 60;
			if(++i == size){
				i = 0;
			}
		}
		if (len_now >= len){
			len_now -= len;
			--laps;
		}
	}
}

main(){
	std::vector<distance> Arr = {500,690,1200,1692, 1800};
	race(Arr,2000,3);
}
