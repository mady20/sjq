
import Foundation

struct Example: Codable {
    let name: String           // string
    let age: Double            // number (can be decimal)
    let isStudent: Bool        // boolean
    let nickname: String?      // null (optional string)
    let scores: [Int]          // array of integers
    let tags: [String]         // array of strings
    let grades: [Double]       // array of doubles
    let friends: [Friend]      // array of objects
    let metadata: Metadata     // nested object
}

struct Friend: Codable {
    let id: Int
    let name: String
}

struct Metadata: Codable {
    let createdAt: String
    let verified: Bool
}

let json = #"""
{
  "name": "James",
  "age": 18.6,
  "isStudent": true,
  "nickname": null,
  "scores": [95, 88, 76],
  "tags": ["swift", "json", "example"],
  "grades": [18.5, 19.9, 20.0],
  "friends": [
    { "id": 1, "name": "Alice" },
    { "id": 2, "name": "Bob" }
  ],
  "metadata": {
    "createdAt": "2025-08-24",
    "verified": false
  }
}
"""#

if let data = json.data(using: .utf8) {
    do {
        let result = try JSONDecoder().decode(Example.self, from: data)
        print("Decoded Swift object:\n", result)
        print("\nData types:")
        print("- name:", type(of: result.name))
        print("- age:", type(of: result.age))
        print("- isStudent:", type(of: result.isStudent))
        print("- nickname:", type(of: result.nickname))
        print("- scores:", type(of: result.scores))
        print("- tags:", type(of: result.tags))
        print("- grades:", type(of: result.grades))
        print("- friends:", type(of: result.friends))
        print("- metadata:", type(of: result.metadata))
    } catch {
        print("Decoding error:", error)
    }
}
