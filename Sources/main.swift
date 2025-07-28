// File: main.swift
// Author: Mady 
// Date: 2025-07-28


import Foundation

struct TextStats {
    var lines = 0
    var words = 0
    var spaceCount = 0
    var charactersWithSpaces = 0
    var charactersWithoutSpaces:Int {
        charactersWithSpaces - spaceCount
    }
    var averageWordLength:Double {
         Double(charactersWithoutSpaces) / Double(words) 
    }
    func  printStats(){
        print("Lines : \(lines)")
        print("Words : \(words)")
        print("Characters (w/ spaces) : \(charactersWithSpaces)")
        print("Characters (no spaces) : \(charactersWithoutSpaces)")
        print("Avg. Word Length: \(averageWordLength)")
    }
}
var details = TextStats()


func getLines(_ text: String) -> Int{
    var count = 0
    for char in text{
        details.charactersWithSpaces += 1
        if char.isNewline {count += 1}
        if char.isWhitespace {details.spaceCount += 1}
    } 
    return count == 0 ? 1 : count
}

func getWords(_ text: String) -> Int{
    let words = text.split(separator: " ")
    return words.count
}

func main(){
    guard let text = CommandLine.arguments.dropFirst().first?
    .trimmingCharacters(in: .whitespaces),
    !text.isEmpty
    else {
        //TODO: PRINT USAGE MESSAGE
         return
    }  
   details.lines = getLines(text) 
   details.words = getWords(text) 
}


main()
details.printStats()
