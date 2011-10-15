Delicious Surf is a fork of Surf web browser. It makes easier to access and organize your bookmarks on del.icio.us.

Tested Platforms: Linux
Dependencies: dmenu, libwebkit, xorg-prop, wget

Install
=======
```
$ git clone git@github.com:azer/delicious-surf.git
$ cd delicious-surf
$ make build
$ make sync
$ sudo make install
```

The installation creates following directory tree in your home directory;

* ~/.local/share/delicious-surf
    - bookmarks
    - cookies.txt
    - homepage.html
    - history
    - logs
    - script.js
    - style.css 
* ~/.opt/delicious-surf
    - add.sh
    - browse.sh
    - clean_history.sh
    - copy_url.sh
    - fetch.sh
    - history.sh
    - list.sh
    - log.sh
    - prompt_tags.sh
    - suggest.sh
    - sync.sh

Screenshot
==========
[![Delicious Surf in Xmonad Desktop Environment](http://farm7.static.flickr.com/6060/6218262253_ecb3bf4e8c_z.jpg)](http://www.flickr.com/photos/azer/6218262253/sizes/l/in/photostream/)

Quick Introduction
==================
After launching Delicious Surf, first thing you'll notice about is that it
doesn't show any navigation bar. Instead of a rich GUI, it comes with keyboard
bindings. The most important one is **ctrl+g** which opens the URL bar as seen below. 

![URL Bar](http://i51.tinypic.com/10xvyf9.png)

As you see, URL bar is also a search bar. You can query your history and use
some special keywords to search the web. See "Search Engines" section for
details.


Besides of safety of your links, offline copy makes quite faster to query your
bookmarks. **ctrl+b** opens a bookmarking bar that helps you to search your
bookmarks by tags and keywords. 

![Bookmarks Bar](http://i54.tinypic.com/wi57oi.png)

If you don't see any bookmark on the bookmark bar, repeat the synchronization
step of the installation.

![New Bookmark Dialog](http://i56.tinypic.com/29cmb20.png)

To add a bookmark, Press **ctrl+d** and type your tags by pressing Shift+Enter
after each one. It supports auto-completion but Delicious' suggestion API is
currently broken. Press ESC button when you're done. 

Tabbing
=======
Delicious Surf does not support tabbing. Check out the alternatives listed below;

- [XMonad.Layout.Tabbed](http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Layout-Tabbed.html (The one shown in screenshot #1)
- [TABBED](http://tools.suckless.org/tabbed)

Search Engines
==============
Delicious Surf's URL bar contains some quick ways to search delicious.com and major search engines. For example, 
you can serach delicious.com by typing "s travel" or access a popular links page by typing "p travel". Here below 
is the full list of search engines;

Delicious:

- Search: `s $keyword` 
- Popular: `p $keyword`

Google:

- Search: `g $keyword`
- Code Search: `gc $keyword`
- Dictionary: `dict $keyword`
 
Wikipedia:

- English: `w $title`

Others:

- Duck Duck Go: `ddg $keyword`
- WolframAlpha: `wa $query`
- StackOverflow: `so $keyword`
- LastFM: `lastfm $music`
- Flickr: `flickr $keyword`
- IMDB: `imdb $keyword`
- Amazon: `amazon $keyword`
- Youtube: `youtube $keyword`
- Github: `github $keyword`


Keybindings
===========
- `Ctrl-g` Opens the URL-bar.
- `Ctrl-b` Opens the Bookmarks-bar
- `Ctrl-d` Calls the New Bookmark Dialog.
- `Escape` Stops loading current page or stops download.
- `Ctrl-h` Walks back the history.
- `Ctrl-l` Walks forward the history.
- `Ctrl-k` Scrolls page upwards.
- `Ctrl-j` Scrolls page downwards.
- `Ctrl-Shift-k` Zooms page in.
- `Ctrl-Shift-j` Zooms page out
- `Ctrl-Shift-i` Resets Zoom
- `Ctrl-f` Opens the search-bar.
- `Ctrl-n` Go to next search result.
- `Ctrl-Shift-n` Go to previous search result.
- `Ctrl-p` Loads URI from primary selection.
- `Ctrl-Shift-p` Calls Printpage Dialog.
- `Ctrl-r` Reloads the website.
- `Ctrl-Shift-r` Reloads the website without using cache.
- `Ctrl-y` Copies current URI to primary selection.
- `Ctrl-o` Show the sourcecode of the current page.

See Also
=======
- [surf](http://surf.suckless.org)
- [dmenu](http://dmenu.suckless.org)
