# KWIC Docker Tutorials

This repository provides examples of different KWIC deployment scenarios. For ease of use and portability, these scenarios are provided using Docker.

Kaazing WebSocket Intercloud Connect (KWIC) delivers highly secure, hybrid cloud connectivity – with no hardware required. KWIC enables rapid delivery of new applications and services in the cloud while securely connecting to your existing infrastructure, and makes costly and time-intensive site-to-site VPNs between your data center and the public cloud no longer necessary.

The following tutorials are available:

* [1-simple](1-simple) – Get started with a simple KWIC scenario.
* [2-tls](2-tls) – Demonstrate securing KWIC with TLS/SSL.
* [3-multi-tenant](3-multi-tenant) – Demonstrate using KWIC in a multi-tenant scenario, including TLS/SSL.
* [4-ha](4-ha) – Demonstrate configuring KWIC for HA (High Availability), including TLS/SSL.

## Requirements

### Docker and Docker Compose

These tutorials require that you have both [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/) installed. If you are unfamiliar with Docker there is a learning curve at the beginning, but we highly recommend getting familiar with it. Docker isn't just for production deployment. Even if you're just evaluating, prototyping, or developing, Docker is an excellent convenience that will make your life easier. It is well worth getting to know it.

Docker has some excellent documentation and tutorials. Here are some links to get you started:

* [Mac](https://docs.docker.com/docker-for-mac/)
* [Linux](https://docs.docker.com/engine/installation/linux/ubuntu/)
* [Windows](https://docs.docker.com/docker-for-windows/)

### Host file for DNS resolution

Some of these tutorials may require hostnames that resolve to the Docker host machine. To enable this resolution, add an entry in your [hosts file](https://en.wikipedia.org/wiki/Hosts_(file)) that points to your Docker host's IP address for the given hostname, such as `example.com`.

If you are using Docker Machine, you can get the IP address with this command: `docker-machine ip`. If you are using Kitematic, go to **Settings** then **Ports**. For other examples, see [10 Examples of how to get Docker Container IP Address](http://networkstatic.net/10-examples-of-how-to-get-docker-container-ip-address/).

In many cases, the IP address defaults to `192.168.99.100`.

### Netcat

Some of these tutorials may use **netcat** to simulate a client or server.

If you are running on Windows, or don't have netcat installed, everywhere you see the `nc` command, replace it with a Docker image that contains netcat.

For example when using netcat as a client, if you see:

```
$ nc 192.168.99.100 5551
```

then replace it with:

```bash
$ docker run -it --rm konjak/netcat 192.168.99.100 5551
```

Once the netcat client is connected, you can type a message and press Enter to send it to the server.

Or to run netcat in Docker as a server (in listen mode):

```
$ docker run -it --rm -p 9000:9000 konjak/netcat -l 9000
```

then connect to it via the Docker IP address:

```bash
$ nc 192.168.99.100 9000
```

or

```bash
docker run -it --rm konjak/netcat 192.168.99.100 9000
```

See the **Host file for DNS resolution** section, above, for steps to get your Docker IP address.

Just like the netcat client, when the netcat server has received a connection, you can type a message and press Enter to send it to the client.
