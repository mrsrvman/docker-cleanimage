FROM debian:buster-slim
COPY ./cleanimage /usr/local/bin/cleanimage
RUN chmod +x /usr/local/bin/cleanimage
