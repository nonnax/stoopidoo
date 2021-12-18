# for randomizing collections

def shuffle!(choices, **h)
	# random shuffling using tail n-digits of msec
  n = h[:factor] ||= 2
  n *= -1
  reps=rand(Time.now.to_ms.to_s[n..-1].to_i).to_i
  reps.times { choices.shuffle! }
end
