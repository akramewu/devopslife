### Example: Using Variables to Store and Manipulate Configuration Data in a DevOps Context

webserver = "Apache"
database = "MySQL"
username = "admin"
password = "password"
port = 80
htpps_enabled = True

print("Webserver: " + webserver)
print("Database: " + database)
print("Username: " + username)
print("Password: " + password)
print("Port: " + str(port))
print("HTTPS Enabled: " + str(htpps_enabled))

## Manipulating Configuration Data
port = 443
htpps_enabled = False

print("Webserver: " + webserver)
print("Database: " + database)
print("Username: " + username)
print("Password: " + password)
print("Port: " + str(port))
print("HTTPS Enabled: " + str(htpps_enabled))