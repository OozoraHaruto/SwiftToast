//
//  ToastModifier.swift
//  SwiftToast
//
//  Created by はると on 9/12/22.
//

import SwiftUI

/// To be used in conjection with the `ToastCoordinator`
///
/// Usage:
///   Can be attached to any view but it is reccommended to be only attached to
///   the root view controller. See `ToastCoordinator` for full usage docs.
///
///       .modifier(ToastModifier())
///
@available(iOS 15.0, macOS 11.0, watchOS 8.0, *)
public struct ToastModifier: ViewModifier {
  @EnvironmentObject var toastCoordinator: ToastCoordinator
  @State private var workItem: DispatchWorkItem?
  
  public init() {
    self.workItem = nil
  }
  
  var toast: Toast? {
    return toastCoordinator.shownToast
  }
  
  public func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay(
        ZStack {
          mainToastView()
        }.animation(.spring(), value: toast)
      )
      .onChange(of: toast) { value in
        showToast()
      }
  }
  
  @ViewBuilder func mainToastView() -> some View {
    if let toast = toast {
      ZStack{
        if toast.showMask {
          toast.maskColor
            .opacity(toast.maskOpacity)
            .ignoresSafeArea(.all)
            .blur(radius: 20)
            .onTapGesture {
              if toast.tapMaskToDismiss {
                dismissToast()
              }
            }
        }

        VStack {
          if toast.position == .bottom {
            Spacer()
          }

          ToastView(
            type: toast.type,
            bgColor: toast.bgColor,
            foregroundColor: toast.foregroundColor,
            systemIcon: toast.systemIcon,
            theme: toast.theme,
            title: toast.title,
            message: toast.message,
            showIcon: toast.showIcon,
            showCancel: toast.showCancel) {
              dismissToast()
            }
  #if os(iOS)
            .gesture(DragGesture().onEnded {_ in
              if toast.swipeToDismiss {
                dismissToast()
              }
            })
  #endif

          if toast.position == .top {
            Spacer()
          }
        }
      }
      .transition(toast.showMask ? .scale : .move(edge: toast.position == .top ? .top : .bottom))
    }
  }
  
  private func showToast() {
    guard let toast = toast else { return }
    
    if toast.duration > 0 {
      workItem?.cancel()
      
      let task = DispatchWorkItem {
        dismissToast()
      }
      
      workItem = task
      DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
    }
  }
  
  private func dismissToast() {
    withAnimation(.easeOut(duration: 0.2)) {
      toastCoordinator.removeToast()
    }
    
    workItem?.cancel()
    workItem = nil
  }
}
