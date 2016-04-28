# Instance Launch Error

In the case of a generic "Error" when launching an instance, check the Javascript console in the UI and inspect the failed request to see the error returned by the API.

In most cases, a generic "Error" message results when launching a new instance for the first time. One possible source of an "Error" is the source image being unavailable on the selected provider. Another possibility is that Atmosphere is at capacity and there is no available room to allocate for the new instance.

Another way to diagnose the error would be to check Celery and atmosphere logs for any reference to the instance ID.
