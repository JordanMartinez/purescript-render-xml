module RenderXml.Html.Elements
  ( Node
  , Leaf
  , a
  , a_
  , abbr
  , abbr_
  , address
  , address_
  , area
  , article
  , article_
  , aside
  , aside_
  , audio
  , audio_
  , b
  , b_
  , base
  , bdi
  , bdi_
  , bdo
  , bdo_
  , blockquote
  , blockquote_
  , body
  , body_
  , br
  , br_
  , button
  , button_
  , canvas
  , caption
  , caption_
  , cite
  , cite_
  , code
  , code_
  , col
  , colgroup
  , colgroup_
  , command
  , datalist
  , datalist_
  , dd
  , dd_
  , del
  , del_
  , details
  , details_
  , dfn
  , dfn_
  , dialog
  , dialog_
  , div
  , div_
  , dl
  , dl_
  , dt
  , dt_
  , em
  , em_
  , embed
  , embed_
  , fieldset
  , fieldset_
  , figcaption
  , figcaption_
  , figure
  , figure_
  , footer
  , footer_
  , form
  , form_
  , h1
  , h1_
  , h2
  , h2_
  , h3
  , h3_
  , h4
  , h4_
  , h5
  , h5_
  , h6
  , h6_
  , head
  , head_
  , header
  , header_
  , hr
  , hr_
  , html
  , html_
  , transitionHtml
  , transitionHtml_
  , i
  , i_
  , iframe
  , img
  , input
  , ins
  , ins_
  , kbd
  , kbd_
  , label
  , label_
  , legend
  , legend_
  , li
  , li_
  , link
  , main
  , main_
  , map
  , map_
  , mark
  , mark_
  , menu
  , menu_
  , menuitem
  , menuitem_
  , meta
  , meter
  , meter_
  , nav
  , nav_
  , noscript
  , noscript_
  , object
  , object_
  , ol
  , ol_
  , optgroup
  , optgroup_
  , option
  , option_
  , output
  , output_
  , p
  , p_
  , param
  , pre
  , pre_
  , progress
  , progress_
  , q
  , q_
  , rp
  , rp_
  , rt
  , rt_
  , ruby
  , ruby_
  , samp
  , samp_
  , script
  , script_
  , section
  , section_
  , select
  , select_
  , small
  , small_
  , source
  , span
  , span_
  , strong
  , strong_
  , style
  , style_
  , sub
  , sub_
  , summary
  , summary_
  , sup
  , sup_
  , table
  , table_
  , tbody
  , tbody_
  , td
  , td_
  , textarea
  , tfoot
  , tfoot_
  , th
  , th_
  , thead
  , thead_
  , time
  , time_
  , title
  , title_
  , tr
  , tr_
  , track
  , u
  , u_
  , ul
  , ul_
  , var
  , var_
  , video
  , video_
  , wbr
  , module Exports
  ) where

import RenderXml.Html.Indexed as I
import RenderXml.Html.Core (Html, Prop, leaf, namespaceHtml, node)
import RenderXml.Html.Core (textElem) as Exports
import RenderXml.Core (ElemName(..))
import RenderXml.Core as XmlCore

-- | An Html element that admits children.
type Node r = Array (Prop r) -> Array Html -> Html

-- | An Html element that does not admit children.
type Leaf r = Array (Prop r) -> Html

a :: Node I.HTMLa
a = node (ElemName "a")

a_ :: Array Html -> Html
a_ = a []

abbr :: Node I.HTMLabbr
abbr = node (ElemName "abbr")

abbr_ :: Array Html -> Html
abbr_ = abbr []

address :: Node I.HTMLaddress
address = node (ElemName "address")

address_ :: Array Html -> Html
address_ = address []

area :: Leaf I.HTMLarea
area props = leaf (ElemName "area") props

article :: Node I.HTMLarticle
article = node (ElemName "article")

article_ :: Array Html -> Html
article_ = article []

aside :: Node I.HTMLaside
aside = node (ElemName "aside")

aside_ :: Array Html -> Html
aside_ = aside []

audio :: Node I.HTMLaudio
audio = node (ElemName "audio")

audio_ :: Array Html -> Html
audio_ = audio []

b :: Node I.HTMLb
b = node (ElemName "b")

b_ :: Array Html -> Html
b_ = b []

