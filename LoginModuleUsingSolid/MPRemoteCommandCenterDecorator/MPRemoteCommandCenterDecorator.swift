////
////  MPRemoteCommandCenterDecorator.swift
////  LoginModuleUsingSolid
////
////  Created by macmini41 on 03/10/22.
////
//
//import Foundation
//import Foundation
//class MPRemoteCommandCenterDecorator: PlayerDecoratorProtocol, MPCommandCenterPlayable, SessionReferenceable {
//  weak var playerView: PlayerView?
//  weak var session: PlaybackSession?
//  var playlistRepo: PlayerRepository {
//    return playerView?.playlistRepo ?? PlayerRepository()
//  }
//  var referenceId: String? {
//    return playerView?.referenceId
//  }
//  let commandCenter =  MPRemoteCommandCenter.shared()
//  required init(_ playerView: PlayerView) {
//    self.playerView = playerView
//  }
//  func setupNowPlayingInfoCenter() {
//    commandCenter.playCommand.isEnabled = true
//    commandCenter.playCommand.addTarget {event in
//      self.session?.player.play()
//      return .success
//    }
//    commandCenter.pauseCommand.isEnabled = true
//    commandCenter.pauseCommand.addTarget {event in
//      self.session?.player.pause()
//      return .success
//    }
//    commandCenter.nextTrackCommand.isEnabled = false
//    commandCenter.nextTrackCommand.addTarget {event in
//      self.playerView?.playNextVideo()
//      return .success
//    }
//    commandCenter.previousTrackCommand.isEnabled = false
//    commandCenter.previousTrackCommand.addTarget {event in
//      self.playerView?.playPrevVideo()
//      return .success
//    }
//  }
//  func enableNextVideo() {
//    commandCenter.nextTrackCommand.isEnabled = true
//  }
//  func disableNextVideo() {
//    commandCenter.nextTrackCommand.isEnabled = false
//  }
//  func enablePrevVideo() {
//    commandCenter.previousTrackCommand.isEnabled = true
//  }
//  func disablePrevVideo() {
//    commandCenter.previousTrackCommand.isEnabled = false
//  }
//  func updateNextVideoMPCommandCenter() {
//    if playlistRepo.isNextVideoAvailable() {
//      enableNextVideo()
//    } else {
//      disableNextVideo()
//    }
//  }
//  func updatePrevVideoMPCommandCenter() {
//    if playlistRepo.isPrevVideoAvailable() {
//      enablePrevVideo()
//    } else {
//      disablePrevVideo()
//    }
//  }
//  func updateMPCommandCenter() {
//    updateNextVideoMPCommandCenter()
//    updatePrevVideoMPCommandCenter()
//    updateMPCommandCentreUI()
//  }
//  func updateMPCommandCentreUI() {
//    guard let referenceId = self.referenceId else { return }
//    let video = self.playlistRepo.getVideo(with: referenceId)
//    let title = video.title
//    var nowPlayingInfo = [String : Any]()
//    nowPlayingInfo[MPMediaItemPropertyTitle] = title
//    MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
//  }
//}
//@objcMembers public class PlayerView: UIView {
//  lazy var mpCommandCenterDecorator: MPCommandCenterDecoratorType = {
//    let decorator = MPRemoteCommandCenterDecorator(self)
//    return decorator
//  }()
//  @objc public var session: PlaybackSession? = nil {
//    didSet {
//      mpCommandCenterDecorator.session = session
//    }
//   }
// }
