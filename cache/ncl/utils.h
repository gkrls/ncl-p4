#ifndef _UTILS_H_
#define _UTILS_H_

#include <math.h>
#include <vector>

double inline mean(const std::vector<unsigned>& data) {
    double sum = 0.0;
    for (double value : data) {
        sum += value;
    }
    return sum / data.size();
}

// Function to compute variance
double inline variance(const std::vector<unsigned>& data, double mean) {
    double sum_squared_diff = 0.0;
    for (double value : data) {
        double diff = value - mean;
        sum_squared_diff += diff * diff;
    }
    return sum_squared_diff / (data.size() - 1); // Use data.size() for population variance
}

// Function to compute standard deviation
double inline stdev(const std::vector<unsigned>& data) {
    double var = variance(data, mean(data));
    return sqrt(var);
}

#endif