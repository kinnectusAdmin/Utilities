//
//  Utilities.swift
//  Utilities
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//
import Foundation
import AVFoundation
import Darwin
import MapKit
import CleanModelViewIntent

class Utilities {
    static func numberOfKeywords(in words: String) ->Int {
        var count = 0
        for char in words{
            if char == "#"{
                count+=1
            }
        }
        return count
    }
    static func separateKeywords(words: String) -> [String.SubSequence] {
        //split the strings by the  # character
        var separateStrings = words.split(separator: "#")
        //split last word by space character
        if let last2 = separateStrings.last?.split(separator: " ") {
            separateStrings.removeLast(1)
            separateStrings+=last2
        }
        return separateStrings
    }
    static func removeSpaces(from stringSequence: inout [String.SubSequence]) -> [String.SubSequence] {
        //remove all spaces between keywords
        stringSequence = stringSequence.map({
            word in
            if word.contains(" ") {
                return word.dropLast()
            }
            return word
        })
        return stringSequence
    }
    static func insertHashtags(for separateStrings: inout [String.SubSequence]) -> String {
        var words: String = ""
        //reduce and insert hashtags
        words = separateStrings.reduce("#", {result, word in
            let filteredWord = word.filter({ $0 != ","})
            return result+filteredWord+", "+"#"
        })
        words = String(describing: words.dropLast())
        //get new set of keywords
        //remove hashtags
        let keywords1 = words.split(separator: "#")
        //remove spaces
        let keywords2  = keywords1.map({ word in
            return String(word.dropLast())
        })
        return words
    }
    static func makeKeywords( keywords: inout String) -> String {
        var str = keywords
        let count = numberOfKeywords(in: keywords)
        if count == 0 { //first word, store word in keywords and add pound to beginning and space at end
            keywords = str+","
            str = "#\(keywords) "
            return str
        }
        var separateStrings = separateKeywords(words: keywords)
        separateStrings = removeSpaces(from: &separateStrings)
        str = insertHashtags(for: &separateStrings)
        return str
    }
    static func keyWords(text: String) -> [String] {
        guard !text.isEmpty else { return [] }
        let filteredText = text.replace(strings: [",",",","#"], with: ["","",""])
        let split = filteredText.split(separator: " ").map { String($0)}
        return split
    }
    static func makeFullName(from name: String) -> (String, String) {
        let firstLast = name.split(separator: " ").map { String($0).trimmingCharacters(in: .whitespaces)}
        guard firstLast.count > 1 else { return (name, "") }
        guard let firstName = firstLast.first, let lastName = firstLast.last else { return (name, "") }
        return (firstName, lastName)
    }
    static func formattedName(_ name: String) -> (firstName: String, lastName: String) {
        let first_name = name.split(separator: " ").first ?? ""
        let last_name = name.split(separator: " ").last ?? ""
        return (String(first_name),String(last_name))
    }
    static func testCoordinates() -> [(Double,Double)] {
        let coord1 = (36.8777412,-76.3033785)
        let coord2 = (36.8839664,-76.3039779)
        let coord3 = (36.8494557,-76.2893914)
        return [coord1, coord2, coord3]
    }
    static func distanceInMiles(distance: Double) -> String {
        let metersPerMile: Double = 2896
        let calculation: Double = distance/metersPerMile
        let value = NSNumber(value: calculation)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .up
        formatter.maximumFractionDigits = 2
        return (formatter.string(from: value) ?? "0") + " mi"
    }
    static func timeFor(time: CMTime) -> String {
        let seconds = NSNumber(value: round(time.seconds)).intValue
        var minutes = seconds % 60
        minutes = round(time.seconds) < 60 ? 0 : minutes
        let zero = seconds < 10 ? "0" : ""
        let secondString = zero + String(describing: seconds - minutes*60)
        let minuteString = String(describing: minutes)
        return "\(minuteString):\(secondString)"
    }
    static func progressFor(time: CMTime, duration: CMTime) -> Float {
        return Float(time.seconds/duration.seconds)
    }
    static func coordinateLimits(miles: Double, from coordinate: CLLocationCoordinate2D) -> (Double, Double, Double, Double) {
        let region =  MKCoordinateRegion.init(center: coordinate, latitudinalMeters: miles, longitudinalMeters: miles)
        let latDelta = region.span.latitudeDelta
        let longDelta = region.span.longitudeDelta
        let latRange = coordinateRange(center: coordinate.latitude, delta: latDelta)
        let longRange = coordinateRange(center: coordinate.longitude, delta: longDelta)
        return (latRange.0, latRange.1, longRange.0, longRange.1)
    }
    
    static func coordinateRange(center: Double, delta: Double) -> (min: Double, max: Double) {
        let maxLimit = max(center+delta, center-delta)
        let minLimit = min(center+delta, center-delta)
        return (minLimit, maxLimit)
    }
}
extension Utilities {
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - array: <#array description#>
    ///   - item: <#item description#>
    /// - Returns: <#return value description#>
    static public func appendIfNil(array: inout [String]?, item: String) -> [String]? {
        if array != nil {
            array?.append(item)
            return array
        } else {
            return [item]
        }
    }
}
