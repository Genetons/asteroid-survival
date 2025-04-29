extends Node2D

func _ready():
    var asteroid = $Asteroid
    var planets = get_tree().get_nodes_in_group("gravity_sources")
    asteroid.gravity_sources = planets
