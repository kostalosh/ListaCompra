//
//  ListaProductosViewController.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 27/2/21.
//

import UIKit
import CoreData

final class ListaProductosViewController: UIViewController {

    //MARK: - Variables globales
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var productoArray = [Producto]()
    
    //MARK: - Outlets
    @IBOutlet weak var ListaProductos: UITableView!
    
    
    
    //MARK: - Aplicación
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)

        //imprime ruta
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        setup()
        configuraBarraSuperior()
        localize()
        cargaDatos()
    }

    override func viewWillAppear(_ animated: Bool) {
        let request: NSFetchRequest<Producto> = Producto.fetchRequest()
        
        do {
            try productoArray = context.fetch(request)
        } catch  {
            print("Error al recuperar los datos")
        }
        self.ListaProductos.reloadData()
    }
    
    //MARK: - Funciones privadas
    
   @objc func loadList() {
        self.ListaProductos.reloadData()
    }
    
    private func cargaDatos() {
        let request : NSFetchRequest<Producto> = Producto.fetchRequest()
        do {
           productoArray = try context.fetch(request)
        } catch  {
            print("Error al recuperar los datos")
        }
        
        
    }
    private func configuraBarraSuperior(){
        //Título
        localize()
        //añade boton OK al navigation controller
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(botonAñadirPulsado))
    }
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
    
    //Botón de añadir pulsado
    @objc private func botonAñadirPulsado(){
        
        //vamos a la ventana de creación de nuevo producto
        navigationController?.pushViewController(NuevoProductoView(nombreProducto: "", precioProducto: 0.0), animated: true)
        
        
        
      /*  var textField = UITextField()
        let controller = UIAlertController(title: "Añade producto", message: "", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Añadir", style: .default) {
         (action) in
            let producto = Producto(context: self.context)
            producto.nombre = textField.text!
            self.guardaDatos()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        controller.addAction(addAction)
        controller.addAction(cancelAction)
        
        controller.addTextField { (alertTextField) in
            alertTextField.placeholder = "Escribe aquí el nombre del producto"
            textField = alertTextField
        }
        present(controller, animated: true, completion: nil)
    */
    }
    
    private func guardaDatos(){
        do{
            try context.save()
        } catch {
            print("Error al intentar guardar los datos")
        }
        self.ListaProductos.reloadData()
    }
    
    //MARK: - DataSource y Delegate
    
    
    
    //MARK: - Funciones públicas
}

extension ListaProductosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productoArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = productoArray[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: CeldaViewCell.kCellId, for: indexPath) as? CeldaViewCell {
            cell.fill(nombreProducto: item.nombre ?? "", precioProducto: String(item.precio) ,cantidad: "0")
            return cell
        }

        return UITableViewCell()
    }
    
    // evento al pulsar en una celda
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
