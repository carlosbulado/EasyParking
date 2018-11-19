//
//  Database.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-12.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class Database
{
    static let pathToDatabase = Bundle.main.path(forResource: "Database", ofType: "sqlite")
    static let myDatabase = FMDatabase(path: pathToDatabase)
    
    init()
    {
        Database.createTables()
        Database.insertBasicRegs()
    }
    
    static func createTables()
    {
        myDatabase.open()
        var newTable = "CREATE TABLE IF NOT EXISTS User (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, login TEXT, password TEXT, contactNumber TEXT, plateNumber TEXT, email TEXT, carCompany TEXT, carColor TEXT)"
        myDatabase.executeStatements(newTable)
        newTable = "CREATE TABLE IF NOT EXISTS ParkingPaymentReceipt (id INTEGER PRIMARY KEY AUTOINCREMENT, userId INTEGER, hoursParked REAL, date NUMERIC, lotNumber INTEGER, SpotNumber INTEGER, PaymentMethod INTEGER, PaymentAmount REAL)"
        myDatabase.executeStatements(newTable)
        myDatabase.close()
    }
    
    static func insertBasicRegs()
    {
        let _ = Database.save("insert into User (name, login, password, plateNumber, carCompany, carColor, email) values (?, ?, ?, ?, ?, ?, ?)", ["Administrator", "admin", "123", "DIY 000", "Honda", "Green", "adm@adm.com"])
        let _ = Database.save("insert into ParkingPaymentReceipt (userId, hoursParked, date, lotNumber, SpotNumber, PaymentMethod, PaymentAmount) values (?, ?, ?, ?, ?, ?, ?)", ["1", "2", "1542589241.4228", "1", "1", "0", "8"])
    }
    
    static func save(_ sql : String, _ params : [Any]) -> Bool
    {
        myDatabase.open()
        let saved : Bool = myDatabase.executeUpdate(sql, withArgumentsIn: params)
        if !saved
        {
            print("didnt save - \(sql)")
        }
        myDatabase.close()
        return saved
    }
    
    static func select(_ sql : String, _ params : [Any] = []) -> [[String : String]]
    {
        myDatabase.open()
        var select : [[String : String]] = []
        let results : FMResultSet? = myDatabase.executeQuery(sql, withArgumentsIn: params)
        while results?.next() == true {
            var line = [String : String]()
            for i in 0..<Int("\(results?.columnCount ?? 0)")!
            {
                let columnName = (results?.columnName(for: Int32(i)))!
                line[columnName] = results?.string(forColumnIndex: Int32(i))
            }
            select.append(line)
        }
        myDatabase.close()
        return select
    }
    
}
