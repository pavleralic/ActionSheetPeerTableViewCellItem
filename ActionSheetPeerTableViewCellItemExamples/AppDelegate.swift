//
//  AppDelegate.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/26/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupRealm()
        
        setupRealmDataIfNeeded()
        
        setupRootViewController()
        
        setupTimeFormat()
        
        return true
    }
    
    private func setupTimeFormat() {
        Date.is24HourTimeFormatSetted = !DateFormatter.dateFormat(fromTemplate: "j", options: 0, locale: Locale.current)!.contains("a")
    }
    
    private func setupRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        window!.makeKeyAndVisible()
    }
    
    private func setupRealm() {
        
        //Realm migration
        var realmConfiguration = Realm.Configuration (
            schemaVersion: 2, //here's the schema version you need to change
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 2) {
                    //if you want to perform particular tasks
                    //while migrating, place your code here.
                }
        })
        
        realmConfiguration.fileURL = realmConfiguration.fileURL!.deletingLastPathComponent().appendingPathComponent("actionSheetExample.realm")
        
        Realm.Configuration.defaultConfiguration = realmConfiguration
    }
    
    private func setupRealmDataIfNeeded() {
        
        let realm = try! Realm()
        
        let user1 = User(id: 1, name: "Roland", lastName: "Hall")
        
        let user2 = User(id: 2, name: "Jeremy", lastName: "Curtis")
        
        let user3 = User(id: 3, name: "Diana", lastName: "Campbell")
        
        let message1 = Message(id: 1, comment: "Hello!", pubDate: 1582807275, user: user1)
        
        let message2 = Message(id: 2, comment: "Hello Roland!", pubDate: 1582807475, user: user2)
        
        let message3 = Message(id: 3, comment: "Hello folks!", pubDate: 1582807675, user: user3)
        
        let message4 = Message(id: 4, comment: "How are you guys?", pubDate: 1582807875, user: user1)
        
        let message5 = Message(id: 5, comment: "When I see Sir Richard Branson, I remember the time when he was on Shark Tank and really shocked the whole crew. It's not a surprise Virgin has lasted 50 years - Sir Richard is as tenacious as they get!", pubDate: 1582807975, user: user1)
        
        let message6 = Message(id: 6, comment: "How exciting for you and for US to read!  Thank you for sharing your journey with us", pubDate: 1582808575, user: user3)
        
        let message7 = Message(id: 7, comment: "Omgosh just watching him talk about this book and just the excitement in his voice like a little boy getting his first toy, So heartwarming lol. I love to watch him. Like to just watch his actions lol to cute", pubDate: 1582809075, user: user2)
        
        let message8 = Message(id: 8, comment: "Creative and culture are key and I am a huge fan of Virgin’s dynamic diverse culture! Steeped with tradition as well! Go virgin!  MAsami haircare would love be a part of the Virgin experience", pubDate: 1582809275, user: user3)
        
        let message9 = Message(id: 9, comment: "Cool is unique, compliancy with good marketing is common and Commons before decline.", pubDate: 1582809675, user: user1)
        
        let message10 = Message(id: 10, comment: "Omgosh just watching him talk about this book and just the excitement in his voice like a little boy getting his first toy, So heartwarming lol. I love to watch him. Like to just watch his actions lol to cute", pubDate: 1582829675, user: user2)
                        
        try! realm.write {
            realm.deleteAll()
            realm.add([user1,user2,user3,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10])
        }
    }
}