base :: Leaf I.HTMLbase
base props = leaf (ElemName "base") props

bdi :: Node I.HTMLbdi
bdi = node (ElemName "bdi")

bdi_ :: Array Html -> Html
bdi_ = bdi []

bdo :: Node I.HTMLbdo
bdo = node (ElemName "bdo")

bdo_ :: Array Html -> Html
bdo_ = bdo []

blockquote :: Node I.HTMLblockquote
blockquote = node (ElemName "blockquote")

blockquote_ :: Array Html -> Html
blockquote_ = blockquote []

body :: Node I.HTMLbody
body = node (ElemName "body")

body_ :: Array Html -> Html
body_ = body []

br :: Leaf I.HTMLbr
br props = leaf (ElemName "br") props

br_ :: Html
br_ = br []

button :: Node I.HTMLbutton
button = node (ElemName "button")

button_ :: Array Html -> Html
button_ = button []

canvas :: Leaf I.HTMLcanvas
canvas props = leaf (ElemName "canvas") props

caption :: Node I.HTMLcaption
caption = node (ElemName "caption")

caption_ :: Array Html -> Html
caption_ = caption []

cite :: Node I.HTMLcite
cite = node (ElemName "cite")

cite_ :: Array Html -> Html
cite_ = cite []

code :: Node I.HTMLcode
code = node (ElemName "code")

code_ :: Array Html -> Html
code_ = code []

col :: Leaf I.HTMLcol
col props = leaf (ElemName "col") props

colgroup :: Node I.HTMLcolgroup
colgroup = node (ElemName "colgroup")

colgroup_ :: Array Html -> Html
colgroup_ = colgroup []

command :: Leaf I.HTMLcommand
command props = leaf (ElemName "command") props

datalist :: Node I.HTMLdatalist
datalist = node (ElemName "datalist")

datalist_ :: Array Html -> Html
datalist_ = datalist []

dd :: Node I.HTMLdd
dd = node (ElemName "dd")

dd_ :: Array Html -> Html
dd_ = dd []

del :: Node I.HTMLdel
del = node (ElemName "del")

del_ :: Array Html -> Html
del_ = del []

details :: Node I.HTMLdetails
details = node (ElemName "details")

details_ :: Array Html -> Html
details_ = details []

dfn :: Node I.HTMLdfn
dfn = node (ElemName "dfn")

dfn_ :: Array Html -> Html
dfn_ = dfn []

dialog :: Node I.HTMLdialog
dialog = node (ElemName "dialog")

dialog_ :: Array Html -> Html
dialog_ = dialog []

div :: Node I.HTMLdiv
div = node (ElemName "div")

div_ :: Array Html -> Html
div_ = div []

dl :: Node I.HTMLdl
dl = node (ElemName "dl")

dl_ :: Array Html -> Html
dl_ = dl []

dt :: Node (I.HTMLdt)
dt = node (ElemName "dt")

dt_ :: Array Html -> Html
dt_ = dt []

em :: Node I.HTMLem
em = node (ElemName "em")

em_ :: Array Html -> Html
em_ = em []

embed :: Node I.HTMLembed
embed = node (ElemName "embed")

embed_ :: Array Html -> Html
embed_ = embed []

fieldset :: Node I.HTMLfieldset
fieldset = node (ElemName "fieldset")

fieldset_ :: Array Html -> Html
fieldset_ = fieldset []

figcaption :: Node I.HTMLfigcaption
figcaption = node (ElemName "figcaption")

figcaption_ :: Array Html -> Html
figcaption_ = figcaption []

figure :: Node I.HTMLfigure
figure = node (ElemName "figure")

figure_ :: Array Html -> Html
figure_ = figure []

footer :: Node I.HTMLfooter
footer = node (ElemName "footer")

footer_ :: Array Html -> Html
footer_ = footer []

form :: Node I.HTMLform
form = node (ElemName "form")

form_ :: Array Html -> Html
form_ = form []

h1 :: Node I.HTMLh1
h1 = node (ElemName "h1")

h1_ :: Array Html -> Html
h1_ = h1 []

h2 :: Node I.HTMLh2
h2 = node (ElemName "h2")

h2_ :: Array Html -> Html
h2_ = h2 []

h3 :: Node I.HTMLh3
h3 = node (ElemName "h3")

h3_ :: Array Html -> Html
h3_ = h3 []

