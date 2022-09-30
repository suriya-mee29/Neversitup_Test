//
//  CurrenencyViewModel.swift
//  Test
//
//  Created by Suriya on 28/9/2565 BE.
//

import Foundation
import Combine

class CurrenencyViewModel : ObservableObject {
    
    @Published var currentprice: CurrentpriceModel? = nil
    @Published var historyData : [CurrentpriceModel] = [CurrentpriceModel]()
    @Published var isUpdate : Bool = false
    
    private var cancellableSet : Set<AnyCancellable> = []
    var dataHelper : NetworkingHelperProtocal
    var scheduler : SchedulerHelper
    
    init(dataHelper : NetworkingHelperProtocal = NetworkingHelper.shared,
         scheduler : SchedulerHelper = SchedulerHelper.shared ){
        self.dataHelper = dataHelper
        self.scheduler = scheduler
        self.fetchCurrentprice()
        self.scheduler.startScheduler()
    }
    deinit {
        self.scheduler.stopScheduler()
    }
    func fetchCurrentprice(){
        dataHelper.fetchBPI()
            .sink { data in
                if data.error != nil{
                    // logError
                }else{
                    self.objectWillChange.send()
                        self.currentprice = data.value!
                        self.historyData.append(self.currentprice!)
                }
                
            }.store(in: &cancellableSet)
    
        
       
    }
}
