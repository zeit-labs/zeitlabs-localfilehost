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
