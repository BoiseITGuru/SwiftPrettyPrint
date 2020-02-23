//
//  AppDelegate.swift
//  SwiftPrettyPrintExample
//
//  Created by Yusuke Hosonuma on 2020/02/18.
//  Copyright © 2020 Yusuke Hosonuma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // --------
        // Example
        // --------
        let dog = Dog(id: DogId(rawValue: "pochi"), price: Price(rawValue: 10.0), name: "ポチ")

        Debug.print(dog)
        // => Dog(id: "pochi", price: 10.0, name: "ポチ")

        Debug.prettyPrint(dog)
        // =>
        // Dog(id: "pochi",
        //     price: 10.0,
        //     name: "ポチ")

        Debug.debugPrint(dog)
        // => Dog(id: DogId(rawValue: "pochi"), price: Price(rawValue: 10.0), name: Optional("ポチ"))

        Debug.debugPrettyPrint(dog)
        // =>
        // Dog(id: DogId(rawValue: "pochi"),
        //     price: Price(rawValue: 10.0),
        //     name: Optional("ポチ"))

        // -------------------
        // Swift standard API
        // -------------------
        print(dog)
        // => Dog(id: SwiftPrettyPrintExample.DogId(rawValue: "pochi"), price: SwiftPrettyPrintExample.Price(rawValue: 10.0), name: Optional("ポチ"))

        debugPrint(dog)
        // => SwiftPrettyPrintExample.Dog(id: SwiftPrettyPrintExample.DogId(rawValue: "pochi"), price: SwiftPrettyPrintExample.Price(rawValue: 10.0), name: Optional("ポチ"))

        dump(dog)
        // ▿ SwiftPrettyPrintExample.Dog
        //   ▿ id: SwiftPrettyPrintExample.DogId
        //     - rawValue: "pochi"
        //   ▿ price: SwiftPrettyPrintExample.Price
        //     - rawValue: 10.0
        //   ▿ name: Optional("ポチ")
        //     - some: "ポチ"

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_: UIApplication, didDiscardSceneSessions _: Set<UISceneSession>) {}
}
