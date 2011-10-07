Delicious Surf is a fork of Surf web browser customized for del.icio.us. It
makes easier to access and organize your bookmarks on Delicious by giving you
some shortcuts and keeping an offline copy.

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

Screenshot
==========
![Delicious Surf in Xmonad Desktop Environment](http://farm7.static.flickr.com/6060/6218262253_ecb3bf4e8c_z.jpg)

Quick Introduction
==================
After launching Delicious Surf, first thing you'll notice about is that it
doesn't show any navigation bar. Instead of a rich GUI, it comes with keyboard
bindings. The most important one is **ctrl+g** which opens the URL bar as seen below. 

![URL Bar](http://i51.tinypic.com/10xvyf9.png)

As you see, URL bar is also a search bar. You can query your history and use
some special keywords to search the web. See "Search Engines" section for
details.

When something happes to your Delicious.com account, your bookmarks will be in
safe with the offline copy located in your home directory (~/.local/share/delicious-surf)

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

Keybindings
===========

Search Engines
==============

See Also
=======
