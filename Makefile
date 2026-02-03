CC = gcc

TARGET = cvfs

OBJECTS = main.o cvfs_helper.o

all: $(TARGET)

$(TARGET): $(OBJECTS)
	@echo "Linking object files..."
	@$(CC) -o $(TARGET) $(OBJECTS)
	@echo "Build successful! Executable '$(TARGET)' created."

main.o: main.c cvfs.h
	@echo "Compiling main.c..."
	@$(CC) -c main.c

cvfs_helper.o: cvfs_helper.c cvfs.h
	@echo "Compiling cvfs_helper.c..."
	@$(CC) -c cvfs_helper.c

clean:
	@echo "Cleaning up generated files..."
	@rm -f $(OBJECTS) $(TARGET) CVFS_Backup.bin
	@echo "Clean complete."

run: $(TARGET)
	@echo "Starting Customised Virtual Filesystem..."
	@echo ""
	@./$(TARGET)
