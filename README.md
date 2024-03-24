# CS548_Kubernetes
CS-548: Cloud-native Software Architectures Computer Science Department • University of Crete. Assignment 2: Kubernetes.

## ex1:

  - a) Adding user with ```sudo usermod -aG docker $USER && newgrp docker``` Start minikube ```minikube start``` and then start the pod ```kubectl apply -f nginx-pod.yaml```.
  - b) Forward port 80 locally ```kubectl port-forward nginx-pod 8080:80 &``` using ```curl http://localhost:8080``` we can see that we can access the site.
  - c) To access logs we can use ```kubectl logs nginx-pod```.
  - d) To open a shell session inside the nginx container we can use ```kubectl exec -it nginx-pod -- sh```. When inside the container we can run ```vi usr/share/nginx/html/index.html``` and change the first sentence of the default page to "Welcome to MY nginx!". Then save and ```curl http://localhost:8080``` we can see the changes.
  - e) To download the web page of the container we can use ```kubectl cp nginx-pod:/usr/share/nginx/html/index.html ./original.html```. Then we change it and replace the message with "My Message!" to a file called ```new.html``` and upload it to the container with ```kubectl cp new.html nginx-pod:/usr/share/nginx/html/index.html```. Now we can reload the page or use ```curl http://localhost:8080``` and see the changes.
  - f) By running ```kubectl delete -f nginx-pod.yaml``` stop the Pod and remove the manifest from Kubernetes. We can check with ```kubectl get pods``` we get ```No resources found in default namespace.```.
