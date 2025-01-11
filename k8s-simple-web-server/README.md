
### Deploy a Simple Web Server on Kubernetes (Using a Local Cluster)
This project will guide you through deploying a simple web server (e.g., an Nginx-based web server) on a Kubernetes cluster running locally. Follow these step-by-step instructions.

---

### **1. Prerequisites**
1. **Install Kubernetes Locally:**
   - Use a tool like [Minikube](https://minikube.sigs.k8s.io/docs/start/) 
   - Ensure `kubectl` is installed (the Kubernetes command-line tool).

2. **Install Docker:** Required to build and manage container images.

3. **Install Helm (Optional):** Useful for managing Kubernetes resources, though not essential for this project.

4. **Verify Setup:**
   - Confirm that Kubernetes and Docker are running:
     ```bash
     kubectl version --client
     docker version
     ```

---

### **2. Setup Local Kubernetes Cluster**
1. **Start Minikube (or Kind):**
   ```bash
   minikube start
   ```

2. **Confirm Cluster is Running:**
   ```bash
   kubectl get nodes
   ```

---

### **3. Create a Simple Web Server Application**
1. **Create a Basic HTML Page:**
   Create a directory for the project:
   ```bash
   mkdir simple-web-server && cd simple-web-server
   ```

   Inside, create an `index.html` file:
   ```html
   <!DOCTYPE html>
   <html>
   <head>
       <title>Simple Web Server</title>
   </head>
   <body>
       <h1>Welcome to my Kubernetes Web Server!</h1>
   </body>
   </html>
   ```

2. **Create a Dockerfile:**
   Create a file named `Dockerfile` in the same directory:
   ```dockerfile
   FROM nginx:latest
   COPY index.html /usr/share/nginx/html/index.html
   ```

3. **Build the Docker Image:**
   Build the Docker image locally:
   ```bash
   docker build -t simple-web-server:1.0 .
   ```

4. **Test the Image Locally:**
   Run the container:
   ```bash
   docker run -d -p 8080:80 simple-web-server:1.0
   ```
   Visit `http://localhost:8080` to ensure the web server works.

---

### **4. Push Image to Local Registry**
Minikube supports a local Docker registry:
1. Use Minikube's Docker daemon:
   ```bash
   eval $(minikube docker-env)
   ```
2. Build the image again to make it available to the cluster:
   ```bash
   docker build -t simple-web-server:1.0 .
   ```

---

### **5. Deploy to Kubernetes**
1. **Create a Deployment Manifest:**
   Create a file named `deployment.yaml`:
   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: simple-web-server
   spec:
     replicas: 2
     selector:
       matchLabels:
         app: simple-web-server
     template:
       metadata:
         labels:
           app: simple-web-server
       spec:
         containers:
         - name: simple-web-server
           image: simple-web-server:1.0
           ports:
           - containerPort: 80
   ```

2. **Create a Service Manifest:**
   Create a file named `service.yaml`:
   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: simple-web-server-service
   spec:
     selector:
       app: simple-web-server
     ports:
       - protocol: TCP
         port: 80
         targetPort: 80
     type: NodePort
   ```

3. **Apply the Manifests:**
   Deploy the resources to the cluster:
   ```bash
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   ```

4. **Verify the Deployment:**
   Check the pods:
   ```bash
   kubectl get pods
   ```

   Check the service:
   ```bash
   kubectl get svc
   ```

5. **Access the Web Server:**
   - Use the Minikube IP and service NodePort to access the web server:
     ```bash
     minikube service simple-web-server-service
     ```

---

### **6. Test and Scale the Deployment**
1. **Scale the Deployment:**
   Scale the application to 3 replicas:
   ```bash
   kubectl scale deployment simple-web-server --replicas=3
   ```

2. **Check Pod Distribution:**
   Verify the new pods:
   ```bash
   kubectl get pods -o wide
   ```

---

### **7. Cleanup**
1. **Delete the Deployment and Service:**
   ```bash
   kubectl delete -f deployment.yaml
   kubectl delete -f service.yaml
   ```

2. **Stop Minikube (or Kind):**
   ```bash
   minikube stop
   ```
   OR for Kind:
   ```bash
   kind delete cluster
   ```

---

### **Key Concepts Covered**
- Building a Docker image.
- Deploying containers to Kubernetes.
- Creating and managing Kubernetes manifests (Deployment and Service).
- Scaling applications in Kubernetes.

Feel free to ask if you encounter any issues!
