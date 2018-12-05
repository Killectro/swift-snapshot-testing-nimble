#import "XCTestObservationCenter+CurrentTestCaseTracker.h"
#import <SnapshotTesting_Nimble/SnapshotTesting_Nimble-Swift.h>

@implementation XCTestObservationCenter (CurrentTestCaseTracker)

+ (void)load {
    [[self sharedTestObservationCenter] addTestObserver:[CurrentTestCaseTracker shared]];
}

@end
