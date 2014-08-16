part of goodNbad;

class AssetsLoader{

	static Map<String, ImageLoader> images = new Map<String, ImageLoader>();

	int _loadCursor;

	AssetsLoader(){
		_loadCursor = 0;

		// get all assets
		List<String> assets = Assets.getAllAssets();

		// add all assets to be loaded
		assets.forEach((asset){
			ImageLoader assetImg = new ImageLoader(asset);
			images[asset] = assetImg;
		});

	}

	void loadImages(callback){
		print("begin load imgs");
		images.values.forEach((image){
			image.load((Event e){
				_loadCursor++;
				if(_loadCursor == images.length){
					print("end load imgs");
					callback();
				}
			});
		});
	}

}