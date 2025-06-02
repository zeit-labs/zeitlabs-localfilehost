ZeitLabs-LocalFileHost
======================

A simple package to serve static assets locally over HTTPS.

Prerequisites
-------------

- Docker
- Docker Compose

Usage
-----

1. Run the server:

   .. code-block:: bash

      make run

2. Add any files you want to serve to the ``assets`` directory.

3. Access your files via HTTPS at: https://localhost:8888/

4. Trust the self-signed certificate in your browser. You may need to add an exception for the certificate. To do this:

   - **Firefox**:

     1. Open Firefox and navigate to `Settings` > `Privacy & Security`.

     2. Scroll down to the `Certificates` section and click `View Certificates`.

     3. In the `Authorities` tab, click `Import`.

     4. Select the `./certs/rootCA.pem` file and check the box to trust the certificate for websites.

     5. Click `OK` to save.

   - **Chrome**:

     1. Open Chrome and navigate to `Settings` > `Privacy and Security` > `Security`.

     2. Under `Advanced`, click `Manage Certificates`.

     3. In the `Custom` tab, click `Imported by you`.

     4. In the `Trusted Certificated` click `Import`.

     5. Select the `./certs/rootCA.pem` file and check the box to trust the certificate for websites.

Notes
-----

- All files placed in the ``assets`` directory will be available at the root of the HTTPS server.
- No additional configuration is required.

Changing the Port
-----------------

To change the port on which the server listens, pass an environment variable ``LOCAL_FILE_HOST_PORT`` when running the server:

   .. code-block:: bash

      export LOCAL_FILE_HOST_PORT=7777
      make run

or

   .. code-block:: bash

      LOCAL_FILE_HOST_PORT=7777 make run

- The server will then be accessible at ``https://localhost:7777/``