h4 :: Node I.HTMLh4
h4 = node (ElemName "h4")

h4_ :: Array Html -> Html
h4_ = h4 []

h5 :: Node I.HTMLh5
h5 = node (ElemName "h5")

h5_ :: Array Html -> Html
h5_ = h5 []

h6 :: Node I.HTMLh6
h6 = node (ElemName "h6")

h6_ :: Array Html -> Html
h6_ = h6 []

head :: Node I.HTMLhead
head = node (ElemName "head")

head_ :: Array Html -> Html
head_ = head []

header :: Node I.HTMLheader
header = node (ElemName "header")

header_ :: Array Html -> Html
header_ = header []

hr :: Leaf I.HTMLhr
hr props = leaf (ElemName "hr") props

hr_ :: Html
hr_ = hr []

html :: Node I.HTMLhtml
html = node (ElemName "html")

html_ :: Array Html -> Html
html_ = html []

transitionHtml :: forall outerNs r. Array (Prop r) -> Array Html -> XmlCore.Xml outerNs
transitionHtml = XmlCore.transitionNode namespaceHtml (ElemName "html")

transitionHtml_ :: forall outerNs. Array Html -> XmlCore.Xml outerNs
transitionHtml_ = transitionHtml []

i :: Node I.HTMLi
i = node (ElemName "i")

i_ :: Array Html -> Html
i_ = i []

iframe :: Leaf I.HTMLiframe
iframe props = leaf (ElemName "iframe") props

img :: Leaf I.HTMLimg
img props = leaf (ElemName "img") props

input :: Leaf I.HTMLinput
input props = leaf (ElemName "input") props

ins :: Node I.HTMLins
ins = node (ElemName "ins")

ins_ :: Array Html -> Html
ins_ = ins []

kbd :: Node I.HTMLkbd
kbd = node (ElemName "kbd")

kbd_ :: Array Html -> Html
kbd_ = kbd []

label :: Node I.HTMLlabel
label = node (ElemName "label")

label_ :: Array Html -> Html
label_ = label []

legend :: Node I.HTMLlegend
legend = node (ElemName "legend")

legend_ :: Array Html -> Html
legend_ = legend []

li :: Node I.HTMLli
li = node (ElemName "li")

li_ :: Array Html -> Html
li_ = li []

link :: Leaf I.HTMLlink
link props = leaf (ElemName "link") props

main :: Node I.HTMLmain
main = node (ElemName "main")

main_ :: Array Html -> Html
main_ = main []

map :: Node I.HTMLmap
map = node (ElemName "map")

map_ :: Array Html -> Html
map_ = map []

mark :: Node I.HTMLmark
mark = node (ElemName "mark")

mark_ :: Array Html -> Html
mark_ = mark []

menu :: Node I.HTMLmenu
menu = node (ElemName "menu")

menu_ :: Array Html -> Html
menu_ = menu []

menuitem :: Node I.HTMLmenuitem
menuitem = node (ElemName "menuitem")

menuitem_ :: Array Html -> Html
menuitem_ = menuitem []

meta :: Leaf I.HTMLmeta
meta props = leaf (ElemName "meta") props

meter :: Node I.HTMLmeter
meter = node (ElemName "meter")

meter_ :: Array Html -> Html
meter_ = meter []

nav :: Node I.HTMLnav
nav = node (ElemName "nav")

nav_ :: Array Html -> Html
nav_ = nav []

noscript :: Node I.HTMLnoscript
noscript = node (ElemName "noscript")

noscript_ :: Array Html -> Html
noscript_ = noscript []

object :: Node I.HTMLobject
object = node (ElemName "object")

object_ :: Array Html -> Html
object_ = object []

ol :: Node I.HTMLol
ol = node (ElemName "ol")

ol_ :: Array Html -> Html
ol_ = ol []

optgroup :: Node I.HTMLoptgroup
optgroup = node (ElemName "optgroup")

optgroup_ :: Array Html -> Html
optgroup_ = optgroup []

option :: Node I.HTMLoption
option = node (ElemName "option")

option_ :: Array Html -> Html
option_ = option []

output :: Node I.HTMLoutput
output = node (ElemName "output")

output_ :: Array Html -> Html
output_ = output []

p :: Node I.HTMLp
p = node (ElemName "p")

p_ :: Array Html -> Html
p_ = p []

