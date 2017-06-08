//
//  ItemDetailsVC.swift
//  DreamListerCoreDataExample
//
//  Created by Berkant Y. GEDIZ on 6/7/17,23.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    @IBOutlet weak var imageField: UIImageView!
    
    
    var stores = [Store]()
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
    var fetchedStoresController: NSFetchedResultsController<Store>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.dataSource = self
        storePicker.delegate = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
       //self.generateStoreTestData()
        self.attemptFetchStores()
        
        if itemToEdit != nil {
            self.loadItemData()
        }
    
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    func attemptFetchStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [nameSort]
        
        fetchedStoresController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
                let error = error as NSError
                print("\(error.description)")
        }
    }

    @IBAction func saveItemBtnPressed(_ sender: UIButton) {
        var item: Item!
        let picture = Image(context: context)
        picture.image = imageField.image
        
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        
        item.toImage = picture
        
        if let title = titleField.text {
            if !title.isEmpty {
                item.title = title
            }
        }
        
        if let price = priceField.text {
            if !price.isEmpty {
                item.price = (price as NSString).doubleValue
            }
        }
        
        if let details = detailsField.text {
            if !details.isEmpty {
                item.details = details
            }
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        appDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
    func loadItemData() {
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            imageField.image = item.toImage?.image as? UIImage
            
            if let s = item.toStore {
                for var i in 0..<self.stores.count {
                    if s.name == stores[i].name {
                        storePicker.selectRow(i, inComponent: 0, animated: false)
                        break
                    }
                }
            }
        }
    }
    
    @IBAction func deleteBtnPressed(_ sender: UIBarButtonItem) {
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            appDelegate.saveContext()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addImageBtnPressed(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageField.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    func generateStoreTestData () {
        let store1 = Store(context: context)
        store1.name = "Best Buy"
        
        let store2 = Store(context: context)
        store2.name = "Amazon"
        
        let store3 = Store(context: context)
        store3.name = "Jet"
        
        let store4 = Store(context: context)
        store4.name = "Macy's"
        
        let store5 = Store(context: context)
        store5.name = "Target"
        
        let store6 = Store(context: context)
        store6.name = "K Mart"
        
        let store7 = Store(context: context)
        store7.name = "Tesla dealership"
        
        appDelegate.saveContext()
    }
}
