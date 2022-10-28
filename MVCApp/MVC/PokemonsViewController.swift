//
//  ViewController.swift
//  MVCApp
//
//  Created by Jorge Benavides
//

import UIKit

final class PokemonsViewController: UIViewController {

    // MARK: - Stored Properties
    private let viewModel: PokemonsViewModel
    private var addPokemonController: AddPokemonController
    private var removePokemonController: RemovePokemonController
    private lazy var tableView = UITableView(frame: view.bounds, style: .plain)

    // MARK: - Life cycle callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bind()
    }
    
    init(viewModel: PokemonsViewModel,
         addPokemonController: AddPokemonController,
         removePokemonController: RemovePokemonController) {
        self.viewModel = viewModel
        self.addPokemonController = addPokemonController
        self.removePokemonController = removePokemonController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Initial setup
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = viewModel
        tableView.register(PokemonCellController.self, forCellReuseIdentifier: "PokemonCellController")
    }
    
    private func bind() {
        addPokemonController.didAddPokemon = { [weak self] in
            self?.tableViewDidSelectAdd()
        }
        removePokemonController.didRemovePokemon = { [weak self] in
            self?.tableViewDidSelectRemove()
        }
    }
    
    // MARK: TableView Operations
    private func tableViewDidSelectRow(at index: Int) {
        removePokemonController.pokemonToRemove(index)
    }

    private func scrollToBottom() {
        guard let lastIndexPath = viewModel.getLastIndexPath() else { return }
        tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
    }

    private func tableViewDidSelectAdd() {
        tableView.reloadData()
        removePokemonController.pokemonToRemove(nil)
        scrollToBottom()
    }

    private func tableViewDidSelectRemove() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension PokemonsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        removePokemonController.view
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        addPokemonController.view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewDidSelectRow(at: indexPath.row)
    }

}
