//
//  NuevoProductoView.swift
//  ListaCompra
//
//  Created by Antonio Galvan Ruiz on 6/3/21.
//

import UIKit

final class NuevoProductoView: UIViewController {
    
    //MARK: - Constructor
    private let nombreProducto: String
    private let precioProducto: Double
    
    init(nombreProducto: String, precioProducto: Double){
        self.nombreProducto = nombreProducto
        self.precioProducto = precioProducto
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Outlets
    
    @IBOutlet weak var btnBotonAñadir: UIButton!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtPrecio: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
    }


   //MARK: - Funciones públicas
    
    @IBAction func btnAñadirPressed(_ sender: Any) {
        let nCaracteres: Int = txtNombre.text?.count ?? 0
        if nCaracteres == 0 {
            self.showAlert(withTitle: "Rellene todos los datos", message: "")
        } else {
            if let _ = Double(txtPrecio.text ?? "0.0") {
                guardaDatos()
            }
        }
    }
    
    func guardaDatos() {
        let producto = Producto(context: context)
        producto.nombre = txtNombre.text
        producto.precio = (txtPrecio.text as NSString?)!.doubleValue // Double(txtPrecio.text)
        do {
            try context.save()
            self.showAlert(withTitle: "Producto guardado", message: "")
            
            limpiaFormulario()
            
            
        } catch  {
            print("Error al guardar los datos...")
        }
    }
    private func limpiaFormulario(){
        txtNombre.text = ""
        txtPrecio.text = ""        
    }
    
    
    //MARK : - Funciones privadas
    
    private func setup() {
    
        //Botón añadir
        btnBotonAñadir.redondea()
    }
    
    
}

extension UIViewController {
  func showAlert(withTitle title: String?, message: String?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
}
