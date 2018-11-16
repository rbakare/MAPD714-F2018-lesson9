
import Foundation
import UIKit

class FavoritesList {
    
    
    public static let sharedFavoritesList = FavoritesList()
    private(set) var favorites:[String]
    
   
    init(){
     let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        
        favorites = storedFavorites != nil ? storedFavorites : []
    }
    func addFavorites(fontName: String) {
        if !favorites.contains(fontName){
            favorites.append(fontName)
            saveFavorites()
        }
    }
    func removeFavorites(fontName:String){
      
        if let index = favorites.index(of: fontName){
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    func saveFavorites(){
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
}
