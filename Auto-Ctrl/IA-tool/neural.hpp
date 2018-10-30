#include <iostream>
#include <vector>
#include <math.h>
#include <random>
#include <fstream>

using namespace std;

class Network{
    public:
        Network(vector< int >& layers);
        ~Network();

        void Mostrar_Pesos();
        void Mostrar_Output();
        void Aprendizaje_Prop_Atras(vector< vector < double > >& inputs, vector < vector < double > >& outputs);
        vector<double> Calcular_Output(vector < double >& inputs);
        double sigmoide(double z);
        double sigmoide_prima(double x);
				void train(vector<vector<double>> input, vector<vector<double>> output);

    private:
        int n_capas;
        vector<vector<vector<double>>> Weight;
        vector<vector<double>> in;
        vector<vector<double>> a;
        vector<vector<double>> delta;

};

#define ALPHA 0.8

Network::Network(vector< int >& layers){
    n_capas = layers.size();
    srand (time(NULL));
    double r;

    for(int k = 0; k < n_capas-1; k++){
        Weight.push_back({});
        for(int j = 0; j < layers[k]; j++){
            Weight[k].push_back({});
            for(int i = 0; i < layers[k+1]; i++){
                r = rand()%200-100;
                r = r/100;
                Weight[k][j].push_back(r);
            }
        }
    }
    for(int k = 0; k < n_capas; k++){
        a.push_back({});
        in.push_back({});
        delta.push_back({});
        for(int j = 0; j < layers[k]; j++){
            a[k].push_back(j);
            in[k].push_back(j);
            delta[k].push_back(j);
        }
    }
}

Network::~Network(){};

void Network::Mostrar_Pesos(){
    cout << endl << "Pesos";
    for(int k = 0; k < Weight.size(); k++){
        cout << endl << "[" << k << "]   ";
        for(int j = 0; j < Weight[k].size(); j++){
            cout << "[" << j << "](";
            for(int i = 0; i < Weight[k][j].size()-1; i++){
                cout << Weight[k][j][i] << ", ";
            }
            cout << Weight[k][j][Weight[k][j].size()-1] << ")    ";
        }
    }
    cout << endl;
}

void Network::Mostrar_Output(){
    cout << endl << "Output";
    for(int k = 0; k < a.size(); k++){
        cout << endl << "[" << k << "]   ";
        for(int j = 0; j < a[k].size(); j++){
            if(k != a.size()-1)
                cout << "[" << j << "](" << a[k][j] << ")    ";
            else
                cout << "\033[1;44m[" << j << "](" << a[k][j] << ")\033[0m    ";
        }
    }
    cout << endl;
}

double Network::sigmoide(double x){
    return (1.0/(1+exp(-1*x)));
}

double Network::sigmoide_prima(double x){
    return (exp(x)/((exp(x)+1)*(exp(x)+1)));
}

vector<double> Network::Calcular_Output(vector < double >& input){
    vector < double > salidas (a[a.size()-1].size());
    for(int j = 0; j < a[0].size(); j++){
        a[0][j] = input[j];
    }
    for(int l = 1; l < a.size(); l++){
        for(int i = 0; i < a[l].size(); i++){
            in[l][i] = 0;
            for(int j = 0; j < a[l-1].size(); j++){
                in[l][i] += Weight[l-1][j][i]*a[l-1][j];
            }
            a[l][i] = sigmoide(in[l][i]);
        }
    }
    salidas = a[a.size()-1];
    return salidas;
}


void Network::Aprendizaje_Prop_Atras(vector< vector < double > >& inputs, vector<vector<double>>& outputs){
    double suma;
    int contador = 0;
    double ERROR = 200;
    double error;
    while(ERROR > 0.0001 and contador < 10000){
        ERROR = 0;
        for(int e = 0; e < inputs.size(); e++){
            Calcular_Output(inputs[e]);
            for(int i = 0; i < a[n_capas-1].size(); i++){
                error = (outputs[e][i]-a[a.size()-1][i]);
                delta[delta.size()-1][i] = sigmoide_prima(in[in.size()-1][i])*error;
                ERROR += error*error;
            }
            for(int l = n_capas-2; l >= 0; l--){
                for(int j = 0; j < a[l].size(); j++){
                    suma = 0;
                    for(int i = 0; i < Weight[l][j].size(); i++){
                        suma = suma + Weight[l][j][i]*delta[l+1][i];
                    }
                    delta[l][j] = sigmoide_prima(in[l][j])*suma;
                    for(int i = 0; i < a[l+1].size(); i++){
                        Weight[l][j][i] = Weight[l][j][i] + ALPHA*a[l][j]*delta[l+1][i];
                    }
                }
            }
        }
        ERROR *= 0.5*(1.0/inputs.size());
        contador ++;
    }
}

void Network::train(vector<vector<double>> input, vector<vector<double>> output){
	this->Aprendizaje_Prop_Atras(input,output);
}

