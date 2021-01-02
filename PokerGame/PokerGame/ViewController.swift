//
//  ViewController.swift
//  PokerGame
//
//  Created by 신한섭 on 2020/12/31.
//

import SnapKit
import UIKit

final class ViewController: UIViewController {
    private var controlStackView: UIStackView!
    private var studControl: UISegmentedControl!
    private var numOfPlayersControl: UISegmentedControl!
    private var playerContainerStackView: UIStackView!
    private var winnerImageViews: [UIImageView] = [UIImageView]()
    private var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        setUpObserver()
        setUpGame()
        setUpUI()
        game.start()
    }
    
    private func setUpObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showPlayersCard),
                                               name: .CardDistributed,
                                               object: nil)
    }
    
    private func setUpGame() {
        let stud = Game.Stud.allCases[0]
        let numOfPlayers = Game.NumOfPlayers.allCases[0]
        game = Game(stud: stud, numOfPlayers: numOfPlayers)
    }
    
    private func setUpUI() {
        setUpControlStackView()
        setUpStudControl()
        setUpNumOfPlayersControl()
        setUpPlayerContainerStackView()
    }
    
    private func setUpControlStackView() {
        controlStackView = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 10)
        view.addSubview(controlStackView)
        
        controlStackView.snp.makeConstraints { stackView in
            stackView.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            stackView.centerX.equalTo(view)
            stackView.width.equalTo(view).dividedBy(2)
        }
    }
    
    private func setUpStudControl() {
        let items = Game.Stud.allCases.map { "\($0.numOfIndividualCards) Cards" }
        guard let index = game.stud.index else { return }
        studControl = makePokerGameControl(with: items, selectedIndex: index, action: #selector(studChanged(sender:)))
        controlStackView.addArrangedSubview(studControl)
    }
    
    private func setUpNumOfPlayersControl() {
        let items = Game.NumOfPlayers.allCases.map { "\($0.count)명" }
        guard let index = game.numOfPlayers.index else { return }
        
        numOfPlayersControl = makePokerGameControl(with: items, selectedIndex: index, action: #selector(numOfPlayersChanged(sender:)))
        
        controlStackView.addArrangedSubview(numOfPlayersControl)
    }
    
    private func makePokerGameControl(with items: [String], selectedIndex: Int, action: Selector) -> UISegmentedControl {
        let segmentControl = UISegmentedControl(items: items)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        segmentControl.selectedSegmentIndex = selectedIndex
        segmentControl.addTarget(self, action: action, for: .valueChanged)
        segmentControl.layer.borderColor = UIColor.white.cgColor
        segmentControl.layer.borderWidth = 1
        
        return segmentControl
    }
    
    private func setUpPlayerContainerStackView() {
        playerContainerStackView = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 10)
        view.addSubview(playerContainerStackView)
        
        playerContainerStackView.snp.makeConstraints { stackView in
            stackView.top.equalTo(controlStackView.snp.bottom).offset(20)
            stackView.centerX.equalTo(view)
            stackView.width.equalTo(view).multipliedBy(0.9)
            stackView.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func addPlayerNameLabel(with labelText : String, into stackView: UIStackView) {
        let label = UILabel(textColor: .white, text: labelText)
        stackView.addArrangedSubview(label)
    }
    
    private func addCardInfoStackView(with cards: [Card], into stackView: UIStackView) {
        let cardInfoStackView = UIStackView(spacing: 10)
        stackView.addArrangedSubview(cardInfoStackView)
        
        addCardStackView(with: cards, into: cardInfoStackView)
    }
    
    private func addCardStackView(with cards: [Card], into stackView: UIStackView) {
        let cardStackView = UIStackView(spacing: -10)
        stackView.addArrangedSubview(cardStackView)
        let winnerImageView = UIImageView()
        winnerImageView.image = #imageLiteral(resourceName: "winner")
        winnerImageView.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(winnerImageView)
        winnerImageViews.append(winnerImageView)
        
        cards.forEach { card in
                addCardView(with: "\(card)", into: cardStackView)
            }
    }
    
    private func addCardView(with name: String, into stackView: UIStackView) {
        let card = UIImageView()
        card.image = UIImage(named: name)
        card.layer.cornerRadius = 7
        card.clipsToBounds = true
        stackView.addArrangedSubview(card)
        card.snp.makeConstraints { imageView in
            imageView.height.equalTo(card.snp.width).multipliedBy(1.27)
            imageView.width.equalTo(playerContainerStackView).dividedBy(game.stud.numOfIndividualCards)
        }
    }
    
    private func addPlayerStackView(with title: String, and cards: [Card], into: UIStackView) {
        let playerStackView = UIStackView(axis: .vertical)
        playerContainerStackView.addArrangedSubview(playerStackView)
        addPlayerNameLabel(with: title, into: playerStackView)
        addCardInfoStackView(with: cards, into: playerStackView)
    }
    
    @objc private func showPlayersCard() {
        DispatchQueue.main.async { [unowned self] in
            var index = 0
            game.playersIterator {
                let name = index == game.numOfPlayers.count ? "Dealer" : "Player\(index + 1)"
                addPlayerStackView(with: name, and: $0.cards , into: playerContainerStackView)
                index += 1
            }
        }
    }
    
    @objc private func studChanged(sender: UISegmentedControl) {
        playerContainerStackView.subviews.forEach { $0.removeFromSuperview() }
        game = Game(stud: Game.Stud(index: sender.selectedSegmentIndex), numOfPlayers: game.numOfPlayers)
        game.start()
    }
    
    @objc private func numOfPlayersChanged(sender: UISegmentedControl) {
        playerContainerStackView.subviews.forEach { $0.removeFromSuperview() }
        game = Game(stud: game.stud, numOfPlayers: Game.NumOfPlayers(index: sender.selectedSegmentIndex))
        game.start()
    }
}
