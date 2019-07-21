import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    class materialColor {
        static var red:UIColor = UIColor.init(red: 244 , green: 67, blue: 54)
        static var pink:UIColor = UIColor.init(red: 233, green: 30, blue: 99)
        static var purple:UIColor = UIColor.init(red: 156, green: 39, blue: 176)
        static var deepPurple:UIColor = UIColor.init(red: 103, green: 58, blue: 183)
        static var indigo:UIColor = UIColor.init(red: 63, green: 81, blue: 181)
        static var blue:UIColor = UIColor.init(red: 33, green: 150, blue: 243)
        static var lightBlue:UIColor = UIColor.init(red: 3, green: 169, blue: 244)
        static var cyan:UIColor = UIColor.init(red: 0, green: 188, blue: 212)
        static var teal:UIColor = UIColor.init(red: 0 , green: 150, blue: 136)
        static var green:UIColor = UIColor.init(red: 76, green: 175, blue: 80)
        static var lightGreen:UIColor = UIColor.init(red: 139, green: 195, blue: 74)
        static var lime:UIColor = UIColor.init(red: 205, green: 220, blue: 57)
        static var yellow:UIColor = UIColor.init(red: 255, green: 235, blue: 59)
        static var amber:UIColor = UIColor.init(red: 255 , green: 193, blue: 7)
        static var orange:UIColor = UIColor.init(red: 255, green: 152, blue: 0)
        static var deepOrange:UIColor = UIColor.init(red: 255, green: 87, blue: 34)
        static var brown:UIColor = UIColor.init(red: 121, green: 85, blue: 72)
        static var grey:UIColor = UIColor.init(red: 158, green: 158, blue: 128)
        static var blueGrey:UIColor = UIColor.init(red: 96, green: 125, blue: 139)
    }
    
    class flatColor {
        static var turquoise:UIColor = UIColor.init(red: 26 , green: 188, blue: 54)
        static var emerald:UIColor = UIColor.init(red: 46, green: 204, blue: 113)
        static var peterRiver:UIColor = UIColor.init(red: 52, green: 152, blue: 219)
        static var amethyst:UIColor = UIColor.init(red: 155, green: 89, blue: 182)
        static var wetAsphalt:UIColor = UIColor.init(red: 52, green: 73, blue: 94)
        static var greenSea:UIColor = UIColor.init(red: 22, green: 160, blue: 133)
        static var nephritis:UIColor = UIColor.init(red: 39, green: 174, blue: 96)
        static var belizeHole:UIColor = UIColor.init(red: 41, green: 128, blue: 185)
        static var wisteria:UIColor = UIColor.init(red: 142 , green: 68, blue: 173)
        static var midnightBlue:UIColor = UIColor.init(red: 44, green: 62, blue: 80)
        static var sunFlower:UIColor = UIColor.init(red: 241, green: 196, blue: 15)
        static var carrot:UIColor = UIColor.init(red: 230, green: 126, blue: 34)
        static var alizarin:UIColor = UIColor.init(red: 231, green: 76, blue: 60)
        static var cloud:UIColor = UIColor.init(red: 236 , green: 240, blue: 241)
        static var concrete:UIColor = UIColor.init(red: 149, green: 165, blue: 166)
        static var orange:UIColor = UIColor.init(red: 243, green: 256, blue: 18)
        static var pumpkin:UIColor = UIColor.init(red: 211, green: 84, blue: 0)
        static var pomgranate:UIColor = UIColor.init(red: 192, green: 57, blue: 43)
        static var silver:UIColor = UIColor.init(red: 189, green: 195, blue: 199)
        static var asbestos:UIColor = UIColor.init(red: 127, green: 140, blue: 141)
    }
    
    
    
    
}
