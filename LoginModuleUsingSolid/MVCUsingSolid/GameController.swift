//
//  GameController.swift
//  LoginModuleUsingSolid
//
//  Created by macmini41 on 28/10/22.
//

import Foundation
 protocol GameEvaluator {
    func evaluateWinner(players: [Player])
}
public class GameController {
//    public init(View view, Deck deck) {}

    public func addPlayer(playerName: String) {}
    public func startGame() {}
    public func flipCards() {}

    func evaluateWinner() {}
    func displayWinner() {}
    func rebuildDeck() {}
};
