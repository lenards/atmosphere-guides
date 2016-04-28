# Swish/Badgekit Variable descriptions
Description of variables used in Swish Badgekit installation and Badgekit installation in general
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

##### [BADGEKIT API VARIABLES]
- DB_HOST  
 * Badgekit API database host
- DB_NAME  
 * Name of badgekit API database
- DB_PASSWORD 
 * Password to badgekit API database
- DB_USER  
 * User to log in to badgekit API database operations
- MASTER_SECRET  
 * API secret that needs to be used to make API calls
