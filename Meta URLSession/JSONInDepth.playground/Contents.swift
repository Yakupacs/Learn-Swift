import Foundation

// MARK: - Simple JSON decoding
struct Recipe: Decodable {
    let title: String
    let views: Int
}


let JSON = """
{
    "title": "Little Lemon Apple pie",
    "views": 47093
}
"""

 
let jsonData = JSON.data(using: .utf8)!
let recipe = try! JSONDecoder().decode(Recipe.self, from: jsonData)

print(recipe.title, ",", recipe.views)

// MARK: - JSON as an array of objects
let JSONArray = """
[
    {
        "title": "Little Lemon Apple pie",
        "views": 47093
    },
    {
        "title": "Little Lemon scrambled egg",
        "views": 10757
    }
]
"""

let jsonArrayData = JSONArray.data(using: .utf8)!
let recipes = try! JSONDecoder().decode([Recipe].self, from: jsonArrayData)

for recipe in recipes{
    print(recipe.title, recipe.views)
}

// MARK: - JSON mapped using custom property names

let JSON2 = """
{
    "title": "Little Lemon Apple pie",
    "views": 47093,
    "url" : "www.littlelemon.com/recipes/298/image.png"
}
"""

struct Recipe2: Decodable {
    enum CodingKeys: String, CodingKey { case
        title, views,
        imageLink = "url"
    }
     
     
    let title: String
    let views: Int
    let imageLink: String
}

let jsonData2 = JSON2.data(using: .utf8)!
let recipe2 = try! JSONDecoder().decode(Recipe2.self, from: jsonData2)
print(recipe2.imageLink)
