import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func activate(leading: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
                  trailing: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
                  top: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
                  bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
                  centerX: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
                  centerY: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
                  width: CGFloat? = nil,
                  height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading   { leadingAnchor.constraint(equalTo: leading).isActive = true }
        if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing).isActive = true }
        if let top = top           { topAnchor.constraint(equalTo: top).isActive = true }
        if let bottom = bottom     { bottomAnchor.constraint(equalTo: bottom).isActive = true }
        if let centerX = centerX   { centerXAnchor.constraint(equalTo: centerX).isActive = true }
        if let centerY = centerY   { centerYAnchor.constraint(equalTo: centerY).isActive = true }
        if let width = width       { widthAnchor.constraint(equalToConstant: width).isActive = true }
        if let height = height     { heightAnchor.constraint(equalToConstant: height).isActive = true }
    }
}

