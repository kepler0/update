CRYSTAL=crystal
CRYSTAL_FLAGS=--release
SOURCES=src/update.cr
EXECUTABLE=update
INSTALL_DIR=/usr/local/bin

all: $(EXECUTABLE)

$(EXECUTABLE):
	$(CRYSTAL) compile $(CRYSTAL_FLAGS) $(SOURCES) -o $(EXECUTABLE)

install:
	mv $(EXECUTABLE) $(INSTALL_DIR)

clean:
	rm $(EXECUTABLE)
