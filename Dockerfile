FROM	nginx:alpine

COPY	99* /docker-entrypoint.d/
RUN	set -ex; \
	chmod 755 /docker-entrypoint.d/99*

