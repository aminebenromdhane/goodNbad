part of goodNbad;

class WorldServiceModel {

	WorldServiceModel();

	/**
	 *  init the model
	 */
	void init(World world){
		world.init();
	}

	/**
	 *  play model next move
	 */
	void play(World world) {
		world.play();
	}

}

