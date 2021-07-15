//
//  HaveValidSnapshot.swift
//  Pods
//
//  Created by DJ Mitchell on 11/30/18.
//

import Foundation
import Nimble
import SnapshotTesting

public func haveValidSnapshot<Value, Format>(
    as strategy: Snapshotting<Value, Format>,
    named name: String? = nil,
    record recording: Bool = false,
    timeout: TimeInterval = 5,
    file: StaticString = #file,
    testName: String = CurrentTestCaseTracker.shared.currentTestCase?.sanitizedName ?? #function,
    line: UInt = #line
    ) -> Predicate<Value> {
    return Predicate { actualExpression in
        guard let value = try actualExpression.evaluate() else {
            return PredicateResult(status: .fail, message: .fail("have valid snapshot"))
        }

        guard let errorMessage = verifySnapshot(
            matching: value,
            as: strategy,
            named: name,
            record: isRecording,
            timeout: timeout,
            file: file,
            testName: testName,
            line: line
            ) else {
                return PredicateResult(bool: true, message: .fail("have valid snapshot"))
        }

        return PredicateResult(
            bool: false,
            message: .fail(errorMessage)
        )
    }
}

public func haveValidInlineSnapshot<Value>(
    as strategy: Snapshotting<Value, String>,
    named name: String? = nil,
    record recording: Bool = false,
    timeout: TimeInterval = 5,
    with reference: String,
    file: StaticString = #file,
    testName: String = CurrentTestCaseTracker.shared.currentTestCase?.sanitizedName ?? #function,
    line: UInt = #line
    ) -> Predicate<Value> {
    return Predicate { actualExpression in
        guard let value = try actualExpression.evaluate() else {
            return PredicateResult(status: .fail, message: .fail("have valid inline snapshot"))
        }

        guard let errorMessage = _verifyInlineSnapshot(
            matching: value,
            as: strategy,
            record: recording,
            timeout: timeout,
            with: reference,
            file: file,
            testName: testName,
            line: line
            ) else {
                return PredicateResult(bool: true, message: .fail("have valid inline snapshot"))
        }

        return PredicateResult(
            bool: false,
            message: .fail(errorMessage)
        )
    }
}
