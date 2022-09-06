//
//  Pokemon.swift
//  AnahuaciOS
//
//  Created by Universidad Anahuac on 05/09/22.
//

import Foundation

struct PokemonDetail: Decodable {
    var base_experience: Int
    var height: Int
    var name: String
    var sprites: PokemonDetailSprite
}

struct PokemonDetailSprite: Decodable {
    var other: PokemonDetilOther
}

struct PokemonDetilOther: Decodable {
    var home: PokemonDetailHome
}

struct PokemonDetailHome: Decodable {
    var front_default: String
}

struct PokemonList: Decodable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Pokemon]
}

struct Pokemon: Decodable {
    var name: String
    var url: String
}
