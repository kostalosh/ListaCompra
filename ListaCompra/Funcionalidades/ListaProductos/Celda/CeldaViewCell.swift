//
//  CeldaViewCell.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 27/2/21.
//

import UIKit
import SwipeCellKit

final class CeldaViewCell:  UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var colorCategoria: UIView!
    @IBOutlet weak var nombreProductoLbl: UILabel!
    @IBOutlet weak var precioProductolbl: UILabel!
    @IBOutlet weak var nombreCategoria: UILabel!
    @IBOutlet weak var cantidadProducto: UILabel!
    @IBOutlet weak var UIStepper: UIStepper!
    
    
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
    
    @IBAction func UIStepperChanged(_ sender: Any) {
        cantidadProducto.text = String(format: "%.0f", UIStepper.value)
    }
    
}
