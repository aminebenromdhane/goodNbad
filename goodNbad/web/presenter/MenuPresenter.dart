part of goodNbad;

class MenuPresenter {
		
	StreamSubscription _subscriptionMenuLunch;
	CanvasRenderingContext2D _ctx2d;
	MenuScreen _menuScreen;
    	
	MenuPresenter(this._ctx2d){
    	print("construct MenuPresenter");
		_menuScreen = new MenuScreen(_ctx2d);
		
   		// onMenuLunchEvent
    	_subscriptionMenuLunch = eventBus.on(menuLunchEvent).listen((String gameState) {
        	print("lunch Menu event");
    		if (gameState == GameState.INIT) {
    			lunchMenu();			
    		}
        });
    }
    	
    void lunchMenu() {
    	print("lunch Menu");
    	_menuScreen.show();
    }
}