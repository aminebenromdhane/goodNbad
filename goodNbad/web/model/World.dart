part of goodNbad;

class World {

	List<Target> _targets;
	
	World(){
		_targets = new List<Target>();
	}
	
	void init(){
		int numberOfTargets = 10;
		for(int i = 0 ; i < numberOfTargets ; i++){
			_targets.add(new Target(i*50 , 0));
		}
	}
	
	void play(){
		_targets.forEach((target){
			target.goDown();
		});
	}
}