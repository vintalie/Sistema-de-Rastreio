bind = "0.0.0.0:8080"
module = "appconsulta.wsgi:application"

workers = 2  # Adjust based on your server's resources
worker_connections = 1000
threads = 4

certfile = "/etc/letsencrypt/live/reastreieseupedidojdlg.online/fullchain.pem"
keyfile = "/etc/letsencrypt/live/reastreieseupedidojdlg.online/privkey.pem"