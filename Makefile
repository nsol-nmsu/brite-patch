# Patched version of the BRITE Makefile

.PHONY: all clean
all: exe  
clean: c++clean javaclean guiclean execlean

.PHONY: c++ c++clean
cppgen = C++/cppgen
c++: bin/cppgen

bin/cppgen: $(cppgen)
	@echo "Building C++..."
	@ln -f C++/cppgen bin/cppgen	

$(cppgen):
	@if test -f C++/Makefile; then\
		(cd C++; make) ; \
	fi

c++clean:
	@if test -f C++/Makefile; then\
		(cd C++; make clean); \
	fi
	rm -f bin/cppgen

.PHONY: java javaclean
java:
	@echo "Building Java..."
	@if test -f Java/Makefile; then \
		(cd Java; make) ; \
	fi

javaclean:
	@if test -f Java/Makefile; then\
		(cd Java; make clean) ;\
	fi

.PHONY: gui guiclean
gui: c++ java
	@echo "Building GUI..."
	@if test -f GUI/Makefile; then \
		(cd GUI; make) ; \
	fi

guiclean: 
	@if test -f GUI/Makefile; then\
	 	(cd GUI; make clean ); \
	fi

.PHONY: exe execlean
exe: gui 
	@echo "#!/bin/sh" > brite
	@echo "" >> brite
	@echo "java -Xmx256M -classpath Java/:. GUI.Brite" >> brite
	@chmod +x brite
	@echo "Built successfully. Run the BRITE GUI using \"./brite &\""

execlean:
	rm -f brite
