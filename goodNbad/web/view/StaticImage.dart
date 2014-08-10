part of goodNbad;

class StaticImage {

	num _x;
	num _y;
	int _height;
	int _width;
	String _contentPath;
	ImageElement _content;

	StaticImage(_contentPath, _x, _y, _height, _width){
		_content = new ImageElement(src: _contentPath);
	}

	void loadImage(var callbackLoadResources){
		_content.onLoad.listen(callbackLoadResources);
	}

	void draw(CanvasRenderingContext2D context, bool isScaled){
		if (isScaled == 1) {
	        context.drawImageScaled(_content, _x, _y, _width, _height);
		}
		else {
	        context.drawImage(_content, _x, _y);
		}
	}

}
