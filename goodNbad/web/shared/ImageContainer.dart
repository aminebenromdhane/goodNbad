part of goodNbad;

class ImageContainer {

	double _x;
    double _y;
    String _imagePath;
    ImageElement _imageContent;
    
    ImageContainer(this._imagePath, this._x, this._y){
    	_imageContent = AssetsLoader.images.first._imageContent;	
    }

	draw(CanvasRenderingContext2D context){
		context.drawImage(_imageContent, _x, _y);
	}

}