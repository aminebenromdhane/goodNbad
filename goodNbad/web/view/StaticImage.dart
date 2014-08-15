part of goodNbad;

class StaticImage extends ImageContainer{

//	double _hight;
//	int _width;
//	ImageElement _content;

	StaticImage(_imagePath, _x, _y, _hight, _width): super(_imagePath, _x, _y){
		this._hight = _hight;
		this._width = _width;
		//_content = new ImageElement(src: _imagePath);
	}

	void loadImage(var callbackLoadResources){
		//_content.onLoad.listen(callbackLoadResources);
	}

	void draw(CanvasRenderingContext2D context){
		/*if (false) {
	        context.drawImageScaled(_content, _x, _y, _width, _height);
		}
		else {*/
		context.drawImage(_imageContent, _x, _y);
		//}
	}

}
