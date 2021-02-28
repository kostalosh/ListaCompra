//
//  ListaProductosViewController.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 27/2/21.
//

import UIKit

final class ListaProductosViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var ListaProductos: UITableView!
    
    
    //MARK: - Aplicación
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
      
    }

    
    //MARK: - Funciones privadas
    private func setup(){
        setupTable()
        
        
    }
    private func setupTable(){
        ListaProductos.configura(Vc: self)
        ListaProductos.register(UINib(nibName: CeldaViewCell.kCellId, bundle: nil), forCellReuseIdentifier: CeldaViewCell.kCellId)
        }
    
    //MARK: - DataSource y Delegate
    
    
    
    //MARK: - Funciones públicas
}

extension ListaProductosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CeldaViewCell.kCellId, for: indexPath) as? CeldaViewCell {
            cell.fill(nombreProducto: "Producto \(indexPath.row + 1)", precioProducto: "0.00€")
            return cell
        }

        return UITableViewCell()
        
    }
    
    
}
