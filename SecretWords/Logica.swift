import Foundation

class LogicaVM: ObservableObject {
    
    @Published var text = ""
    @Published var accepted: Array<String> = []
    @Published var all: Set<String> = []
    @Published var theme = "пусто"
    
}
