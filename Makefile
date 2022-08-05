NAME=shooting-game
SLD=${NAME}.sld
NEX=${NAME}.nex

# SRCS := $(wildcard src/*.asm) $(wildcard src/*/*.asm)
SRCS = $(shel find -name *.asm)
OUTDIR := out
OUT := ${SLD} ${NEX}

all: ${OUT}
	@echo ${SRCS}

${OUT}: ${SRCS} ${OUTDIR}
	sjasmplus -D_NEXNAME_=${NEX} --sld=out/${SLD} --fullpath --outprefix=./out/ src/main.asm

${OUTDIR}:
	mkdir out

clean:
	rm -f ${OUTDIR}
