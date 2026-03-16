# 编译器
CC = gcc

# 编译参数
CFLAGS = -Wall -g -Iinclude     # -Wall：打开编译警告    # -g:生成调试信息    # Iinclude：指定头文件目录，可以除了在本文件目录下额外搜索其他目录

# 目录
SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin

# 自动扫描所有.c文件
SRCS = $(wildcard $(SRC_DIR)/*.c)

# 生成对应的.o文件
OBJS = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))     # 把一组 .c 文件路径转换成对应的 .o 文件路径

# 最终程序
TARGET = $(BIN_DIR)/app.exe

# 默认目标
all: $(TARGET)

# 链接
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

# 编译规则
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# 创建目录
$(BUILD_DIR):
	if not exist $(BUILD_DIR) mkdir $(BUILD_DIR)

$(BIN_DIR):
	if not exist $(BIN_DIR) mkdir $(BIN_DIR)

# 清理
clean:
	del /Q build\*.o 2>nul
	del /Q bin\*.exe 2>nul

.PHONY: all clean