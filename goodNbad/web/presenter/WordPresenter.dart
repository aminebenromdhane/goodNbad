part of goodNbad;

class WorldPresenter {

	World _world;
	WorldView _wordView;
	WorldServiceModel _wordServiceModel;
	StreamSubscription _subscriptionPlay;

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
		_subscriptionPlay = eventBus.on(initEvent).listen((CanvasRenderingContext2D ctx2d) {
			print("init world event");
			// update model via service model
			_wordServiceModel.init(_world);
			// update model via service model
			_wordServiceModel.play(_world);

			// init view
			_wordView = new WorldView(ctx2d);
			// update view
			_wordView.draw(_world);
        });

		// onPlayEvent
		_subscriptionPlay = eventBus.on(playEvent).listen((Object object) {
			print("play event: imgs go down");
			// update model via service model
			_wordServiceModel.play(_world);
			// update view
			_wordView.draw(_world);
        });

		print("end init world presenter");
	}





}