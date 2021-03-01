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
    @IBOutlet weak var UnidadesTxt: UITextField!
    
    var ubicacionPickerView = UIPickerView()
    var unidadesPickerView = UIPickerView()
    
    
    //MARK: - Propiedades
    private let creador: String
    let ubicaciones = ["Bebidas","Carnicería","Congelados","Higiene personal"]
    let unidades = ["Botellas","Cajas","Paquetes","Unidades","Docena"]
    
    //MARK: - Inicialización
    
    init(creador: String){
        self.creador = creador
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UbicacionTxt.inputView = ubicacionPickerView
        UnidadesTxt.inputView = unidadesPickerView
        setup()
        localize()
        
        
    }
    
    //MARK: - Funciones privadas
    
    
    private func setup() {
        //añade boton OK al navigation controller
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "OK", style: .plain, target: self, action: nil)
        //configura botón
        btnEliminar.redondea()
        
        //configura los pickerview
        ubicacionPickerView.configura(vc: self)
        unidadesPickerView.configura(vc: self)
        
        //añade borde a labels
              
        //Asignamos numeros a cada picker
        ubicacionPickerView.tag = 1
        unidadesPickerView.tag = 2
        
    }
    
    private func localize(){
        title = "Editando \(creador)"
        
    }
    
    
    //MARK: - Funciones públicas
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
}

extension DetalleProductoViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 1:
            return ubicaciones.count
        case 2:
            return unidades.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            UbicacionTxt.text = ubicaciones[row]
            UbicacionTxt.resignFirstResponder()
        case 2:
            UnidadesTxt.text = unidades[row]
            UnidadesTxt.resignFirstResponder()
        default:
            return
            
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return ubicaciones [row]
        case 2:
            return unidades[row]
        default:
            return "Sin datos..."
        }
    }
    
}

extension DetalleProductoViewController: UITextFieldDelegate {
    private func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
                 return false
}
    }
