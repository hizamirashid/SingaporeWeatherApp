/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Forecast : Codable {
	let code : Int?
	let date : String?
	let day : String?
	let high : Int?
	let low : Int?
	let text : String?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case date = "date"
		case day = "day"
		case high = "high"
		case low = "low"
		case text = "text"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		day = try values.decodeIfPresent(String.self, forKey: .day)
		high = try values.decodeIfPresent(Int.self, forKey: .high)
		low = try values.decodeIfPresent(Int.self, forKey: .low)
		text = try values.decodeIfPresent(String.self, forKey: .text)
	}

}