# How to deploy Badgekit with Swish
#### Requires Ansible 2.0
1. Clone Swish from https://github.com/iplantcollaborativeopensource/swish
2. Fill out variables.ini file
3. Run configure script
4. Run the "deploy_badgekit" playbook with `ansible-playbook <path/to/deploy_badgekit.yml>`

#### Variable descriptions
##### [GLOBAL]
- BADGEKIT_ADMIN_REPO
 * The location of the Badgekit admin UI repo
- BADGEKIT_API_REPO
 * The location of the Badgekit API repo

##### [ANSIBLE]
- API_ENV_FILE_DEST
 * Location and name iof ansible variables file for BADGEKIT ADMIN INSTALL settings
- MYSQL_SETTINGS_DEST
 * Location and name of ansible variables file for MYSQL settings
- API_INSTALL_DEST  
 * Location and name of ansible variables file for BADGEKIT API INSTALL settings
- ADMIN_INSTALL_DEST  
 * Location and name of ansible variables file for BADGEKIT ADMIN INSTALL settings
- GLOBAL_SETTINGS_DEST  
 * Location and name of ansible variables file for GLOBAL settings

##### [BADGEKIT API INSTALL]
- API_LOCAL_INSTALL
 * True if the API will be deployed locally on each node, False otherwise
- API_INSTALL_LOCATION 
 * Destination for API installation on node
- API_VARIABLES_FILE  
 * Destination for API env file on node
- API_LOG_LOCATION  
 * Destination for API logs on node
 
##### [BADGEKIT ADMIN INSTALL]
- ADMIN_LOCAL_INSTALL 
 * True if the Admin will be deployed locally on each node, False otherwise
- ADMIN_INSTALL_LOCATION  
 * Destination for admin installation on node
- ADMIN_VARIABLES_FILE 
 * Destination for admin env file on node
- ADMIN_LOG_LOCATION  
 * Destination for admin logs

[BADGEKIT API VARIABLES]
- DB_HOST  
 * thing
- DB_NAME  
 * thing
- DB_PASSWORD 
 * thing
- DB_USER  
 * thing
- MASTER_SECRET  
 * thing
- API_PORT  
 * thing
- NODE_ENV 
 * thing

[BADGEKIT ADMIN VARIABLES]
- COOKIE_SECRET  
 * thing
- ADMIN_PORT  
 * thing
- OPENBADGER_SYSTEM  
 * thing
- OPENBADGER_URL  
 * thing
- OPENBADGER_SECRET  
 * thing
- DATABASE_DRIVER  
 * thing
- DATABASE_HOST  
 * thing
- DATABASE_USER  
 * thing
- DATABASE_PASSWORD 
 * thing
- DATABASE_DATABASE 
 * thing
- PERSONA_AUDIENCE  
 * thing
- API_SECRET  
 * thing
- BRANDING  
 * thing
- NODE_TLS_REJECT_UNAUTHORIZED 
 * thing

[MYSQL]
- LOCAL_DATABASE_USER  
 * thing
- LOCAL_ADMIN_DATABASE_NAME  
 * thing
- LOCAL_API_DATABASE_NAME  
 * thing
- LOCAL_DATABASE_PASSWORD  
 * thing
