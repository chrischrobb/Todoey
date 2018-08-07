//
//  AppDelegate.swift
//  Todoey
//
//  Created by Krystian Chrobok on 28/07/2018.
//  Copyright © 2018 Krystian Chrobok. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // to jest to pierwsze co sie laduje zanim laduje sie inicial view controller
        //print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        //zapis umozliwiw a koncoli sprawdzenei gdzie zapisuja sie nasze dane w tym wypadku User Defaults
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // jesli cos sie stanie podczas ladowania aplikacji zabezpiecza przed utrata danych
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        //kiedy aplikacja znika z ekranu przez inne przyciski aplikacja nie jest widoczna ale dziala w tle
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // kiedy ja zgasze albo wywali ja system by uzyskac wiecej pamieci telefonu, mozesz tu dodac save np dla pewnosi zebynie stracil uzytkownik danych co wprowadzal, mozna tez dodac do go to bacground 
    }


}

