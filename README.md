# docker-mjpg_streamer

This is an own implementation of [jacksonliam/mjpg-streamer](https://github.com/jacksonliam/mjpg-streamer) Docker image.

## Quick start

```bash
docker run -d --restart unless-stopped -p 8080:80 --device /dev/video0 --name mjpg_streamer urpylka/mjpg_streamer:latest
```

By default mjpg_streamer running with next arguments:

```bash
/usr/local/bin/mjpg_streamer -i 'input_uvc.so -d /dev/video0 -r 640x480 -f 30 -y -n' -o 'output_http.so -w /usr/local/share/mjpg-streamer/www -p 80'
```

Use password set `-c admin:admin`.

It has prebuild images for:

* `linux/amd64`
* `linux/arm/v6`
* `linux/arm/v7`
* `linux/arm64`

If you wanna build own images, use:

```bash
docker build . --tag urpylka/mjpg_streamer:latest
```

or with `dockerx`:

```bash
docker buildx create --use
docker buildx build \
    --tag urpylka/mjpg_streamer:latest \
    --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64
```
