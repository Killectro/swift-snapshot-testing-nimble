#!/bin/bash

xcodebuild \
	build-for-testing \
  	-project SnapshotTesting-Nimble.xcodeproj \
  	-scheme SnapshotTesting-Nimble \
  	-sdk iphonesimulator \
  	-destination 'platform=iOS Simulator,name=iPhone 11,OS=14.2' \
  	-derivedDataPath 'build'
  