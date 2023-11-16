//
//  KeyChain.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import KeychainSwift

@discardableResult
func saveKC(key: String, value: String) -> Bool {
    
    if let data = value.data(using: .utf8){
        return KeychainSwift().set(data, forKey: key)
    } else {
        return false
    }
}


func loadKC(key: String) -> String? {
    if let data = KeychainSwift().get(key){
        return data
    } else{
        return ""
    }
}

func deleteKC(key: String) -> Bool{
    KeychainSwift().delete(key)
}
