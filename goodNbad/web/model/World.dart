part of goodNbad;

class World {

	List<Target> _targets;

	World(){
		_targets = new List<Target>();
	}

	void init(){
		int numberOfTargets = 10;
		for(int i = 0 ; i < numberOfTargets ; i++){
			_targets.add(new Target(i*250.0 , 0.0));
		}
	}

	List<ImageContainer> getImages(){
		List<ImageContainer> images = new List<ImageContainer>();
		_targets.forEach((target){
        	images.add(target.toImage());
        });
		return images;
	}

	void play(){
		_targets.forEach((target){
			target.goDown();
		});
	}
}