# CS548_Kubernetes
CS-548: Cloud-native Software Architectures Computer Science Department • University of Crete. Assignment 2: Kubernetes.

## Part1:

  - a) Adding user with ```sudo usermod -aG docker $USER && newgrp docker``` Start minikube ```minikube start``` and then start the pod ```kubectl apply -f nginx-pod.yaml```.
  - b) Forward port 80 locally ```kubectl port-forward nginx-pod 8080:80 &``` using ```curl http://localhost:8080``` we can see that we can access the site.
  - c) To access logs we can use ```kubectl logs nginx-pod```.
  - d) To open a shell session inside the nginx container we can use ```kubectl exec -it nginx-pod -- sh```. When inside the container we can run ```vi usr/share/nginx/html/index.html``` and change the first sentence of the default page to "Welcome to MY nginx!". Then save and ```curl http://localhost:8080``` we can see the changes.
  - e) To download the web page of the container we can use ```kubectl cp nginx-pod:/usr/share/nginx/html/index.html ./original.html```. Then we change it and replace the message with "My Message!" to a file called ```new.html``` and upload it to the container with ```kubectl cp new.html nginx-pod:/usr/share/nginx/html/index.html```. Now we can reload the page or use ```curl http://localhost:8080``` and see the changes.
  - f) By running ```kubectl delete -f nginx-pod.yaml``` stop the Pod and remove the manifest from Kubernetes. We can check with ```kubectl get pods``` we get ```No resources found in default namespace.```.

*Part1 files are in CS548_Kubernetes/part1-NginxPod/*
## Part2:

  - To start the job go in part2-ConfigMap directory and and create the ConfigMap with ```kubectl apply -f website-configmap.yaml``` then use ```kubectl apply -f build-website-job.yaml``` to build the website the *build-website-job.yaml* will use the *website-configmap.yaml* YAML manifest ConfigMap to build the site.
  - To confirm that the Job completed successfully we can use ```kubectl describe job build-website-job``` it provides a detailed output about the status of the job i got: ```Normal  SuccessfulCreate  5m35s  job-controller  Created pod: build-website-job-8d8cm  Normal  Completed  4m39s  job-controller  Job completed```. I also did ```kubectl get pods``` to find the job pod and then i did ```kubectl logs <build-website-job-name>``` to see logs.

*Part2 files are in CS548_Kubernetes/part2-ConfigMap/*
## Part3:
  - To apply the yaml ```kubectl apply -f build-run.yaml``` then to port forward ```kubectl port-forward nginx-pod 8080:80 &``` and then access via browser **http://localhost:8080**. I also added a helper script to stop all: pv, pvc, jobs, and pods ... you can ignore it.
  - I used shared volumes. Specifically, PersistentVolumeClaims (PVCs) and PersistentVolumes (PVs) to create shared storage that can be mounted into multiple containers. The "build-website-job" container executes build-script.sh that generates website files and stores them in the persistent volume. The "nginx-pod" container mounts the same persistent volume and serves the website files from it by mounting it into the /usr/share/nginx/html directory.

*Part3 files are in CS548_Kubernetes/part3-singleYAML/*
## Part4:
 - To apply the yaml ```kubectl apply -f deploy.yaml``` then to port forward the service ```kubectl port-forward services/nginx-service 8080:8080 &``` and then access via browser **http://localhost:8080**.

*Part4 files are in CS548_Kubernetes/part4-deploy/*
