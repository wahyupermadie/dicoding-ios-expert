//
//  AppApp.swift
//  App
//
//  Created by Wahyu Permadi on 12/02/21.
//

import SwiftUI
import Profile
import Core
import Favorite
import Resolver

@main
struct AppApp: App {
    init() {
        UIFont.loadFonts()
        Router.router.registerRouters()
    }
    var body: some Scene {
        WindowGroup {
            TabView {
                Router.router.navigateToHome()
                    .tabItem {
                        imgHome
                        Text("text_home".localized(identifier: .bundleId))
                    }
                Router.router.navigateToFavorite()
                    .tabItem {
                        imgFavorite
                        Text("text_favorite".localized(identifier: .bundleId))
                    }
                ProfileView()
                    .tabItem {
                        imgFavorite
                        Text("text_profil".localized(identifier: .bundleId))
                    }
            }
        }
    }
}

extension UIFont {
  private static func registerFont(withName name: String, fileExtension: String) {
    let frameworkBundle = Bundle(identifier: .bundleId)!
    let pathForResourceString = frameworkBundle.path(forResource: name, ofType: fileExtension)!
    let fontData = NSData(contentsOfFile: pathForResourceString)
    let dataProvider = CGDataProvider(data: fontData!)
    let fontRef = CGFont(dataProvider!)
    var errorRef: Unmanaged<CFError>? = nil

    if (CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false) {
      print("Error registering font")
    }
  }

  public static func loadFonts() {
    registerFont(withName: "OpenSans-Bold", fileExtension: "ttf")
    registerFont(withName: "OpenSans-Light", fileExtension: "ttf")
    registerFont(withName: "OpenSans-Regular", fileExtension: "ttf")
  }
}
