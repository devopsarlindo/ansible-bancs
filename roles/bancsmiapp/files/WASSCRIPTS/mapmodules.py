# Get the installed applications
apps = AdminApp.list().splitlines()

# Get the web server name
websrvInfo = AdminConfig.list('WebServer')
websrvName = AdminConfig.showAttribute(websrvInfo, 'name')
websrvMapString = "+WebSphere:server=" + websrvName

# Map the modules for each app
for app in apps:
    print "Mapping modules for " + app
    AdminApp.edit(app, ['-MapModulesToServers', [['.*', '.*', websrvMapString]]])

# Save the changes
AdminConfig.save()
