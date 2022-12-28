stage{ 'pre':
    before => Stage['main']

}

class { 'baseconfig':
    stage => 'pre'

}

# base config is added outside all nodes meaning base config will be included in all nodes
# Included classes are 
# nodejs: contains provisioning for the appserver
# mysql-server: provisioning for the dbserver
# nginx: provisioning for the web server

include baseconfig

node 'appserver'{
    include nodejs

}

node 'dbserver' {
    include mysql-server
}

node 'web'{
    include nginx

}

# used regular expression to idetify tst0, tst1, tst2 test servers
node /tst\d+$/{
    include baseconfig

}