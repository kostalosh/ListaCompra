//
//  CeldaViewCell.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 27/2/21.
//

import UIKit

final class CeldaViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var colorCategoria: UIView!
    @IBOutlet weak var nombreProductoLbl: UILabel!
    @IBOutlet weak var precioProductolbl: UILabel!
    @IBOutlet weak var nombreCategoria: UILabel!
    @IBOutlet weak var cantidadProducto: UILabel!
    
    
    //MARK: - Propiedades
    static let kCellId = "CeldaViewCell"
    
    
    //MARK: - Aplicacion
    override func awakeFromNib() {
        super.awakeFromNib()
      
        setup()
        setupUI()
    }
    
    //MARK: - Funciones Privadas
    
    private func setup(){
        configura()
        setupUI()
    }
    
    private func setupUI() {
        nombreProductoLbl.primaria()
        precioProductolbl.secundaria()
        nombreCategoria.secundaria()
        cantidadProducto.secundaria()
    }
    
    //MARK: - Funciones Públicas
    
    func fill(nombreProducto: String, precioProducto: String, cantidad: String){
        nombreProductoLbl.text = nombreProducto
        precioProductolbl.text = precioProducto
        cantidadProducto.text = cantidad
    }
    

}
