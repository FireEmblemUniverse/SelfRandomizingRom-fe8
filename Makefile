.SUFFIXES:
.PHONY: objects asmgen events bindmps clean

# making sure devkitARM exists and is set up
ifeq ($(strip $(DEVKITARM)),)
	$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

# including devkitARM tool definitions
include $(DEVKITARM)/base_tools

# setting up main dir
# we want to use an absolute path because EA's wd won't be here
ABS_MAIN_DIR := $(realpath .)
MAIN_DIR := .

# Setting C/ASM include directories up
INCLUDE_DIRS := $(MAIN_DIR)/src/libgbafe
INCFLAGS     := $(foreach dir, $(INCLUDE_DIRS), -I "$(dir)")

# adding local binaries to path
PATH := $(abspath .)/bin:$(PATH)

# lyn library object
LYNLIB := $(MAIN_DIR)/src/libgbafe/fe8u.o

# setting up compilation flags
ARCH    := -mcpu=arm7tdmi -mthumb -mthumb-interwork
CFLAGS  := $(ARCH) $(INCFLAGS) -Wall -Os -mtune=arm7tdmi -fomit-frame-pointer -ffast-math
ASFLAGS := $(ARCH) $(INCFLAGS)

# dependency generation flags for CC
CDEPFLAGS = -MD -MT $*.o -MT $*.asm -MF $*.d -MP

# Finding all possible source files (in src folder)
# CFILES := $(wildcard *.c)
# SFILES := $(wildcard *.s)
CFILES := $(shell find src/ -type f -name '*.c')
SFILES := $(shell find src/ -type f -name '*.s')

# listing possible object files
OFILES := $(CFILES:.c=.o) $(SFILES:.s=.o)

# listing possible generated asm files
ASMFILES := $(CFILES:.c=.asm)

# listing possible lyn event files
LYNFILES := $(OFILES:.o=.lyn.event)

# listing possible dmp files
DMPFILES := $(OFILES:.o=.dmp)

# listing possible dependency files
DEPFILES := $(CFILES:.c=.d)

# defining & making dependency directory
DEPSDIR := .MkDeps
$(shell mkdir -p $(DEPSDIR) > /dev/null)

# listing possible dependency files
DEPFILES := $(addprefix $(DEPSDIR)/, $(notdir $(CFILES:.c=.d)))

# dependency generation flags for CC
CDEPFLAGS = -MD -MT $*.o -MT $*.asm -MF $(DEPSDIR)/$(notdir $*).d -MP

# C to ASM rule
%.asm: %.c
	@echo "$(notdir $<) => $(notdir $@)"
	@$(CC) $(CFLAGS) $(CDEPFLAGS) -S $< -o $@ -fverbose-asm $(ERROR_FILTER)

# C to OBJ rule
%.o: %.c
	@echo "$(notdir $<) => $(notdir $@)"
	@$(CC) $(CFLAGS) $(CDEPFLAGS) -c $< -o $@ $(ERROR_FILTER)

# OBJ to DMP rule
%.dmp: %.o
	@echo "$(notdir $<) => $(notdir $@)"
	@$(OBJCOPY) -S $< -O binary $@

# OBJ to EVENT rule
%.lyn.event: %.o $(LYNLIB)
	@echo "$(notdir $<) => $(notdir $@)"
	@lyn $< $(LYNLIB) > $@

# ASM to OBJ
%.o: %.s
	@echo "$(notdir $<) => $(notdir $@)"
	@$(AS) $(ARCH) $< -o $@ $(ERROR_FILTER)

# "make all" phony targets
objects: $(OFILES);
asmgen: $(ASMFILES);
events: $(LYNFILES);
bindmps: $(DMPFILES)

# "Clean" target
clean:
	@rm -f $(OFILES) $(ASMFILES) $(LYNFILES) $(DMPFILES) $(DEPFILES)
	@echo done.

-include $(DEPFILES)