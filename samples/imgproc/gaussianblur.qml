import lcvcore 1.0
import lcvimgproc 1.0

Row{
    
    // This sample shows the usage of the Blur
    // element
    
    ImRead{
       id : src
       file : codeDocument.path + '/../_images/buildings_0246.jpg'
    }
    
    GaussianBlur{
        input : src.output
        ksize : "21x21"
        sigmaX : 5
        sigmaY : 5
    }
}
