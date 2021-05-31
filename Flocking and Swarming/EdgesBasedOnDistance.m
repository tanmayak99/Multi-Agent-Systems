% This code simulates consensus algorithm for N agents psudorandomly uniformly
% spawned in a disc of radius 0.5 units
% The information flow between the agents depends on their relative
% distances. So the adjacency matrix of the toplogy keeps changing.
% Any two agents within a distance 'r' can transfer and receive the info
% and hence constructs and edge.

clc;
clear all;

N = input('Number of agents in the simulation? ');
r = input('What is the desired distance for information flow? ');
ifPlot = input('Do you want the simulation plots? 0/1 ');

% ifPlot -> 1 => plot of trajectories of all tge agents will be shown
% else otherwise
f = runSim(N ,r, ifPlot);
