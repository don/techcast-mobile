function togglePlayer() {
    // http://stackoverflow.com/questions/4009524/change-button-text-jquery-mobile
	var button = $("#button .ui-btn-text");

	var player = $("#player").get(0);
	if (button.text() === "Play") {	    
		player.play();
		button.text("Pause");
	} else { // Pause
		player.pause();
		button.text("Play");
	}
}


