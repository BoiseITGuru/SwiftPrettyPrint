//
//  MultilineFormatterTests.swift
//  SwiftPrettyPrint
//
//  Created by Yusuke Hosonuma on 2020/02/26.
//

@testable import SwiftPrettyPrint
import XCTest

class MultilineFormatterTests: XCTestCase {
    var formatter: MultilineFormatter!

    override func setUp() {}

    override func tearDown() {}

    func testCollectionString() {
        let array: [String] = [#""Hello""#, #""World""#]

        formatter = MultilineFormatter(option: option(indent: 2))
        assertEqualLines(formatter.collectionString(elements: array),
                         """
                         [
                           "Hello",
                           "World"
                         ]
                         """)

        formatter = MultilineFormatter(option: option(indent: 4))
        assertEqualLines(formatter.collectionString(elements: array),
                         """
                         [
                             "Hello",
                             "World"
                         ]
                         """)
    }

    func testDictionaryString() {
        let keysAndValues: [(String, String)] = [
            ("2", #""Two""#),
            ("1", """
            One(value: 1,
                first: true)
            """),
        ]

        formatter = MultilineFormatter(option: option(indent: 2))
        assertEqualLines(formatter.dictionaryString(keysAndValues: keysAndValues),
                         """
                         [
                           1: One(value: 1,
                                  first: true),
                           2: "Two"
                         ]
                         """)

        formatter = MultilineFormatter(option: option(indent: 4))
        assertEqualLines(formatter.dictionaryString(keysAndValues: keysAndValues),
                         """
                         [
                             1: One(value: 1,
                                    first: true),
                             2: "Two"
                         ]
                         """)
    }
    
    func testTupleString() {
        let tupleElements: [(String?, String)] = [
            (
                Optional(nil),
                "\"first\""
            ),
            (
                "label",
                """
                One(value: 1,
                    first: true)
                """
            )
        ]

        formatter = MultilineFormatter(option: option(indent: 2))
        assertEqualLines(formatter.tupleString(elements: tupleElements),
                         """
                         (
                           "first",
                           label: One(value: 1,
                                      first: true)
                         )
                         """)

        formatter = MultilineFormatter(option: option(indent: 4))
        assertEqualLines(formatter.tupleString(elements: tupleElements),
                         """
                         (
                             "first",
                             label: One(value: 1,
                                        first: true)
                         )
                         """)
    }

    func testObjectString() {
        let fields: [(String, String)] = [
            ("name", #""pochi""#),
            ("owner", """
            Owner(
                name: "Nanachi",
                age: 4
            )
            """),
        ]

        let expected =
        """
        Dog(
          name: "pochi",
          owner: Owner(
                     name: "Nanachi",
                     age: 4
                 )
        )
        """

        formatter = MultilineFormatter(option: option(indent: 2))
        assertEqualLines(formatter.objectString(typeName: "Dog", fields: fields), expected)
    }
    
    // MARK: - Helper
        
    private func option(indent: Int) -> Debug.Option {
        Debug.Option(prefix: "", indent: indent)
    }
}
