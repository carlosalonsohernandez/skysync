//
//  MainTicketView.swift
//  SkySync
//
//  Created by Carlos Hernandez on 3/30/25.
//


import SwiftUI

struct MainTicketView: View {
    @StateObject private var viewModel = TicketViewModel()
    @State private var showingAddTicket = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                // Tickets Section
                HStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Tickets")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Spacer()
                    Button(action: {
                        showingAddTicket = true
                    }) {
                        Text("Add +")
                            .fontWeight(.medium)
                    }
                }
                .padding([.top, .horizontal])

                List {
                    ForEach(viewModel.tickets) { ticket in
                        HStack(spacing: 16) {
                            // Placeholder circle. Use GMAPs API to fetch icon later
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 40, height: 40)
                            let ticketLabel = "\(ticket.name) - \(ticket.start) to \(ticket.destination)" // avoiding compiler types.
                            Text(ticketLabel)
                                .font(.body)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .sheet(isPresented: $showingAddTicket) {
                AddTicketView(viewModel: viewModel)
            }
        }
    }
}

struct MainTicketView_Previews: PreviewProvider {
    static var previews: some View {
        MainTicketView()
    }
}
