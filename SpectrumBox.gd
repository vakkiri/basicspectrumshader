extends CSGBox


var low
var mid
var hi
var spectrum

# Called when the node enters the scene tree for the first time.
func _ready():
	spectrum = AudioServer.get_bus_effect_instance(0,0)
	low = spectrum.get_magnitude_for_frequency_range(40,150)
	mid = spectrum.get_magnitude_for_frequency_range(150, 1000)
	hi = spectrum.get_magnitude_for_frequency_range(1000, 2000)


func _process(delta):
	spectrum = AudioServer.get_bus_effect_instance(0,0)
	low = low * 0.5 + 0.5 * spectrum.get_magnitude_for_frequency_range(140,160)
	mid = mid * 0.5 + 0.5 * spectrum.get_magnitude_for_frequency_range(300, 1000)
	hi = hi * 0.5 + 0.5 * spectrum.get_magnitude_for_frequency_range(1000, 2000)
	material.set_shader_param("low", low[0] * 10)
	material.set_shader_param("mid", mid[0] * 5)
