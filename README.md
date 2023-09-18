# Network X
Ansible playbook for Network X sysadmin.  I'm not sure where I'm going
with this.

## Setup
Clone the repo:
```sh
git clone https://github.com/gbenson/nx-admin.git
cd nx-admin
```
Create a virtual environment:
```sh
python3 -m venv venv
. venv/bin/activate
```
Upgrade pip, and install Ansible:
```sh
pip install --upgrade pip ansible
```

## Usage
Run the entire playbook:
```sh
ansible-playbook main.yml
```
Skip gathering facts, and run only tasks tagged with "redis":
```sh
ANSIBLE_GATHERING=explicit ansible-playbook -t redis main.yml
```
