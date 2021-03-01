//
//  PickerViewExtension.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 1/3/21.
//

import UIKit


extension UIPickerView {
    
    func configura(vc: UIViewController) {
        delegate = vc as? UIPickerViewDelegate
        dataSource = vc as? UIPickerViewDataSource
    }
    
     
}
