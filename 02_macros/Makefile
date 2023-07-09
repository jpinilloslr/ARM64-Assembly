SRC_DIR = src
OBJ_DIR = obj
BUILD_DIR = build
TARGET = $(BUILD_DIR)/macros

all: $(TARGET)

$(OBJ_DIR)/main.o: $(SRC_DIR)/*.S
	mkdir -p $(@D)
	as -Isrc -o $(OBJ_DIR)/main.o $(SRC_DIR)/main.S

$(TARGET): $(OBJ_DIR)/main.o
	mkdir -p $(@D)
	ld $(OBJ_DIR)/main.o -o $(TARGET)

clean:
	rm -rf $(OBJ_DIR) $(BUILD_DIR)
