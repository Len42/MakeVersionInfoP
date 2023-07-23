# Version info files
VERSION_INFO = "$(SOLUTIONDIR)version-info"
VERSION_TEMP = "$(SOLUTIONDIR)version-temp"

all: $(TARGETS)

clean:
	del $(TARGETS) $(VERSION_INFO) $(VERSION_TEMP)

rebuild: clean all

# All targets get the version info from $(VERSION_INFO)
$(TARGETS): $(VERSION_INFO)

# Python command line
PYCMD = py

# git command line
GITCMD = git

# Rules to create header files with version info from corresponding template files
.SUFFIXES: .txttemplate .htemplate .cstemplate .doxytemplate

.txttemplate.txt:
	$(PYCMD) "./make-version-file.py" $(VERSION_INFO) $@

.htemplate.h:
	$(PYCMD) "./make-version-file.py" $(VERSION_INFO) $@

.cstemplate.cs:
	$(PYCMD) "./make-version-file.py" $(VERSION_INFO) $@

.doxytemplate.doxy:
	$(PYCMD) "./make-version-file.py" $(VERSION_INFO) $@
