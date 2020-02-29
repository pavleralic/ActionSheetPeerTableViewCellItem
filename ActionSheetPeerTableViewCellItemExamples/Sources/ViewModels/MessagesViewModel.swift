//
//  MessagesViewModel.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import RealmSwift

class MessagesViewModel {
    
    //MARK: - Variables
    private var models: [MessageTableViewCellViewModel] = []
    
    //MARK: - Init
    init() {
        setupModels()
    }
    
    //MARK: - Private Methods
    private func setupModels() {
        (try! Realm()).objects(Message.self).sorted(byKeyPath: "pubDate", ascending: true).forEach { (message) in
            models.append(MessageTableViewCellViewModel(message: message))
        }
    }
    
    //MARK: - Public Methods
    func numberOfRows(in section: Int) -> Int {
        return models.count
    }
    
    func model(at indexPath: IndexPath) -> CellViewAnyModel? {
        return models[indexPath.row]
    }
}
