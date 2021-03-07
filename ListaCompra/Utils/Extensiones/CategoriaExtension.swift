//
//  CategoriaExtension.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 7/3/21.
//

import UIKit

//Extensión de la clase Categorías

extension Categorias {
    var color: UIColor? {
        get{
            guard let hex = colorHex else { return nil}
            return UIColor(hex: hex)
        }
        set(newColor){
            if let newColor = newColor {
                colorHex = newColor.toHex
            }
        }
    }
}
