//
//  ViewController.swift
//  Challenge5
//
//  Created by Keith Crooc on 2021-10-03.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [Country]()
    
     
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    

        parseJSON()
        

    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        
        let Country = countries[indexPath.row]
        cell.textLabel?.text = Country.name
        cell.detailTextLabel?.text = Country.capital
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        vc.countryFacts = countries[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func parseJSON() {
        
        guard let path = Bundle.main.path(forResource: "Countries", ofType: "json") else { return }

        let url = URL(fileURLWithPath: path)
        
        
        let decoder = JSONDecoder()
        
        
        do {
            let jsonData = try Data(contentsOf: url)
            
            if let jsonCountries = try? decoder.decode(Countries.self, from: jsonData) {
                countries = jsonCountries.countries
            }
        } catch {
            print("Failed to parse")
        }
        
    }


    }

