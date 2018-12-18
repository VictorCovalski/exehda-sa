# What is EXEHDA-SA?
*EXEHDA-SA* is a distributed event-driven architectural model which takes into account the operating assumptions and design strategies of the *EXEHDA* middleware. The middleware is focused on providing support to distributed, mobile, and context-aware applications. It creates and manages a ubiquitous environment formed by distributed execution cells, and promotes the execution of applications in this environment. The EXEHDA defines that the physical infrastructure resources are mapped to three basic abstractions, which are used in the composition of the ubiquitous environment.

In general, *EXEHDA-SA* consists of an architectural model that, in addition to using these formalizations already defined by the EXEHDA middleware, it proposes the application of the Situational Awareness concepts. Consequently, it strives to support the IoT demands of scalability, flexibility, autonomy, and heterogeneity, providing a transversal modularity. The advantage of the proposed modular design is that the component modules are only deployed when necessary, which is opportune for restricted environments, such as embedded systems.


The purpose of this repository is to provide readers and researchers a reproducible prototype for the evaluation scenarios described in our paper. Those scenarios are applied on Internet of Things.

We have divided our repository into two directories: technologies and docker. The first provides some configurations files which could be easily applied through the different technologies used for the prototype of *EXEHDA-SA*. The second leverage by Docker as a way of creating a reproducible and containerized environment, thus avoiding scenarios such as "it runs on my machine".

## TL;DR
To get the docker environment up and running. PS.: pay attention for scalability scenario which has two configuration files: docker-stack-vertical.yml and docker-stack-horizontal.yml.
```
git clone https://github.com/VictorCovalski/exehda-sa.git
cd exehda-sa/docker/$desired-case-study ($desired-case-study is one of "flexibility-default", "flexibility-change" or "scalability")
docker stack deploy -c docker-stack.yml stack_name
```
Please wait a minute or two for the setup process before going to the next steps. (Logstash has a slow boot time). If necessary, it is possible to use the 'docker logs' command to fetch the logs of a container.


## Environment Description

flexibility-default - SmartLogger-A and SmartLogger-B with all modules enabled.

flexibility-change - SmartLogger-A with all modules enabled and SmartLogger-B only forwarding events.

scalability (docker-stack-horizontal.yml) - SmartLogger-A with all modules enabled and SmartLogger-B only forwarding events. Each SmartLogger node with 2 CPU cores. 

scalability (docker-stack-vertical.yml) - SmartLogger-A with two nodes (A-1 and A-2) and SmartLogger-B only forwarding events. 

Each case study is working with the generator logstash plugin. 

If desired, the user can enable the http logstash input plugin and adjust the ports mapping through docker-stack.yml to ingest desired events.

## Sending individual events
Sample firewall logs can be found in the *sample* file. To issue an event you can send it to either Smartlogger-A or Smartlogger-B for parsing.

For this you can use an HTTP client such as [Postman](https://www.getpostman.com/), simply send the log in the payload of the request.

Example - Pushing one raw event to Smartlogger-A with Curl
```
EVENT=$(head -n1 sample)
curl -XPOST "http://localhost:8080/" -d $EVENT
```

Example - Pushing one raw event to Smartlogger-B (forward only)
```
EVENT=$(head -n1 sample)
curl -XPOST "http://localhost:8082/" -d $EVENT
```

## Sending a batch of events
We provide an easy to use Python 3 script for pushing events to the Smartlogger of your choice. Please refer to the table below.

So if we wanted to push events to smartlogger-b for processing before they are correlated. Don't forget to enable the http input in the desired SmartLogger and map the ports in docker-stack.yml.
```
python3 event-pusher.py "http://localhost:8082/" sample
```

## Instructions for docker installation

[Install Docker](https://docs.docker.com/install/)

## Technologies used

*Docker 18.06.1-ce* for creating the environment.

*Logstash 6.4.0* for parsing logs and adding needed metadata.

*CorReactive 0.1a* for correlating security events and issuing alerts.

*Python 3.6/3.7* for outputting alerts generated from CorReactive alerts.

## About the authors of this repository
*MsC. Ricardo Borges Almeida*

*B.S. Victor Renan Covalski Junes* 
