# duino_vscode_settings makefile

THIS_DIR := $(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))
TOP_DIR ?= $(THIS_DIR)
$(info TOP_DIR = $(TOP_DIR))

DUINO_MAKEFILE ?= ${HOME}/Arduino/libraries/duino_makefile

ifeq ("$(wildcard $(DUINO_MAKEFILE)/Makefile)","")
$(error Unable to open $(DUINO_MAKEFILE)/Makefile)
else
include $(DUINO_MAKEFILE)/Makefile
endif

# Creates the source distribution tarball
sdist:
	rm -rf dist/*
	python3 setup.py sdist

# Creates the distribution tarball and uploads to the pypi live server
upload-pypi: sdist
	twine upload -r pypi-duino-vscode-settings dist/*
