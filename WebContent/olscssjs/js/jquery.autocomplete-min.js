/**
 * Ajax Autocomplete for jQuery, version 1.1.3 (c) 2010 Tomas Kirda
 * 
 * Ajax Autocomplete for jQuery is freely distributable under the terms of an
 * MIT-style license. For details, see the web site:
 * http://www.devbridge.com/projects/autocomplete/jquery/
 * 
 * Last Review: 04/19/2010
 * 
 * NOTE - Auto Correct changelog
 *------------------------------
 * #1 In i.prototype.suggest()
 * 	[old]
 *	if (this.suggestions.length === 0) {
 *		this.hide();
 *	}
 *	[new]
 *	if (this.suggestions.length === 0) {
 *		this.autoCorrect();
 *	}
 *
 * #2 In i.prototype
 * [new]
 * Added two functions editDistance() and autoCorrect()
 * 
 * Everything else untouched
 *
 */

(function(d) {
	function l(b, a, c) {
		a = "(" + c.replace(m, "\\$1") + ")";
		return b.replace(new RegExp(a, "gi"), "<strong>$1</strong>")
	}
	
	function i(b, a) {
		this.el = d(b);
		this.el.attr("autocomplete", "off");
		this.suggestions = [];
		this.data = [];
		this.badQueries = [];
		this.selectedIndex = -1;
		this.currentValue = this.el.val();
		this.intervalId = 0;
		this.cachedResponse = [];
		this.onChangeInterval = null;
		this.ignoreValueChange = false;
		this.serviceUrl = a.serviceUrl;
		this.isLocal = false;
		this.options = {
			autoSubmit : false,
			minChars : 1,
			maxHeight : 300,
			deferRequestBy : 0,
			width : 0,
			highlight : true,
			params : {},
			fnFormatResult : l,
			delimiter : null,
			zIndex : 9999
		};
		this.initialize();
		this.setOptions(a)
	}
	var m = new RegExp(
			"(\\/|\\.|\\*|\\+|\\?|\\||\\(|\\)|\\[|\\]|\\{|\\}|\\\\)", "g");
	d.fn.autocomplete = function(b) {
		return new i(this.get(0) || d("<input />"), b)
	};
	function companyData(id,name){
		this.id = id;
		this.name = name;
	}
	i.prototype = {
		killerFn : null,
		initialize : function() {
			var b, a, c;
			b = this;
			a = Math.floor(Math.random() * 1048576).toString(16);
			c = "Autocomplete_" + a;
			this.killerFn = function(e) {
				if (d(e.target).parents(".autocomplete").size() === 0) {
					b.killSuggestions();
					b.disableKillerFn()
				}
			};
			if (!this.options.width)
				this.options.width = this.el.width();
			this.mainContainerId = "AutocompleteContainter_" + a;
			d(
					'<div id="'
							+ this.mainContainerId
							+ '" style="position:absolute;z-index:9999;"><div class="autocomplete-w1"><div class="autocomplete" id="'
							+ c
							+ '" style="display:none; width:300px;"></div></div></div>')
					.appendTo("body");
			this.container = d("#" + c);
			this.fixPosition();
			window.opera ? this.el.keypress(function(e) {
				b.onKeyPress(e)
			}) : this.el.keydown(function(e) {
				b.onKeyPress(e)
			});
			this.el.keyup(function(e) {
				b.onKeyUp(e)
			});
			this.el.blur(function() {
				b.enableKillerFn()
			});
			this.el.focus(function() {
				b.fixPosition()
			})
		},
		setOptions : function(b) {
			var a = this.options;
			d.extend(a, b);
			if (a.lookup) {
				this.isLocal = true;
				if (d.isArray(a.lookup))
					a.lookup = {
						suggestions : a.lookup,
						data : []
					}
			}
			d("#" + this.mainContainerId).css({
				zIndex : a.zIndex
			});
			this.container.css({
				maxHeight : a.maxHeight + "px",
				width : a.width
			})
		},
		clearCache : function() {
			this.cachedResponse = [];
			this.badQueries = []
		},
		disable : function() {
			this.disabled = true
		},
		enable : function() {
			this.disabled = false
		},
		fixPosition : function() {
			var b = this.el.offset();
			d("#" + this.mainContainerId).css({
				top : b.top + this.el.innerHeight() + "px",
				left : b.left + "px"
			})
		},
		enableKillerFn : function() {
			d(document).bind("click", this.killerFn)
		},
		disableKillerFn : function() {
			d(document).unbind("click", this.killerFn)
		},
		killSuggestions : function() {
			var b = this;
			this.stopKillSuggestions();
			this.intervalId = window.setInterval(function() {
				b.hide();
				b.stopKillSuggestions()
			}, 300)
		},
		stopKillSuggestions : function() {
			window.clearInterval(this.intervalId)
		},
		onKeyPress : function(b) {
			if (!(this.disabled || !this.enabled)) {
				switch (b.keyCode) {
				case 27:
					this.el.val(this.currentValue);
					this.hide();
					break;
				case 9:
				case 13:
					if (this.selectedIndex === -1) {
						this.hide();
						return
					}
					this.select(this.selectedIndex);
					if (b.keyCode === 9)
						return;
					break;
				case 38:
					this.moveUp();
					break;
				case 40:
					this.moveDown();
					break;
				default:
					return
				}
				b.stopImmediatePropagation();
				b.preventDefault()
			}
		},
		onKeyUp : function(b) {
			if (!this.disabled) {
				switch (b.keyCode) {
				case 38:
				case 40:
					return
				}
				clearInterval(this.onChangeInterval);
				if (this.currentValue !== this.el.val())
					if (this.options.deferRequestBy > 0) {
						var a = this;
						this.onChangeInterval = setInterval(function() {
							a.onValueChange()
						}, this.options.deferRequestBy)
					} else
						this.onValueChange()
			}
		},
		
		/* Called on each keystroke */
		onValueChange : function() {
			clearInterval(this.onChangeInterval);
			this.currentValue = this.el.val();
			var b = this.getQuery(this.currentValue);
			this.selectedIndex = -1;
			if (this.ignoreValueChange)
				this.ignoreValueChange = false;
			else
				b === "" || b.length < this.options.minChars ? this.hide()
						: this.getSuggestions(b)
		},
		getQuery : function(b) {
			var a;
			a = this.options.delimiter;
			if (!a)
				return d.trim(b);
			b = b.split(a);
			return d.trim(b[b.length - 1])
		},
		
		/* Generates suggestions from query */
		getSuggestionsLocal : function(b) {
			var a, c, e, g, f;
			c = this.options.lookup;
			e = c.suggestions.length;
			a = {
				suggestions : [],
				data : []
			};
			b = b.toLowerCase();
			for (f = 0; f < e; f++) {
				g = c.suggestions[f];
				/* Normal autocomplete - if query is substring, add to returned object */
				if (g.toLowerCase().indexOf(b) != -1) {
					a.suggestions.push(g);
					a.data.push(c.data[f]);
				}
			}
			return a ;/* Return object containing autocomplete names and IDs */
		},
		getSuggestions : function(b) {
			var a, c;
			if ((a = this.isLocal ? this.getSuggestionsLocal(b) : this.cachedResponse[b]) && d.isArray(a.suggestions)) {
				/* 'suggestions' and 'data' set to result of getSuggestionsLocal() for use by suggest()*/
				this.suggestions = a.suggestions;
				this.data = a.data;
				this.suggest();	/* Process suggestions */
			} else if (!this.isBadQuery(b)) {
				c = this;
				c.options.params.query = b;
				d.get(this.serviceUrl, c.options.params, function(e) {
					c.processResponse(e)
				}, "text");
			}
		},
		isBadQuery : function(b) {
			for ( var a = this.badQueries.length; a--;)
				if (b.indexOf(this.badQueries[a]) === 0)
					return true;
			return false;
		},
		
		/* Hides the drop down */
		hide : function() {
			this.enabled = false;
			this.selectedIndex = -1;
			this.container.hide();
		},
		
		/* Processes suggestions */
		suggest : function() {
			/* If no autocomplete suggestions, fill AutoCorrect suggestions */
			if (this.suggestions.length === 0) {
				this.autoCorrect();
			}
			
			/* This else was commented so its code would always run */
//			else {
				var b, a, c, e, g, f, j, k;
				b = this;
				a = this.suggestions.length;
				e = this.options.fnFormatResult;
				g = this.getQuery(this.currentValue);
				j = function(h) {
					return function() {
						b.activate(h);
					}
				};
				k = function(h) {
					return function() {
						b.select(h);
					}
				};
				this.container.hide().empty();
				for (f = 0; f < a; f++) {
					c = this.suggestions[f];
					c = d((b.selectedIndex === f ? '<div class="selected"'
							: "<div")
							+ ' title="'
							+ c
							+ '">'
							+ e(c, this.data[f], g)
							+ "</div>");
					c.mouseover(j(f));
					c.click(k(f));
					this.container.append(c);
				}
				this.enabled = true;
				this.container.show();
//			}
		},
		processResponse : function(b) {
			var a;
			try {
				a = eval("(" + b + ")");
			} catch (c) {
				return
			}
			if (!d.isArray(a.data))
				a.data = [];
			if (!this.options.noCache) {
				this.cachedResponse[a.query] = a;
				a.suggestions.length === 0 && this.badQueries.push(a.query);
			}
			if (a.query === this.getQuery(this.currentValue)) {
				this.suggestions = a.suggestions;
				this.data = a.data;
				this.suggest();
			}
		},
		/* Called on hover */
		activate : function(b) {
			var a, c;
			a = this.container.children();
			this.selectedIndex !== -1 && a.length > this.selectedIndex
					&& d(a.get(this.selectedIndex)).removeClass();
			this.selectedIndex = b;
			if (this.selectedIndex !== -1 && a.length > this.selectedIndex) {
				c = a.get(this.selectedIndex);
				d(c).addClass("selected")
			}
			return c
		},
		deactivate : function(b, a) {
			b.className = "";
			if (this.selectedIndex === a)
				this.selectedIndex = -1
		},
		/* Called on click */
		select : function(b) {
		//alert("2222"+this.data[b]);
		if(this.data[b] == "-1"){
		 return;
		}
			var a;
			if (a = this.suggestions[b]) {
				this.el.val(a);
				if (this.options.autoSubmit) {
					a = this.el.parents("form");
					a.length > 0 && a.get(0).submit()
				}
				this.ignoreValueChange = true;
				this.hide();
				this.onSelect(b)
			}
		},
		moveUp : function() {
			if (this.selectedIndex !== -1)
				if (this.selectedIndex === 0) {
					this.container.children().get(0).className = "";
					this.selectedIndex = -1;
					this.el.val(this.currentValue)
				} else
					this.adjustScroll(this.selectedIndex - 1)
		},
		moveDown : function() {
			this.selectedIndex !== this.suggestions.length - 1
					&& this.adjustScroll(this.selectedIndex + 1)
		},
		adjustScroll : function(b) {
			var a, c, e;
			a = this.activate(b).offsetTop;
			c = this.container.scrollTop();
			e = c + this.options.maxHeight - 25;
			if (a < c)
				this.container.scrollTop(a);
			else
				a > e
						&& this.container.scrollTop(a - this.options.maxHeight
								+ 25);
			this.el.val(this.getValue(this.suggestions[b]))
		},
		onSelect : function(b) {
		
			var a, c;
			a = this.options.onSelect;
			c = this.suggestions[b];
			b = this.data[b];
			//alert("1111"+c);
			this.el.val(this.getValue(c));
			d.isFunction(a) && a(c, b, this.el)
		},
		getValue : function(b) {
			var a, c;
			a = this.options.delimiter;
			if (!a)
				return b;
			c = this.currentValue;
			a = c.split(a);
			if (a.length === 1)
				return b;
			return c.substr(0, c.length - a[a.length - 1].length) + b
		},
		
		/* Below are AutoCorrect methods */
		
		editDistance : function(s1, s2) {
			// Allocate auxilary space for algorithm
			var arr = new Array(s1.length+1);
			for(var i=0 ; i<s1.length+1 ; i++)
				arr[i] = new Array(s2.length+1);
		
			// Algorithm
			for(var i=0 ; i<=s1.length ; i++)
				for(var j=0 ; j<=s2.length ; j++)
					arr[i][j] = 0;
			for(var i=0 ; i<=s1.length ; i++)
				arr[i][0] = i;
			for(var i=0 ; i<=s2.length ; i++)
				arr[0][i] = i;
			for(var i=1 ; i<=s1.length ; i++)
				for(var j=1 ; j<=s2.length ; j++)
					arr[i][j] = Math.min(arr[i-1][j-1] + (s1.charAt(i-1)==s2.charAt(j-1) ? 0 : 1), arr[i-1][j]+1, arr[i][j-1]+1);
		
			// Final answer is arr[s1.length][s2.length]
			return arr[s1.length][s2.length].toString(10);
		},
		
		sift3Distance: function(s1, s2) {
		      // sift3: http://siderite.blogspot.com/2007/04/super-fast-and-accurate-string-distance.html
		      if (s1 == null || s1.length === 0) {
		        if (s2 == null || s2.length === 0) {
		          return 0;
		        } else {
		          return s2.length;
		        }
		      }

		      if (s2 == null || s2.length === 0) {
		        return s1.length;
		      }

		      var c = 0;
		      var offset1 = 0;
		      var offset2 = 0;
		      var lcs = 0;
		      var maxOffset = 5;

		      while ((c + offset1 < s1.length) && (c + offset2 < s2.length)) {
		        if (s1.charAt(c + offset1) == s2.charAt(c + offset2)) {
		          lcs++;
		        } else {
		          offset1 = 0;
		          offset2 = 0;
		          for (var i = 0; i < maxOffset; i++) {
		            if ((c + i < s1.length) && (s1.charAt(c + i) == s2.charAt(c))) {
		              offset1 = i;
		              break;
		            }
		            if ((c + i < s2.length) && (s1.charAt(c) == s2.charAt(c + i))) {
		              offset2 = i;
		              break;
		            }
		          }
		        }
		        c++;
		      }
		      return (s1.length + s2.length) /2 - lcs;
		    },
		
		autoCorrectOld : function() {
			var input = jQuery("#companyQuery").val().toLowerCase();	// User input in lowercase
			var numberOfSuggestions = 5;								// Maximum number of suggestions to show to user
			var shortList = [];											// A small list of best matching companies
			var numberOfCompanies = options.lookup.suggestions.length;	// Number of companies in database
			
			// DO NOT MODIFY BELOW TWO OPTIONS. THEY CONTROL THE ACCURACY OF GENERATED RESULTS.
			var shortListWindowSize = 500;								// Maximum size of the small list
			var thresholdDistance = 5;									// Threshold edit distance
			
		 	// Fill the small list with best matches
			for(var i=0 ; i<numberOfCompanies ; i++) {
				var distance;
				if(shortList.length < shortListWindowSize && thresholdDistance >= (distance = this.sift3Distance(input, options.lookup.suggestions[i].toLowerCase()))) {
					shortList.unshift({
						id		:	options.lookup.data[i],
						name	:	options.lookup.suggestions[i],
						dist	:	distance
					});
				}
			}
			
			// Sort the list by edit distance
			shortList.sort(function(a,b){
				return a.dist - b.dist;
			});
			
			// Copy closest matches in arrays used by jQuery autocomplete
			this.suggestions.length = 0;
			this.data.length = 0;
			if(numberOfSuggestions > shortList.length) numberOfSuggestions = shortList.length;
			for(var i=0 ; i<numberOfSuggestions ; i++) {
				this.suggestions.push(shortList[i].name);
				this.data.push(shortList[i].id);
			}
			
			// Add user query at end of suggestions to avoid confusion to users
			
		},
		
		wordCheck : function() {
			var suggestionsFromWord = new Array();
			var str = jQuery('#companyQuery').val();
			var count = 0;
			var word = str.split(" "); 
			//console.log("word::::"+word);
			for(var j=0;j<word.length;j++){
				var ctr = 0;
				for(var i=0 ; i< options.lookup.suggestions.length ; i++){
					var company = options.lookup.suggestions[i].replace(/[^a-zA-Z ]/g, " ");
					var companyword = company.split(" "); 
					var wordlcase = word[j];
					for(var k=0;k<companyword.length;k++){
						if(wordlcase.toLowerCase() ==companyword[k].toLowerCase()){
								var companyObj = new  companyData(options.lookup.data[i],options.lookup.suggestions[i]);
								suggestionsFromWord[count] = companyObj;
								count++;
								break;
							}
						 }
					 if(count > 5)
					  break;
					}
				if(count > 5)
				 break;
					
			}
			if(count < 5)
				for(var j=0;j<word.length;j++){
					var ctr = 0;
					for(var i=0 ; i< options.lookup.suggestions.length ; i++){
						var company = options.lookup.suggestions[i].toLowerCase();
						var wordlcase = word[j].toLowerCase();
						if(company.indexOf(wordlcase)!= -1){
								var companyObj = new  companyData(options.lookup.data[i],options.lookup.suggestions[i]);
								suggestionsFromWord[count] = companyObj;
								//console.log("("+ctr+")::::"+options.lookup.data[i] + "name::"+options.lookup.suggestions[i]);
								ctr++;
								count++;
								if(ctr == 3)
									break;
							}
						}
						if(count > 5)
							break;
				}
			
			return suggestionsFromWord;
		},
		
		autoCorrect : function() {
			var input = jQuery('#companyQuery').val().toLowerCase();	// User input in lowercase
			var numberOfSuggestions = 5;								// Number of suggestions to show to user
			var shortList = [];											// A small list of best matching companies
			var numberOfCompanies = options.lookup.suggestions.length;	// Number of companies in database
			
			// DO NOT MODIFY BELOW TWO OPTIONS. THEY CONTROL THE ACCURACY OF GENERATED RESULTS.
			var shortListWindowSize = 50;								// Size of the small list
			var thresholdDistance = 1024;								// Initial threshold string distance set to infinity
			
		 	// Fill the small list with best matches
			for(var i=0 ; i<numberOfCompanies ; i++) {
				var distance = this.sift3Distance(input, options.lookup.suggestions[i].toLowerCase());
				if(distance < thresholdDistance) {
					shortList.unshift({
						id		:	options.lookup.data[i],
						name	:	options.lookup.suggestions[i],
						dist	:	distance
					});
					if(shortList.length > shortListWindowSize) {
						shortList.pop();
						thresholdDistance = shortList[shortListWindowSize-1].dist;
					}
				}
			}
			
			// Sort the small list by string distance
			shortList.sort(function(a,b){
				return a.dist - b.dist;
			});
			var suggestionsFromWord = this.wordCheck();
			/*
			var suggestionsFromWord = new Array();
			var str = jQuery('#companyQuery').val().toLowerCase();
			var ctr = 0;
			var word = str.split(" "); 
			console.log("word::::"+word);
			for(var j=0;j<word.length;j++){
				for(var i=0 ; i<numberOfCompanies ; i++){
					var company = options.lookup.suggestions[i].toLowerCase();
			
					if(company.indexOf(word[j])!= -1){
							suggestionsFromWord[ctr] = company;
							ctr++;
						}
					}
			}*/
			//console.log("suggestion from word::"+suggestionsFromWord);
			var suggestionsFromWordSize = suggestionsFromWord.length;
			this.suggestions.length = 0;
			this.data.length = 0;
			
				this.suggestions.push("Did you mean?");
				this.data.push("-1");

			if(suggestionsFromWordSize >= numberOfSuggestions){
				for(var i=0 ; i<numberOfSuggestions ; i++) {
					//console.log("Loop 1");
					this.suggestions.push(suggestionsFromWord[i].name);
					this.data.push(suggestionsFromWord[i].id);
				}
			}else{
				for(var i=0 ; i<suggestionsFromWordSize ; i++) {
					//console.log("Loop 2");
					this.suggestions.push(suggestionsFromWord[i].name);
					this.data.push(suggestionsFromWord[i].id);
				}
			}
			// Copy closest matches in arrays used by jQuery autocomplete
		
			//this.suggestions.push('Did you mean...'); // Did you mean...
			
			for(var i=0 ; i<numberOfSuggestions-suggestionsFromWordSize ; i++) {
				//console.log("sugesstion:::"+shortList[i].name+":id::"+shortList[i].id)
				this.suggestions.push(shortList[i].name);
				this.data.push(shortList[i].id);
			}
			
			// Add user query at end of suggestions to avoid confusion to users
			
		}
	
	}
})(jQuery);