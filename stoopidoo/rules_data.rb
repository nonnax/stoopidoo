#!/usr/bin/env mruby
# frozen_string_literal: true

@chatbot_list = %i[butoy pot shem kem].map(&:capitalize)
(rand(10)*@chatbot_list.size).times{ @chatbot_list.shuffle! }
@chatbot = @chatbot_list[rand(@chatbot_list.size)].to_s+"-bot"

# __END__
@data = {
	default: [
	'ka din!', 
	'pero hindi masyado, sakto lang', 
	'ang hilig mo di ba?',
	'yung katabi mo?'
	],
  presubs: {
    'hate' => 'love',
    'love' => 'hate',
    'i am' => 'you are',
    'you are' => 'i am',
    'are you' => 'am i',
    'am i' => 'are you',
    'you' => 'i',
    'your' => 'my',
    'my' => 'your',
    'you' => 'me',
    'me' => 'you',
    'are' => 'am',
    'ako' => 'ikaw',
    'ikaw' => 'ako',
    'ba' => 'nga',
    'nga' => 'ba',
    'mo' => 'ko',
    'ko' => 'mo',
    'akin' => 'iyo',
    'iyo' => 'akin',
    'kita' => 'mo ako',
    'eto' => 'iyan',
    'iyan' => 'ire'
  },
  
  interjection: [
  	'isigaw pa ba?! ...', 
  	'katakot ka naman ! ...', 
  	'kailangan bang isigaw pa?! ...', 
  	'parang galit ka yata ? ...', 
  	'galit ka ba? ...', 
  	'galit ka? ...', 
  	],
  
  query: [
  	'teka..i mean, wait lang :-)', 
  	'tanong ba yan ?...', 
  	'hmm...', 
		'teka teka ',
		'Buti naitanong mo..', 
		'tinatanong pa ba yan ?..', 
  	'oh..',
  	'ows..', 
  	'di nga?..', 
  	'good question!', 
  	'trick question ba yan? ', 
  	'now that you mentioned it...', 
  	'ha? ...', 
  	'huh? ...', 
  	'weh? ...', 
  	'what do you mean? ...',
  	'ano kamo ? ...',
  	'ngak ? ...',
  	'ano ibig mo sabihin? ...',
  	'you made me think...',
  	'let me think...',
  	'esep esep...',
  	'pag-iisipan ko muna...'
  	],

  normal: [
  	'teka..i mean, wait lang :-)', 
  	'wait lang...', 
  	'hmm...', 
		'...',
  	'oh..', 
  	'ows..', 
  	'e di ..', 
  	'eh di ..', 
  	'yun na nga..', 
  	'sabi ko nga..', 
  	'yan nga..', 
  	'talaga lang ha ', 
  	'talaga naman ', 
  	'yan na nga ba sinasabi ko..', 
  	'ah ...', 
  	'ayun ...', 
  	'chika ha ...', 
  	'i see ...', 
  	'yeah ...', 
  	'ha? ...', 
  	'huh? ...', 
  	'weh? ...', 
  	'right ...',
  	'ibig sabihin ...',
  	'copy ...',
  	],
  
  normalize: {
    'san' => 'saan',
    'bat' => 'bakit',
    'bang' => '',
    'ba' => '',
    'lang' => '',
    'nga' => '',
    'mag' => '',
    'uu' => 'u',
    'na' => 'ba',
    'sumagot' => 'sagot',
    'sumasagot' => 'sagot',
    'yung' => 'yang',
    'thank you' => 'thanks',
    'you\'re' => 'you are',
    'we\'re' => 'we are',
    'that\'s' => 'that is',
    'what\'s' => 'what is'
  },
  keywords: {
    'sino si (.*)' => [
      'Hindi ko kilala si *',
      'Sino ba yang * na yan?',
      '* ? Wala akong kilalang *, *'
    ],
    
    'sino ang (.*)' => [
      'Hindi ko kilala ang *',
      'Ewan ko ba dyan sa * na yan?'
    ],
    
    'saan si (.*)' => [
      'Hindi ko kilala si *',
      'Sino ba yang * na yan?',
      '* ? Wala akong kilalang *, *'
    ],
    
    'saan ka (.*)' => [
      '*? Aba wala ka na dun!',
      'Bakit gusto mo malaman saan ako *?',
      'Tinanong pa ba saan *?',
      '* sa .... seecrit ba',
      'Wala kang pake saan *?',
      'Hmmm, saan *?'
    ],

    'gusto ko (.*)' => [
      'Aba gusto ko din *',
      'Bakit gusto mo *?',
      'Hmmm, gusto mo *?'
    ],

    'ilang (.*) ka' => [
      'Hindi matanda, hindi bata. Sakto lang!',
      'Hindi na po ako bata',
      'Bata pa po ako',
      'Desi na ako',
      'Di ba, age does not matter?'
    ],    
    
    'eto (.*)' => [
      'OO *, yan na yun!',
      'Teka, yan nga ba yang *?',
      'Tumpak! * nga!',
      'Nandyan lang pala * na yan!',
      'Sorry, pero wala akong pake sa * na yan.',
      'Hmmm, yan nga yang *?'
    ],

    '(.*) ako' => [
      'Normal lang ba na * ka?',
      'Bakit mo nasabi na * ka?',
      'Gaano katagal na ba na * ka?',
      'Palagi ba na * ka?',
      'Madalas ba na * ka?',
      'Sana malaman natin ang rason bakit ka *',
      'Ano sa tingin mo bakit ka *',
      'Sana mahanap natin ang sagot bakit ka *',
      'Kapag * ka, ano ginagawa mo?',
      'Pag nakaramdam ka ng pagka-*, ano gagawin mo?',
    ],

    '(.*) tayo' => [
      'Gusto ba * tayo?',
      '*? tayo? sige una ka na pala',
      'Bakit mo gusto * tayo?',
      'Talaga? gusto mo * tayo?',
      'Yes, lagi tayo * ha?',
      'Sana mas marami tayo *',
      'Sure! * lang tayo ng *',
      'Ok! Ikaw na mag-umpisa sa * natin',
      'Ok! Umpisa ka na sa * natin',
    ],

    'ano (.*) mo' => [
      'Anong pake mo sa * ko?',
      '* ko lang yan palagi?',
      'Lagi nga * ako?'
    ],

    'ano (.*) natin' => [
      'Kahit ano naman pwede *',
      '* natin ang hilig mo',
      '* natin ang buhay-buhay',
      '* natin ang hobbies mo',
      '* natin ang books mo',
      'Wag na ako *. Ikaw na lang'
    ],

		'mahilig ka ba (.*)' =>[
			'Gusto ko * din',
			'*? Sino ba naman may ayaw nyan?',
			'Di masyado. Sakto lang',
      'Yan ang gusto ko, *?',
      'Oo *! gusto ko yan!',
		],

    
		'(.*) ka' =>[
			'Hindi masyadong *. Sakto lang',
			'* din',
			'Bet ko mga *?',
      'Yan ang mga hilig ko, mag-* ba?',
      'Ay oo * ako! * ka din ba?',
      'Pareho lang siguro tayong * ano?',
      'Ikaw din ba *? Ako, matagal na akong * e?',
      'Truly, * na * ako',
      ':-). Super * ako dyan. Hihihi',
      'Proud na * yata ako',
      "Ako si #{@chatbot} ang nag-iisang *!",
      'Sus! Experto ako dyan sa pagka-*',
      '*! As in!'
		],
		
    'you are (.*)' => [
      'What makes you think I am *?',
      'Are you so sure I am *?'
    ],

    'that is (.*)' => [
      'What makes you think I am *?',
      'Are you so sure I am *?'
    ],

    'what is your (.*)' => [
      'My *?',
      'Oh no, I forgot my *?',
      'I forgot my *? I\'ll get back to you on that',
      'My *? I don\'t really know' 
    ],

    'how (.*) are you'=> [
      'What makes you think I am *?',
      'Are you so sure I am *?',
      'Being * has many benefits'
    ],

    'how (.*)'=> [
      'How, how \'D Carabao',
      'I don\'t know. Do you?',
      'Ah, *? ... * ... ah... Ask mo na lang po si goog-el!'
    ],


    'everyone (.*)' => ['You think everyone *?'],
    'do not know' => ['Are you always so indecisive?'],
    'yes' => [
      "At least you're positive about something!",
      'Great.'
    ],

    'i am (.*)' => [
      'Is it normal for you to be *?',
      'Do you like being *?'
    ],
    
    'i do not (.*)' => ["Why don't you *?"],
    'what' => ['Why do you ask?', 'Why?', "I don't know. Do you?"],
    'No' => [
      'Really?',
      'Fair enough.'
    ],

    'why does (.*)' => [
      "I don't know why *",
      'Do you already know the answer?'
    ],
    
    'are you (.*)' => [
      'Yes, I am *',
      'Am I *? Is that a trick question?',
      'What do you mean *?',
      'I cant answer that',
      'Are you *?',
      'Do you know the answer?',
      'Maybe you are * too?',
      'I dont know the answer. Do you?'
    ],
    
    'why can\'t i (.*)' => [
      '*, why?',
      '* where?',
      'Why do you want to *?',
      'Do you want to *?'
    ],
    
    'why can\'t you (.*)' => [
    	'Do you want me to *?'
    ],
    
    'hates *' => [
      'Why do you think they hate *?'
    ],

    'hate (.*)' => [
      "Why don't you like *?",
      'Why the dislike of *?'
    ],

    'i like (.*)' => [
      'Why do you like *?',
      'Wow! I like * too!'
    ],

    'paano (.*)' => [
      'Bakit mo gusto *?',
      '*? ano yun?',
      "ano ba yang '*, *' na yan!"
    ],

    'sagot (.*)' => [
      'ano ba isasagot ko',
      'kailangan pa bang i-memorize yan?',
      'sumasagot ng *? ano yun?',
      "ano kamo?"
    ],
    
    '(.*) na ako' => [
      '* ka na pala',
      'Aba! * din ako!',
      'Uy, pareho tayong *!',
      "Ay, * ka na?"
    ],

    'ang (.*) mo' => [
      'Bakit mo nasabi na * ako?',
      'Paano mo nalaman na * ako?',
      'Uy, pareho lang tayong * ha!',
      "Ay, * ka din?"
    ],
    
    
    'hates (.*)' => [
      'Why do you think they dislike * ?',
      'I hate * too!'
    ],

    'hello' => [
      "How's it going?",
      'How do you do?',
      'Enough of the pleasantries!'
    ],
    
    'sorry' => ["There's no need to apologize."],
    'different' => [
      'How is it different?',
      'What has changed?'
    ],
    
    'sino' => [
      "Ako nga pala si, #{@chatbot}",
      "#{@chatbot}, at your service!",
      "Si #{@chatbot} po ito!",
      "Si #{@chatbot} nga po ito!",
      "Ay, ako nga pala si #{@chatbot}!",
      "Eto si #{@chatbot} chatbot!",
      "Ako si #{@chatbot} chatbot! Ang bida dito. Sidekick kita! :-P"
    ],
    
    'saan' => [
      'Aba ewan ko?',
      'Malay ko?',
      'Ako pa tinanong mo?'
    ],
    
    'who' => [
      "I am #{@chatbot}",
      "#{@chatbot} chatbot here!",
      "I'm #{@chatbot}, at your service!"
    ],
    
    'hours' => [
      'We are open mondays to fridays. 7am-9pm',
      'Office-hours: 7am-9pm'
    ],

    'oras' => [
      "Ngayon na ang oras para magsaya",
      "Oras na para bumili ng relo"
    ],


    'taon' => [
      "Bakit mo naitanong?",
      "Hindi ko alam. Medyo bata pa ako. ikaw?"
    ],

    'sorry' => [
      'There is no need to apologize',
      'No problem',
      'Wala lang yun, noh!',
      'Kalimutan na natin yun',
      'Hay, naku. sha sha!',
      'Tapos na yun.',
      'What is done is done',
      'Sabi nang tama na e.'
    ],
    
    'thanks' => [
      'You are welcome',
      'Happy to help',
      'Wala yun, noh!',
      'Yun lang, noh!',
      'Shh... don\'t mention it',
      'No problem',
      'Hay, naku. sha sha!',
      'Tapos na yun.'
    ],
    
    'salamat' => [
      'Hay salamat!',
      'Walang yun, noh!',
      'No problem'
    ],
    
    'happy' => [
      'I am glad you are happy',
      'Happy to help',
      'No problem'
    ],
    
    'blam' => [
      'Nice! You can find updates at shopee and facebook.',
      'Blamstore! See you at shopee and at our facebook page.'
    ],
    
    'family' => ['Tell me about your family']
  }
}
# puts @data.to_yaml
# puts JSON.pretty_generate(@data)
