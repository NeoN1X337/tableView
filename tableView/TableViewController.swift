//
//  TableViewController.swift
//  tableView
//
//  Created by Алдияр Женисулы on 29.10.2024.
//

import UIKit

class TableViewController: UITableViewController {

    //var array = ["1","2","3","4", "5"]
    
//    var arrayBrands = ["Rolls-Royce", "Lexus", "Mercedes", "Mercedes", "Toyota"]
//    var arrayModels = ["Phantom", "ES350","CLS63", "GLS63", "Supra"]
//    var arrayImage = ["Rolls-Royce-Phantom", "Lexus-ES-350", "Mercedes-CLS-63AMG", "Mercedes-GLS-63AMG", "Toyota-Supra"]
    
    var arrayCars = [Car(brand: "Rolls-Royce", model: "Phantom", imageName: "Rolls-Royce-Phantom"),
                     Car(brand: "Lexus", model: "ES350", imageName: "Lexus-ES-350"),
                     Car(brand: "Mercedes", model: "CLS63", imageName: "Mercedes-CLS-63AMG"),
                     Car(brand: "Mercedes", model: "GLS63", imageName: "Mercedes-GLS-63AMG"),
                     Car(brand: "Toyota", model: "Supra", imageName: "Toyota-Supra")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func addCar(_ sender: Any) {
        arrayCars.append(Car(brand: "UnknownBrand", model: "UnknownModel", imageName: "unknown-car"))
        
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayCars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = arrayCars[indexPath.row].brand
        
        let labelModels = cell.viewWithTag(1002) as! UILabel
        labelModels.text = arrayCars[indexPath.row].model
        
        let imageView = cell.viewWithTag(1003) as! UIImageView
        imageView.image = UIImage(named: arrayCars[indexPath.row].imageName)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        vc.car = arrayCars[indexPath.row]
        
        navigationController?.show(vc, sender: self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            arrayCars.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
