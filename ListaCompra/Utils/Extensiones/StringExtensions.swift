//
//  StringExtensions.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 28/2/21.
//

import UIKit

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func upperLocalize() -> String {
        localize().uppercased()
    }
    
    func lowerLocalize() -> String {
        localize().lowercased()
    }
    
    
}

