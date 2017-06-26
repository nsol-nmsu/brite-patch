# Makefile for BRITE 2.1 Java Generation Engine

JFLAGS=-O -classpath .
javafiles = $(wildcard **/*.java)
classfiles = $(javafiles:.java=.class)

all: $(classfiles)
$(classfiles): $(javafiles)
	javac ${JFLAGS} $(javafiles)

javadoc:
	rm -rf javadoc; mkdir javadoc; javadoc -d javadoc/ Main Topology Model Graph Import Export Util 

clean: 
	rm -f **/*.class
	rm -rf javadoc
