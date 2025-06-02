import http.server
import ssl
import os

ASSETS_DIR = '/assets'
CERT_FILE = '/certs/localhost.pem'
KEY_FILE = '/certs/localhost-key.pem'

os.chdir(ASSETS_DIR)

handler = http.server.SimpleHTTPRequestHandler

httpd = http.server.ThreadingHTTPServer((
    '0.0.0.0', int(os.getenv('LOCAL_FILE_HOST_PORT', 8888))
), handler)

httpd.socket = ssl.wrap_socket(
    httpd.socket,
    certfile=CERT_FILE,
    keyfile=KEY_FILE,
    server_side=True
)

print("Serving HTTPS on 0.0.0.0:8888")
httpd.serve_forever()
