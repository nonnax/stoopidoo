# frozen_string_literal: true
# helper methods for msec, timestamp conversions
class String
  def to_msec
    h, m, s, ms = match(/(\d{2}):(\d{2}):(\d{2}).(\d{2,3})/)&.captures
    t = ((h.to_i * 60 + m.to_i) * 60 + s.to_i) * 1000 + ms.to_i			# 0-99 ms
  end
end

class Numeric
  def to_ts
  	# to timestamp
    s, ms = divmod(1000)
    m, s = s.divmod(60)
    h, m = m.divmod(60)
    format('%02d:%02d:%02d.%03d', h, m, s, ms)
  end
end

class Time
  def to_ms
    (to_f * 1000.0).to_i
  end
  alias to_msec to_ms

  def to_ts
    to_ms.to_ts
  end
end

