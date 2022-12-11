//
//  Toast.swift
//  SwiftToast
//
//  Created by はると on 10/12/22.
//

import SwiftUI

/// Data here is used to create the toast Views
@available(iOS 14.0, macOS 11.0, *)
public struct Toast: Equatable {
  /// The type of toast UI to show
  public var type: ToastType = .boot
  
  /// The color of the toast
  public var theme: ToastTheme = .info
  
  /// The title message of the toast (Uses .headline)
  public var title: String
  
  /// The message of the toast (Uses .caption)
  public var message: String = ""
  
  /// To show the icon or not. (See `ToastTheme` for more info`
  public var showIcon: Bool = false
  
  /// To show the cancel/close icon
  public var showCancel: Bool = false
  
  /// The position of where the toast will appear
  public var position: ToastPosition = .top
  
  /// The duration of the toast to be shown
  public var duration: Double = 3
  
  /// Create a toast
  /// - Parameters:
  ///   - type: The type of toast UI to show
  ///   - theme:The color of the toast
  ///   - title: The title message of the toast (Uses .headline)
  ///   - message: The message of the toast (Uses .caption)
  ///   - showIcon: To show the icon or not.
  ///   - showCancel: To show the cancel/close icon
  ///   - position: The position of where the toast will appear
  ///   - duration: The duration of the toast to be shown
  public init(type: ToastType = .boot,
              theme: ToastTheme = .info,
              title: String,
              message: String = "",
              showIcon: Bool = false,
              showCancel: Bool = false,
              position: ToastPosition = .top,
              duration: Double = 3) {
    self.type = type
    self.theme = theme
    self.title = title
    self.message = message
    self.showIcon = showIcon
    self.showCancel = showCancel
    self.position = position
    self.duration = duration
  }
}

/// The theme that we use to customise each toast
///
/// - Color used
///   - `.error`: red color
///   - `.warning`: orange color
///   - `.info`: light blue color
///   - `.success`: green color
///   - `.primary`: blue color
///   - `.secondary`: gray color
/// - Icons used
///   - `.info`, `.primary`, `.secondary` uses : `"info.circle.fill"`
///   - `.warning` uses: `"exclamationmark.triangle.fill"`
///   - `.success` uses: `"checkmark.circle.fill"`
///   - `.error` uses: `"xmark.circle.fill"`
public enum ToastTheme {
  case error
  case warning
  case success
  case info
  case primary
  case secondary
  
  var themeColor: Color {
    switch self {
      case .error: return .error
      case .warning: return .warn
      case .info: return .info
      case .success: return .success
      case .primary: return .primary
      case .secondary: return .secondaryColor
    }
  }
  
  var iconFileName: String {
    switch self {
      case .info: fallthrough
      case .primary: fallthrough
      case .secondary: return "info.circle.fill"
      case .warning: return "exclamationmark.triangle.fill"
      case .success: return "checkmark.circle.fill"
      case .error: return "xmark.circle.fill"
    }
  }
  
  var bootBGThemeColor: Color {
    switch self {
      case .error: return .bgError
      case .warning: return .bgWarn
      case .info: return .bgInfo
      case .success: return .bgSuccess
      case .primary: return .bgPrimary
      case .secondary: return .bgSecondary
    }
  }
}

/// The position of where the toast will appear
public enum ToastPosition {
  case top
  case middle
  case bottom
}

/// The type of toast UI to show
///
/// - `.fancy` will use system colors as bg and text, while having the color
/// on the left side of the toast
/// - `.boot` will have a background color of the alert (see `ToastTheme`)
/// and the text color will be a darker color
public enum ToastType {
  case fancy
  case boot
}
