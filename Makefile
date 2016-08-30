CRYSTAL=crystal
CRYSTAL_FLAGS=--release
SOURCES=src/update.cr
EXECUTABLE=update
INSTALL_DIR=/usr/local/bin

all: spec build

spec:
	$(CRYSTAL) spec

build:
	$(CRYSTAL) build $(CRYSTAL_FLAGS) $(SOURCES) -o $(EXECUTABLE)

install:
	cp $(EXECUTABLE) $(INSTALL_DIR)

clean:
	rm $(EXECUTABLE)