param :: Leaf I.HTMLparam
param props = leaf (ElemName "param") props

pre :: Node I.HTMLpre
pre = node (ElemName "pre")

pre_ :: Array Html -> Html
pre_ = pre []

progress :: Node I.HTMLprogress
progress = node (ElemName "progress")

progress_ :: Array Html -> Html
progress_ = progress []

q :: Node I.HTMLq
q = node (ElemName "q")

q_ :: Array Html -> Html
q_ = q []

rp :: Node I.HTMLrp
rp = node (ElemName "rp")

rp_ :: Array Html -> Html
rp_ = rp []

rt :: Node I.HTMLrt
rt = node (ElemName "rt")

rt_ :: Array Html -> Html
rt_ = rt []

ruby :: Node I.HTMLruby
ruby = node (ElemName "ruby")

ruby_ :: Array Html -> Html
ruby_ = ruby []

samp :: Node I.HTMLsamp
samp = node (ElemName "samp")

samp_ :: Array Html -> Html
samp_ = samp []

script :: Node I.HTMLscript
script = node (ElemName "script")

script_ :: Array Html -> Html
script_ = script []

section :: Node I.HTMLsection
section = node (ElemName "section")

section_ :: Array Html -> Html
section_ = section []

select :: Node I.HTMLselect
select = node (ElemName "select")

select_ :: Array Html -> Html
select_ = select []

small :: Node I.HTMLsmall
small = node (ElemName "small")

small_ :: Array Html -> Html
small_ = small []

source :: Leaf I.HTMLsource
source props = node (ElemName "source") props []

span :: Node I.HTMLspan
span = node (ElemName "span")

span_ :: Array Html -> Html
span_ = span []

strong :: Node I.HTMLstrong
strong = node (ElemName "strong")

strong_ :: Array Html -> Html
strong_ = strong []

style :: Node I.HTMLstyle
style = node (ElemName "style")

style_ :: Array Html -> Html
style_ = style []

sub :: Node I.HTMLsub
sub = node (ElemName "sub")

sub_ :: Array Html -> Html
sub_ = sub []

summary :: Node I.HTMLsummary
summary = node (ElemName "summary")

summary_ :: Array Html -> Html
summary_ = summary []

sup :: Node I.HTMLsup
sup = node (ElemName "sup")

sup_ :: Array Html -> Html
sup_ = sup []

table :: Node I.HTMLtable
table = node (ElemName "table")

table_ :: Array Html -> Html
table_ = table []

tbody :: Node I.HTMLtbody
tbody = node (ElemName "tbody")

tbody_ :: Array Html -> Html
tbody_ = tbody []

td :: Node I.HTMLtd
td = node (ElemName "td")

td_ :: Array Html -> Html
td_ = td []

textarea :: Leaf I.HTMLtextarea
textarea es = leaf (ElemName "textarea") es

tfoot :: Node I.HTMLtfoot
tfoot = node (ElemName "tfoot")

tfoot_ :: Array Html -> Html
tfoot_ = tfoot []

th :: Node I.HTMLth
th = node (ElemName "th")

th_ :: Array Html -> Html
th_ = th []

thead :: Node I.HTMLthead
thead = node (ElemName "thead")

thead_ :: Array Html -> Html
thead_ = thead []

time :: Node I.HTMLtime
time = node (ElemName "time")

time_ :: Array Html -> Html
time_ = time []

title :: Node I.HTMLtitle
title = node (ElemName "title")

title_ :: Array Html -> Html
title_ = title []

tr :: Node I.HTMLtr
tr = node (ElemName "tr")

tr_ :: Array Html -> Html
tr_ = tr []

track :: Leaf I.HTMLtrack
track props = leaf (ElemName "track") props

u :: Node I.HTMLu
u = node (ElemName "u")

u_ :: Array Html -> Html
u_ = u []

ul :: Node I.HTMLul
ul = node (ElemName "ul")

ul_ :: Array Html -> Html
ul_ = ul []

var :: Node I.HTMLvar
var = node (ElemName "var")

var_ :: Array Html -> Html
var_ = var []

video :: Node I.HTMLvideo
video = node (ElemName "video")

video_ :: Array Html -> Html
video_ = video []

wbr :: Leaf I.HTMLwbr
wbr props = node (ElemName "wbr") props []
