//
//  TicketViewModel.swift
//  SkySync
//
//  Created by Carlos Hernandez on 3/30/25.
//


import Foundation
import SwiftUI

class TicketViewModel: ObservableObject {
    @Published var tickets: [Ticket] = []
    @Published var availableAirports: [String] = [] // You can prefill this later

    func addTicket(_ ticket: Ticket) {
        tickets.append(ticket)
    }
}