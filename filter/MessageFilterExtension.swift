//
//  MessageFilterExtension.swift
//  filter
//
//  Created by Noman Ikram on 13/07/2019.
//  Copyright © 2019 Noman Ikram. All rights reserved.
//

import IdentityLookup

final class MessageFilterExtension: ILMessageFilterExtension {}

extension MessageFilterExtension: ILMessageFilterQueryHandling {
    

    
    func handle(_ queryRequest: ILMessageFilterQueryRequest, context: ILMessageFilterExtensionContext, completion: @escaping (ILMessageFilterQueryResponse) -> Void) {
        
        // First, check whether to filter using offline data (if possible).
        let offlineAction = self.offlineAction(for: queryRequest)
        
        switch offlineAction {
        case .allow, .filter:
            // Based on offline data, we know this message should either be Allowed or Filtered. Send response immediately.
            let response = ILMessageFilterQueryResponse()
            response.action = offlineAction
            
            completion(response)
            
        case .none:
            // Based on offline data, we do not know whether this message should be Allowed or Filtered. Defer to network.
            // Note: Deferring requests to network requires the extension target's Info.plist to contain a key with a URL to use. See documentation for details.
            context.deferQueryRequestToNetwork() { (networkResponse, error) in
                let response = ILMessageFilterQueryResponse()
                response.action = .none
                
                if let networkResponse = networkResponse {
                    // If we received a network response, parse it to determine an action to return in our response.
                    response.action = self.action(for: networkResponse)
                } else {
                    NSLog("Error deferring query request to network: \(String(describing: error))")
                }
                
                completion(response)
            }
        }
    }
    
    private func offlineAction(for queryRequest: ILMessageFilterQueryRequest) -> ILMessageFilterAction {
        // Replace with logic to perform offline check whether to filter first (if possible).

     
            
            var blockNumberList :[String] = []
            var blockKeywordList:[String] = []
            var whiteNumberList :[String] = []
            
            let userDefault = UserDefaults(suiteName: "group.nomanikram.spamy-poc")
            
            // Retriving Data from User Default
            if  userDefault?.array(forKey: "blockNumberList") != nil {
                blockNumberList = userDefault?.array(forKey: "blockNumberList") as! [String]
            }else{
                blockNumberList = []
            }
        
            if  userDefault?.array(forKey: "blockKeywordList") != nil {
                blockKeywordList = userDefault?.array(forKey: "blockKeywordList") as! [String]
            }else{
                blockKeywordList = []
            }
        
            if  userDefault?.array(forKey: "whiteNumberList") != nil {
            whiteNumberList = userDefault?.array(forKey: "whiteNumberList") as! [String]
            }else{
            whiteNumberList = []
            }
        
            let sender = queryRequest.sender
            let message = queryRequest.messageBody

        return .filter
    }
    
    private func action(for networkResponse: ILNetworkResponse) -> ILMessageFilterAction {
        // Replace with logic to parse the HTTP response and data payload of `networkResponse` to return an action.
        return .filter
    }
    
    
}
