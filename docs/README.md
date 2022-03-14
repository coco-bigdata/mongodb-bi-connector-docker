```shell
sudo docker build -f Dockerfile -t yiluxiangbei/mongodb-bi-connector:v2.14.4 .
sudo docker push yiluxiangbei/mongodb-bi-connector:v2.14.4

sudo docker pull yiluxiangbei/mongodb-bi-connector:v2.14.4

./bin/mongosqld --logPath /var/log/mongosqld.log --mongo-uri mongodb://root:123456@127.0.0.1:27017 --addr 0.0.0.0:3311
./bin/mongosqld --logPath /var/log/mongosqld.log --mongo-uri mongodb://root:123456@127.0.0.1:27017/?connect=direct --addr 0.0.0.0:3311
./bin/mongosqld --logPath /var/log/mongosqld.log --mongo-uri mongodb://root:123456@10.50.10.27:27017 --addr 0.0.0.0:3311
/mongosqld/bin/mongosqld --logPath /var/log/mongosqld.log --mongo-uri mongodb://root:123456@127.0.0.1:27017 --addr 0.0.0.0:3311

./bin/mongosqld --logPath /var/log/mongosqld.log --mongo-uri mongodb://admin:admin@127.0.0.1:27017/test --addr 0.0.0.0:3311

./bin/mongosqld --mongo-uri mongodb://127.0.0.1:27017 --mongo-username=admin --mongo-password=admin --addr 0.0.0.0:3311
mysql -h127.0.0.1 -uroot -p -P3311
```

```shell
mongo -u root -p
123456

use admin
db.createUser(
  {
    user: "admin", //用户名
    pwd: "admin", //密码
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] //设置权限
  }
)

mongo -u admin -p
admin

mongod --auth --port 27017 --dbpath /home/mongodb/data 
```

```shell
https://docs.mongodb.com/manual/reference/connection-string/
mongodb://[username:password@]host1[:port1][,...hostN[:portN]][/[defaultauthdb][?options]]
```

