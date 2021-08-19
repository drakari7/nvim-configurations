" Airline settings
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#buf_label_first = 1
let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline#extensions#tagbar#enabled = 0

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline_powerline_fonts = 1
let g:airline_stl_path_style = 'short'
let g:airline_symbols.maxlinenr = ' '

call airline#parts#define_text('enc', &fenc)
call airline#parts#define_minwidth('enc', 100)
call airline#parts#define_text('ff', &ff)
call airline#parts#define_raw('file', '%t%m')


call airline#parts#define('linenr', {
            \ 'raw': '%{g:airline_symbols.linenr}%2l',
            \ 'accent': 'bold'})
call airline#parts#define('maxlinenr', {
            \ 'raw': '/%2L%{g:airline_symbols.maxlinenr}',
            \ 'accent': 'bold'})
call airline#parts#define('colnr', {
            \ 'raw': '%{g:airline_symbols.colnr}%2v',
            \ 'accent': 'bold'})

let spc = ' '
let g:airline_section_c = airline#section#create(['%<', 'file', spc, 'readonly'])
let g:airline_section_y = airline#section#create_right(['enc'])
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', 'colnr'])
let g:airline_section_error = ''
