part of goodNbad;

class StaticImage extends ImageContainer{

	int _height;
	int _width;
	//ImageElement _content;

	StaticImage(_imagePath, _x, _y, _height, _width): super(_imagePath, _x, _y){
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
		context.drawImage(_imageContent, 0, 0);
		//}
	}

}
