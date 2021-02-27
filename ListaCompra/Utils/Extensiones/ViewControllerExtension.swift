//
//  ViewControllerExtension.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 27/2/21.
//

import UIKit


extension UIViewController {
    
    //Transforma un VC en un NavigationVC
    func ConvierteEnVCNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
