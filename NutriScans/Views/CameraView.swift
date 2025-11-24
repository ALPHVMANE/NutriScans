//
//  CameraView.swift
//
//
//  SCANNER VIEW
//

import SwiftUI
import AVFoundation
import Vision
import OpenFoodFactsSDK

struct CameraView: View {
    
    @State public var scannedString: String = "Scan a barcode"
    @State public var showItemView = false
    @State var isValidBarcode: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom) {
                 ScannerView(scannedString: $scannedString)
                     .edgesIgnoringSafeArea(.all)
                     .onChange(of: scannedString){
                         print(scannedString)
                         showItemView = viewCheck(barcode: scannedString)
                         isValidBarcode = scannedString.isAValidBarcode()
                         print("Valid barcode?: \(isValidBarcode)")
                     }.sheet(isPresented: $showItemView, onDismiss: resetValues){
                         ProductPage(barcode: self.scannedString) { uploadedProduct in
                                              print(uploadedProduct?.json() ?? "returned product is nil")
                         }.presentationBackground(Color(red: 26/255, green: 17/255, blue: 16/255))
                     }.interactiveDismissDisabled()
                    .background(Color(hex: 0x1a1110))
               
                Text(scannedString)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .padding()
                    .onTapGesture {
                    }
             }
        }
    }
    
    func resetValues(){
        self.scannedString = "Scan a barcode"
        self.showItemView = false
    }
    
    func viewCheck(barcode: String) -> Bool{
        if scannedString == "Scan a barcode"{
            return false
        }
        else{
            return true
        }
    }
}


#Preview {
    CameraView()
}
