# TiddlyUpdater-script
A set of scripts designed to update  a Tiddlywiki to proper locations

What: A set of scripts designed to save wiki using the unmodified save feature of Tiddlywiki https://tiddlywiki.com/
Why: None of the saving solutions I read about were fit for my needs. So I looked into writing one
How: A user first need to define some hard coded parameters in the Tidcall.bat file

Set TiddlyCodefolder= needs to be set to where your copy of Tidcall.bat and Tidprocess.bat are located. !! It has only been tested with locations not containing a space. !!
Set TidSupport= needs to be set to where your copy of the tiddlylist.txt is. !! It has only been tested with locations not containing a space. !!

Please note the timestamp was designed with my windows 10 setup in mind. For your machine this may needs configuring diffently. 

Once done the user can then modify the tiddlylist 

The file should begin with 

--Tiddly list

and end with 

--Endoflist

any lines not beginning with a -- should be a tiddlywiki that you want picked up from the download location. 

The file should contain at least one of the following lines

--Backup: needs to have the location where your backups are stored. Don't forget to manage this location on a regular basis. 
<br/>--Pickup: where files are picked up from - usually the download folder. It will move files from this location. 
<br/>--Delivery: where files are going to. Where you want your wikis stored. 

These locations can change midflow. For example in the below example tiddly1.html will be saved to C:\location1 while tiddly2.html
 and any subsequent wikis will be saved to C:\location2 until the --Delivery parameter is reset again. 

...
<br/>--Delivery:C:\location1
<br/>tiddly1.html
<br/>--Delivery:C:\location2
<br/>tiddly2.html
...

--Copylocation:a location for the next wiki to be copied to. This only works for the next wiki on the list unlike other parameters which are set until it is superseded by a new one. 

This is useful if you have two live locations. I have a wiki for example that has lots of external images. I don't want to fill my dropbox with these images but want to be able to refer to the wiki on my phone. As such the wiki is saved to both a dropbox location and a non-shared location.

To run the update run Tidcall.bat

<br/>        1 file(s) moved.
<br/>        1 file(s) copied.
<br/>        1 file(s) moved.
<br/>Tiddly Updated: essay.html
<br/>Tiddly1.html copied to {delivery location}
<br/>Related files in download directory
<br/>In{download location} location
<br/>empty.html
<br/>Updates complete. 1 wikis were updated
<br/>Press any key to continue . . .

It will report on any HTML files still in pickup locations. 
<br/>It will report on what Wikis and finally how many wikis were moved. 

If no changes are made the color changes of the script to highlight no files are moved. 

Related files in download directory
<br/>In {download location}
<br/>empty.html
<br/>Updates complete. No wikis were updated
<br/>Press any key to continue . . .
