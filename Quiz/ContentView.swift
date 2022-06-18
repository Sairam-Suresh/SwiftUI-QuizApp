//
//  ContentView.swift
//  Quiz
//
//  Created by Sairam Suresh on 15/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var questionNumber = 0
    @State var noOfPoints = 0
    @State var correctAnswer = false
    @State var showAlert = false
    @State var isFinished = false
    @State var openEndedAns = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, Color .yellow, .blue, .green,]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Text(questions[questionNumber].questionText)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                if questions[questionNumber].questionType == .mcq {
                    Button {
                        if questions[0].correctOption == correctOption.one {
                            print("correct")
                            correctAnswer = true
                            noOfPoints += 1
                        }
                        showAlert = true
                        
                        if showAlert == false {
                            if questions.count == questionNumber+1 {
                                questionNumber = 0
                                isFinished = true
                            } else {
                                questionNumber += 1
                            }
                        }
                    } label: {
                        Text((questions[questionNumber].options?[0])!)
                            .foregroundColor(.white)
                            .frame(width: 300, alignment: .center)
                            .padding()
                            .background(.red)
                            .cornerRadius(20)
                            .font(.system(size: 30))
                        
                    }.sheet(isPresented: $showAlert, onDismiss: {showAlert = false}) {
                        Image("paw-patrol-0")
                            .resizable()
                            .scaledToFit()
                        Button("OK")
                        {
                            showAlert = false
                            if questions.count == questionNumber+1 {
                                questionNumber = 0
                                isFinished = true
                            } else {
                                questionNumber += 1
                            }
                        }
                    }
                    
                    Button {
                        if questions[0].correctOption == correctOption.two {
                            correctAnswer = true
                            noOfPoints += 1
                        }
                        showAlert = true
                    } label: {
                        Text((questions[questionNumber].options?[1])!)
                            .foregroundColor(.white)
                            .frame(width: 300, alignment: .center)
                            .padding()
                            .background(.yellow)
                            .cornerRadius(20)
                            .font(.system(size: 30))
                    }.sheet(isPresented: $showAlert, onDismiss: {showAlert = false}) {
                        Image("paw-patrol-0")
                            .resizable()
                            .scaledToFit()
                        Button("OK")
                        {
                            showAlert = false
                            if questions.count == questionNumber+1 {
                                questionNumber = 0
                                isFinished = true
                            } else {
                                questionNumber += 1
                            }
                        }
                    }
                    
                    Button {
                        if questions[0].correctOption == correctOption.three {
                            correctAnswer = true
                            noOfPoints += 1
                        }
                        showAlert = true
                    } label: {
                        Text((questions[questionNumber].options?[2])!)
                            .foregroundColor(.white)
                            .frame(width: 300, alignment: .center)
                            .padding()
                            .background(.blue)
                            .cornerRadius(20)
                            .font(.system(size: 30))
                    }.sheet(isPresented: $showAlert, onDismiss: {showAlert = false}) {
                        if noOfPoints == 0 {
                            Image("paw-patrol-0")
                                .resizable()
                                .scaledToFit()
                        } else if noOfPoints == 1 {
                            Image("paw-patrol-1")
                                .resizable()
                                .scaledToFit()
                        } else if noOfPoints == 2 {
                            Image("paw-patrol-2")
                                .resizable()
                                .scaledToFit()
                        } else if noOfPoints == 3 {
                            Image("paw-patrol-3")
                                .resizable()
                                .scaledToFit()
                        }
                        
                        Button("OK")
                        {
                            showAlert = false
                            if questions.count == questionNumber+1 {
                                questionNumber = 0
                                isFinished = true
                            } else {
                                questionNumber += 1
                            }
                        }
                    }
                    
                    Button {
                        if questions[0].correctOption == correctOption.four {
                            correctAnswer = true
                            noOfPoints += 1
                        }
                        showAlert = true
                    } label: {
                        Text((questions[questionNumber].options?[3])!)
                            .foregroundColor(.white)
                            .frame(width: 300, alignment: .center)
                            .padding()
                            .background(.green)
                            .cornerRadius(20)
                            .font(.system(size: 30))
                    }.sheet(isPresented: $showAlert, onDismiss: {showAlert = false}) {
                        if noOfPoints == 0 {
                            Image("paw-patrol-0")
                                .resizable()
                                .scaledToFit()
                        } else if noOfPoints == 1 {
                            Image("paw-patrol-1")
                                .resizable()
                                .scaledToFit()
                        } else if noOfPoints == 2 {
                            Image("paw-patrol-2")
                                .resizable()
                                .scaledToFit()
                        } else if noOfPoints == 3 {
                            Image("paw-patrol-3")
                                .resizable()
                                .scaledToFit()
                        }
                            .resizable()
                            .scaledToFit()
                        Button("OK")
                        {
                            showAlert = false
                            if questions.count == questionNumber+1 {
                                questionNumber = 0
                                isFinished = true
                            } else {
                                questionNumber += 1
                            }
                        }
                    }
                } else {
                    TextField("Put your answer here", text: $openEndedAns)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .frame(width: 350, alignment: .center)
                    
                    
                    Button {
                        if openEndedAns == questions[questionNumber].correctAnswer {
                            correctAnswer = true
                        }
                        showAlert = true
                    } label: {
                        Text("submit")
                            .foregroundColor(.white)
                            .frame(width: 300, alignment: .center)
                            .padding()
                            .background(.blue)
                            .cornerRadius(20)
                            .font(.system(size: 30))
                    }.alert(correctAnswer ? "Correct" : "Wrong", isPresented: $showAlert) {
                        Button("OK", role: .cancel) {showAlert = false
                            if questions.count == questionNumber+1 {
                                questionNumber = 0
                                isFinished = true
                            } else {
                                questionNumber += 1
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
