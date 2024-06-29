//
//  Themes.swift
//  MemorizeHW
//
//  Created by Денис Никитин on 29.06.2024.
//

import Foundation
import SwiftUI

struct Themes{
    var emojisOfTheme: Array<String>
    var numberOfPairs: Int = Int.random(in: 3...10)
    var colorForPrint: Color
    var nameOfTheme: String
}

