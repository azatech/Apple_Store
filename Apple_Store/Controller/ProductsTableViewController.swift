//
//  ProductTableViewController.swift
//  rock-paper-scissors
//
//  Created by Azat IOS on 14.12.2017.
//  Copyright © 2017 Azat IOS. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    //var products = ProductLine.getProductLines()[0].products

    var productLines: [ProductLine] = ProductLine.getProductLines()


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Apple Store"

        // bar button item - edit
        navigationItem.rightBarButtonItem = editButtonItem

        // estimated = dimension Row height
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - UITableViewDataSource
    // 1. how many sections
    // 2. how many rows
    // 3. how each of the row display!

    override func numberOfSections(in tableView: UITableView) -> Int {
        return productLines.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productLines[section].products.count
    }

    // cell For row at index Path Method
    // 1. Prototype Cell - how muy cell will look like
    // 2. dequeue a new cell - 

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        // Displaying data in cell
        //  each product will shown on the cell.textLabel.text
        //        let product = products[indexPath.row]

        let productLine = productLines[indexPath.section]
        let products = productLine.products
        let product = products[indexPath.row]

        // the same path as? above constant --> product
        // cell.product = productLines[indexPath.section].products[indexPath.row]

        cell.product = product
        return cell
    }

    // Multiple Section

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let productLine = productLines[section]

        return productLine.name
    }

    // Deleting Rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            // 1. - delete the product from the productLine's product's array
            let productLine = productLines[indexPath.section]
            productLine.products.remove(at: indexPath.row)

            // 2. - update table view with a new data
            // tableView.reloadData() // bad way
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }


    //we can move to another
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

        let productToMove = productLines[sourceIndexPath.section].products[sourceIndexPath.row]

        // move productToMove to the destination
        productLines[destinationIndexPath.section].products.insert(productToMove, at: destinationIndexPath.row)

        // delete the product ToMove from the source products
        productLines[sourceIndexPath.section].products.remove(at: sourceIndexPath.row)
    }


    // MARK: - UITableViewDelegate

    var selectedProduct: Product?

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productLine = productLines[indexPath.section]
        let product = productLine.products[indexPath.row]

        selectedProduct = product

        performSegue(withIdentifier: "showProductDetail", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetail" {
            let productDetailTVC = segue.destination as! ProductDetailTableViewController
            productDetailTVC.product = selectedProduct
        }
    }



}

