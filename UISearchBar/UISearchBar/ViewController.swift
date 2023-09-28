//
//  ViewController.swift
//  UISearchBar
//
//  Created by Yakup on 28.09.2023.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

	@IBOutlet weak var searchBar: UISearchBar!
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		searchBar.delegate = self
		
		let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
		
		// Search Bar Text Color
		textFieldInsideSearchBar?.textColor = .brown
		// Search Bar Sol Icon Rengi
		searchBar.searchTextField.leftView?.tintColor = .red
	}

	// Search Bar içinde bir metin girildiğinde her harf için çalışacak fonksiyon
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		print("SearchBar text değişti: \(searchText)")
	}
	
	// Search Bar seçiliyken klavyeden Ara seçeneği tıklandığında çalışır
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		print("SearchBar üzerinde klavyeden Ara seçeneği tıklandı!")
	}
	
	// Search Bar üzerine ilk tıklanışta çalışır
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		print("SearchBar üzerine tıklandı!")
	}
	
	// Search Bar üzerinden başka bir yere odaklanıldığında çalışır.
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		print("SearchBar'dan çıktı!")
	}
	
}

