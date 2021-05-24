//
//  InlineSnapshotTestingNimbleSpec.swift
//  SnapshotTesting_NimbleTests
//
//  Created by DJ Mitchell on 12/4/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import SnapshotTesting
import SnapshotTesting_Nimble

struct TestViewModel {
    let itemId: Int
    let exampleBool: Bool
}

class InlineSnapshotTestingNimbleSpec: QuickSpec {

    override func spec() {
        describe("in arbitrary context") {

            describe("view recursive description") {
                var viewModel: TestViewModel!

                beforeEach {
                    viewModel = TestViewModel(itemId: 123, exampleBool: true)
                }

                it("has valid snapshot") {
                    expect(viewModel).to(haveValidInlineSnapshot(as: .dump, with: """
                    ▿ TestViewModel
                      - exampleBool: true
                      - itemId: 123
                    """))
                }

                it("has valid snapshot named") {
                    expect(viewModel).to(haveValidInlineSnapshot(as: .dump, named: "some name", with: """
                    ▿ TestViewModel
                      - exampleBool: true
                      - itemId: 123
                    """))
                }

                it("has valid snapshot testNamed") {
                    expect(viewModel).to(haveValidInlineSnapshot(as: .dump, with: """
                    ▿ TestViewModel
                      - exampleBool: true
                      - itemId: 123
                    """, testName: "valid_recursive_snapshot"))
                }
            }
        }
    }
}
