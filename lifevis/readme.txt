This file contains some notes about Lifevis and its use.



-- Running Lifevis --

- Start Dwarf Fortress, making sure it is the last version, which currently is .40d.
- Double-check this.
- Load up any game so the ingame view shows.
- Double-Click either Lifevis.exe or Lifevis-Console.exe. The former one will drop output and errors in text files, while the latter will show it in a dos console window.
- Wait a bit for the OpenGL window to load, once it opens, again wait a while for it to start drawing landscape.
- Play DF. The 3D view will follow you around ingame.



-- Archive contents --

/bin
 - This contains the Perl executable, nothing interesting here
 
/site
 - This contains all the Perl modules i use in this program. Most of them are stock ActivePerl modules, but a few of them have been slightly modified. If you plan on looking at/using any of these, make sure you check the SVN history of this directory tree to see which ones i changed.
 
/Lifevis
 - This contains the Perl modules i have written and which basically make up the heart of this program. If you like programming and/or Perl, have a look. They're completely Public Domain and should be fairly readable. Criticism by other coders is heartily welcomed.
 
/documents
 - These are a few documents which i used to design the program and to record certain informations in a more readable structure. No guarantee is made for their exactness as they more or less act like sketches, however they may be interesting to look at.
 
/models
 - Here are the .wings and .obj files of the 3D models. You can use Wings 3D to load the .wings file and any other 3D editor you like to load the others.
 
/textures
 - This contains the textures as png files.
 
lifevis.cfg
 - This is the configuration file. You can change it to change some of the options of Lifevis. It has a lot of explanations, so please read it before running Lifevis.
 
Lifevis[-Console].exe
 - This is the main executable.
 
ModelGen.exe
 - This converts .obj files in /models into ingame models.



-- Customization --

Some parts of Lifevis can be customized, namely:

Options:
All options of Lifevis are set in lifevis.cfg. Please read it.

Code:
If you want you can edit any file in /Lifevis. Any changes there will be directly reflected by the program once you run it, as these files are loaded when running the executable. (Which is really just a converted .bat file.)

Art:
You can edit any of the textures, as long as you keep their size square and a power of 2.
You can also edit any of the models, but note that for them to appear in Lifevis, you will need to export them to .obj and then run ModelGen.exe.



-- User Interface --

You will notice when you start it up that there's a bunch of text in the upper left corner. You can savely ignore it, that's only debug data for me.

Of course, if you're curious, it'll tell you some info about the state of the program. Note that the memory display is in percent, not in MB. It should start to reduce after it goes above 100. Caches is the number of tiles that are currently in the cache. It should always (after initial load) say at *least* 9. Working threads is the number of running loops, which currently should always be 4. Mouse is the x/y coordinates of the ingame cursor. Tasks is the status of the landscape update loop, where it's now, how many slices it processed last time. The latter number will change as you move around. Creature tasks is the same, current creature, number of creatures processed last. Type is the type of the current tile and the bottom two rows of text show the designations and occupancy of the current tile. The rest is either obvious or broken.

In the bottom right corner you have two +/- buttons, click these to change the view range. You can also change that in the config file.

On the right edge you have a grey scale. Clicking or dragging with your mouse on here changes the view ceiling.
The lock button lets you lock the view ceiling to the current view height. Disabling it sets the ceiling to the max again.
I'm planning on adding some kind of offset feature here, i.e. the ceiling is always locked to view height + x. But i'm not sure how i'd implement the actual interface for that, so input is welcome.



-- Controls --

The general rule is that ALL keyboard input gets forwarded directly to DF. That means that no matter what window is active, you'll always be able to use the keyboard to play as if only DF was running.

Clicking and dragging with the left mouse button however rotates the view around.
Clicking and dragging with the middle mouse button zooms the view in and out.



-- Contact --

Mail: mithaldu@yahoo.de
Forums: Im under the username Mithaldu on both the DF forum and SomethingAwful.
IRC: Server irc.worldirc.org in the channel #bay12games. Say "xeno" to get my attention.
ICQ: 170500377
MSN: mithaldu@yahoo.de
YIM: mithaldu



-- Thanks --

These go to quite a few people, including Bay12Games, the Perlmonks, SomethingAwful Goons, users on the DF forums, the Wings 3D creators and some CPAN contributors. Gonna be listing them in a more comprehensive way once i've sat down and checked over the project history.