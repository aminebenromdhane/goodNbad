part of goodNbad;

class World {

	List<Target> _ennemies;

	Target _background;

	World(){
		_ennemies = new List<Target>();
		_background = new Target(0.0, 0.0, Assets.MARIO_BACKGROUND_IMAGE);
	}

	List<Target> get ennemies => _ennemies;
	void set ennemies(_ennemies){
		this._ennemies = _ennemies;
	}

	void init(){
		int numberOfTargets = 4;
		for(int i = 0 ; i < numberOfTargets ; i++){
			if (i<2) {
				Target mario = new Target(i*250.0 , 0.0, Assets.MARIO_IMAGE);
				mario.setMarioPolygon();
				_ennemies.add(mario);
			}
			else {
				Target luigi = new Target(i*250.0 , 0.0, Assets.LUIGI_IMAGE);
				//TODO to create luigi polygon
				luigi.setMarioPolygon();
//				luigi.setLuigiPolygon();
				_ennemies.add(luigi);
			}
		}
	}

	List<ImageContainer> getImages(){
		List<ImageContainer> images = new List<ImageContainer>();
		// add background img to images to be drawed first
		ImageContainer backgroundImage = _background.toImage();
		backgroundImage.hight = canvasHight;
		backgroundImage.width = canvasWidth;
		images.add(backgroundImage);

		// add all ennemies imgs to images
		_ennemies.forEach((ennemy){
        	images.add(ennemy.toImage());
        });
		return images;
	}

	void play(){
		_ennemies.forEach((target){
			target.goDown();
		});
	}
}