
clear;
clc;

addpath('activation_functions');
addpath('solver');
addpath('left_func');
tspan = [0 5];
options=odeset('RelTol',1e-3,'AbsTol',1e-3);


% Diff_gamma_norm;
Diff_AF_norm;