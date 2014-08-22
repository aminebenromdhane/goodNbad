part of goodNbad;

class ImageLoader {
	
	String _imagePath;
	ImageElement _imageContent;
	
	ImageLoader(this._imagePath){
		_imageContent = new ImageElement(src: _imagePath);
	}
	
    ImageElement get imageContent => _imageContent;
    void set imageContent(_imageContent){
    	this._imageContent = _imageContent;
    }
	
	void load(callbackLoadResources){
    	_imageContent.onLoad.listen(callbackLoadResources);
    }
	
}