# RabbitMQ service

This is a very basic non-production configurations for rabbitMQ (even if we
use it for production right now)

Move to an operator is a future work to be done see:
https://mitigasolutions.atlassian.net/browse/MT-3789

## Autoscaling

Kubernetes pod autoscaler based on rabbitMQ messages is also a non production
approach using a modification of this simple script: 
https://github.com/onfido/k8s-rabbit-pod-autoscaler
