# kubernetes-sandbox

Sandbox for testing and learning kubernetes architecture and automation of processes

# Install/update system requeirements
# Warning right now support only install for arch based system. Tested on Manjaro
```
sudo ./os_requiremetns/install_requirements.sh
```

# Basic set up
## Build and start virtualmachines

```
vagrant up
```

# Install master node via ansible
```
cd playbook

ansible-playbook master_node.yml -i hosts
```

# Install worker nodes
```

ansible-playbook worker_node.yml -i hosts
```