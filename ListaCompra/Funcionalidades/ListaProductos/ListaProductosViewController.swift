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
        localize()
    }

    
    //MARK: - Funciones privadas
    private func setup(){
        
        setupTable()
    }
    
    private func localize() {
        title = NSLocalizedString("productos.title", comment: "")
    }
    
    private func setupTable(){
        ListaProductos.configura(Vc: self)
        ListaProductos.register(UINib(nibName: CeldaViewCell.kCellId, bundle: nil), forCellReuseIdentifier: CeldaViewCell.kCellId)
        ListaProductos.rowHeight = CGFloat(K.altoCeldaProducto)
        }
    
    //MARK: - DataSource y Delegate
    
    
    
    //MARK: - Funciones públicas
}

extension ListaProductosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CeldaViewCell.kCellId, for: indexPath) as? CeldaViewCell {
            cell.fill(nombreProducto: "Producto \(indexPath.row + 1)", precioProducto: "0.00€",cantidad: "0")
            return cell
        }

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    
    
    
    //MARK: - Menú al desplazar celda de derecha a izquierda y al contrario
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let borrar = UIContextualAction(style: .destructive,
                                        title: "Borrar") { [weak self] (action, view, completionHandler) in
                                            self?.borrarCelda()
                                            completionHandler(true)
        }
        
        borrar.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [borrar])
        
    }
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editar = UIContextualAction(style: .destructive,
                                        title: "Editar") { [weak self] (action, view, completionHandler) in
            self?.editarCelda(indice: indexPath.row)
                                            completionHandler(true)
        }
        
        editar.backgroundColor = .systemGray
        return UISwipeActionsConfiguration(actions: [editar])
    }
    
    
    private func borrarCelda() {
        print("Celda Borrada")
    }
    private func editarCelda(indice: Int) {
        navigationController?.pushViewController(DetalleProductoViewController(creador: "Producto \(indice + 1)"), animated: true)
        print("Editando Producto \(indice + 1)")
    }
    
    
    
    
}
