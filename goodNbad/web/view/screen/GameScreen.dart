part of goodNbad;

class GameScreen {

	WorldPresenter _worldPresenter;

	/**
	 * Lunch Game
	 */
	void lunchGame(){	
	 	// init mouse event manager
		MouseEventManager mouseEventManager = new MouseEventManager(_ctx2d, console1);
	
		// load game imgs then lunch the gameLoop (the beggining of the game)
		AssetsLoader mainLoader = new AssetsLoader();
	    	mainLoader.loadImages((){
	    		window.animationFrame.then(gameInit);
	    });
	}
	
	/**
	 * Game Init
	 */
	void gameInit(num delta){

    	// init world presenter
    	_worldPresenter = new WorldPresenter();

    	// send init game event
    	eventBus.fire(initEvent, _ctx2d);

    	new Future((){
        	window.animationFrame.then(gameLoop);
        });
    }
	
	/**
	 * Game Loop
	 */
	void gameLoop(num delta){
        print("begin loop");
    	// args : eventName, object passed
    	eventBus.fire(playEvent, null);

    	new Future.delayed(const Duration(milliseconds: 500), (){
    		window.animationFrame.then(gameLoop);
    	});
        print("re loop");
    }
}