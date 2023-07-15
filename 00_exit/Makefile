SRC_DIR = src
OBJ_DIR = obj
BUILD_DIR = build
TARGET = $(BUILD_DIR)/exit

all: $(TARGET)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.S
	mkdir -p $(@D)
	as -g -I$(SRC_DIR) -o $@ $<

OBJS = $(patsubst $(SRC_DIR)/%.S, $(OBJ_DIR)/%.o, $(wildcard $(SRC_DIR)/*.S))

$(TARGET): $(OBJS)
	mkdir -p $(@D)
	ld $(OBJS) -o $@

clean:
	rm -rf $(OBJ_DIR) $(BUILD_DIR)

