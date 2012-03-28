/* modifier 0 means no modifier */
static char *homedir        = HOMEDIR;
//static char *useragent      = "Surf/"VERSION" (X11; U; Unix; en-US) AppleWebKit/531.2+ Compatible (Safari)";
static char *useragent      = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.874.102 Safari/535.2";
static char *progress       = "#FF0000";
static char *progress_trust = "#00FF00";
static char *stylefile      = ".local/share/delicious-surf/style.css";
static char *scriptfile     = ".local/share/delicious-surf/script.js";
static char *cookiefile     = ".local/share/delicious-surf/cookies.txt";
static char *historyfile    = ".local/share/delicious-surf/history";
static time_t sessiontime   = 3600;
static char *default_search_engine = "g"; // see searchengines[] below v

static SearchEngine searchengines[] = {
  { "p", "http://delicious.com/tag/popular/%s" },
  { "s", "http://delicious.com/search?p=%s" },

  { "g",   "http://www.google.com/search?q=%s" },
  { "gc",   "http://google.com/codesearch?hl=en&lr=&q=%s" },
  { "ddg",   "http://www.duckduckgo.com/?q=%s" },
  { "wa",   "http://www.wolframalpha.com/input/?i=%s" },

  { "w",   "http://en.wikipedia.org/w/index.php?title=Special:Search&search=%s&go=Go" },

  { "so", "http://google.com/search?hl=en&safe=off&num=100&q=site:stackoverflow.com+%s&aq=f&oq=&aqi=" },
  { "dict", "https://www.google.com/#q=%s&tbs=dfn:1" },
  { "lastfm", "http://last.fm/music/%s" },
  { "flickr", "http://flickr.com/search/?q=%s&m=tags&s=int" },
  { "imdb",   "http://google.com/search?q=site:imdb.com%20%s&num=100" },
  { "youtube", "http://www.youtube.com/results?search_query=%s" },
  { "amazon", "http://www.amazon.com/s/?field-keywords=%s" },
  { "github", "https://github.com/search?q=%s" }
};

#define HOMEPAGE "file://"HOMEDIR"/.local/share/delicious-surf/homepage.html"
#define HIDE_BACKGROUND FALSE
#define MODKEY GDK_CONTROL_MASK

#define SETPROP(p, q)     { .v = (char *[]){ "/bin/sh", "-c", \
	"prop=\"`xprop -id $2 $0 | cut -d '\"' -f 2 | ~/.opt/delicious-surf/history.sh`\" &&" \
  ". "HOMEDIR"/.opt/delicious-surf/clean_history.sh &&"\
	"xprop -id $2 -f $1 8s -set $1 \"$prop\"", \
	p, q, winid, NULL } }

#define SETPROP_FIND(p, q)     { .v = (char *[]){ "/bin/sh", "-c", \
	"prop=\"`xprop -id $2 $0 | cut -d '\"' -f 2 | ~/.opt/delicious-surf/find.sh`\" &&" \
	"xprop -id $2 -f $1 8s -set $1 \"$prop\"", \
	p, q, winid, NULL } }

#define DOWNLOAD(d) {			  \
	.v = (char *[]){ "/bin/sh", "-c", \
	"xterm -e \"cd "HOMEDIR"/downloads && wget '$0' \
--load-cookies ~/.local/share/delicious-surf/cookies.txt \
--user-agent '$1' ; sleep 5\"", d, useragent, NULL } }

#define SETURI(p)       { .v = (char *[]){ "/bin/sh", "-c", \
"prop=\"`dmenu`\" &&" \
"xprop -id $1 -f $0 8s -set $0 \"$prop\"", \
p, winid, NULL } }

#define ADDBMK           { .v = (char *[]){ "/bin/sh", "-c", \
    ". ~/.opt/delicious-surf/add.sh $0", winid, NULL } }

#define LOADBMK(p)       { .v = (char *[]){ "/bin/sh", "-c", \
        "xprop -id $1 -f $0 8s -set $0 `~/.opt/delicious-surf/browse.sh` || exit 0", \
     p, winid, NULL } }

static Key keys[] = {
    /* modifier	            keyval      function    arg             Focus */
    { MODKEY|GDK_SHIFT_MASK,GDK_r,      reload,     { .b = TRUE } },
    { MODKEY,               GDK_r,      reload,     { .b = FALSE } },
    { MODKEY|GDK_SHIFT_MASK,GDK_p,      print,      { 0 } },
    { MODKEY,               GDK_p,      clipboard,  { .b = TRUE } },
    { MODKEY,               GDK_y,      clipboard,  { .b = FALSE } },
    { MODKEY|GDK_SHIFT_MASK,GDK_j,      zoom,       { .i = -1 } },
    { MODKEY|GDK_SHIFT_MASK,GDK_k,      zoom,       { .i = +1 } },
    { MODKEY|GDK_SHIFT_MASK,GDK_i,      zoom,       { .i = 0  } },
    { MODKEY,               GDK_l,      navigate,   { .i = +1 } },
    { MODKEY,               GDK_h,      navigate,   { .i = -1 } },
    { MODKEY,               GDK_j,      scroll,     { .i = +1 } },
    { MODKEY,               GDK_k,      scroll,     { .i = -1 } },
    { 0,                    GDK_Escape, stop,       { 0 } },
    { MODKEY,               GDK_o,      source,     { 0 } },
    { MODKEY,               GDK_g,      spawn,      SETPROP("_SURF_URI", "_SURF_GO") },
    { MODKEY,               GDK_f,      spawn,      SETPROP_FIND("_SURF_FIND", "_SURF_FIND") },
    { MODKEY,               GDK_n,      find,       { .b = TRUE } },
    { MODKEY,               GDK_Return, spawn,      SETURI("_SURF_URI") },
    { MODKEY,               GDK_d,      spawn,      ADDBMK },
    { MODKEY,               GDK_b,      spawn,      LOADBMK("_SURF_URI") },
    { MODKEY|GDK_SHIFT_MASK,GDK_n,      find,       { .b = FALSE } },
};
