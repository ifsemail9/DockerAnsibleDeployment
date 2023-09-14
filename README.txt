Docker Compose for Ansible Testing environment
************************************************
Extract compressed file into windows path
open windows powershell
CD  into the docker compose YAML file path in Windows
run below commands in windows powershell
    -> docker-compose up -d
    -> after completion make sure all containers up and running by -> docker ps
    -> log into the controller node -> docker exec -it ansible_controller bash
    -> check ansible -> ansible ansible_manage_node1 -m ping(in first attempt may ask to add into the known host)
Node Details 
*****************
Controller Node
hostname: ansible_controller | IP: can be changed 
Worker/Manged Nodes
hostname:ansible_manage_node1 | IP: can be changed | 80 port exposed on your local machine port 81 
hostname:ansible_manage_node2 | IP: can be changed | 80 port exposed on your local machine port 82 
hostname:ansible_manage_node3 | IP: can be changed | 80 port exposed on your local machine port 83 
hostname:ansible_manage_node4 | IP: can be changed | 80 port exposed on your local machine port 84

For complex ansible operations, and when installing diiferent application may need to open ports and change the docker 
setup to test those from local machine. However, already exposed all containers' 80 port to the local machine 81,82,83,84.
So can test out http service and all through local web by passing 127.0.0.1:81/82.. etc.
