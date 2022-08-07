NAME=main
SLD=${NAME}.sld
NEX=${NAME}.nex

SRCS := $(wildcard src/*.asm) $(wildcard src/*/*.asm)
OUTDIR := out
OUT := ${NEX}

SJASM_CMD_DOCKER = docker run -v "${PWD}":/code -w /code burma5have/sjasmplus sjasmplus
SJASM_CMD_LOCAL = ./tools/sjasmplus/sjasmplus

SJASM_CMD = ${SJASM_CMD_LOCAL}
# SJASM_CMD = ${SJASM_CMD_DOCKER}

all: ${OUT}
	@echo ${SRCS}

${OUT}: ${SRCS} ${OUTDIR}
	${SJASM_CMD} -D_NEXNAME_=${NEX} --sld=out/${SLD} \
		--fullpath --outprefix=./out/ src/main.asm

${OUTDIR}:
	mkdir out

clean:
	rm -rf ${OUTDIR}
