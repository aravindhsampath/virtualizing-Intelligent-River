#!/bin/bash
echo -e "************************************************************************************\n" >> log;
date >> log;
uname -a >> log;
echo -e "************************************************************************************\n" >> log;
cat /proc/cpuinfo >> log;
echo -e "************************************************************************************\n" >> log;
free -m >> log;
echo -e "************************************************************************************\n" >> log;
df -h >> log;
echo -e "************************************************************************************\n" >> log;
echo "Starting the CPU tests at  $(date)" >> log;
echo "Starting the CPU tests at  $(date)";
echo "Calculation of prime numbers up to a value in different CPU/Thread configurations" >> log;
echo -e "\n" >> log;
/usr/bin/time -p sh -c 'sysbench --test=cpu --num-threads=1 --cpu-max-prime=20000 run; \
sysbench --test=cpu --num-threads=2 --cpu-max-prime=30000 run; \
sysbench --test=cpu --num-threads=4 --cpu-max-prime=30000 run; \
sysbench --test=cpu --num-threads=8 --cpu-max-prime=30000 run; \
sysbench --test=cpu --num-threads=16 --cpu-max-prime=30000 run; \
sysbench --test=cpu --num-threads=32 --cpu-max-prime=30000 run; \
sysbench --test=cpu --num-threads=64 --cpu-max-prime=30000 run' &> log;
echo "Completed the CPU tests with prime no gen at  $(date)" >> log;
echo "Completed the CPU tests with prime no gen at  $(date)";
echo -e "\n" >> log;
echo -e "************************************************************************************\n" >> log;

echo "large number of threads competing for some set of mutexes" >> log;
echo -e "\n" >> log;
/usr/bin/time -p sh -c 'sysbench --num-threads=2 --test=threads run; \
sysbench --num-threads=4 --test=threads run; \
sysbench --num-threads=8 --test=threads run; \
sysbench --num-threads=16 --test=threads run; \
sysbench --num-threads=32 --test=threads run; \
sysbench --num-threads=64 --test=threads run; \
sysbench --num-threads=128 --test=threads run' &> log;
echo -e "\n" >> log;
echo "Completed multithreaded CPU tests at  $(date)" >> log;
echo "Completed multithreaded CPU tests at  $(date)";
echo -e "************************************************************************************\n" >> log;

#echo "Installing UnixBench"
#wget https://byte-unixbench.googlecode.com/files/UnixBench5.1.3.tgz
#tar -zxf UnixBench5.1.3.tgz
cd UnixBench/pgms;
pwd;
echo "Executing Dhrystone 2 Benchmark for 2 minutes . . " >> log;
/usr/bin/time -p ./dhry2reg 120 &> log;
echo -e "\n" >> log;
echo "Completed Dhrystone 2 CPU tests at  $(date)" >> log;
echo "Completed Dhrystone 2 CPU tests at  $(date)";
echo -e "\n" >> log;
echo "Executing Whetstone Benchmark 4 times . . " >> log;
./whetstone-double &> log;
./whetstone-double &> log;
./whetstone-double &> log;
./whetstone-double &> log;
echo -e "\n" >> log;
echo "Completed Whetstone CPU tests at  $(date)" >> log;
echo "Completed Whetstone CPU tests at  $(date)";
echo -e "\n" >> log;
for ((n=0;n<500;n++))
do
	openssl genrsa ;
done &> rsalog;
echo "**** CPU Benchmark Complete !  ***" >> log;
echo "Completed the CPU tests at  $(date)";
echo "Completed the CPU tests at  $(date)" >> log;




