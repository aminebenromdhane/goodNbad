part of goodNbad;

class ImageContainer {

	double _x;
    double _y;
	double _hight;
    double _width;
    String _imagePath;
    ImageElement _imageContent;
    CanvasRenderingContext2D _context;

    ImageContainer(this._imagePath, this._x, this._y){
    	_imageContent = AssetsLoader.images.first._imageContent;
    	_hight = 171.toDouble();
    	_width = 129.toDouble();
    }

	draw(CanvasRenderingContext2D context){
		context.drawImage(_imageContent, _x, _y);
	}

	clear(CanvasRenderingContext2D context){
		context.clearRect(_x, _y, _width, _hight);
	}

}