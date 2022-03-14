```shell
sudo docker build -f Dockerfile -t yiluxiangbei/mongodb-bi-connector:v2.14.4 .
sudo docker push yiluxiangbei/mongodb-bi-connector:v2.14.4

./bin/mongosqld --logPath /var/log/mongosqld.log --mongo-uri mongodb://root:123456@127.0.0.1:27017 --addr 0.0.0.0:3311
./bin/mongosqld --logPath /var/log/mongosqld.log --mongo-uri mongodb://root:123456@127.0.0.1:27017/?connect=direct --addr 0.0.0.0:3311
./bin/mongosqld --logPath /var/log/mongosqld.log --mongo-uri mongodb://root:123456@10.50.10.27:27017 --addr 0.0.0.0:3311
/mongosqld/bin/mongosqld --logPath /var/log/mongosqld.log --mongo-uri mongodb://root:123456@127.0.0.1:27017 --addr 0.0.0.0:3311
```