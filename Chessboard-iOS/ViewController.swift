//
//  ViewController.swift
//  Chessboard-iOS
//
//  Created by Dimitris Papaioannou on 19/10/19.
//  Copyright © 2019 Dimitris Papaioannou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var a1_Button: UIButton!
    @IBOutlet weak var b1_Button: UIButton!
    @IBOutlet weak var c1_Button: UIButton!
    @IBOutlet weak var d1_Button: UIButton!
    @IBOutlet weak var e1_Button: UIButton!
    @IBOutlet weak var f1_Button: UIButton!
    @IBOutlet weak var g1_Button: UIButton!
    @IBOutlet weak var h1_Button: UIButton!
    
//    @IBOutlet weak var a2_Button: UIButton!
//    @IBOutlet weak var b2_Button: UIButton!
//    @IBOutlet weak var c2_Button: UIButton!
//    @IBOutlet weak var d2_Button: UIButton!
//    @IBOutlet weak var e2_Button: UIButton!
//    @IBOutlet weak var f2_Button: UIButton!
//    @IBOutlet weak var g2_Button: UIButton!
//    @IBOutlet weak var h2_Button: UIButton!
//
//    @IBOutlet weak var a3_Button: UIButton!
//    @IBOutlet weak var b3_Button: UIButton!
//    @IBOutlet weak var c3_Button: UIButton!
//    @IBOutlet weak var d3_Button: UIButton!
//    @IBOutlet weak var e3_Button: UIButton!
//    @IBOutlet weak var f3_Button: UIButton!
//    @IBOutlet weak var g3_Button: UIButton!
//    @IBOutlet weak var h3_Button: UIButton!
//
//    @IBOutlet weak var a4_Button: UIButton!
//    @IBOutlet weak var b4_Button: UIButton!
//    @IBOutlet weak var c4_Button: UIButton!
//    @IBOutlet weak var d4_Button: UIButton!
//    @IBOutlet weak var e4_Button: UIButton!
//    @IBOutlet weak var f4_Button: UIButton!
//    @IBOutlet weak var g4_Button: UIButton!
//    @IBOutlet weak var h4_Button: UIButton!

