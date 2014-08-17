part of goodNbad;

class WorldPresenter {

	World _world;
	WorldView _wordView;
	WorldServiceModel _wordServiceModel;
	StreamSubscription _subscriptionPlay;
	StreamSubscription _subscriptionClick;
	StreamSubscription _subscriptionInit;

	/**
	 * Constructeur's WordPresenter
	 * Init models
	 * subscribes on PlayEvent and InitEvent
	 */
	WorldPresenter(){
		print("begin init world presenter");

		_world = new World();
		_wordServiceModel = new WorldServiceModel();
//		_subscriptionPlay = new StreamSubscription();

		// onInitEvent
		_subscriptionInit = eventBus.on(initEvent).listen((CanvasRenderingContext2D ctx2d) {
			initModelView(ctx2d);
        });

		// onPlayEvent
		_subscriptionPlay = eventBus.on(playEvent).listen((Object object) {
			playModelView(object);
        });

		// onClickEvent
		_subscriptionClick = eventBus.on(clickEvent).listen((Point pointClick) {
			clickModel(pointClick);
        });

		print("end init world presenter");
	}

	void initModelView(ctx2d){
		print("init world event");
        // update model via service model
        _wordServiceModel.init(_world);
        // update model via service model
        _wordServiceModel.play(_world);

        //TODO in test
        // init mouse event manager on img
        _world.getImages().forEach((img){
        	new MouseEventManager(img, console2);
        });

        // init view
        _wordView = new WorldView(ctx2d);
        // update view
		_wordView.draw(_world);
	}

	void playModelView(object){
		print("play event: imgs go down");
		// update model via service model
		_wordServiceModel.play(_world);
		// update view
		_wordView.draw(_world);
	}
	
	void clickModel(pointClick){
		Target deadEnnemy = null;
		_world.ennemies.forEach((ennemy){
			log(pointClick, ennemy);

			if( ennemy.isRectHit(pointClick) ){
//			if( ennemy.isHit(pointClick) ){
				deadEnnemy = ennemy;
			}
		});
		if (deadEnnemy != null) {
			_world.ennemies.remove(deadEnnemy);
		}
	}
	
	void log(pointClick, ennemy){
		console2.text = "is ennemy hitted: " + ennemy.isRectHit(pointClick).toString();
//					 + "   " + "ennemyXY: " + ennemy._x.toString() + ", " +ennemy._y.toString();
		print("is ennemy hitted: " + ennemy.isRectHit(pointClick).toString() +
			"\t clickXY: " + pointClick.x.toString() + ", " +pointClick.y.toString() +
			"\t ennemy: " + ennemy.x.toString() + ", " + ennemy.width.toString() +
			"\t  " + ennemy.y.toString() + ", " + ennemy.hight.toString());
	}

}