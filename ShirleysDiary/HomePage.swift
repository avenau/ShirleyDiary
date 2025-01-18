import SwiftUI
import SwiftData

struct HomePage: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \DiaryEntry.date, order: .reverse) private var entries: [DiaryEntry]
    @State private var showingNewEntry = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Today's date header
                Text(Date.now, format: .dateTime.day().month().year())
                    .font(.title)
                    .padding()
                
                // List of diary entries
                List {
                    ForEach(entries) { entry in
                        NavigationLink(destination: DiaryEntryView(entry: entry)) {
                            VStack(alignment: .leading) {
                                Text(entry.date, format: .dateTime.day().month().year())
                                    .font(.headline)
                                Text(entry.content)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteEntries)
                }
            }
            .navigationTitle("Dear Diary")
            .safeAreaInset(edge: .bottom) {
                NavigationBar(showNewEntry: { showingNewEntry = true })
            }
            .sheet(isPresented: $showingNewEntry) {
                DiaryEntryView(entry: nil)
            }
        }
    }
    
    private func deleteEntries(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(entries[index])
            }
        }
    }
}

#Preview {
    HomePage()
        .modelContainer(for: DiaryEntry.self, inMemory: true)
}
