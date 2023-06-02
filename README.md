# Slice
Ansible playbook for slice sysadmin.  I'm not sure where I'm going
with this.

## Local setup
Clone the repo:
```sh
git clone git@github.com:gbenson/slice.git
cd slice
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
Run the playbook:
```sh
ansible-playbook main.yml
```
