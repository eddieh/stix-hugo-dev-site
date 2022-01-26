HUGO = hugo
HOSTNAME = $(shell hostname)
IP = $(shell ifconfig en0 inet | tail -1 | cut -d ' ' -f 2)

server:
	$(HUGO) server -D --baseURL $(HOSTNAME) --bind $(IP) --debug
