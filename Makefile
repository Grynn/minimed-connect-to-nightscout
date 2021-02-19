
MOCHA=./node_modules/.bin/mocha --timeout 15000

.PHONY: test

test: node_modules
	MMCONNECT_SERVER=EU ${MOCHA} test/connectEu.js
	MMCONNECT_COUNTRYCODE=us ${MOCHA} test/connectUs.js
	${MOCHA} test/integration.js
	${MOCHA} test/filter.js
	${MOCHA} test/transform.js
	${MOCHA} test/multitenant.js

node_modules: package-lock.json
	npm install
	touch node_modules

package-lock.json: package.json
	npm install
	touch package-lock.json

