"Detective Game" by John Detective

Section 0 - Config

Include Punctuation Removal by Emily Short.

After reading a command:
	if the player's command matches the regular expression "\.\d{2,3}":
		remove periods.


When play begins:
	now the story viewpoint is first person singular.

Section 1 - Definitions

[ -- Things -- ]
A thing has some text called the convenient description. The convenient description is usually "[description]".
A thing has some text called the convenient name. The convenient name is usually "[printed name]".

[ -- Fire and burning -- ]
The block burning rule is not listed in the check burning rulebook.
Instead of burning something:
	try lighting the noun with the second noun.

A thing can be flammable. A thing is usually not flammable. A flammable thing is usually unlit.

A thing can be firestarting. A thing is usually not firestarting.

An extinguishability is a kind of value. The extinguishabilities are easy and hard. A thing has an extinguishability. The extinguishability of a thing is usually easy.

A thing is either easy to extinguish or hard to extinguish. A thing is usually easy to extinguish.

Understand "light [something] with [something preferably held]" or "burn [something] with [something preferably held]" or "set [something preferably held] on fire with [something preferably held]" or "set fire to [something] with [something preferably held]" as lighting it with. Lighting it with is an action applying to two visible things.
Check lighting it with:
	if the noun is not flammable:
		if the second noun is firestarting:
			if the noun is ammo:
				say "I don't feel like blowing my fingers off at the moment. Maybe at a later date.";
			otherwise:
				say "That would be a really bad idea.";
		otherwise:
			say "That's not going to work.";
		stop the action;
	otherwise:
		continue the action.

Carry out lighting it with:
	now the noun is lit;
	continue the action.
	
Report lighting it with:
	say "I light [the noun] with [the second noun]."
	
Rule for supplying a missing second noun while lighting:
	if the noun is not flammable:
		say "That's not going to work.";
		the rule fails;
	otherwise:
		repeat with N running through the list of visible things:
			if N is firestarting:
				now the second noun is N;
				the rule succeeds;
		say "I don't have anything to light this with.";
		the rule fails.
	
Instead of lighting something lit with something, say "It's already burning, baby."
		
Understand "extinguish [something]" or "put out [something]" or "put [something] out" or "blow [something] out" as simple extinguishing. Simple extinguishing is an action applying to one thing.
Check simple extinguishing:
	if the noun is unlit:
		say "No need, [the noun] [are]n[apostrophe]t on fire.";
	otherwise:
		if the noun is easy to extinguish:
			say "I put out [the noun].";
			now the noun is unlit;
		otherwise:
			say "I can't exactly just put this out without something to help...".

A room can be smoky. A room is usually not smoky.

[ -- Doors -- ]

A door can be obscurant or see-through. A door is usually obscurant.
	
Definition: a door is transparent:
	if the door is see-through, yes;
	if the door is open, yes;
	no.

[ -- Rooms -- ]
A room has some text called the convenient description. The convenient description is usually "[description]".
A room has some text called the convenient name. The convenient name is usually "[printed name]".
A room can be intimately familiar. A room is usually not intimately familiar.

[ -- Containers -- ]


[ -- Examining / Descriptions -- ]

The fancy examining rule is listed instead of the standard examining rule in the carry out examining rules.
Printing the description of something is an activity.
This is the fancy examining rule:
	carry out the printing the description activity with the noun;
	rule succeeds.
	
Rule for printing the description of something (called item):
	if the description of the item is not "":
		say "[description of the item] [run paragraph on]";
	otherwise:
		say "You see nothing special about [the item]. [run paragraph on]".
		
Last after printing the description of something:
	say "[paragraph break]".


To decide whether peering into the known (this is the see familiar and visible locations behind doors rule):
	if the printing the description activity is going on and the noun is a door:
		if the door is transparent, yes;
		if the other side of the noun is intimately familiar, yes;
	no.

After printing the description of a door:
	let R be the other side;
	if peering into the known:
		say "It leads to [the convenient name of R].";
	otherwise if R is visited:
		say "I recall it leads to [the convenient name of R].".

[ -- Guns and Ammo -- ]
A gun is a kind of portable container. A gun has some text called chambering.
After printing the description of a gun:
	if the gun is loaded:
		let N be the number of ammo in the noun;
		say "It's loaded with [N] round[if N is greater than 1]s[end if].";
	otherwise:
		say "It's empty right now."

Ammo is a kind of thing. Ammo has some text called a caliber.

Definition: a gun is loaded if it contains ammo.

Understand "put [things] in [something]" or "load [gun] with [things]" or "load [things] into [gun]" as inserting it into.
Understand "load [gun] with [something]" or "load [something] into [gun]" as inserting it into.

