#include <iostream>
#include <fstream>
#include <vector>

int main() {
    const std::string inputFileName = "poly.txt";
    const std::string outputFileName = "diff_poly.txt";

    // Preverjamo, če nam v redu odpre datoteko
    std::ifstream inputFile(inputFileName);
    if (!inputFile.is_open()) {
        std::cerr << "Ne odpre datoteke " << inputFileName << std::endl;
        return 1;
    }

    // Določimo število točk iz datoteke
    int N;
    inputFile >> N;

    // Definiramo vektorja x in f preko podatkov iz datoteke
    std::vector<double> x(N);
    std::vector<double> f(N);
    for (int i = 0; i < N; i++) {
        double ID, value1, value2;
        char colon; 
        inputFile >> ID >> colon >> value1 >> value2;
        x[i] = value1;
        f[i] = value2;
    }

    // Definiramo h
    double h = x[1] - x[0];

    // Definiramo odvode in jih shranimo v vektor
    std::vector<double> odvodi;
    odvodi.push_back((-3 * f[0] + 4 * f[1] - f[2]) / h); // prvi odvod

    for (int i = 1; i < (N - 1); i++) {
        double sredina = (f[i + 1] - f[i - 1]) / (2 * h);
        odvodi.push_back(sredina);
    }

    odvodi.push_back((3 * f[N - 1] - 4 * f[N - 2] + f[N - 3]) / h); // zadnji odvod

    // Zapis odvodov
    std::ofstream outputFile(outputFileName);
    for (double value : odvodi) {
        outputFile << value << '\n';
    }
    outputFile.close();
    inputFile.close();

    return 0;
}
