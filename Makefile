CRYSTAL=crystal
CRYSTAL_FLAGS=--release
SOURCES=src/update.cr
EXECUTABLE=update
INSTALL_DIR=/usr/local/bin

all: spec compile

spec:
	$(CRYSTAL) spec

build: compile
compile:
	$(CRYSTAL) compile $(CRYSTAL_FLAGS) $(SOURCES) -o $(EXECUTABLE)

install:
	cp $(EXECUTABLE) $(INSTALL_DIR)

clean:
	rm $(EXECUTABLE)
