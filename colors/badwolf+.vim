runtime bundle/badwolf/colors/badwolf.vim
let g:colors_name = "badwolf+"

" Palette {{{

let s:bwc = {}

" The most basic of all our colors is a slightly tweaked version of the Molokai
" Normal text.
let s:bwc.plain = ['f8f6f2', 15]

" Pure and simple.
let s:bwc.snow = ['ffffff', 15]
let s:bwc.coal = ['000000', 16]

" All of the Gravel colors are based on a brown from Clouds Midnight.
let s:bwc.brightgravel   = ['d9cec3', 252]
let s:bwc.lightgravel    = ['998f84', 245]
let s:bwc.gravel         = ['857f78', 243]
let s:bwc.mediumgravel   = ['666462', 241]
let s:bwc.deepgravel     = ['45413b', 238]
let s:bwc.deepergravel   = ['35322d', 236]
let s:bwc.darkgravel     = ['242321', 235]
let s:bwc.blackgravel    = ['1c1b1a', 233]
let s:bwc.blackestgravel = ['141413', 232]

" A color sampled from a highlight in a photo of a glass of Dale's Pale Ale on
" my desk.
let s:bwc.dalespale = ['fade3e', 221]

" A beautiful tan from Tomorrow Night.
let s:bwc.dirtyblonde = ['f4cf86', 222]

" Delicious, chewy red from Made of Code for the poppiest highlights.
let s:bwc.taffy = ['ff2c4b', 196]

" Another chewy accent, but use sparingly!
let s:bwc.saltwatertaffy = ['8cffba', 121]

" The star of the show comes straight from Made of Code.
let s:bwc.tardis = ['0a9dff', 39]

" This one's from Mustang, not Florida!
let s:bwc.orange = ['ffa724', 214]

" A limier green from Getafe.
let s:bwc.lime = ['aeee00', 154]

" Rose's dress in The Idiot's Lantern.
let s:bwc.dress = ['ff9eb8', 211]

" Another play on the brown from Clouds Midnight.  I love that color.
let s:bwc.toffee = ['b88853', 137]

" Also based on that Clouds Midnight brown.
let s:bwc.coffee    = ['c7915b', 173]
let s:bwc.darkroast = ['88633f', 95]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}

" Ruby/Rails 
""hi rubyIdentifier guifg=#0ac2ff
""hi rubyInstanceVariable guifg=#0ac2ff
call s:HL('rubyInstanceVariable', 'tardis', '', 'none')
""call s:HL('rubyFunction', 'orange', '', 'bold')
""call s:HL('rubyDefine', 'taffy', '', 'bold')
call s:HL('rubyControl', 'taffy', '', 'none')
call s:HL('rubyConditional', 'taffy', '', 'none')
"call s:HL('rubySymbol', 'dress', '', 'none')
call s:HL('rubyComment', 'lightgravel')
""call s:HL('rubyInterpolationDelimiter', 'tardis', '', 'bold')
""call s:HL('railsMethod', 'orange')
""call s:HL('erubyDelimiter', 'tardis', '', 'bold')

" Overrides 
call s:HL('htmlArg', 'brightgravel', '', 'none')
""call s:HL('Folded', 'mediumgravel', 'bg', 'italic')
""call s:HL('markdownItalic', 'snow', '', 'italic')
""call s:HL('markdownBoldItalic', 'snow', '', 'bold,italic')
call s:HL('Constant',  'saltwatertaffy', '', 'none')

" call s:HL('org_shade_stars', 'gravel', '', 'bold')
" call s:HL('org_heading1', 'lime', '', 'none')
" call s:HL('org_heading2', 'saltwatertaffy', '', 'none')
" call s:HL('org_heading3', 'dirtyblonde', '', 'none')
" call s:HL('org_heading4', 'dress', '', 'none')

hi Visual guifg=NONE gui=NONE guibg=#544033
hi VertSplit ctermfg=233 guifg=#1c1b1a guibg=#1c1b1a
