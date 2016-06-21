CRYSTAL=crystal
CRYSTAL_FLAGS=--release
SOURCES=src/update.cr
EXECUTABLE=update


all: compile

compile:
	$(CRYSTAL) compile $(CRYSTAL_FLAGS) $(SOURCES) -o $(EXECUTABLE)

clean:
	rm $(EXECUTABLE)
