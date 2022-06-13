//
//  ViewController.swift
//  MyProject5 - CountriesFacts
//
//  Created by Vitali Vyucheiski on 4/29/22.
//

import UIKit

class ViewController: UITableViewController {
//Variables -----------
    var countries = [Country]()
    
//View did load ------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showCreator))
        
        title = "Countries Facts"
        
        guard let JSONToParse = readLocalFile() else { return }
        navigationController?.navigationBar.prefersLargeTitles = true
        
        parse(json: JSONToParse)
    }
    
//Parsing this Fing JSON --------------------
    func readLocalFile() -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "countries", ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }

        return nil
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let countriesJSON = try? decoder.decode(Countries.self, from: json) {
            countries = countriesJSON.results
            countries.sort { $0.country > $1.country }
            tableView.reloadData()
        }
    }
    
//Configuring table View
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.country
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedCountry = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

//ACes -----------
    
    @objc func showCreator() {
        let ac = UIAlertController(title: "Coded By Vitali Vyucheiski", message: "https://vk.com/vitali_vyucheiski", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Great!", style: .default))
        present(ac, animated: true)
    }

}

