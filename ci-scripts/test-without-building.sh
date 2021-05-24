#!/bin/bash

xcodebuild \
	test-without-building \
	-xctestrun 'build/Build/Products/SnapshotTesting-Nimble_iphonesimulator14.5-x86_64.xctestrun' \
  	-destination 'platform=iOS Simulator,name=iPhone 11,OS=14.5'
  