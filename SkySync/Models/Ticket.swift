//
//  Ticket.swift
//  SkySync
//
//  Created by Carlos Hernandez on 3/30/25.
//


import Foundation

struct Ticket: Identifiable {
    let id = UUID()
    var name: String
    var airport: String
    var flight: String
    var date: Date
    var seat: String
    var gate: String
    var start: String
    var destination: String
    var company: String
}