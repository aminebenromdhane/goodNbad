part of goodNbad;

class ImageLoader {
	
	String _imagePath;
	ImageElement _imageContent;
	
	ImageLoader(this._imagePath){
		_imageContent = new ImageElement(src: _imagePath);
	}
	
	void load(callbackLoadResources){
    	_imageContent.onLoad.listen(callbackLoadResources);
    }
	
}