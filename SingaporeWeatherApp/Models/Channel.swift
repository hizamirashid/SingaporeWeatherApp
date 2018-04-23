/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Channel : Codable {
	let units : Units?
	let title : String?
	let link : String?
	let description : String?
	let language : String?
	let lastBuildDate : String?
	let ttl : Int?
	let location : Location?
	let wind : Wind?
	let atmosphere : Atmosphere?
	let astronomy : Astronomy?
	let image : Image?
	let item : Item?

	enum CodingKeys: String, CodingKey {

		case units
		case title = "title"
		case link = "link"
		case description = "description"
		case language = "language"
		case lastBuildDate = "lastBuildDate"
		case ttl = "ttl"
		case location
		case wind
		case atmosphere
		case astronomy
		case image
		case item
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		units = try Units(from: decoder)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		link = try values.decodeIfPresent(String.self, forKey: .link)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		lastBuildDate = try values.decodeIfPresent(String.self, forKey: .lastBuildDate)
		ttl = try values.decodeIfPresent(Int.self, forKey: .ttl)
		location = try Location(from: decoder)
		wind = try Wind(from: decoder)
		atmosphere = try Atmosphere(from: decoder)
		astronomy = try Astronomy(from: decoder)
		image = try Image(from: decoder)
		item = try Item(from: decoder)
	}

}