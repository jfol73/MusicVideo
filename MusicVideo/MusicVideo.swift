//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Officefront on 21/03/16.
//  Copyright © 2016 jfol73. All rights reserved.
//

import Foundation

class Videos {
    
    //Data Encapsulation
    
    private var _vName:String
    private var _vRights:String
    private var _vPrice:String
    private var _vImageUrl:String
    private var _vArtist:String
    private var _vVideoUrl:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDte:String
    
    //This variable gets created from the UI
    var vImageData:NSData?
    
    //Make a getter
    
    var vName: String {
        return _vName
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrice: String {
        return _vPrice
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vArtist: String {
        return _vArtist
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vImid: String {
        return _vImid
    }
    
    var vGenre: String {
        return _vGenre
    }
    
    var vLinkToiTunes: String {
        return _vLinkToiTunes
    }
    
    var vReleaseDte: String {
        return _vReleaseDte
    }
    
    init(data: JSONDictionary) {
        
        //If we do not initialize all properties we will get error message
        //Return from initializer without initializing all stored properties
        
        //Video name
        if let name = data["im:name"] as? JSONDictionary, vName = name["label"] as? String {
            self._vName = vName
        }
        else {
            //You may not always get data back from the JSON - you may want to display message
            //element in the JSON is unexpected
            
            _vName = ""
        }
        
        //Video Rights
        if let rights = data["rights"] as? JSONDictionary, vRights = rights["label"] as? String {
            self._vRights = vRights
        }
        else {
            _vRights = ""
        }
        
        //Video Price
        if let price = data["im:price"] as? JSONDictionary, vPrice = price["label"] as? String {
            self._vPrice = vPrice
        }
        else {
            _vPrice = ""
        }
        
        // The Video Image
        if let img = data["im:image"] as? JSONArray, image = img[2] as? JSONDictionary, immage = image["label"] as? String {
            _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else {
            _vImageUrl = ""
        }
        
        //Video Artist
        if let artist = data["im:artist"] as? JSONDictionary, vArtist = artist["label"] as? String {
            self._vArtist = vArtist
        }
        else {
            _vArtist = ""
        }
        
        //Video Url
        if let video = data["link"] as? JSONArray, vUrl = video[1] as? JSONDictionary, vHref = vUrl["attributes"] as? JSONDictionary, vVideoUrl = vHref["href"] as? String {
            self._vVideoUrl = vVideoUrl
            }
        else{
            _vVideoUrl = ""
        }
        
        //Artist id
        if let imid = data["id"] as? JSONDictionary, vrefid = imid["attributes"] as? JSONDictionary, vImid = vrefid["im:id"] as? String {
            self._vImid = vImid
        }
        else {
            _vImid = ""
        }
        
        //The Genre
        if let genre = data["category"] as? JSONDictionary, gatt = genre["attributes"] as? JSONDictionary, vGenre = gatt["term"] as? String {
            self._vGenre = vGenre
        }
        else {
            _vGenre = ""
        }
        
        //Link to iTunes
        if let linkToiTunes = data["id"] as? JSONDictionary, vLinkToiTunes = linkToiTunes["label"] as? String {
            self._vLinkToiTunes = vLinkToiTunes
        }
        else {
            _vLinkToiTunes = ""
        }
        
        //Release Date
        if let releaseDate = data["im:releaseDate"] as? JSONDictionary, relatt = releaseDate["attributes"] as? JSONDictionary, vReleaseDte = relatt["label"] as? String {
            self._vReleaseDte = vReleaseDte
        }
        else {
            _vReleaseDte = ""
        }
        
    }
    
    
    
    
    
}
