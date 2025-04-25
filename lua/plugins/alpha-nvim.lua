-- Dashboard made with alpha-nvimdash
-- https://github.com/goolord/alpha-nvim

return {
	{
		"goolord/alpha-nvim",
		config = function()
			math.randomseed(os.time())

			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Function to center quotes
			local function center_quote(quote)
				local max_width = 0
				for _, str in ipairs(quote) do
					max_width = math.max(max_width, #str)
				end

				local centered_strings = {}
				for _, str in ipairs(quote) do
					local leading_spaces = math.floor((max_width - #str) / 2)
					local trailing_spaces = max_width - leading_spaces - #str
					local centered_str = string.rep(" ", leading_spaces) .. str .. string.rep(" ", trailing_spaces)
					table.insert(centered_strings, centered_str)
				end

				-- Insert blank strings at start of table yea ik its scuffed
				table.insert(centered_strings, 1, "")
				table.insert(centered_strings, 1, "")
				return centered_strings
			end

			-- Set header
			local shrek = {
				"         ⢀⡴⠑⠀⠀⠀   ⠀⣀⣀⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"          ⠸⠿⡀⠀⠀⠀⣀⡴⢿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"        ⠀⠀⠀⠀⠑⢄⣠⠾⠁⣀⣄⡈⠙⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀",
				"        ⠀⠀⠀⠀⢀⡀⠁⠀⠀⠈⠙⠛⠂⠈⣿⣿⣿⣿⣿⠿⡿⢿⣆⠀⠀⠀⠀⠀⠀⠀",
				"        ⠀⠀⠀⢀⡾⣁⣀⠀⠴⠂⠙⣗⡀⠀⢻⣿⣿⠭⢤⣴⣦⣤⣹⠀⠀⠀⢀⢴⣶⣆",
				"        ⠀⠀⢀⣾⣿⣿⣿⣷⣮⣽⣾⣿⣥⣴⣿⣿⡿⢂⠔⢚⡿⢿⣿⣦⣴⣾⠁⠸⣼⡿",
				"        ⠀⢀⡞⠁⠙⠻⠿⠟⠉⠀⠛⢹⣿⣿⣿⣿⣿⣌⢤⣼⣿⣾⣿⡟⠉⠀⠀⠀⠀⠀",
				"        ⠀⣾⣷⣶⠇⠀⠀⣤⣄⣀⡠⠌⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀",
				"        ⠀⠉⠈⠉⠀⠀⢦⡈⢻⣿⣿⣿⣶⣶⣶⣶⣤⣽⡹⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀",
				"        ⠀⠀⠀⠀⠀⠀⠀⠉⠲⣽⡻⢿⣿⣿⣿⣿⣿⣿⣷⣜⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀",
				"        ⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣷⣶⣮⣭⣽⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀",
				"        ⠀⠀⠀⠀⠀⠀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀",
				"        ⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠐⠀⠀⠀⠀⠀⠀⠀",
				"        ⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠡⡀⠀⠀⠀⠀⠀",
				"        ⠀⠀⠀⠀⠀⠀⠀⢀⠀⠉⠛⠻⠿⠿⠿⠿⠛⠉⠀⠀⠀⠀⠀⢀⠃⠀⠀⠀⠀⠀",
			}

			local nike = {
				"                                  :;+XXXX++         ",
				"                               :+XXXXXXXXXXXXXx     ",
				"                             :xXXXXXXXXXXXXXXXXXX   ",
				"            :::::        ::+x$XXXXXXXXXX$$XXXXXXXX  ",
				"          :::;x+:::;x;;xX$$XXXXXXX$XXXXXXXXXXXXXXXX ",
				"         :::::++++xxXXX$$$$XXXX$$$$XXXXXXXXXXXXX$XXx",
				"        ::;++x;;;+;xxXX$$XX$$X$$$$$$$$$XXXXXXXX$XXXX",
				"       :+XXX;+xxxxxXXXXX$$$$$$$$$$$$$$XXXXXXX$X$$X  ",
				"       +xxxXxX$XX$$$XXXXX$X$$$$$$$$$                ",
				"       ++xXXXXX$$$$X$X$$XX$$$$$$$XXX                ",
				"        ++xxXXX$XXXXXXX$$X$$X                       ",
				"        x+xXXXXX$$XXXXXXXXXX                        ",
				"        X+xxxXX$XX$x$$$ XX                          ",
				"         xxxXxx+++++xX$X                            ",
				"         +++xxxx++++;+x$$                           ",
				"         ;+xxxxxXxX++++X$                           ",
				"       xXx++xx$$XXxx++x+X$                          ",
				"        +++x$$XXXXXX$$$+x$$                         ",
				"        ;;x+:+X$&$$$XxXXX$$$                        ",
				"        ;++XXXx+$$$XXxxxx&&XXx                      ",
				"        :;+xXXXXX$$XxXXXxX$$$$XX                    ",
				"        ;+;+xXXXXX$XXXXXXX&$$X$Xx                   ",
				"        ;;+xxx$XXXX$XXXXXX$&$$XXx                   ",
				"        ;xxxxXX$XxXX$XXXXXX$$$XXx                   ",
				"        ++xx$xxX$$xXX$XXXXX$$$XXx                   ",
				"        +xXX$XxXXX$XX$$$XXX$$XX                     ",
				"        xxX$Xxxx$$X$$$$$$$Xx $                      ",
				"        x+XxXXXXx$$$X$$$$$$X+                       ",
				"       ++;++XXxXxxX$$XX$$$$$xx                      ",
				"        :+x+x$$XXxxX$$XXx$$$XX                      ",
				"        ;xXXxx&$$$XxXXXXXX$$XX                      ",
				"        :+XXXXx$$$$$xXXXxxX$XXx                     ",
				"        ;+XX$$x+$$$XXx++X$$$XXX                     ",
				"         ;X$&$$XX&$xXx$$$$$&XXX                     ",
				"         +X$$$$xX&&X+xXXX$$$$$                      ",
				"         XX$$$$XX$$$X+xXX$$$&$Xx                    ",
				"         xXX$$Xx$$XX$$+;:;xX$&$                     ",
				"          +xXxXx&&$x+X$XxX+;++x                     ",
				"          ++;+++;;;;;;+;;;;++XXX                    ",
				"  ;;:;;;++;;+xxxxxxxxxxxxxxxxXXxxx++++;;            ",
				"  ;;;;;;+++++XXXXxxxXxXXxxxXxXXXxxxxXxxxx           ",
			}

			dashboard.section.header.val = nike
			local quotes = {
				{
					"Software is like sex:",
					"it's better when it's free.",
					"- Linus Torvalds",
				},
				{
					"Intelligence is the ability to avoid doing work,",
					"yet getting the work done.",
					"- Linus Torvalds",
				},
				{
					"I often compare open source to science.",
					"To where science took this whole notion of developing ideas in the open",
					"and improving on other peoples' ideas and making it into what science is today",
					"and the incredible advances that we have had.",
					"And I compare that to witchcraft and alchemy,",
					"where openness was something you didn't do.",
					"- Linus Torvalds",
				},
				{
					"I want my office to be quiet.",
					"The loudest thing in the room - by far - should be the occasional purring of the cat.",
					"- Linus Torvalds",
				},
				{
					"People enjoy the interaction on the Internet,",
					"and the feeling of belonging to a group that does something interesting:",
					"that's how some software projects are born.",
					"- Linus Torvalds",
				},
				{
					"I don't try to be a threat to Microsoft,",
					"mainly because I don't really see MS as competition.",
					"Especially not Windows—the goals of Linux and Windows are simply so different.",
					"- Linus Torvalds",
				},
				{ "I do get my pizzas paid for by Linux indirectly.", "- Linus Torvalds" },
				{
					"I don't expect to go hungry if I decide to leave the University.",
					"Resume: Linux looks pretty good in many places.",
					"- Linus Torvalds",
				},
				{
					"In many cases, the user interface to a program is the most important part for a commercial company:",
					"whether the program works correctly or not seems to be secondary.",
					"- Linus Torvalds",
				},
				{
					"In my opinion, MS is a lot better at making money",
					"than it is at making good operating systems.",
					"- Linus Torvalds",
				},
				{
					"There's innovation in Linux.",
					"There are some really good technical features that I'm proud of.",
					"There are capabilities in Linux that aren't in other operating systems.",
					"- Linus Torvalds",
				},
				{
					"The cyberspace earnings I get from Linux come in the format of having a network of people that know me and trust me,",
					"and that I can depend on in return.",
					"- Linus Torvalds",
				},
				{
					"The economics of the security world are all horribly, horribly nasty",
					"and are largely based on fear, intimidation, and blackmail.",
					"- Linus Torvalds",
				},
				{
					"The fame and reputation part came later,",
					"and never was much of a motivator,",
					"although it did enable me to work without feeling guilty about neglecting my studies.",
					"- Linus Torvalds",
				},
				{
					"If you start doing things because you hate others",
					"and want to screw them over, the end result is bad.",
					"- Linus Torvalds",
				},
				{
					"I think of myself as an engineer,",
					"not as a visionary or 'big thinker.'",
					"I don't have any lofty goals.",
					"- Linus Torvalds",
				},
				{ "Non-technical questions sometimes don't have an answer at all.", "- Linus Torvalds" },
				{
					"By staying neutral, I end up being somebody that everybody can trust.",
					"Even if they don't always agree with my decisions, they know I'm not working against them.",
					"- Linus Torvalds",
				},
				{
					"I've actually found the image of Silicon Valley as a hotbed of money-grubbing tech people to be pretty false,",
					"but maybe that's because the people I hang out with are all really engineers.",
					"- Linus Torvalds",
				},
				{
					"Helsinki may not be as cold as you make it out to be,",
					"but California is still a lot nicer.",
					"I don't remember the last time I couldn't walk around in shorts all day.",
					"- Linus Torvalds",
				},
				{
					"Before the commercial ventures, Linux tended to be rather hard to set up,",
					"because most of the developers were motivated mainly by their own interests.",
					"- Linus Torvalds",
				},
				{
					"I don't have any authority over Linux other than this notion that I know what I'm doing.",
					"- Linus Torvalds",
				},
				{
					"When it comes to software, I much prefer free software,",
					"because I have very seldom seen a program that has worked well enough for my needs,",
					"and having sources available can be a life-saver.",
					"- Linus Torvalds",
				},
				{
					"Love is composed of a single soul",
					"inhabiting two bodies.",
					"- Aristotle",
				},
				{
					"In a rich man's house",
					"there is no place to spit but his face.",
					"- Diogenes",
				},
				{
					"Do not spoil what you have by desiring what you have not;",
					"remember that what you now have was once among the things you only hoped for.",
					"- Epicurus",
				},
				{
					"Silence is better",
					"than unmeaning words.",
					"- Pythagoras",
				},
				{
					"Reserve your right to think,",
					"for even to think wrongly is better than not to think at all.",
					"- Hypatia",
				},
				{
					"In peace, sons bury their fathers.",
					"In war, fathers bury their sons.",
					"- Herodotus",
				},
				{
					"The secret to happiness is freedom...",
					"And the secret to freedom is courage.",
					"- Thucydides",
				},
				{
					"Give me a lever long enough and a fulcrum on which to place it,",
					"and I shall move the world.",
					"- Archimedes",
				},
				{
					"What you leave behind is not what is engraved in stone monuments,",
					"but what is woven into the lives of others.",
					"- Pericles",
				},
				{
					"You cannot teach a crab",
					"to walk straight.",
					"- Aristophanes",
				},
				{
					"The sweetest of all sounds",
					"is praise.",
					"- Xenophon",
				},
				{
					"The only true wisdom",
					"is in knowing you know nothing.",
					"- Socrates",
				},
				{
					"We have two ears and one mouth",
					"so that we can listen twice as much as we speak.",
					"- Epictetus",
				},
				{
					"Healing is a matter of time,",
					"but it is sometimes also a matter of opportunity.",
					"- Hippocrates",
				},
				{
					"One word frees us of all the weight and pain in life.",
					"That word is love.",
					"- Sophocles",
				},
				{
					"An opera begins long before the curtain goes up and ends long after it has come down.",
					"It starts in my imagination, it becomes my life,",
					"and it stays part of my life long after I've left the opera house.",
					"- Maria Callas",
				},
				{
					"Happiness resides not in possessions, and not in gold,",
					"happiness dwells in the soul.",
					"- Democritus",
				},
				{
					"Every dictator is an enemy of freedom,",
					"an opponent of law.",
					"- Demosthenes",
				},
				{
					"Appearances are a glimpse",
					"of the unseen.",
					"- Anaxagoras",
				},
				{
					"Time is the most valuable thing",
					"a man can spend.",
					"- Theophrastus",
				},
				{
					"As iron is eaten away by rust,",
					"so the envious are consumed by their own passion.",
					"- Antisthenes",
				},
				{
					"Music is a moral law.",
					"It gives soul to the universe, wings to the mind,",
					"flight to the imagination, and charm and gaiety to life and to everything.",
					"- Plato",
				},
				{
					"No man ever steps in the same river twice,",
					"for it's not the same river and he's not the same man.",
					"- Heraclitus",
				},
				{
					"One loyal friend is worth",
					"ten thousand relatives.",
					"- Euripides",
				},
				{
					"No act of kindness, no matter how small,",
					"is ever wasted.",
					"- Aesop",
				},
				{
					"The most difficult thing in life",
					"is to know yourself.",
					"- Thales",
				},
				{
					"Let no man be called happy before his death.",
					"Till then, he is not happy, only lucky.",
					"- Solon",
				},
				{
					"Food is like music.",
					"You've got two kinds, good and bad.",
					"- Demis Roussos",
				},
				{
					"The nature of God is a circle",
					"of which the center is everywhere and the circumference is nowhere.",
					"- Empedocles",
				},
    { 
      "I'm an egotistical bastard,",
      "and I name all my projects after myself.",
      "First 'Linux', now 'git.",
      "- Linus Torvalds"
    },
			}

			-- Set random quote
			dashboard.section.footer.val = center_quote(quotes[math.random(#quotes)])

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
				dashboard.button("s", "  > Settings", ":Oil --float C:/Users/Lenovo/AppData/Local/nvim<CR>"),
				dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
			}

			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[
          autocmd FileType alpha setlocal nofoldenable
      ]])

			-- Keymap
			-- Open dashboard
			vim.api.nvim_set_keymap("n", "<leader>h", ":Alpha<CR>", { noremap = true, silent = true })
		end,
	},
}
