import SwiftUI
import AVKit

public struct PlayerView: UIViewRepresentable {
    public var player: AVPlayer?

    public init(player: AVPlayer?) {
        self.player = player
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
        (uiView as? PlayerUIView)?.setPlayer(player)
    }
    
    public func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero)
    }
}

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    func setPlayer(_ player: AVPlayer?) {
        playerLayer.player = player
    }
    
}
