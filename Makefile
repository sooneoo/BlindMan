PLATFORM ?=linux_x86_64


TARGET=blindman
CACHE=.cache
RELEASE=$(CACHE)/release


all: env build 


-include config/$(PLATFORM).mk


build: link


.PHONY: env clean


env:
	mkdir -pv $(CACHE)
	mkdir -pv $(RELEASE)


clean:
	rm -rvf $(CACHE)


