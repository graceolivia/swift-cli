import Foundation
import ArgumentParser
// the allowable stitches

let allowed_stitches = ["k1", "p1"]
let stitchPrinting = ["k1":" ",
                      "p1":"-"]

public final class Chartify {
    public init() {}
    public func run() {
        print("Knitting!")
        print(Charter().make_chart(pattern: "k1 k1 p1 p1 k1 k1"))
    }
}

//take user input
public struct User_Input: ParsableCommand {
    public init() {}
    @Argument() var user_pattern: String
    
    func run() -> String {
        print(user_pattern)
        return(user_pattern)
    }
}


// validator class
public class Validator {
    init() {}
    // this will validate if the string contains only approved stitches
    public func validate(pattern: String) -> Bool {
        let pattern_stitches = pattern.components(separatedBy: " ")
        print(pattern_stitches)
        for stitch in pattern_stitches {
            if allowed_stitches.contains(stitch) == false{
                return false
            }
        }
        return true
    }

}

// printing class
public class Charter {
    public init() {}
    public func make_chart(pattern: String) -> String {
        let pattern_stitches = pattern.components(separatedBy: " ")
        let length = pattern_stitches.count
        let the_top_row_bars = self.make_top_row(width: length)
        let bottom_row_bars = self.make_bottom_row(width: length)
        var stitch_row = "│"
        
        for j in pattern_stitches {
            stitch_row += stitchPrinting[j]!
            stitch_row += "│"
        }
        print(the_top_row_bars)
        print(stitch_row)
        print(bottom_row_bars)
        return("done")
    }
    public func make_top_row(width: Int) -> String {
        var top_row_bars = "┌"
        for n in 1...(width - 1) {
            top_row_bars += "─┬"
        }
        top_row_bars += "─┐"
        return(top_row_bars)
    }
    public func make_middle_row(width: Int) -> String {
        var middle_row_bars = "├"
        for i in 1...(width - 1) {
            middle_row_bars += "─┼"
        }
        middle_row_bars += "─┤"
        return(middle_row_bars)
    }
    public func make_bottom_row(width: Int) -> String {
        var bottom_row_bars = "└"
        for i in 1...(width - 1) {
            bottom_row_bars += "─┴"
        }
        bottom_row_bars += "─┘"
        return(bottom_row_bars)
    }
}
//┌─┬─┬─┬─┐
//│k│p│k│p│
//├─┼─┼─┼─┤
//│p│k│p│k│
//└─┴─┴─┴─┘
