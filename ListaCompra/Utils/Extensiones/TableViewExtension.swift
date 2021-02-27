//
//  TableViewExtension.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 27/2/21.
//

import UIKit

extension UITableView {
    
    //Configuración por defecto de una tabla
    func configura(Vc: UIViewController) {
        tableFooterView = UIView()
        delegate = Vc as? UITableViewDelegate
        dataSource = Vc as? UITableViewDataSource
        
        separatorStyle = .singleLine
    }
    
    
}
