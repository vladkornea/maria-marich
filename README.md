###### Project Summary

The project's name is maria-marich, with the canonical URL of https://www.maria-marich.com, but the project actually has three domains, including maria-marici.com and marija-maric.com, each of which is in a different language. Each of these domains has three subdomains: `dev`, `test`, and `www`, with corresponding environment names: `dev`, `test`, and `live`.

###### Context and Environment

Want to create this website on existing EC2 server. It is to be running the latest version of Wordpress. The latest version of Wordpress calls for PHP7.4, but the PHP version currently installed on the server is 7.3. Considered upgrading PHP at this time, but decided against it because three other web sites are running on the server, all of which would be potentially affected by the upgrade (this approach would mean not only doing a lot of work now, but doing even more work in the future when adding or upgrading a website). Considered installing a version of Wordpress which calls for PHP7.3, but decided against it because it means architecturally committing myself to being stuck in the past. Considered installing this website on Fargate with this EC2 server being used just for the database, but decided against it because it would cost more and add needless complexity. The best solution all things considered is to use docker containerization on this single EC2 server, with the host's web server being set up as a reverse proxy for the container. Handling SSL certs is delegated to the host, which needs filesystem access to the container's docroots due to the way `certbot-auto certonly --webroot` works.

###### Administration

Run `./rebuild.sh` to bring up the container (after tearing it down).

Run `./enter-container.sh` to enter the running container.
