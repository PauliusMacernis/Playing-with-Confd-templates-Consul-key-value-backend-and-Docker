A custom bash executable that allows us more customization in running our applications in Docker.  
We are using a CLI program Confd (https://github.com/kelseyhightower/confd) to manage application configuration files to provide some configuration setup before running a web server.  
For the web server we use Caddy.  

Run the container and manually populate consul to get the container running:
`docker-compose up --build`
`curl -X PUT -d 'www.example.com' http://localhost:8500/v1/kv/example.com/hostname`
(check for: http://localhost:8500/ui/#/dc1/kv/example.com/hostname/edit )
(check for: http://www.example.com:8080 before updating hosts file to point www.example.com to 127.0.0.1)
`curl -X PUT -d 'foo.com' http://localhost:8500/v1/kv/example.com/hostname`
(check for: http://www.example.com:8080 )

Now if you request http://www.example.com:8080 you should get the following response from caddy: "404 Site www.example.com:8080 is not served on this interface". Note, that this only works if you update your hosts file to make www.example.com point to 127.0.0.1.
