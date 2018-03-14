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

let note1 = Note(title: "Codable note1", text: "This as the test of Codable protocol with writng in a file number 1", timestamp: Date())
let note2 = Note(title: "Codable note2", text: "This as the test of Codable protocol with writng in a file number 2", timestamp: Date())
let note3 = Note(title: "Codable note3", text: "This as the test of Codable protocol with writng in a file number 3", timestamp: Date())
let notes = [note1, note2, note3]
let notesArchiveURL = documentsDirectory.appendingPathComponent("multi_notes_test").appendingPathExtension("plist")
guard let encNotes = try? propListEncoder.encode(notes) else { exit(1) }
try? encNotes.write(to: notesArchiveURL, options: .noFileProtection)

if let retrData = try? Data(contentsOf: notesArchiveURL), let decodedNotes = try? propListDecoder.decode([Note].self, from: retrData) {
    print("\(decodedNotes)")
    print("\(decodedNotes[0].text)")
}






