# Copyright 2018 www.privaz.io Valletech AB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Use full path to ensure virtualenv compatibility
PYTHON = $(shell which python) 
PYXBGEN = $(shell which pyxbgen) 

schemas = index.xsd

VPATH = src: pyone/xsd

all: pyone/bindings/__init__.py

pyone/bindings/__init__.py: $(schemas)
	${PYTHON} ${PYXBGEN} -m pyone.bindings.__init__ -u $^

.PHONY: clean build
clean:
	rm -f pyone/bindings/*.py
	rm -rf build dist

dist:
	${PYTHON} setup.py sdist bdist_wheel
