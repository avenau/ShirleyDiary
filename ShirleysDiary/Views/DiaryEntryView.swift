import SwiftUI
import SwiftData

struct DiaryEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var content: String
    var entry: DiaryEntry?
    
    init(entry: DiaryEntry?) {
        self.entry = entry
        _content = State(initialValue: entry?.content ?? "")
    }
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $content)
                .padding()
                .navigationTitle(entry?.date.formatted(.dateTime.day().month().year()) ?? Date.now.formatted(.dateTime.day().month().year()))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            if let existingEntry = entry {
                                existingEntry.content = content
                            } else {
                                let newEntry = DiaryEntry(content: content)
                                modelContext.insert(newEntry)
                            }
                            dismiss()
                        }
                        .disabled(content.isEmpty)
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
        }
    }
} 