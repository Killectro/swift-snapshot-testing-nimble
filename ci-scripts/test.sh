#!/bin/bash

xcodebuild \
	test \
	-project SnapshotTesting-Nimble.xcodeproj \
  	-scheme SnapshotTesting-Nimble \
  	-sdk iphonesimulator \
  	-destination 'platform=iOS Simulator,OS=15.0,name=iPhone 11 Pro'