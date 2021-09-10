#!/usr/bin/env mruby
# frozen_string_literal: true

# added conversation recorder
# added user name for response intros
# added rule: sentence types are matched with similar response type intros, etc

require 'stoopidoo/rules_data'
require 'stoopidoo/interface'
require 'stoopidoo/math_helper'
require 'stoopidoo/time_ext'

@chatbot_list = %i[stoopi pot shem kem].map(&:capitalize)
shuffle! @chatbot_list
@chatbot = @chatbot_list.sample.to_s+"-bot"

@user = 'Hooman'
@found = nil

def perform_substitutions(s)
  return s if @found

  r = s.downcase
  @found = false
  @data[:presubs].each do |k, v|
    match = r.match(/\b#{k}\b/)
    next unless match

    r.gsub!(/\b#{k}\b/, v.upcase)
    (@found ||= 0)
    @found += 1
    # p [__method__, k, match, s]
  end

  return r unless @found

  r
end

def phrase_substitutions(s, k)
  return s unless k

  v = random_response(@data[:keywords][k])
  # detect * in template response
  match = k.match(/\*/)

  return v unless match

  into_placeholder = s.match(k).captures.pop # just to get the $1 match
  # v.gsub('*', $1)
  # update * splat
  v.gsub('*', into_placeholder)
end

def swap_post_process(s)
  r = { /^me\b/ => 'i', /\bme$/ => 'i', /\bikaw$/ => 'ka' }
  r.each { |k, v| s = s.downcase.gsub(k, v) }
  # p [__method__, s ]
  s
end

def normalize(s)
  r = s
  @data[:normalize].each do |k, v|
    r.gsub!(/\b#{k}\b/, v)
  end
  r.split.join(' ')
end

def answer_keyword(s)
  # this method is at the top of the pipe-line. uncomment below if moved below the pipeline down
  # return s if @found
  @found = false
  key = nil
  @found = @data[:keywords].any? { |k, _v| key = k if s.match(k) }

  return s unless @found

  # @found=__method__
  phrase_substitutions(s, key)
end

def default(s)
  return s if @found

  w = s.split.first
  tail = random_response(@data[:default])
  "#{w} #{tail}"
end

def reformat(s)
  s.capitalize
end

def downcase(s)
  s.downcase
end

def finish(s)
  punc = (@stype == :query ? '?' : ['?', '.'].sample)

  s.gsub!('[chatbot]', @chatbot)

  s.chomp[-1].match(/[?!.]/) ? s : (s + punc)
end

def stamp_tail(input, _word, tail)
  input.gsub('*', tail)
end

def shuffle!(choices, **h)
  n = h[:times] ||= 2
  n *= -1
  Time.now.to_ms.to_s[n..-1].to_i.times { choices.shuffle! }
end

def random_response(choices)
  shuffle!(choices, factor: 3)
  choices.sample
end

def wait(s)
  w = (@data[@stype]).sample
  r = [@user, w, ':-)'].shuffle.sample
  r = clean_punc(r)
  [r, s].join(', ')
end

def clean_punc(s)
  s.gsub(/[.?\s!]+/, ' ')
end

def delay(s)
  sleep(rand(12) * 0.05)
  s
end

def record(q, a)
  fn = 'q_and_a.dat'
  File.open(fn, 'w').puts('') unless File.exist?(fn)
  File.open(fn, 'a').puts([q, a].join('|'))
end

def sentence_type(s)
  # test type and remove punctuations
  @stype = case s
           when /\?/
             :query
           when /!/
             :interjection
           else
             :normal
           end
  s.gsub(/[?!.]*/, '')
end

# assemble process sequence

def post(sentence, **h)
  json = h[:json] || false
  reply = pipe.inject(sentence) do |s, m|
    send(m, s)
  end
  json ? { response: reply }.to_json : reply
end

self.class.class_eval do
  attr_accessor :pipe
end

@pipe = []
# pipe << :command
pipe << :sentence_type
pipe << :normalize
pipe << :answer_keyword
pipe << :downcase
pipe << :perform_substitutions
pipe << :swap_post_process
pipe << :default
pipe << :reformat
pipe << :finish
pipe << :wait
# pipe << :delay
# pipe << :typewrite

# Start bot

@found = false
# run
q=ARGV.join(' ')
puts post(q) if q 
