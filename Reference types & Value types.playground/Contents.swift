import Foundation

private class Pixels {
  let storageBuffer: UnsafeMutableBufferPointer<UInt8>

  init(size: Int, value: UInt8) {
    let p = UnsafeMutablePointer<UInt8>.allocate(capacity: size)
    storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: size)
    storageBuffer.initialize(from: repeatElement(value, count: size))
  }

  init(pixels: Pixels) {
    let otherStorage = pixels.storageBuffer
    let p  = UnsafeMutablePointer<UInt8>.allocate(capacity: otherStorage.count)
    storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: otherStorage.count)
    storageBuffer.initialize(from: otherStorage)
  }
  
  subscript(offset: Int) -> UInt8 {
    get {
      storageBuffer[offset]
    }
    set {
      storageBuffer[offset] = newValue
    }
  }
  
  deinit {
    storageBuffer.baseAddress!.deallocate()
  }
}

struct Image {
  private (set) var width: Int
  private (set) var height: Int
  private var pixels: Pixels
  private var mutatingPixels: Pixels {
    mutating get {
      if !isKnownUniquelyReferenced(&pixels) {
        pixels = Pixels(pixels: pixels)
      }
      return pixels
    }
  }

  init(width: Int, height: Int, value: UInt8) {
    self.width = width
    self.height = height
    self.pixels = Pixels(size: width * height, value: value)
  }
  
  subscript(x: Int, y: Int) -> UInt8 {
    get {
      return pixels[y * width + x]
    }
    set {
      mutatingPixels[y * width + x] = newValue
    }
  }
  
  mutating func clear(with value: UInt8) {
    for (i, _) in self.mutatingPixels.storageBuffer.enumerated() {
      self.mutatingPixels.storageBuffer[i] = value
    }
  }
}
