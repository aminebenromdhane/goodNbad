part of goodNbad;

class World {

	List<Target> _ennemies;

	Target _background;

	World(){
		_ennemies = new List<Target>();
		_background = new Target(0.0, 0.0, Assets.MARIO_BACKGROUND_IMAGE);
	}

	void init(){
		int numberOfTargets = 4;
		for(int i = 0 ; i < numberOfTargets ; i++){
			if (i<2) {
				_ennemies.add(new Target(i*250.0 , 0.0, Assets.MARIO_IMAGE));
			}
			else {
				_ennemies.add(new Target(i*250.0 , 0.0, Assets.LUIGI_IMAGE));
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