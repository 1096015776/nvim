local options = {
  termguicolors = true,
  -- Indentation
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  -- Buffers
  hidden = true, -- Buffer switching without saving

  -- Search
  ignorecase = true, -- Case insensitive search
  smartcase = true, -- But sensitive if includes capital letter
  grepprg = 'rg --ignore-case --vimgrep',
  grepformat = '%f:%l:%c:%m,%f:%l:%m',

  path = '**',
  -- Ignore some folders and files with find
  wildignore = {'**/node_modules/**', '**/coverage/**', '**/.idea/**', '**/.git/**', '**/.nuxt/**'},

  -- UI
  wrap = false,
  linebreak = true, -- Break lines by spaces or tabs

  number = true,
  relativenumber = true,
  -- TODO:待确认
  -- signcolumn = 'yes'
  -- statuscolumn = "%C%=%4{&nu ? (&rnu ? (v:lnum == line('.') ? v:lnum . ' ' : v:relnum) : v:lnum) : ''}%=%s"
  cmdheight = 0,

  list = true,
  listchars = {
    nbsp = '⦸', -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    tab = '  ',
    extends = '»', -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
    precedes = '«', -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
    trail = '·' -- Dot Operator (U+22C5)
  },
  -- Show cool character on line wrap
  showbreak = '↳ ', -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
  fillchars = {
    eob = ' ', -- Suppress ~ at EndOfBuffer
    fold = ' ', -- Hide trailing folding characters
    diff = '╱',
    foldopen = '',
    foldclose = ''
  },

  cursorline = true, -- Highlight current line
  colorcolumn = {81, 121}, -- Highlight columns
  showmatch = true, -- Highlight matching parenthesis, etc.
  showmode = false, -- Do not show mode in command line

  -- UX
  confirm = true,
  updatetime = 100, -- Trigger cursorhold faster
  inccommand = 'nosplit', -- Show preview of ex commands

  splitright = true, -- Open new split to the right
  splitbelow = true, -- Open new split below
  -- todo:待确认
  -- splitkeep = 'screen'
  joinspaces = false, -- Prevent inserting two spaces with J

  completeopt = {'menuone', 'noselect'}, -- Completion menu
  pumheight = 13,

  --  Autoformatting
  --  TODO: Might need to use concat because of
  --  https://github.com/neovim/neovim/issues/14669
  formatoptions = table.concat {'2', -- Use the second line's indent vale when indenting (allows indented first line)
    'q', -- Formatting comments with `gq`
    'w', -- Trailing whitespace indicates a paragraph
    'j', -- Remove comment leader when makes sense (joining lines)
    'r', -- Insert comment leader after hitting Enter
    'o' -- Insert comment leader after hitting `o` or `O`
  },


  -- Integration with the system clipboard
  -- clipboard = {'unnamed', 'unnamedplus'},

  -- Navigation
  scrolloff = 5, -- Lines to scroll when cursor leaves screen
  sidescrolloff = 3, -- Lines to scroll horizontally
  suffixesadd = {'.md', '.js', '.ts', '.tsx'}, -- File extensions not required when opening with `gf`

  -- Backups
  backup = true,
  backupdir = {vim.env.XDG_DATA_HOME .. '/nvim/backups'},
  backupskip = {'/tmp/*', '/private/tmp/*'},
  writebackup = true,

  -- Undo & History
  undofile = true,
  undolevels = 1000,
  undoreload = 10000,
  shada = {'!', "'1000", '<50', 's10', 'h'}, -- Increase the shadafile size so that history is longer
  tgc = true,
  background = 'dark',
}

for key, val in ipairs(options) do
    vim.opt[key] = val
end

local opt = vim.opt

opt.shortmess:append{
    I = true, -- No splash screen
    W = true, -- Don't print "written" when editing
    a = true, -- Use abbreviations in messages ([RO] intead of [readonly])
    c = true, -- Do not show ins-completion-menu messages (match 1 of 2)
    F = true, -- Do not print file name when opening a file
    s = true -- Do not show "Search hit BOTTOM" message
}

opt.sessionoptions:remove{'buffers', 'folds'}
opt.cpoptions:append('>')
opt.whichwrap:append('h,l,<,>,[,]') 
