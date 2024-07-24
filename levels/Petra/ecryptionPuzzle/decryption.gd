extends Node2D

@onready var h1 = $"Empty-ancient-paper(4)/Sprites(17)/7a2"
@onready var h2 = $"Empty-ancient-paper(4)/Sprites(17)/7a22"
@onready var q = $"Empty-ancient-paper(4)/Sprites(17)/qaf"
@onready var s = $"Empty-ancient-paper(4)/Sprites(17)/seen"
@onready var s2 = $"Empty-ancient-paper(4)/Sprites(17)/seen2"
@onready var t = $"Empty-ancient-paper(4)/Sprites(17)/ta2"
@onready var sh = $"Empty-ancient-paper(4)/Sprites(17)/sheen"
@onready var j = $"Empty-ancient-paper(4)/Sprites(17)/jeem"
@onready var b = $"Empty-ancient-paper(4)/Sprites(17)/ba2"
@onready var l = $"Empty-ancient-paper(4)/Sprites(17)/lam"
@onready var r = $"Empty-ancient-paper(4)/Sprites(17)/ra2"
@onready var f1 = $"Empty-ancient-paper(4)/Sprites(17)/fa2"
@onready var f2 = $"Empty-ancient-paper(4)/Sprites(17)/fa22"
@onready var m = $"Empty-ancient-paper(4)/Sprites(17)/meem"
@onready var y = $"Empty-ancient-paper(4)/Sprites(17)/ya2"
@onready var y2 = $"Empty-ancient-paper(4)/Sprites(17)/ya22"
@onready var hh = $"Empty-ancient-paper(4)/Sprites(17)/ha2"
@onready var k = $"Empty-ancient-paper(4)/Sprites(17)/kaf"
@onready var n = $"Empty-ancient-paper(4)/Sprites(17)/noon"
@onready var z = $"Empty-ancient-paper(4)/Sprites(17)/zain"
#sounds
var correctSound: AudioStreamPlayer = preload("res://assets/soundEffects/mixkit-game-level-completed-2059.wav")

func _on_button_pressed():
  var score = 0  # Use a more descriptive variable name
  # Check individual letters (modular approach)
  score += check_letter(h1, h2, 1)  # Score for double ح
  score += check_letter(s, s2, 2)  # Score for double س
  score += check_letter(q)
  score += check_letter(t)
  score += check_letter(sh)
  score += check_letter(j)
  score += check_letter(b)
  score += check_letter(l)
  score += check_letter(r)
  score += check_letter(f1, f2, 2)  # Score for double ف
  score += check_letter(m)
  score += check_letter(y, y2, 2)  # Score for double ي
  score += check_letter(hh)
  score += check_letter(k)
  score += check_letter(n)
  score += check_letter(z)

  # Check for correct answer and play sound (integrate with previous discussion)
  if score == 20:
	  # Play correct sound (integrate sound logic here)
	  print("Correct!")  # Placeholder for success message (modify as needed)
  else:
	  # Play wrong sound (integrate sound logic here)
	  print("Wrong. Try again.")  # Placeholder for error message (modify as needed)

func check_letter(letter1, letter2=null, points=1):
  # Improved error checking
  if not letter1 or not letter1.text:
	  return 0

  if letter2 and letter2.text:
	  if letter1.text == letter2.text:
		  return points * 2  # Double points for duplicates
	  else:
		  return 0  # No points for mismatched duplicates
  else:
	if letter1.text:
		return points
	else:
		  return 0
