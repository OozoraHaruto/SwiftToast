//
//  Color+Extensions.swift
//  SwiftToast
//
//  Created by はると on 10/12/22.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

@available(iOS 14.0, macOS 11.0, *)
extension Color {
  static var primary: Color{
    return Color.init("colPrimary", bundle: .module)
  }
  
  static var info: Color{
    return Color.init("colInfo", bundle: .module)
  }
  
  static var secondaryColor: Color{
    return Color.init("colSecondary", bundle: .module)
  }
  
  static var success: Color{
    return Color.init("colSuccess", bundle: .module)
  }
  
  static var warn: Color{
    return Color.init("colWarn", bundle: .module)
  }
  
  static var error: Color{
    return Color.init("colError", bundle: .module)
  }
  
  static var bgPrimary: Color{
    return Color.init("bgPrimary", bundle: .module)
  }
  
  static var bgInfo: Color{
    return Color.init("bgInfo", bundle: .module)
  }
  
  static var bgSecondary: Color{
    return Color.init("bgSecondary", bundle: .module)
  }
  
  static var bgSuccess: Color{
    return Color.init("bgSuccess", bundle: .module)
  }
  
  static var bgWarn: Color{
    return Color.init("bgWarn", bundle: .module)
  }
  
  static var bgError: Color{
    return Color.init("bgError", bundle: .module)
  }
  
  static var systemBackground: Color {
#if canImport(UIKit)
    return Color(.systemBackground)
#elseif canImport(AppKit)
    return Color(.windowBackgroundColor)
#else
    return Color.white
#endif
  }
  
  static var label: Color {
#if canImport(UIKit)
    return Color(.label)
#elseif canImport(AppKit)
    return Color(.labelColor)
#else
    return Color.black
#endif
  }
}
