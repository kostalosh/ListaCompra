//
//  LabelExtension.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 27/2/21.
//

import UIKit


extension UILabel {
    
    
    func primaria() {
        textColor = .letraPrincipal
        
    }
    
    func secundaria() {
        textColor = .letraSecundaria
    }
    
    func conBorde(){
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
    }
    
}
