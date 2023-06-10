import SwiftUI

struct SecretView: View {
    
    @EnvironmentObject private var vm: LogicaVM
    
    @State private var themeEnter = ""
    @State private var text2 = ""
    @State private var secretAlert1 = false
    @State private var secretAlert2 = false
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                
                RadialGradient(gradient: Gradient(colors: [.indigo, .black]), center: .center, startRadius: 20, endRadius: 600)
                
            }
            .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 20) {
                    
                    Image(systemName: "gearshape")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                    
                    Text("Инструкция к игре")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.yellow)
                    
                    Text("1. Внесите название темы\n(\(vm.theme))\n2. Вносите и сохраняйте по одному слову-загадке\n\nЗагадано слов: \(vm.accepted.count)")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                    
                }
                .foregroundColor(.secondary)
                .padding(.vertical, 20)
                .frame(width: 260)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
                GroupBox {
                    
                    HStack {
                        
                        TextField("Тема", text: $themeEnter)
                        
                        Button(action: { if themeEnter != "" { vm.theme = themeEnter }; themeEnter = "" }, label: { Text("Сохранить").foregroundColor(.indigo) })
                        
                    }
                }
                .frame(width: 260)
                
                GroupBox {
                    
                    HStack {
                        
                        TextField("Слово", text: $text2)
                        
                        Button(action: { if text2 != "" { vm.accepted.append(text2) }; text2 = "" }, label: { Text("Сохранить").foregroundColor(.indigo) })
                        
                    }
                }
                .frame(width: 260)
                
                VStack(spacing: 5) {
                    
                    Text("Загаданные слова")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.yellow)
                    
                    if vm.accepted != [] {
                        
                        ScrollView {
                            Text($vm.accepted.wrappedValue.description)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                        } .frame(height: 100)
                        
                    } else {
                        Text("Слов пока нет")
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: { secretAlert1 = true }, label: { Text("Удалить \nслова").foregroundColor(.yellow) })
                            .buttonStyle(.bordered)
                            .tint(.white)
                            .alert("Удалить слова?", isPresented: $secretAlert1) {
                                Button("Да") { vm.accepted.removeAll() }
                                Button("Нет", role: .cancel) { }
                            } message: {
                                Text("функция очистит все загаданные слова")
                            }
                        
                        Spacer()
                        
                        Button(action: { secretAlert2 = true }, label: { Text("Удалить \nтему").foregroundColor(.yellow) })
                            .buttonStyle(.bordered)
                            .tint(.white)
                            .alert("Удалить тему?", isPresented: $secretAlert2) {
                                Button("Да") { vm.theme = "пусто" }
                                Button("Нет", role: .cancel) { }
                            } message: {
                                Text("функция очистит установленную тему")
                            }
                        Spacer()
                        
                    }
                }
                .foregroundColor(.secondary)
                .padding(.vertical, 20)
                .frame(width: 260)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
            }
        }
    }
}

struct SecretView_Previews: PreviewProvider {
    static var previews: some View {
        SecretView()
            .environmentObject(LogicaVM())
    }
}
