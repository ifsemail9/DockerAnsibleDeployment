1. Build Image
   docker build -t myansi -f Dockerfile-3 .

2. Run the Containers
   docker run -itd --name Master -h "Master" myansi bash
   docker run -itd --name Client1 -h "Client1" myansi bash
   docker run -itd --name Client2 -h "Client2" myansi bash

3. Start the SSH Servers in conatiners
   service ssh start

4. Setup passwordless authentication between containers
   ssh-keygen -t rsa
   ssh-copy-id ifsadmin@172.17.0.3

5. SSH to 'Master Container'
   docker exec -it edec22100c65 bash

7. Change to 'ifsadmin' in container
   root@Master:/# su - ifsadmin

8. Create 'Inventroy' file for Ansible
   nano inventory

9. Execute ansible command
   ansible all -i inventory -m ping -k



Ansible Commands
================

ansible all -m ping -bK

ansible all -m ping -u ifsadmin

ansible 10.241.32.45  -m ping -u ifsadmin

ansible 172.17.0.3 -i inventory -m ping

ansible all -i inventory -m ping

ansible all -i inventory -m command -a 'ls' -k

ansible all -i inventory -m command -a 'uptime' -k

