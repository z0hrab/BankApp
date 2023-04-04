//
//  CrudOperations.swift
//  atl_bankApp
//
//  Created by zed on 04.03.23.
//

import Foundation

class CrudOperations {
    
    // Method for receiving the file url
    static func getFileURL() -> URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths) // for checking purposes
        let path = paths[0].appendingPathComponent("Users.json")
        return path
    }
    
    // Writing to a file
    static func writeOperation(userList: [User]) {
        do {
            let data = try JSONEncoder().encode(userList)
            try data.write(to: self.getFileURL()!)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    // Reading from a file
    static func readOperation() -> [User] {
        var userList: [User] = [User]()
        do {
            let data = try Data(contentsOf: getFileURL()!)
            userList = try JSONDecoder().decode([User].self, from: data)
        }
        catch {
            print(error.localizedDescription)
        }
        return userList
    }
}
