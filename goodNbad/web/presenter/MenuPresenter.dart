part of goodNbad;

class MenuPresenter {
		
	StreamSubscription _subscriptionMenuLunch;
	CanvasRenderingContext2D _ctx2d;
	MenuScreen menuScreen;
    	
	MenuPresenter(this._ctx2d){
		menuScreen = new MenuScreen(_ctx2d);
		
   		// onMenuLunchEvent
    	_subscriptionMenuLunch = eventBus.on(menuLunchEvent).listen((String gameState) {
    		if (gameState == GameState.INIT) {
    			lunchMenu();			
    		}
        });
    }
    	
    void lunchMenu() {
    	menuScreen.show();
    }
}