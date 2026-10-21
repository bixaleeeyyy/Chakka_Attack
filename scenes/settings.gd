extends Control

#HACK: Have the sound effect bars like in pirate solitaire 
#Extra sound plays due to update_buttons being called

func _ready() -> void:
	%HelpButton.grab_focus()
	update_buttons()


func _on_music_button_toggled(toggled_on: bool) -> void:
	%MenuClickSound.play()
	GameState.music = toggled_on
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), !toggled_on)
	update_buttons()
	GameState.save_game()

func _on_sound_effects_button_toggled(toggled_on: bool) -> void:
	%MenuClickSound.play()
	GameState.sound_effects = toggled_on
	AudioServer.set_bus_mute(AudioServer.get_bus_index("SoundEffects"), !toggled_on)
	update_buttons()
	GameState.save_game()


func _on_joystick_button_toggled(toggled_on: bool) -> void:
	%MenuClickSound.play()
	GameState.joystick_is_visible = toggled_on
	update_buttons()
	GameState.save_game()

func _on_fire_touch_button_toggled(toggled_on: bool) -> void:
	%MenuClickSound.play()
	GameState.fire_button_is_visible = toggled_on
	update_buttons()
	GameState.save_game()


func _on_help_button_pressed() -> void:
	%MenuClickSound.play()
	Transition.change_scene_with_transition("res://scenes/tutorial.tscn")


func _on_android_automove_button_toggled(toggled_on: bool) -> void:
	GameState.player_alt_touch_controls = toggled_on
	update_buttons()
	GameState.save_game()

func update_buttons() -> void:
	$VBoxContainer/SoundEffectsButton.button_pressed = GameState.sound_effects
	$VBoxContainer/MusicButton.button_pressed = GameState.music
	$VBoxContainer/JoystickButton.button_pressed =  GameState.joystick_is_visible
	$VBoxContainer/FireTouchButton.button_pressed =  GameState.fire_button_is_visible
	$VBoxContainer/AndroidAutomoveButton.button_pressed = GameState.player_alt_touch_controls

func _on_back_button_pressed() -> void:
	%MenuClickSound.play()
	GameState.save_game()
	Transition.change_scene_with_transition("res://scenes/main.tscn")


func _on_fullscreen_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