```
./bin/mongosqld --help
Usage:
  mongosqld [install|uninstall] <options>

Documentation:
  https://docs.mongodb.com/bi-connector/current/reference/mongosqld/#msqld-core-options

Client Connection options:
      --addr=                                                 comma separated list of ip addresses to listen on ('localhost' by default)
      --auth                                                  use authentication/authorization ('sslPEMKeyFile' is required when using auth)
      --defaultAuthMechanism=                                 the default authentication mechanism ('SCRAM-SHA-1' by default)
      --defaultAuthSource=                                    the default authentication source ('admin' by default)
      --gssapiHostname=                                       the hostname to use when hosting using GSSAPI/Kerberos (server's first bind ip address by
                                                              default)
      --gssapiServiceName=                                    the service name to use when hosting using GSSAPI/Kerberos ('mongosql' by default)
      --gssapiConstrainedDelegation                           use proxy credentials for kerberos auth, enabling constrained delegation (requires mongosqld
                                                              service credentials in client keytab)
      --minimumTLSVersion=[TLS1_0|TLS1_1|TLS1_2]              the minimum TLS protocol version accepted by the BI Connector from the client
      --sslAllowInvalidCertificates                           don't require the certificate presented by the client to be valid
      --sslCAFile=                                            path to a CA certificate file to use for authenticating client certificate
      --sslMode=[disabled|allowSSL|requireSSL]                set the SSL operation mode
      --sslPEMKeyFile=                                        path to a file containing the certificate and private key establishing a connection with a
                                                              client
      --sslPEMKeyPassword=                                    password to decrypt private key in --sslPEMKeyFile

Debug options:
      --usageLogInterval=                                     the interval (in seconds) at which usage stats should be written to the log, or 0 to disable
                                                              usage logging (default 60)

General options:
  -h, --help                                                  print usage
      --version                                               display version information
      --config=                                               path to a configuration file
      --configExpand=                                         comma-separated list of expansion directives to enable ('none' by default)

Log options:
      --logAppend                                             append new logging output to existing log file
      --logPath=                                              path to a log file for storing logging output
      --logRotate=[rename|reopen]                             set the log rotation behavior
  -v, --verbose=<level>                                       more detailed log output (include multiple times for more verbosity, e.g. -vvvvv, or specify
                                                              a numeric value, e.g. --verbose=N)
      --quiet                                                 hide all log output

Mongo Connection options:
      --mongo-authenticationMechanism=                        authentication mechanism to use for schema discovery (only used if --auth is also enabled)
      --mongo-authenticationSource=<authentication source>    database that holds the credentials for the schema discovery user (only used if --auth is
                                                              also enabled)
      --mongo-gssapiServiceName=                              the service name MongoDB is using ('mongodb' by default)
      --mongo-minimumTLSVersion=[TLS1_0|TLS1_1|TLS1_2]        the minimum TLS protocol version used to connect to MongoDB
  -p, --mongo-password=<password>                             password for admin username specified in --mongo-username (required if --auth is enabled)
      --mongo-ssl                                             use SSL when connecting to mongo instance
      --mongo-sslAllowInvalidCertificates                     don't require the certificate presented by the MongoDB server to be valid, when using
                                                              --mongo-ssl
      --mongo-sslAllowInvalidHostnames                        bypass the validation for server name
      --mongo-sslCAFile=<filename>                            path to a CA certificate file to use for authenticating certificates from MongoDB, when
                                                              using --mongo-ssl
      --mongo-sslCRLFile=<filename>                           the .pem file containing the certificate revocation list
      --mongo-sslFIPSMode                                     use FIPS mode of the installed openssl library
      --mongo-sslPEMKeyFile=<filename>                        path to a file containing the certificate and private key for connecting to MongoDB, when
                                                              using --mongo-ssl
      --mongo-sslPEMKeyPassword=                              password to decrypt private key in mongo-sslPEMKeyFile
  -u, --mongo-username=<username>                             MongoDB username to use for admin tasks such as metadata loading and schema discovery
                                                              (required if --auth is enabled)
      --mongo-uri=                                            a mongo URI (https://docs.mongodb.org/manual/reference/connection-string/) to connect to
      --mongo-versionCompatibility=                           indicates the MongoDB version with which to be compatible (only necessary when used with
                                                              mixed version replica sets).

Schema options:
      --schema=                                               the path to a schema file
      --schemaDirectory=                                      the path to a directory containing schema files to load
      --maxVarcharLength=                                     the maximum length of a varchar
      --schemaRefreshIntervalSecs=                            the interval (in seconds) mongosqld waits before updating its schema
      --schemaSource=                                         database to use for stored schemas
      --schemaMode=[auto|custom]                              set the stored-schema mode
                                                              (https://docs.mongodb.com/bi-connector/current/reference/mongosqld/#sampling-mode-reference--

                                                              chart)
      --schemaName=                                           the name of the stored schema to use in custom mode ('defaultSchema' by default)
      --sampleSize=                                           the number of documents to sample, per namespace, when sampling the schema(s) (1000 by
                                                              default)
      --prejoin                                               generate unwound tables including parent columns, effectively resulting in a pre-joined table
      --sampleNamespaces=<sample namespaces>                  namespace(s) to sample in generating schema (defaults to all namespaces - except admin and
                                                              local databases)
  -b, --uuidSubtype3Encoding=[old|csharp|java]                encoding used to generate UUID binary subtype 3. old: Old BSON binary subtype
                                                              representation; csharp: The C#/.NET legacy UUID representation; java: The Java legacy UUID
                                                              representation

Service options:
      --serviceName=                                          the service name
      --serviceDisplayName=                                   the service display name
      --serviceDescription=                                   the service description

Socket options:
      --filePermissions=                                      permissions to set on UNIX domain socket file (0700 by default)
      --noUnixSocket                                          disable listening on UNIX domain sockets
      --unixSocketPrefix=                                     alternative directory for UNIX domain sockets (/tmp by default)
```