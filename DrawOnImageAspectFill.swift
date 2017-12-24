
func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {        
    UIGraphicsBeginImageContextWithOptions(topImageView.bounds.size, false, 0.0)
    let aspect = imageView.image!.size.width / imageView.image!.size.height
    let rect: CGRect
    if imageView.frame.width / aspect > imageView.frame.height {
        let height = imageView.frame.width / aspect
        rect = CGRect(x: 0, y: (imageView.frame.height - height) / 2, width: imageView.frame.width, height: height)
    } 
    else {
        let width = imageView.frame.height * aspect
        rect = CGRect(x: (imageView.frame.width - width) / 2, y: 0, width: width, height: imageView.frame.height)
    }
    imageView.image?.draw(in: rect)
            
    let context = UIGraphicsGetCurrentContext()
    context?.move(to: fromPoint)
    context?.addLine(to: toPoint)
    context?.setLineCap(CGLineCap.round)
    context?.setLineWidth(brushWidth)
    context?.setStrokeColor(strokeColor)
    context?.setBlendMode(CGBlendMode.normal)
    context?.strokePath()

    imageView.image = UIGraphicsGetImageFromCurrentImageContext()
    imageView.alpha = opacity
    UIGraphicsEndImageContext()
}