require 'ruby2d'

set background: 'blue'
set title: 'Reaction game'
text = Text.new('Click to begin', color: 'black')
game_started = false
circle = nil
start_time = nil
duration = nil
on :mouse_down do |event|
  if game_started
    if circle.contains?(event.x, event.y)
      duration = (Time.now - start_time) * 1000
      text = Text.new(" You took #{duration.round}  miliseconds!    Click to begin", color: 'red')
      circle.remove
      game_started = false
    end

  else
    text.remove
    circle = Circle.new(
      x: rand(get(:width) - 25), y: rand(get(:height) - 25),
      radius: 17,
      sectors: 32,
      color: 'yellow'
    )
    start_time = Time.now
    game_started = true
  end
end

show
