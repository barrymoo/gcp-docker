# gcp-docker
Docker Image for Globus Connect Personal Client

I forked this from [meissnert/gcp-docker](https://github.com/meissnert/gcp-docker) because the client was out of date.

### Running GCP client on Synology NAS:

1) Install the Docker app using "Package Center"

2) Open the Docker app

3) On the "Registry" tab, search for `barrymoo/gcp_client`, right click on image, click "Download"

4) Navigate to the "Container" tab, right click the `barrymoo/gcp_client` container, and edit the container

5) Under the "Volumes" tab, select the data you want to mount, mount to `/mnt/data`

6) Under the _SOMETHING HERE_, set environmental variable `USER` to match one of the local users on the NAS

7) Launch the container, under the "Terminal" tab, setup and start gcp:

```sh
su - $USER
/opt/globusconnectpersonel/globusconnectpersonal -setup <key>
/opt/globusconnectpersonel/gobusconnectpersonal -start -restrict-path r[w]/mnt/data/.../path/to/data
```