//    var chessboardArray = [[Int]]()
    var startingPointSelected: Bool = false
    var pathsArray: [String] = []
    var knightMovesCount = 0
    
    var start_x: Int = 0
    var start_y: Int = 0
    
    var finish_x: Int = 0
    var finish_y: Int = 0
    
    var selectionsSum: Int = 0
    
    // Knight's possible moves:
    var X: [Int] = [ 2, 1, -1, -2, -2, -1, 1, 2 ]
    var Y: [Int] = [ 1, 2, 2, 1, -1, -2, -2, -1 ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func pathsForCoordinates(x: Int, y: Int) {
        
        if startingPointSelected == false {
            start_x = x
            start_y = y
            selectionsSum += 1
            startingPointSelected = true
            print("Starting point is: \(start_x),\(start_y)")
            print("SelectionsSum is: \(selectionsSum)")
        } else {
            if selectionsSum < 2 {
                finish_x = x
                finish_y = y
                selectionsSum += 1
                print("Finish point is: \(finish_x),\(finish_y)")
                print("SelectionsSum is: \(selectionsSum)")

                if start_x == finish_x && start_y == finish_y {
                    print("Error: It's the same spot!")
                    // SHOW ERROR MESSAGE!
                    return
                }
            }
        }
    }
    
    /*
        Make a function that takes coordinates x,y and calculate the possible moves.
        Returns a new array.
        Check if count >= 3.
        Check if getting out of bounds.
    */
    func getPossibleMovesForCoordinates(x: Int, y: Int) {
        var X_new: [Int] = Array(repeating: 0, count: 8)
        var Y_new: [Int] = Array(repeating: 0, count: 8)
        
        if selectionsSum == 2 && knightMovesCount < 3 {
            for i in 0...7 {
                X_new[i] = X[i] + x
                Y_new[i] = Y[i] + y
                
                // Check if new element's coordinates getting out of bounds. If that's so, skip this and move to the next element.
                if X_new[i] < 1 || X_new[i] > 8 || Y_new[i] < 1 || Y_new[i] > 8 {
                    print("\(X_new[i]) \(Y_new[i]) Coordinates out of bounds!!")
                    continue
                }
                
                // Check if this is the destination element.
                if X_new[i] == finish_x && Y_new[i] == finish_y {
                    let path = "\(x),\(y) -> \(X_new[i]),\(Y_new[i])"
                    pathsArray.append(path)
                    print("Path found successfully @ x,y: \(path)!")
                    continue
                }
                print(X_new[i],Y_new[i])
            }
            knightMovesCount += 1
            print("KnightMovesCount: \(knightMovesCount)")
        }
    }
    
    // To calculate possible moves:
    func possibleMoves(x: Int, y: Int) -> Int {
                
        var count: Int = 0
        
//      Check if each possible move is valid or not
        for i in 0 ..< 8 {
            // Position of knight after move
            let possible_x = x + X[i];
            let possible_y = y + Y[i];
            
            if possible_x >= 1 && possible_x <= 8 && possible_y >= 1 && possible_y <= 8 {
                count += 1
            }

        }
        // Return number of possible moves
        return count;
    }

    // Buttons actions:
    @IBAction func a1_buttonPressed(_ sender: Any) {
        pathsForCoordinates(x: 1, y: 1)
        getPossibleMovesForCoordinates(x: start_x, y: start_y)
    }
    
    @IBAction func a2_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 1, y: 2)}
    @IBAction func a3_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 1, y: 3)}
    @IBAction func a4_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 1, y: 4)}
    @IBAction func a5_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 1, y: 5)}
    @IBAction func a6_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 1, y: 6)}
    @IBAction func a7_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 1, y: 7)}
    @IBAction func a8_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 1, y: 8)}
  
    @IBAction func b1_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 2, y: 1)}
    @IBAction func b2_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 2, y: 2)}
    @IBAction func b3_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 2, y: 3)}
    @IBAction func b4_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 2, y: 4)}
    @IBAction func b5_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 2, y: 5)}
    @IBAction func b6_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 2, y: 6)}
    @IBAction func b7_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 2, y: 7)}
    @IBAction func b8_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 2, y: 8)}
    
    @IBAction func c1_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 3, y: 1)}
    @IBAction func c2_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 3, y: 2)}
    @IBAction func c3_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 3, y: 3)}
    @IBAction func c4_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 3, y: 4)}
    @IBAction func c5_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 3, y: 5)}
    @IBAction func c6_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 3, y: 6)}
    @IBAction func c7_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 3, y: 7)}
    @IBAction func c8_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 3, y: 8)}
    
    @IBAction func d1_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 4, y: 1)}
    @IBAction func d2_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 4, y: 2)}
    @IBAction func d3_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 4, y: 3)}
    @IBAction func d4_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 4, y: 4)}
    @IBAction func d5_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 4, y: 5)}
    @IBAction func d6_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 4, y: 6)}
    @IBAction func d7_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 4, y: 7)}
    @IBAction func d8_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 4, y: 8)}
    
    @IBAction func e1_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 5, y: 1)}
    @IBAction func e2_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 5, y: 2)}
    @IBAction func e3_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 5, y: 3)}
    @IBAction func e4_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 5, y: 4)}
    @IBAction func e5_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 5, y: 5)}
    @IBAction func e6_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 5, y: 6)}
    @IBAction func e7_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 5, y: 7)}
    @IBAction func e8_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 5, y: 8)}
    
    @IBAction func f1_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 6, y: 1)}
    @IBAction func f2_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 6, y: 2)}
    @IBAction func f3_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 6, y: 3)}
    @IBAction func f4_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 6, y: 4)}
    @IBAction func f5_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 6, y: 5)}
    @IBAction func f6_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 6, y: 6)}
    @IBAction func f7_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 6, y: 7)}
    @IBAction func f8_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 6, y: 8)}
    
    @IBAction func g1_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 7, y: 1)}
    @IBAction func g2_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 7, y: 2)}
    @IBAction func g3_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 7, y: 3)}
    @IBAction func g4_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 7, y: 4)}
    @IBAction func g5_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 7, y: 5)}
    @IBAction func g6_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 7, y: 6)}
    @IBAction func g7_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 7, y: 7)}
    @IBAction func g8_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 7, y: 8)}
    
    @IBAction func h1_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 8, y: 1)}
    @IBAction func h2_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 8, y: 2)}
    @IBAction func h3_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 8, y: 3)}
    @IBAction func h4_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 8, y: 4)}
    @IBAction func h5_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 8, y: 5)}
    @IBAction func h6_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 8, y: 6)}
    @IBAction func h7_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 8, y: 7)}
    @IBAction func h8_buttonPressed(_ sender: Any) {pathsForCoordinates(x: 8, y: 8)}

}
