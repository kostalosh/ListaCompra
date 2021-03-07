//
//  ColorExtension.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 27/2/21.
//

import UIKit

extension UIColor {
    //MARK: - Constantes de colores
    static let letraPrincipal = UIColor (named: "colorNombresPrincipal")
    static let letraSecundaria = UIColor (named: "colorNombresSecundario")
    
    //MARK: - conversor a Hex y viceversa
    convenience init?(hex: String) {
        var hexNormalizado = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexNormalizado = hexNormalizado.replacingOccurrences(of: "≠", with: "")
        
        //variables de RGB
        var rgb: UInt64 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        let longitud = hexNormalizado.count
        
        Scanner(string: hexNormalizado).scanHexInt64(&rgb)
        if longitud == 6 {
            r = CGFloat(Double((rgb & 0xFF0000) >> 16))/255.0
            g = CGFloat(Double((rgb & 0x00FF00) >> 8))/255.0
            b = CGFloat(Double((rgb & 0x0000FF))/255.0)
        } else {
            return nil
        }
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
    var toHex : String? {
        guard let components = cgColor.components, components.count  >= 3 else { return nil }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        let a = Float(1.0)
        
        let hex = String(format: "%02lX%02lX%02lX%02lX", lroundf(r*255),lroundf(g*255),lroundf(b*255),lroundf(a*255))
        return hex
    }
}

