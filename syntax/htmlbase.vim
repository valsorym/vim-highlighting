" Vim HTML/HTML5 syntax file.
syn include @htmlCss syntax/css.vim
syn include @htmlCss syntax/css/html5-elements.vim
syn include @htmlCss syntax/css/compositing-1.vim
syn include @htmlCss syntax/css/css3-animations.vim
syn include @htmlCss syntax/css/css3-background.vim
syn include @htmlCss syntax/css/css3-box.vim
syn include @htmlCss syntax/css/css3-break.vim
syn include @htmlCss syntax/css/css3-cascade.vim
syn include @htmlCss syntax/css/css3-colors.vim
syn include @htmlCss syntax/css/css3-conditional.vim
syn include @htmlCss syntax/css/css3-content.vim
syn include @htmlCss syntax/css/css3-exclusions.vim
syn include @htmlCss syntax/css/css3-fonts.vim
syn include @htmlCss syntax/css/css3-images.vim
syn include @htmlCss syntax/css/css3-layout.vim
syn include @htmlCss syntax/css/css3-linebox.vim
syn include @htmlCss syntax/css/css3-multicol.vim
syn include @htmlCss syntax/css/css3-page.vim
syn include @htmlCss syntax/css/css3-positioning.vim
syn include @htmlCss syntax/css/css3-regions.vim
syn include @htmlCss syntax/css/css3-selectors.vim
syn include @htmlCss syntax/css/css3-sizing.vim
syn include @htmlCss syntax/css/css3-speech.vim
syn include @htmlCss syntax/css/css3-transforms.vim
syn include @htmlCss syntax/css/css3-transitions.vim
syn include @htmlCss syntax/css/css3-ui.vim
syn include @htmlCss syntax/css/css3-values.vim
syn include @htmlCss syntax/css/css-align-3.vim
syn include @htmlCss syntax/css/css-counter-styles-3.vim
syn include @htmlCss syntax/css/css-display-3.vim
syn include @htmlCss syntax/css/css-flexbox-1.vim
syn include @htmlCss syntax/css/css-gcpm-3.vim
syn include @htmlCss syntax/css/css-grid-1.vim
syn include @htmlCss syntax/css/css-inline-3.vim
syn include @htmlCss syntax/css/css-line-grid-1.vim
syn include @htmlCss syntax/css/css-lists-3.vim
syn include @htmlCss syntax/css/css-masking-1.vim
syn include @htmlCss syntax/css/css-overflow-3.vim
syn include @htmlCss syntax/css/css-pseudo-4.vim
syn include @htmlCss syntax/css/css-ruby-1.vim
syn include @htmlCss syntax/css/css-scoping-1.vim
syn include @htmlCss syntax/css/css-shapes-1.vim
syn include @htmlCss syntax/css/css-text-3.vim
syn include @htmlCss syntax/css/css-text-decor-3.vim
syn include @htmlCss syntax/css/css-variables.vim
syn include @htmlCss syntax/css/css-will-change-1.vim
syn include @htmlCss syntax/css/css-writing-modes-3.vim
syn include @htmlCss syntax/css/selectors4.vim


" Please check :help html.vim for some comments and a description of the options

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'html'
endif

let s:cpo_save = &cpo
set cpo&vim

" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ HtmlHiLink hi link <args>
else
  command! -nargs=+ HtmlHiLink hi def link <args>
endif

syntax spell toplevel

syn case ignore

" mark illegal characters
syn match htmlError "[<>&]"


" tags
syn region  htmlString   contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc
syn region  htmlString   contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc
syn match   htmlValue    contained "=[\t ]*[^'" \t>][^ \t>]*"hs=s+1   contains=javaScriptExpression,@htmlPreproc
syn region  htmlEndTag             start=+</+      end=+>+ contains=htmlTagN,htmlTagError
syn region  htmlTag                start=+<[^/]+   end=+>+ fold contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
syn match   htmlTagN     contained +<\s*[-a-zA-Z0-9]\++hs=s+1 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster
syn match   htmlTagN     contained +</\s*[-a-zA-Z0-9]\++hs=s+2 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster
syn match   htmlTagError contained "[^>]<"ms=s+1


