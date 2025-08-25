CC=gcc
PKG_CONFIG=pkg-config

SRC=src/include

PKGS=raylib


CFLAGS += -Wall 
CFLAGS += -Wextra 
CFLAGS += -pedantic 
CFLAGS += -O3
CFLAGS += $$($(PKG_CONFIG) --cflags $(PKGS))
CFLAGS += -I$(SRC)



LIBS += -lm
LIBS += -lalloc
LIBS += $$($(PKG_CONFIG) --libs $(PKGS))


OBJ += $(CACHE)/main.o


link: $(OBJ)
	$(CC) $(OBJ) $(LIBS) -o $(RELEASE)/$(TARGET)


exec: link
	$(RELEASE)/$(TARGET)


$(CACHE)/main.o: src/app/main.c
	$(CC) $(CFLAGS) -c src/app/main.c -o $@


