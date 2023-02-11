//
//  DataService.swift
//  coder-swag
//
//  Created by Vadim Kononenko on 10.02.2023.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let categories: [Category] = [
        .init(title: "SHIRTS", bgImage: "shirts"),
        .init(title: "HOODIES", bgImage: "hoodies"),
        .init(title: "HATS", bgImage: "hats"),
        .init(title: "DIGITAL", bgImage: "digital"),
    ]
    
    private let hats: [Product] = [
        .init(title: "Devslopes Logo Graphic Beanie", price: "$18", imageName: "hat01"),
        .init(title: "Devslopes Logo Hat Black", price: "$22", imageName: "hat02"),
        .init(title: "Devslopes Logo Hat White", price: "$22", imageName: "hat03"),
        .init(title: "Devslopes Logo Snapback", price: "$20", imageName: "hat04"),
    ]
    
    private let hoodies: [Product] = [
        .init(title: "Devslopes Logo Hoodie Gray", price: "$32", imageName: "hoodie01"),
        .init(title: "Devslopes Logo Hoodie Red", price: "$32", imageName: "hoodie02"),
        .init(title: "Devslopes Hoodie Gray", price: "$32", imageName: "hoodie03"),
        .init(title: "Devslopes Logo Snapback", price: "$32", imageName: "hoodie04"),
    ]
    
    private let shirts: [Product] = [
        .init(title: "Devslopes Logo Shirt Black", price: "$18", imageName: "shirt01"),
        .init(title: "Devslopes Logo Shirt Light Grey", price: "$19", imageName: "shirt02"),
        .init(title: "Hustle Delegate Grey", price: "$18", imageName: "shirt03"),
        .init(title: "Devslopes Logo Snapback", price: "$18", imageName: "shirt04"),
        .init(title: "Kickflip Studios Black", price: "$18", imageName: "shirt04"),
    ]
    
    private let digitalGoods = [Product]()
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getProducts(forCategoryTitle title: String) -> [Product] {
        switch title {
        case "SHIRTS": return getShirts()
        case "HATS": return getHats()
        case "HOODIES": return getHoodies()
        case "DIGITAL": return getDigitalGoods()
        default: return getShirts()
        }
    }
    
    func getHats() -> [Product] {
        return hats
    }
    
    func getHoodies() -> [Product] {
        return hoodies
    }
    
    func getShirts() -> [Product] {
        return shirts
    }
    
    func getDigitalGoods() -> [Product] {
        return digitalGoods
    }
}
