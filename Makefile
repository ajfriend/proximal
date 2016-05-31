.PHONY: test clean install

#all: test

# can run -vs, where s makes it not capture output
# the -l flag will print out a list of local variables with their corresponding values when a test fails
test:
	py.test scsprox -vs

testslow:
	py.test scsprox --runslow

clean:
	-pip uninstall scsprox -y
	-rm -rf build/ dist/ scsprox.egg-info/
	#-find . -name "*.cache" -exec rm -rf {} \;
	#-find . -name "__pycache__" -exec rm -rf {} \;
	-rm -rf __pycache__ scsprox/__pycache__ scsprox/tests/__pycache__ .cache
	-rm -rf .ipynb_checkpoints/

install:
	python setup.py install

distribute: clean
	python setup.py sdist
	python setup.py bdist_wheel --universal
	#twine register dist/*.whl
	twine upload dist/*