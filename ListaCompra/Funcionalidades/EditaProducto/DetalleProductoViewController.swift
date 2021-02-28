//
//  DetalleProductoViewController.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 28/2/21.
//

import UIKit

final class DetalleProductoViewController: UIViewController {
    
    //MARK: - Outlets
    
    //MARK: - Propiedades
    private let creador: String
    
    //MARK: - Inicilización
    
    init(creador: String){
        self.creador = creador
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    //MARK: - Funciones privadas
    
    private func setup() {
        
        
    }
    
    private func localize(){
        
        
    }
    
    //MARK: - Funciones públicas

    
}
