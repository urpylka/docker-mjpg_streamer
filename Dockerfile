FROM alpine:3.15.0

RUN apk add make cmake gcc g++ jpeg-dev linux-headers

ADD https://github.com/jacksonliam/mjpg-streamer/archive/v1.0.0.tar.gz /mjpg_streamer/mjpg_streamer.tar.gz
RUN tar xzf /mjpg_streamer/mjpg_streamer.tar.gz --strip-components 1 -C /mjpg_streamer

RUN make -C /mjpg_streamer/mjpg-streamer-experimental && \
    make -C /mjpg_streamer/mjpg-streamer-experimental install && \
    rm -r /mjpg_streamer

EXPOSE 80
CMD /usr/local/bin/mjpg_streamer -i 'input_uvc.so -d /dev/video0 -r 640x480 -f 30 -y -n' -o 'output_http.so -w /usr/local/share/mjpg-streamer/www -p 80'
