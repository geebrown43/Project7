//
//  ViewController.swift
//  Project7
//
//  Created by Gavin Brown on 1/13/19.
//  Copyright © 2019 DevelopITLLC. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var petitions: [Petition] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // FIX: Url is no longer active so i cant retain any petition data
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100" //This points to the whitehouse Server system

        if let url = URL(string: urlString) { // makes sure address is valid instead of force unwrapping
            if let data = try? Data(contentsOf: url){ // returns contents of address
                // we are ok to Parse!!
                print("Data was returned")
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder() // converts between JSON and Codeable objects
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){ // decode method converts json data into a Petitions obect
            petitions = jsonPetitions.results // assigns whats returned to petitions array
            tableView.reloadData() // reloads table with data
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(petitions.count)
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //let petition = petitions[indexPath.row]
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here"
        return cell
    }

}

