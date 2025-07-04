
# Performance Evaluation of k3s Container Orchestration for Edge Computing in IoT Applications

This repo contains the code for the paper
"Performance Evaluation of k3s Container Orchestration for Edge Computing in IoT Applications" by
Juan Faria and Johnny Marques.

# How this repo is organized

All the dockerfiles, custom suites and configs to run the experiments are in the `dockerfiles` folder. The persistent volume setup and claim used to run the experiments in K3s are in the `kubernetes\setup` folder. The pods containing the experiments are in the `kubernetes\pods` folder. The test results are in the `results-data` folder.

# About the results

The results are divided into three main categories: bare-metal, docker and k3s. It is also related to three types of test: CPU, Memory and Disk (IO).

Each category contains the results of the experiments run in that environment. The results summary for each category and type are in CSV format and can be easily be seen inside each folder. The raw results can be seen in the folder `test-logs` inside each `category\type` folder.
