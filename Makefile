all: deps

deps:
	npm install
	@echo "Done!"
	@echo "Run 'make build' to build orbit-electron app stand-alone binary."
	@echo "Run 'npm run dev' to start the app in developer mode."
	@echo "Run 'make start' to start the app."

build: deps
	npm run build
	@echo "Build success!"
	@echo "Build is in 'bin/'"
	@echo "Run 'make dist' to build the distribution packages for orbit-electron app."

start: deps
	npm start

package:
	rm -rf bin/dist/
	mkdir -p bin/dist/
	cd bin/ && tar -zcf dist/orbit-darwin-x64.tar.gz Orbit-darwin-x64/
	cd bin/ && tar -zcf dist/orbit-linux-x64.tar.gz Orbit-linux-x64/
	@echo "Distribution packages are in: bin/dist/"

dist: package
	cd bin/dist/ && ipfs add -r .

clean:
	rm -rf bin/
	rm -rf node_modules/
	rm -rf orbit-dev-data/
	rm -rf .tmp/

.PHONY: start