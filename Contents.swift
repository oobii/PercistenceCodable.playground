import UIKit
import PlaygroundSupport

// Coadable example
// Encoding, Saving to file, Loading from a file, Decoding

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

var documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

print("\(archiveURL)")
let note = Note(title: "Codable note", text: "This as the test of Codable protocol with writng in a file", timestamp: Date())
let propListEncoder = PropertyListEncoder()

// encoding
guard let encodedNoteData = try? propListEncoder.encode(note)  else { exit(1) }
    print("\(encodedNoteData)")

// .noFileProtection allows to overwrite the existent file
// saving to a file
try? encodedNoteData.write(to: archiveURL, options: .noFileProtection)

let propListDecoder = PropertyListDecoder()

// reading from the file and decoding
    if let retrievedData = try? Data(contentsOf: archiveURL), let decodedNote = try? propListDecoder.decode(Note.self, from: retrievedData) {
        print("\(decodedNote)")

}
