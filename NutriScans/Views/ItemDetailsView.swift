//
//  ItemDetailsView.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-17.
//

//import SwiftUI
//
//struct ItemDetailsView: View {
//    //    @Binding var scannedString: String
//    @StateObject var itm = ItemViewModel();
//    //    @State private var foodId = ""
//    //    @State private var name = ""
//    //    @State private var imgUrl = ""
//    
//    //function to save ---> written in contentview
//    //passing the functin to the main threat
//    
//    
//    var body: some View {
//        //            VStack{
//        //                AsyncImage(url: (itm.itemData.product?.itemImg ?? URL(string:"https://imgs.search.brave.com/d8rHLqV2cnFszJukGvCDioKsoFwTbBJ4i7VeAzoL200/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by9mb29kLTE4Xzg3/ODEwOS0zNy5qcGc_/c2VtdD1haXNfaHli/cmlkJnc9NzQwJnE9/ODA")))
//        //                Text("name: " + (itm.itemData.product?.name ?? "Product does not exist, please scan again"))
//        //                Text("ingredients: " + (itm.itemData.product?.ingredients ?? "N/A"))
//        //           }
//        ZStack(alignment: .center){
//            
//            RoundedRectangle(cornerRadius: 0)
//                .fill(Color(hex: 0x271d1c))
//                .frame(height: 2000)
//            
//            VStack{
//                AsyncImage(url: URL(string:"https://imgs.search.brave.com/d8rHLqV2cnFszJukGvCDioKsoFwTbBJ4i7VeAzoL200/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by9mb29kLTE4Xzg3/ODEwOS0zNy5qcGc_/c2VtdD1haXNfaHli/cmlkJnc9NzQwJnE9/ODA")){result in
//                    result.image?
//                        .resizable()
//                        .scaledToFill()
//                }
//                .frame(width: 350, height: 350 )
//                .cornerRadius(40)
//                
//                Text("Product does not exist, please scan again")
//                    .font(.title)
//                    .padding(.bottom, 25)
//                
//                HStack(){
//                    Text("Ingredients:")
//                        .font(.headline)
//                    Spacer()
//                    Text("N/A")
//                }.padding(.horizontal, 100)
//            }
//        }
//     
//    }
//}
//
//#Preview {
//    ItemDetailsView()
//}
