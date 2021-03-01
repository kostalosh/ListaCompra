//
//  DetalleProductoViewController.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 28/2/21.
//

import UIKit


final class DetalleProductoViewController: UIViewController  {
       
   
    
    //MARK: - Outlets
    
    @IBOutlet weak var nombreProductoTitle: UILabel!
    @IBOutlet weak var btnEliminar: UIButton!
   
    @IBOutlet weak var UbicacionTxt: UITextField!
    
    
    
    
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
        setup()
        localize()
    }
   

    //MARK: - Funciones privadas
    
    private func setup() {
        //añade boton OK al navigation controller
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "OK", style: .plain, target: self, action: nil)
        //configura botón
        btnEliminar.redondea()
        
        
    }
    
    private func localize(){
        title = "Editando \(creador)"
        
    }
    
   
    
    
   
    
    
    //MARK: - Funciones públicas

    
}
