# Patched version of the BRITE Makefile

.PHONY: all clean
all: exe  
clean: c++clean javaclean guiclean execlean

.PHONY: c++ c++clean
cppgen = C++/cppgen
c++exe = bin/brite
c++: $(c++exe)

$(c++exe): $(cppgen)
	@mkdir -p bin
	@ln -f $(cppgen) $(c++exe)

$(cppgen):
	@echo "Building C++..."
	@if test -f C++/Makefile; then\
		(cd C++; make) ; \
	fi

c++clean:
	@if test -f C++/Makefile; then\
		(cd C++; make clean); \
	fi
	rm -f $(c++exe)

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
bin = britegui
exe: gui
	@echo "#!/bin/sh" > $(bin)
	@echo "" >> $(bin)
	@echo "java -Xmx256M -classpath Java/:. GUI.Brite" >> $(bin)
	@chmod +x $(bin)
	@echo "Built successfully. Run the BRITE GUI using \"./$(bin) &\", or use the C++ binary $(c++exe)"

execlean:
	rm -f $(bin)
