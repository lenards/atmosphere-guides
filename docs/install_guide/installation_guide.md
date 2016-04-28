# Installation of Atmosphere and Troposphere

### Overview
The installation of Atmosphere and Troposphere can be a complex task when done manually. Fortunately, the team behind the stack has created 
a deployment tool that attempts to remove some of the frustrations that one could come across. [Clank](https://github.com/iPlantCollaborativeOpenSource/clank)
is a deployment tool that uses [ansible](https://www.ansible.com/) technology. It deploys the Atmosphere and Troposphere infrastructure within a Linux environment
(perferably Ubuntu) to make using OpenStack fo on-demanding computing needs easy.

#### System Dependencies

Clank perfoms a local install of Atmosphere and Troposphere, and as a result, a few dependencies are required to allow clank to properly run. 

The lines below allow clank to run its own series of commands to get ansible to run locally:
```
apt-get install python-virtualenv -y
apt-get install git python-dev libyaml-dev -y
```

Next, create a virtualenv and activate it. This will allow us to keep our python dependencies tidy and in one place without polluting the system.
```
virtualenv ratchet_env
. ratchet_env/bin/activate
```
Once the virtualenv has been created, clone down clank and install its dependencies in our virtualenv.
```
git clone https://github.com/iPlantCollaborativeOpenSource/clank.git
pip install -r clank/ratchet_requirements.txt
```
If you perform a pip freeze, you should see new libraries added.
```
pip freeze
```

#### Requirements for Configuration
A few files are required to be filled out in order for clank to properly function. You can find all the files below in the dist_files directory.

* variables.yml (See [variables dist](https://github.com/iPlantCollaborativeOpenSource/clank/blob/master/dist_files/variables.yml.dist) for blank template)

* hosts (See [hosts dist](https://github.com/iPlantCollaborativeOpenSource/clank/blob/master/dist_files/hosts.dist) for blank template)

* group_vars (See [group_vars dist](https://github.com/iPlantCollaborativeOpenSource/clank/tree/master/dist_files/group_vars) for blank templates)

Your hosts file and group_vars directory should reflect one another. This would include renaming the dist file to relflect the groups you wish to create with ansible.

When you fill out your hosts file and the provider templates in the group_vars directory, be sure to link the location of these files in the variable.yml file.
At the current moment, the only vars that need to be filled in the new variable.yml are:
```
SERVER_URL:                       # myhostname.org

ANSIBLE_HOSTS_FILE:               #Absolute Path Recommended e.g. /path/to/my/hostfile/hosts
ANSIBLE_GROUP_VARS_FOLDER:        #Absolute Path Recommended e.g. /path/to/my/groupvars/dir/group_vars
```

TODO
Condense variables.yml.dist and explain the other vars needed by user (e.g. openstack, ldap, ELK, etc).

#### Installation
Once you have the completed files, its time to run clank! Change directories into the clank repo.
```
cd clank
```
We currently have to pass in two arguments, workspace and env_file. These two variables define the workspace we are working from and the variables.yml file we worked on previously.
If you know the parent directory of the clank directory is, you can pass that, or you can run the command
```
WORKSPACE="$(dirname `pwd`)"
VARIABLES_YML_FILE=/path/to/our/completed/variables.yml
```
And now we run `rachet.py` which will install ansible locally, pass in the appropriate variables to ansible, and pass any flags we wish ansible to consume.
```
python ratchet.py --workspace $WORKSPACE --env_file $VARIABLES_YML_FILE
```

#### Advanced Configuration

#### Troubleshooting
