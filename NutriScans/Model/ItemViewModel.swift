//
//  ItemViewModel.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-17.
//

import Foundation
import Combine

class ItemViewModel: ObservableObject {
    
    @Published var itemData = ResponseModel(id: "", product: nil, status: -1)
    
    @MainActor //this will always run in the main thread
    func fetchData(scannedString: String) async {
        
        guard let downloadItems: ResponseModel = await WebService().downloadData(fromURL:"https://world.openfoodfacts.net/api/v2/product/\(scannedString)") else{
            print("Failed Fetch")
            return
        }
        itemData = downloadItems
    
    }
}
