//
//  DetailViewController.swift
//  MyProject5 - CountriesFacts
//
//  Created by Vitali Vyucheiski on 4/29/22.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedCountry: Country?
    
    @IBOutlet weak var capitalOut: UILabel!
    @IBOutlet weak var sizeOut: UILabel!
    @IBOutlet weak var populationOut: UILabel!
    @IBOutlet weak var currencyOut: UILabel!
    @IBOutlet weak var headOfGovOut: UILabel!
    @IBOutlet weak var languageOut: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCountry?.country
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        capitalOut.text = "Capital: \(String(describing: selectedCountry!.capital))"
        sizeOut.text = "Size: \(String(describing: selectedCountry!.size))"
        populationOut.text = "Population: \(String(describing: selectedCountry!.population))"
        currencyOut.text = "Currency: \(String(describing: selectedCountry!.currency))"
        headOfGovOut.text = "Head Of Government: \(String(describing: selectedCountry!.headOfGov))"
        languageOut.text = "Language: \(String(describing: selectedCountry!.language))"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: ["\(selectedCountry!.country.uppercased()) \n\nCapital: \(String(describing: selectedCountry!.capital)) \nPopulation: \(String(describing: selectedCountry!.population)) \nCurrency: \(String(describing: selectedCountry!.currency)) \nHead Of Government: \(String(describing: selectedCountry!.headOfGov)) \nLanguage: \(String(describing: selectedCountry!.language))"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
