# PercistenceCodable.playground

For a model object to be encoded or decoded, it must adopt and conform to the Codable protocol.

Once an object conforms to the Codable protocol, an Encoder object can be used to encode the object as a data representation that can be saved to disk. Similarly, a Decoder object can be used to turn that encoded data into its corresponding model object. The encode(_:) method on an Encoder returns a Data object, and the decode(_:from) method on a Decoder takes a Data object and returns an instance of the Codable object in question. Data is a Swift structure that represents data stored as bytes. Data provides instance methods for writing to and reading from a file.