" tag names
syn keyword htmlTagName contained address applet area a base basefont
syn keyword htmlTagName contained big blockquote br caption center
syn keyword htmlTagName contained cite code dd dfn dir div dl dt font
syn keyword htmlTagName contained form hr html img
syn keyword htmlTagName contained input isindex kbd li link map menu
syn keyword htmlTagName contained meta ol option param pre p samp span
syn keyword htmlTagName contained select small strike sub sup
syn keyword htmlTagName contained table td textarea th tr tt ul var xmp
syn match htmlTagName contained "\<\(b\|i\|u\|h[1-6]\|em\|strong\|head\|body\|title\)\>"

" new html 4.0 tags
syn keyword htmlTagName contained abbr acronym bdo button col label
syn keyword htmlTagName contained colgroup del fieldset iframe ins legend
syn keyword htmlTagName contained object optgroup q s tbody tfoot thead

" legal arg names
syn keyword htmlArg contained action
syn keyword htmlArg contained align alink alt archive background bgcolor
syn keyword htmlArg contained border bordercolor cellpadding
syn keyword htmlArg contained cellspacing checked class clear code codebase color
syn keyword htmlArg contained cols colspan content coords enctype face
syn keyword htmlArg contained gutter height hspace id
syn keyword htmlArg contained link lowsrc marginheight
syn keyword htmlArg contained marginwidth maxlength method name prompt
syn keyword htmlArg contained rel rev rows rowspan scrolling selected shape
syn keyword htmlArg contained size src start target text type url
syn keyword htmlArg contained usemap ismap valign value vlink vspace width wrap
syn match   htmlArg contained "\<\(http-equiv\|href\|title\)="me=e-1

" Netscape extensions
syn keyword htmlTagName contained frame noframes frameset nobr blink
syn keyword htmlTagName contained layer ilayer nolayer spacer
syn keyword htmlArg     contained frameborder noresize pagex pagey above below
syn keyword htmlArg     contained left top visibility clip id noshade
syn match   htmlArg     contained "\<z-index\>"

" Microsoft extensions
syn keyword htmlTagName contained marquee

" html 4.0 arg names
syn match   htmlArg contained "\<\(accept-charset\|label\)\>"
syn keyword htmlArg contained abbr accept accesskey axis char charoff charset
syn keyword htmlArg contained cite classid codetype compact data datetime
syn keyword htmlArg contained declare defer dir disabled for frame
syn keyword htmlArg contained headers hreflang lang language longdesc
syn keyword htmlArg contained multiple nohref nowrap object profile readonly
syn keyword htmlArg contained rules scheme scope span standby style
syn keyword htmlArg contained summary tabindex valuetype version

" special characters
syn match htmlSpecialChar "&#\=[0-9A-Za-z]\{1,8};"

" Comments (the real ones or the old netscape ones)
if exists("html_wrong_comments")
  syn region htmlComment                start=+<!--+    end=+--\s*>+ contains=@Spell
else
  syn region htmlComment                start=+<!+      end=+>+   contains=htmlCommentPart,htmlCommentError,@Spell
  syn match  htmlCommentError contained "[^><!]"
  syn region htmlCommentPart  contained start=+--+      end=+--\s*+  contains=@htmlPreProc,@Spell
endif
syn region htmlComment                  start=+<!DOCTYPE+ keepend end=+>+

" server-parsed commands
syn region htmlPreProc start=+<!--#+ end=+-->+ contains=htmlPreStmt,htmlPreError,htmlPreAttr
syn match htmlPreStmt contained "<!--#\(config\|echo\|exec\|fsize\|flastmod\|include\|printenv\|set\|if\|elif\|else\|endif\|geoguide\)\>"
syn match htmlPreError contained "<!--#\S*"ms=s+4
syn match htmlPreAttr contained "\w\+=[^"]\S\+" contains=htmlPreProcAttrError,htmlPreProcAttrName
syn region htmlPreAttr contained start=+\w\+="+ skip=+\\\\\|\\"+ end=+"+ contains=htmlPreProcAttrName keepend
syn match htmlPreProcAttrError contained "\w\+="he=e-1
syn match htmlPreProcAttrName contained "\(expr\|errmsg\|sizefmt\|timefmt\|var\|cgi\|cmd\|file\|virtual\|value\)="he=e-1

