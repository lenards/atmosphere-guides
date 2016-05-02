This will take you through how to login to atmosphere via the Troposphere UI admin interface and approve an imaging request.

*WARNING: At most one machine request should be in the 'started' or 'imaging' state at a time. Failure to follow these rules could potentially cause filesystem trouble. You have been warned.*

# Approving a 'pending' Machine Request

Describe the process, step by step, of how to login to Atmosphere via the Troposphere UI.
Select the admin panel
Select Machine Requests
Click 'approve'


# Imaging Request ends up in (ERROR_ state

 * If the MachineRequest throws an exception and the (Status Message) shows:
 (processing - <IMAGE_ID>) Error ...
 (validating) Error ...
   * Especially: `AttributeError: \'NoneType\' object has no attribute \'id\'\n'`

 See 'Fixing a Cache Problem'.

 * If the MachineRequest throws an exception and the Status Message shows:
 (imaging) Exception ...

 See 'Fixing an Imaging Problem'.

# Fixing a "Cache Problem"
 This is NOT indicative of an actual problem, but rather a result of the way we 'cache' images combined with asking to launch an image that is minutes old is a hard problem to solve at this time.
BEFORE you re-run an imaging request, if the MachineRequest was run in the last 12 hours, you should service celeryd restart FIRST to be sure that the "Caches have been cleared" .



# Fixing an Imaging Problem
  NOTE:  On average, it takes 20-40minutes to go through 'imaging' of a 10GB disk. The larger the disk size, the longer the entire process will take.

  If the MachineRequest throws an exception and the (Status Message) shows:
  (imaging)

  If an image throws an exception while it is in the 'imaging' step, pay attention to the exception message, and you can generally deduce how/why an error occurred.
  These errors occur outside the flow of Atmosphere, in Chromogenic, and as such simply repeating the image request will do you no good here.

  Common reasons for failure:
  * Bad Filesystem type (Rare – usually introduced by staff trying out new img files)
  * Missing modules (Ex: `/dev/nbd` is usually missing after reboot. To restore: `modprobe nbd max_part=16`)
  * Out of Disk space (Free up disk space by cleaning out logs or the storage directory)
  * Running more than one imaging task at the same time may cause problems with OS stability.


# Approving a Machine Request that has an (ERROR) state

Describe the process, step by step, of how to login to Atmosphere via the Troposphere UI.
Select the admin panel
Select Machine Requests
Click 're-submit'
Click 'approve'

# Making contact with the Atmosphere Support Team
  If the information in this guide was not enough to help you solve the users imaging problem, you will need to contact the Atmosphere Support Team.
  To ensure that your end user requests are resolved as quickly as possible, it is highly encouraged that you first colelct the following "Level two triage information".

  When making contact with Atmosphere support team:
  * Copy/Paste the traceback that is included with the Machine Request
  * Instance ID of the machine that was imaged (Communicate to the user that they should *NOT* delete the image until the entire process is completed.)
  * Username and Instance IP related to the machine.
  * Any additional information about the MachineRequest that may be different (User was trying to upgrade kernel, etc.)

  Example request that a staff member would write after traiging a problem:
  ```
  Username: joetest
  Instance ID: 1111-222-3344-4567
  Traceback : (validating) ERROR - AttributeError("'NoneType' object has no attribute 'id'",) Exception:'Traceback (most recent call last):\n File "/opt/env/atmo_mm/local/lib/python2.7/site-packages/celery/app/trace.py", line 240, in trace_task\n R = retval = fun(*args, **kwargs)\n File "/opt/env/atmo_mm/local/lib/python2.7/site-packages/celery/app/trace.py", line 438, in __protected_call__\n return self.run(*args, **kwargs)\n File "service/tasks/machine.py", line 319, in validate_new_image\n using_admin=True)\n File "service/instance.py", line 959, in launch_machine_instance\n name, userdata, network, **kwargs)\n File "service/instance.py", line 1014, in _launch_machine\n **kwargs)\n File "/opt/env/atmo_mm/local/lib/python2.7/site-packages/rtwo/driver.py", line 277, in create_instance\n super(EshDriver, self).create_instance(*args, **kwargs),\n File "/opt/env/atmo_mm/local/lib/python2.7/site-packages/rtwo/driver.py", line 176, in create_instance\n return self._connection.create_node(*args, **kwargs)\n File "/opt/env/atmo_mm/local/lib/python2.7/site-packages/rtwo/drivers/openstack_facade.py", line 424, in create_node\n server_params = self._create_args_to_params(None, **kwargs)\n File "/opt/env/atmo_mm/local/lib/python2.7/site-packages/rtwo/drivers/openstack_facade.py", line 380, in _create_args_to_params\n ._create_args_to_params(node, **kwargs)\n File "/opt/env/atmo_mm/local/lib/python2.7/site-packages/libcloud/compute/drivers/openstack.py", line 1363, in _create_args_to_params\n server_params[\'imageRef\'] = kwargs.get(\'image\').id\nAttributeError: \'NoneType\' object has no attribute \'id\'\n'

  Staff Notes:
  * I attempted to re-approve the request after a few hours had passed.
  * I asked one of the system administrators who could connect to the production server to restart celery
  * After restarting celery and re-approving the request a second time, the failure came back.
  ```

