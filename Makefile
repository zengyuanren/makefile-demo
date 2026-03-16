# 编译器
CC = gcc

# 编译参数
CFLAGS = -Wall -g

# 目标程序
TARGET = app

# 源文件
SRC = main.c add.c sub.c

# 目标文件
OBJ = main.o add.o sub.o

# 默认目标
all: $(TARGET)

# 链接
$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

# 编译规则
main.o: main.c add.h sub.h
	$(CC) $(CFLAGS) -c main.c

add.o: add.c add.h
	$(CC) $(CFLAGS) -c add.c

sub.o: sub.c sub.h
	$(CC) $(CFLAGS) -c sub.c

# 清理
clean:
	rm -f *.o $(TARGET)