if !exists("html_no_rendering")
    """ Rendering.
    syn cluster htmlTop contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLink,javaScript,@htmlPreproc
    
    "" syn region htmlBoldUnderlineItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop
    "" syn region htmlBoldUnderlineItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop
    syn region htmlBold start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlBoldUnderline,htmlBoldItalic
    syn region htmlBold start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlBoldUnderline,htmlBoldItalic
    syn region htmlBoldUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlBoldUnderlineItalic
    syn region htmlBoldItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlBoldItalicUnderline
    syn region htmlBoldItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop,htmlBoldItalicUnderline
    syn region htmlBoldItalicUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlBoldUnderlineItalic
    
    "" syn region htmlUnderlineBoldItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop
    "" syn region htmlUnderlineBoldItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop
    syn region htmlUnderline start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlUnderlineBold,htmlUnderlineItalic
    syn region htmlUnderlineBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlUnderlineBoldItalic
    syn region htmlUnderlineBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlUnderlineBoldItalic
    syn region htmlUnderlineItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlUnderlineItalicBold
    syn region htmlUnderlineItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop,htmlUnderlineItalicBold
    syn region htmlUnderlineItalicBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop
    syn region htmlUnderlineItalicBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop
    
    "" syn region htmlItalic start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlItalicBold,htmlItalicUnderline
    "" syn region htmlItalic start="<em\>" end="</em>"me=e-5 contains=@htmlTop
    syn region htmlItalicBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlItalicBoldUnderline
    syn region htmlItalicBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlItalicBoldUnderline
    syn region htmlItalicBoldUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop
    syn region htmlItalicUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlItalicUnderlineBold
    syn region htmlItalicUnderlineBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop
    syn region htmlItalicUnderlineBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop
    
    syn match htmlLeadingSpace "^\s\+" contained
    syn region htmlLink start="<a\>\_[^>]*\<href\>" end="</a>"me=e-4 contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLeadingSpace,javaScript,@htmlPreproc
    syn region htmlH1 start="<h1\>" end="</h1>"me=e-5 contains=@htmlTop
    syn region htmlH2 start="<h2\>" end="</h2>"me=e-5 contains=@htmlTop
    syn region htmlH3 start="<h3\>" end="</h3>"me=e-5 contains=@htmlTop
    syn region htmlH4 start="<h4\>" end="</h4>"me=e-5 contains=@htmlTop
    syn region htmlH5 start="<h5\>" end="</h5>"me=e-5 contains=@htmlTop
    syn region htmlH6 start="<h6\>" end="</h6>"me=e-5 contains=@htmlTop
    syn region htmlHead start="<head\>" end="</head>"me=e-7 end="<body\>"me=e-5 end="<h[1-6]\>"me=e-3 contains=htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLink,htmlTitle,javaScript,cssStyle,@htmlPreproc
    syn region htmlTitle start="<title\>" end="</title>"me=e-8 contains=htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc
endif

syn keyword htmlTagName         contained noscript
syn keyword htmlSpecialTagName  contained script style
if main_syntax != 'java' || exists("java_javascript")
  " JAVA SCRIPT
  syn include @htmlJavaScript syntax/javascript.vim
  unlet b:current_syntax
  syn region  javaScript start=+<script\_[^>]*>+ keepend end=+</script>+me=s-1 contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
  syn region  htmlScriptTag     contained start=+<script+ end=+>+ fold contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent
  HtmlHiLink htmlScriptTag htmlTag

  " html events (i.e. arguments that include javascript commands)
  if exists("html_extended_events")
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*'+ end=+'+ contains=htmlEventSQ
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*"+ end=+"+ contains=htmlEventDQ
  else
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*'+ end=+'+ keepend contains=htmlEventSQ
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*"+ end=+"+ keepend contains=htmlEventDQ
  endif
  syn region htmlEventSQ        contained start=+'+ms=s+1 end=+'+me=s-1 contains=@htmlJavaScript
  syn region htmlEventDQ        contained start=+"+ms=s+1 end=+"+me=s-1 contains=@htmlJavaScript
  HtmlHiLink htmlEventSQ htmlEvent
  HtmlHiLink htmlEventDQ htmlEvent

  " a javascript expression is used as an arg value
  syn region  javaScriptExpression contained start=+&{+ keepend end=+};+ contains=@htmlJavaScript,@htmlPreproc
endif

if main_syntax != 'java' || exists("java_vb")
  " VB SCRIPT
  syn include @htmlVbScript syntax/vb.vim
  unlet b:current_syntax
  syn region  javaScript start=+<script \_[^>]*language *=\_[^>]*vbscript\_[^>]*>+ keepend end=+</script>+me=s-1 contains=@htmlVbScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
endif

syn cluster htmlJavaScript      add=@htmlPreproc

if main_syntax != 'java' || exists("java_css")
  " embedded style sheets
  syn keyword htmlArg           contained media
  syn include @htmlCss syntax/css.vim
  unlet b:current_syntax
  syn region cssStyle start=+<style+ keepend end=+</style>+ contains=@htmlCss,htmlTag,htmlEndTag,htmlCssStyleComment,@htmlPreproc
  syn match htmlCssStyleComment contained "\(<!--\|-->\)"
  syn region htmlCssDefinition matchgroup=htmlArg start='style="' keepend matchgroup=htmlString end='"' contains=css.*Attr,css.*Prop,cssComment,cssLength,cssColor,cssURL,cssImportant,cssError,cssString,@htmlPreproc
  HtmlHiLink htmlStyleArg htmlString
endif

if main_syntax == "html"
  " synchronizing (does not always work if a comment includes legal
  " html tags, but doing it right would mean to always start
  " at the first line, which is too slow)
  syn sync match htmlHighlight groupthere NONE "<[/a-zA-Z]"
  syn sync match htmlHighlight groupthere javaScript "<script"
  syn sync match htmlHighlightSkip "^.*['\"].*$"
  syn sync minlines=10
endif

" The default highlighting.
if version >= 508 || !exists("did_html_syn_inits")
  if version < 508
    let did_html_syn_inits = 1
  endif
  HtmlHiLink htmlTag                     Function
  HtmlHiLink htmlEndTag                  Identifier
  HtmlHiLink htmlArg                     Type
  HtmlHiLink htmlTagName                 htmlStatement
  HtmlHiLink htmlSpecialTagName          Exception
  HtmlHiLink htmlValue                     String
  HtmlHiLink htmlSpecialChar             Special
  
  if !exists("html_no_rendering")
    HtmlHiLink htmlH1                      Title
    HtmlHiLink htmlH2                      htmlH1
    HtmlHiLink htmlH3                      htmlH2
    HtmlHiLink htmlH4                      htmlH3
    HtmlHiLink htmlH5                      htmlH4
    HtmlHiLink htmlH6                      htmlH5
    HtmlHiLink htmlHead                    PreProc
    HtmlHiLink htmlTitle                   Title
    HtmlHiLink htmlBoldItalicUnderline     htmlBoldUnderlineItalic
    HtmlHiLink htmlUnderlineBold           htmlBoldUnderline
    HtmlHiLink htmlUnderlineItalicBold     htmlBoldUnderlineItalic
    HtmlHiLink htmlUnderlineBoldItalic     htmlBoldUnderlineItalic
    HtmlHiLink htmlItalicUnderline         htmlUnderlineItalic
    HtmlHiLink htmlItalicBold              htmlBoldItalic
    HtmlHiLink htmlItalicBoldUnderline     htmlBoldUnderlineItalic
    HtmlHiLink htmlItalicUnderlineBold     htmlBoldUnderlineItalic
    HtmlHiLink htmlLink                    Underlined
    HtmlHiLink htmlLeadingSpace            None
    if !exists("html_my_rendering")
      hi def htmlBold                term=bold cterm=bold gui=bold
      hi def htmlBoldUnderline       term=bold,underline cterm=bold,underline gui=bold,underline
      hi def htmlBoldItalic          term=bold,italic cterm=bold,italic gui=bold,italic
      hi def htmlBoldUnderlineItalic term=bold,italic,underline cterm=bold,italic,underline gui=bold,italic,underline
      hi def htmlUnderline           term=underline cterm=underline gui=underline
      hi def htmlUnderlineItalic     term=italic,underline cterm=italic,underline gui=italic,underline
      hi def htmlItalic              term=italic cterm=italic gui=italic
    endif
  endif
  
  HtmlHiLink htmlPreStmt            PreProc
  HtmlHiLink htmlPreError           Error
  HtmlHiLink htmlPreProc            PreProc
  HtmlHiLink htmlPreAttr            String
  HtmlHiLink htmlPreProcAttrName    PreProc
  HtmlHiLink htmlPreProcAttrError   Error
  HtmlHiLink htmlSpecial            Special
  HtmlHiLink htmlSpecialChar        Special
  HtmlHiLink htmlString             String
  HtmlHiLink htmlStatement          Statement
  HtmlHiLink htmlComment            Comment
  HtmlHiLink htmlCommentPart        Comment
  HtmlHiLink htmlValue              String
  HtmlHiLink htmlCommentError       htmlError
  HtmlHiLink htmlTagError           htmlError
  HtmlHiLink htmlEvent              javaScript
  HtmlHiLink htmlError              Error
  
  HtmlHiLink javaScript             Special
  HtmlHiLink javaScriptExpression   javaScript
  HtmlHiLink htmlCssStyleComment    Comment
  HtmlHiLink htmlCssDefinition      Special
endif

" HTML 5 tags
syn keyword htmlTagName contained article aside audio canvas command
syn keyword htmlTagName contained datalist details dialog embed figcaption figure footer
syn keyword htmlTagName contained header hgroup keygen main mark meter menu menuitem nav output
syn keyword htmlTagName contained progress ruby rt rp rb rtc section source summary time track video data
syn keyword htmlTagName contained template content shadow
syn keyword htmlTagName contained wbr bdi
syn keyword htmlTagName contained picture


" JavaScript
syn keyword javascriptHtmlEvents onabort onblur oncanplay oncanplaythrough onchange 
syn keyword javascriptHtmlEvents onclick oncontextmenu ondblclick ondrag ondragend ondragenter ondragleave ondragover 
syn keyword javascriptHtmlEvents ondragstart ondrop ondurationchange onemptied onended onerror onfocus onformchange 
syn keyword javascriptHtmlEvents onforminput oninput oninvalid onkeydown onkeypress onkeyup onload onloadeddata 
syn keyword javascriptHtmlEvents onloadedmetadata onloadstart onmousedown onmousemove onmouseout onmouseover onmouseup
syn keyword javascriptHtmlEvents onmousewheel onpause onplay onplaying onprogress onratechange onreadystatechange 
syn keyword javascriptHtmlEvents onscroll onseeked onseeking onselect onshow onstalled onsubmit onsuspend ontimeupdate 
syn keyword javascriptHtmlEvents onvolumechange onwaiting

" <body>
syn keyword javascriptHtmlEvents onafterprint onbeforeprint onbeforeunload onblur onerror onfocus onhashchange onload 
syn keyword javascriptHtmlEvents onmessage onoffline ononline onpopstate onredo onresize onstorage onundo onunload

" Media Controller
syn keyword javascriptDomElemAttrs buffered seekable duration currentTime paused
syn keyword javascriptDomElemAttrs played defaultPlaybackRate playbackRate volume muted
syn keyword javascriptDomElemAttrs mediaGroup
syn keyword javascriptDomElemFuncs load play pause 

syn keyword javascriptHtmlEvents oncanplay oncanplaythrough ondurationchange onemptied 
syn keyword javascriptHtmlEvents onloadeddata onloadedmetadata onloadstart onpause onplay onplaying onratechange 
syn keyword javascriptHtmlEvents ontimeupdate onvolumechange onwaiting

" <audio>/<video>
syn keyword javascriptDomElemAttrs error src currentSrc networkState preload buffered readyState seeking 
syn keyword javascriptDomElemAttrs currentTime initialTime duration startOffsetTime paused defaultPlaybackRate playbackRate played
syn keyword javascriptDomElemAttrs seekable ended autoplay loop controls volume muted defaltMuted audioTracks videoTracks textTracks
syn keyword javascriptDomElemFuncs load addTextTrack

" <video>
" syn keyword javascriptDomElemAttrs width height
syn keyword javascriptDomElemAttrs videoWidth videoHeight poster

" drag and drop
syn keyword javascriptDomElemAttrs onDragStart onDragEnd onDragEnter onDragLeave onDragOver onDrag onDrop draggable dropzone

" SVG tags
" http://www.w3.org/TR/SVG/
" as found in http://www.w3.org/TR/SVG/eltindex.html
syn keyword htmlTagName contained svg 
syn keyword htmlTagName contained altGlyph altGlyphDef altGlyphItem 
syn keyword htmlTagName contained animate animateColor animateMotion animateTransform 
syn keyword htmlTagName contained circle ellipse rect line polyline polygon image path
syn keyword htmlTagName contained clipPath color-profile cursor 
syn keyword htmlTagName contained defs desc g symbol view use switch foreignObject
syn keyword htmlTagName contained filter feBlend feColorMatrix feComponentTransfer feComposite feConvolveMatrix feDiffuseLighting feDisplacementMap feDistantLight feFlood feFuncA feFuncB feFuncG feFuncR feGaussianBlur feImage feMerge feMergeNode feMorphology feOffset fePointLight feSpecularLighting feSpotLight feTile feTurbulence 
syn keyword htmlTagName contained font font-face font-face-format font-face-name font-face-src font-face-uri 
syn keyword htmlTagName contained glyph glyphRef hkern 
syn keyword htmlTagName contained linearGradient marker mask pattern radialGradient set stop
syn keyword htmlTagName contained missing-glyph mpath 
syn keyword htmlTagName contained text textPath tref tspan vkern
syn keyword htmlTagName contained metadata title

" Custom Element
syn match htmlTagName contained "\<[a-z_]\([a-z0-9_.]\+\)\?\(\-[a-z0-9_.]\+\)\+\>"

" HTML 5 arguments
" Core Attributes
syn keyword htmlArg contained accesskey class contenteditable contextmenu dir 
syn keyword htmlArg contained draggable hidden id is lang spellcheck style tabindex title translate
" Event-handler Attributes
syn keyword htmlArg contained onabort onblur oncanplay oncanplaythrough onchange
syn keyword htmlArg contained onclick oncontextmenu ondblclick ondrag ondragend ondragenter ondragleave ondragover 
syn keyword htmlArg contained ondragstart ondrop ondurationchange onemptied onended onerror onfocus onformchange 
syn keyword htmlArg contained onforminput oninput oninvalid onkeydown onkeypress onkeyup onload onloadeddata 
syn keyword htmlArg contained onloadedmetadata onloadstart onmousedown onmousemove onmouseout onmouseover onmouseup
syn keyword htmlArg contained onmousewheel onpause onplay onplaying onprogress onratechange onreadystatechange 
syn keyword htmlArg contained onscroll onseeked onseeking onselect onshow onstalled onsubmit onsuspend ontimeupdate 
syn keyword htmlArg contained onvolumechange onwaiting
" XML Attributes
syn keyword htmlArg contained xml:lang xml:space xml:base xmlns
" new features
" <body>
syn keyword htmlArg contained onafterprint onbeforeprint onbeforeunload onblur onerror onfocus onhashchange onload 
syn keyword htmlArg contained onmessage onoffline ononline onpopstate onredo onresize onstorage onundo onunload
" <video>, <audio>, <source>, <track>
syn keyword htmlArg contained autoplay preload controls loop poster media kind charset srclang track
" <form>, <input>, <button>
syn keyword htmlArg contained form autocomplete autofocus list min max step
syn keyword htmlArg contained formaction autofocus formenctype formmethod formtarget formnovalidate
syn keyword htmlArg contained required placeholder pattern
" <command>, <details>, <time>
syn keyword htmlArg contained label icon open datetime pubdate
" <script>
syn keyword htmlArg contained async
" <content>
syn keyword htmlArg contained select
" <iframe>
syn keyword htmlArg contained seamless srcdoc sandbox
" <picture>
syn keyword htmlArg contained srcset sizes

" Custom Data Attributes
" http://dev.w3.org/html5/spec/elements.html#embedding-custom-non-visible-data
syn match   htmlArg "\<\(data\-\([a-z_][a-z0-9_.\-]*\)\+\)\=\>" contained

" Microdata
" http://dev.w3.org/html5/md/
syn keyword htmlArg contained itemid itemscope itemtype itemprop itemref

" SVG
" http://www.w3.org/TR/SVG/
" Some common attributes from http://www.w3.org/TR/SVG/attindex.html
syn keyword htmlArg contained accent-height accumulate additive alphabetic amplitude arabic-form ascent attributeName attributeType azimuth 
syn keyword htmlArg contained baseFrequency baseProfile bbox begin bias by 
syn keyword htmlArg contained calcMode cap-height class clipPathUnits contentScriptType contentStyleType cx cy 
syn keyword htmlArg contained d descent diffuseConstant divisor dur dx dy 
syn keyword htmlArg contained edgeMode elevation end exponent externalResourcesRequired 
syn keyword htmlArg contained fill filterRes filterUnits font-family font-size font-stretch font-style font-variant font-weight format format from fx fy 
syn keyword htmlArg contained g1 g2 glyph-name glyphRef gradientTransform gradientUnits 
syn keyword htmlArg contained hanging height horiz-adv-x horiz-origin-x horiz-origin-y 
syn keyword htmlArg contained id ideographic in in2 intercept 
syn keyword htmlArg contained k k1 k2 k3 k4 kernelMatrix kernelUnitLength keyPoints keySplines keyTimes 
syn keyword htmlArg contained lang lengthAdjust limitingConeAngle local 
syn keyword htmlArg contained markerHeight markerUnits markerWidth maskContentUnits maskUnits mathematical max media method min mode name 
syn keyword htmlArg contained numOctaves 
syn keyword htmlArg contained offset onabort onactivate onbegin onclick onend onerror onfocusin onfocusout onload onmousedown onmousemove onmouseout onmouseover onmouseup onrepeat onresize onscroll onunload onzoom operator order orient orientation origin overline-position overline-thickness 
syn keyword htmlArg contained panose-1 path pathLength patternContentUnits patternTransform patternUnits points pointsAtX pointsAtY pointsAtZ preserveAlpha preserveAspectRatio primitiveUnits 
syn keyword htmlArg contained r radius refX refY rendering-intent repeatCount repeatDur requiredExtensions requiredFeatures restart result rotate rx ry 
syn keyword htmlArg contained scale seed slope spacing specularConstant specularExponent spreadMethod startOffset stdDeviation stemh stemv stitchTiles strikethrough-position strikethrough-thickness string surfaceScale systemLanguage 
syn keyword htmlArg contained tableValues target targetX targetY textLength title to transform type
syn keyword htmlArg contained u1 u2 underline-position underline-thickness unicode unicode-range units-per-em 
syn keyword htmlArg contained v-alphabetic v-hanging v-ideographic v-mathematical values version vert-adv-y vert-origin-x vert-origin-y viewBox viewTarget 
syn keyword htmlArg contained width widths 
syn keyword htmlArg contained x x-height x1 x2 xChannelSelector xlink:actuate xlink:actuate xlink:arcrole xlink:href xlink:role xlink:show xlink:title xlink:type xml:base xml:lang xml:space 
syn keyword htmlArg contained y y1 y2 yChannelSelector 
syn keyword htmlArg contained z zoomAndPan 
syn keyword htmlArg contained alignment-baseline baseline-shift clip-path clip-rule clip color-interpolation-filters color-interpolation color-profile color-rendering color cursor direction display dominant-baseline enable-background fill-opacity fill-rule fill filter flood-color flood-opacity font-family font-size-adjust font-size font-stretch font-style font-variant font-weight glyph-orientation-horizontal glyph-orientation-vertical image-rendering kerning letter-spacing lighting-color marker-end marker-mid marker-start mask opacity overflow pointer-events shape-rendering stop-color stop-opacity stroke-dasharray stroke-dashoffset stroke-linecap stroke-linejoin stroke-miterlimit stroke-opacity stroke-width stroke text-anchor text-decoration text-rendering unicode-bidi visibility word-spacing writing-mode


delcommand HtmlHiLink

let b:current_syntax = "html"

if main_syntax == 'html'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8