[TODO: Special handling for multiple-bullet loading. This is low priority as it's just to make the text look nicer.]
[Understand "put [things] in [something]" or "load [gun] with [things]" or "load [things] into [gun]" as multiply-inserting it into.]

Check inserting something into a gun:
	if the noun is not ammo, say  the flippant loading denial instead.
Check inserting a gun into something:
	if the second noun is ammo, try inserting the second noun into the noun instead;
	otherwise:
		say the flippant loading denial instead.
To say the flippant loading denial:
	say "[if a random chance of 1 in 5 succeeds]How about you load it into your ass instead?[otherwise]That's not how guns work."

[We can use To X: blah; pattern matching here to deal with the case of shooting a gun or shooting a thing/person/etc.]
Shooting is an action applying to one visible thing. Understand "shoot [something]" or "fire [something]" as shooting.
Check shooting:
	if the noun is not a gun, say "I don't know if you meant shoot it or shoot *at* it, but I'm not doin['] either of those." instead;
	otherwise if the gun is not loaded:
		say "Click! It's empty." instead.

Carry out shooting:
	now a random thing in the noun is nowhere.
	
Report shooting:
	say "I squeeze the trigger and fire a round - BANG!!".

A 38 caliber bullet is a kind of ammo.  The plural of 38 caliber bullet is 38 caliber bullets. The printed name is ".38 caliber bullet". The printed plural name is ".38 caliber bullets". The caliber of a 38 caliber bullet is always ".38". [Understand "38 bullet/round" or "38 caliber bullet/round" or "box of bullets/rounds/38" as a 38 caliber round.]

Section 2 - The Detective Office

The player carries 7 38 caliber bullets.
The detective revolver is a gun. The printed name is ".38 special revolver". The chambering is ".38". The carrying capacity is 6. The description is "My trusty .38 special that can hold [carrying capacity] rounds.[first time] I can only assume it's trusty, because I've never had to actually shoot someone with it. What did you think this is, murder incorporated? If I gunned down every suspect who deserved it I'd have been hauled off to the slammer a long time ago. Anyway... [only]". Understand "38 special/revolver" as the detective revolver. The player carries the detective revolver.

The Detective Office is a room. "My gross little office.[first time] The negative energy from my long nights of brooding has yellowed the wallpaper. Either that or Landlady Dorris put yellow wallpaper up while I was out one day.[only][if smoky] It's a little hazy in here.[end if] The door out is on the north wall." The printed name is "My Office". The convenient name is "my [if smoky]smoky [end if]office". It is intimately familiar.

The ashtray is scenery in the Detective Office. The description is "I once saw a guy dump one of these into a giant beer and drink the whole thing...[if a random chance of 1 in 20 succeeds] That guy was me."

The half-smoked stogey is in the Detective Office. "A half-smoked stogey sits [if unlit]dead and ashen [otherwise]smoldering [end if]in the ashtray on my desk."  The description is "A fine, cheap cigar that I've smoked halfway. [if unlit]I could light it back up if I wanted.[otherwise]The smoldering tip gives of a pleasant amount of savory cigar smoke." The stogey is flammable. Understand "cigar" as the half-smoked stogey.
Report lighting the half-smoked stogey with something:
	say "[one of]Ahh, that's better. I never had a father around to tell me not to inhale cigar smoke so I picked up the habit at an early age. I'm sure these things are killing me, but certainly no faster than the crushing weight of all the existential dread.[or]Let's light this baby back up.[stopping]".
After dropping the stogey while the player is in the Detective Office:
	say "I'll put it back in the ashtray[if a random chance of 1 in 20 succeeds]. The ashes of my hopes and dreams keep this place dirty enough already[end if].";
	now the stogey is not handled.

The office desk is in the Detective Office. The description is "My old desk. It's pockmarked with years of coffee stains. The drawer's [if open]been left open[otherwise]closed[end if]." The office desk is closed and openable. Understand "drawer" as the office desk.
After closing the office desk while the half-smoked stogey is inside the office desk and the half-smoked stogey is lit:
	say "Of all the things that might turn into a 5-alarm fire, I'm sure this isn't one of them.";
	continue the action.
After opening the office desk while the half-smoked stogey is inside the office desk and the half-smoked stogey is lit:
	say "The drawer belches forth a cloud of accumulated cigar smoke. That's not gonna help the wallpaper.";
	now the Detective Office is smoky;
	continue the action.
Rule for printing the name of the office desk while inserting something into something or opening or closing:
	say "desk drawer".

The matchbook is in the office desk. The description is "Carlo brand premium matches. Not sure what's so premium about them." The matchbook is firestarting. Understand "matches" as the matchbook.
Instead of burning the matchbook:
	say "These are 'premium' matches, you know. I'd rather not waste them unless I'm using them for something in particular.".
Rule for printing the name of the matchbook while lighting something with the matchbook:
	say "matches".


The Detective Office Door is north of the Detective Office and south of the Dingy Stairwell.  The Detective Office Door is a door. The description is "'John Detective' is stenciled onto the frosted glass in bold black lettering." The printed name is "door". The Detective Office Door is see-through.

The Dingy Stairwell is a room. "The rough concrete stairwell leads downward to the lobby. A flickering fluorescent light occasionally strobes above." The convenient name is "a stairwell".

The rough concrete stairs is scenery in the Dingy Stairwell. The description is "I must've climbed up and down these stairs ten thousand times over the years." Understand "stairwell" as the rough concrete stairs. 

The flickering fluorescent light is scenery in the Dingy Stairwell. The description is "I've told Landlady Dorris a hundred times to get that thing replaced. She's done it a few times now but they all end up like this after too long. It's either time she call an electrician, or time she stopped buying from those shady discount fluorescent outlets.".