# <a name="networking-issues">Networking Issues</a>
1. A common resolution to an instance stuck in networking is to reboot it from the Tropospere UI while [emulating](#emulating) as the user experiencing the issue. If the instance gets stuck in networking again, proceed to step 2.
2. If an instance is stuck in networking, you can check [flower](#flower) to see current celery tasks and find the instance in question. If there is an error, flower will display it and you can diagnore the issue from there. 
