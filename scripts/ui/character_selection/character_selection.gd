class_name CharacterSelection extends Control


const PLAYER_CARD_SCENE: PackedScene = preload("uid://dqf62jp6j848q")
const WEAPON_CARD_SCENE: PackedScene = preload("uid://cqqynmxuyahf5")

@export var selection_cursor: Texture2D
@export var players: Array[PlayerData]
@export var weapons: Array[WeaponData]

@onready var player_container: HBoxContainer = $PlayerContainer
@onready var weapon_container: HBoxContainer = $WeaponContainer


func _ready() -> void:
	Cursor.sprite_2d.texture = selection_cursor
	load_selection_items()


func load_selection_items() -> void:
	for node: Node in player_container.get_children():
		node.queue_free()
	
	for node: Node in weapon_container.get_children():
		node.queue_free()
	
	for data: PlayerData in players:
		var card: PlayerCard = PLAYER_CARD_SCENE.instantiate()
		player_container.add_child(card)
		card.set_data(data)
	
	for data: WeaponData in weapons:
		var card: WeaponCard = WEAPON_CARD_SCENE.instantiate()
		weapon_container.add_child(card)
		card.set_data(data)
