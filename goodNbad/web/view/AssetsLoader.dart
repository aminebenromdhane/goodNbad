part of goodNbad;

class AssetsLoader{
	
	static List<ImageLoader> images = new List<ImageLoader>();
	
	int _loadCursor;
	
	AssetsLoader(){
		//to change, we need to itritate all attribute of Asset automatically , like Assets.attruibute.forEach()
		_loadCursor = 0;
		ImageLoader loader = new ImageLoader(Assets.TARGET_IMAGE);
        images.add(loader);
	}
	
	void loadImages(callback){
		images.forEach((image){
			image.load((Event e){
				_loadCursor++;
				if(_loadCursor == images.length){
					callback();
				}
			});
		});
	}
	
}