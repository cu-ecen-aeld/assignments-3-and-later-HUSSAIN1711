CC := gcc
CCFLAGS := -Wall -Werror -g
LDFLAGS =

# Use CROSS_COMPILE variable for cross-compilation
ifneq ($(CROSS_COMPILE),)
    CC = $(CROSS_COMPILE)gcc
    LD = $(CROSS_COMPILE)ld
    AR = $(CROSS_COMPILE)ar
    AS = $(CROSS_COMPILE)as
    STRIP = $(CROSS_COMPILE)strip
endif

TARGET := writer

OBJS := writer.o 

all: $(TARGET)

$(TARGET): writer.o 
	$(CC) $(LDFLAGS) -o $(TARGET) writer.o 

writer.o: writer.c
	$(CC) $(CFLAGS) -c writer.c

#check_file_type:
	#@echo "Checking file type of $(TARGET)..." > /home/hussain/Coding/Github/assignment-1-HUSSAIN1711/assignments/assignment2/fileresult.txt
	#@file $(TARGET) >> /home/hussain/Coding/Github/assignment-1-HUSSAIN1711/assignments/assignment2/fileresult.txt
	#@echo "Cross-compilation verification completed." >> /home/hussain/Coding/Github/assignment-1-HUSSAIN1711/assignments/assignment2/fileresult.txt

clean: 
	rm -f $(TARGET) $(OBJS)


