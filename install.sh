#!/usr/bin/env bash

minikube start
helm init
helm install --name my-release -f values.yaml stable/jenkins
printf $(kubectl get secret --namespace default my-release-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
minikube ip
k get svc -o wide