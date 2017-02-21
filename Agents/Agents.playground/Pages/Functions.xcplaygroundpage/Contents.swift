//: [Previous](@previous) / [Next](@next)
//: # Functions
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 ## Encapsulating behaviour
 
 The agent from the prior page produces interesting output.
 
 At times we want several instances of the same behaviour to produce output.
 
 One way to organize this in a program is to use a *function*.
 
 Think of a function as a "black box". You provide certan input (optionally) and the function will produce output.
 
 Below, an example.
 
 */

// Create canvas
let canvas = Canvas(width: 300, height: 300)

/**
 Generates visual output for a simple agent that changes direction based on random number generation.
 
 - parameter fill: The fill for the agent's circle.
 - parameter diameter: The width and height of circle.
 - parameter stepSize: How far the agent travels with each step.
 */
 func simpleAgent(fill : Color, diameter : Int, stepSize : Int) {

 // No borders
 canvas.drawShapesWithBorders = false

 // Declare constants
    let north = 0
    let northEast = 1
    let east = 2
    let southEast = 3
    let south = 4
    let southWest = 5
    let west = 6
    let northWest = 7
    
    // Generate a starting position
    var x = random(from: 50, toButNotIncluding: canvas.width - 50)
    var y = random(from: 50, toButNotIncluding: canvas.height - 50)
    
    // Travel 500 steps
    for _ in 1...500 {
        
        // Generate a random direction
        var direction = random(from: 0, toButNotIncluding: 8)
        
        // Reverse direction if edge reached
        if x + stepSize > canvas.width {
            direction = west
        }
        if x - stepSize < 0 {
            direction = east
        }
        if y + stepSize > canvas.height {
            direction = south
        }
        if y - stepSize < 0 {
            direction = north
        }
        
        // Change position based on direction and step size
        if direction == north {
            y = y + stepSize
        } else if direction == northEast {
            x = x + stepSize
            y = y + stepSize
        } else if direction == east {
            x = x + stepSize
        } else if direction == southEast {
            x = x + stepSize
            y = y - stepSize
        } else if direction == south {
            y = y - stepSize
        } else if direction == southWest {
            x = x - stepSize
            y = y - stepSize
        } else if direction == west {
            x = x - stepSize
        } else if direction == northWest {
            x = x - stepSize
            y = y + stepSize
        }
        
        // Draw the agent in it's new position
        canvas.fillColor = fill
        canvas.drawEllipse(centreX: x, centreY: y, width: diameter, height: diameter)
    }
}

// Make three simple agents

// Agent 1
let lightGrey = Color(hue: 0, saturation: 0, brightness: 0, alpha: 25)
simpleAgent(fill: lightGrey, diameter: 5, stepSize: 3)

// Agent 2
let paleBlue = Color(hue: 240, saturation: 50, brightness: 90, alpha: 25)
simpleAgent(fill: paleBlue, diameter: 10, stepSize: 7)

// Agent 3
simpleAgent(fill: lightGrey, diameter: 2, stepSize: 1)

/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas.imageView
