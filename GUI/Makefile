# Makefile for Java BRITE GUI

javafiles = $(wildcard *.java)
classfiles = $(javafiles:.java=.class)

all: $(classfiles)

$(classfiles): $(javafiles)
	javac -O -classpath ../:.:../Java/ $(javafiles)

clean: 
	rm -rf *.class
