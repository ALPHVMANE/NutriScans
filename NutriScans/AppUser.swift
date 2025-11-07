//
//  AppUser.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-03.
//

import Foundation
import FirebaseFirestore


struct AppUser: Identifiable, Codable {
    
    @DocumentID var id: String? // we will use FirebaseAuth.User.uid
    let email: String
    var displayName: String
    var isActive: Bool = true // by default true
}
