vim.g.mapleader = " "
local vks = vim.keymap.set

vks("n", ";", ":")
vks("i", "jk", "<Esc>")
vks("n", "vv", ":vsp<CR>")
vks("n", "vh", ":tsp<CR>")
vks("n", "<C-s-o>", ":source<CR>")

vks("n", "<C-h>", "<C-w>h", opts)
vks("n", "<C-j>", "<C-w>j", opts)
vks("n", "<C-k>", "<C-w>k", opts)
vks("n", "<C-l>", "<C-w>l", opts)

-- redimensionar ventanas
vks("n", "<C-Up>", ":resize -2<CR>")
vks("n", "<C-Down>", ":resize +2<CR>")
vks("n", "<C-Left>", ":vertical resize -2<CR>")
vks("n", "<C-Right>", ":vertical resize +2<CR>")

-- Nvim-tree
vks("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
vks("n", "<leader>o", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file tree" })
vks("n", "<leader>E", "<cmd>NvimTreeFindFile<cr>", { desc = "Reveal current file in tree" })

-- FzfLua
vks("n", "<leader>ff", ":FzfLua files<CR>", { desc = "Find files" })
vks("n", "<leader>fg", ":FzfLua live_grep<CR>", { desc = "Live grep" })
vks("n", "<leader>fb", ":FzfLua buffers<CR>", { desc = "Find buffers" })
vks("n", "<leader>fh", ":FzfLua help_tags<CR>", { desc = "Help tags" })
vks("n", "<leader>fo", ":FzfLua oldfiles<CR>", { desc = "Recent files" })
vks("n", "<leader>fc", ":FzfLua commands<CR>", { desc = "Commands" })
vks("n", "<leader>fk", ":FzfLua keymaps<CR>", { desc = "Keymaps" })
vks("n", "<leader>fr", ":FzfLua resume<CR>", { desc = "Resume last search" })

-- BufferLine
vks("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vks("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vks("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
vks("n", "<leader>bD", ":bdelete!<CR>", { desc = "Force delete buffer" })
vks("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
vks("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Pick buffer" })
vks("n", "<leader>bc", ":BufferLinePickClose<CR>", { desc = "Pick close buffer" })
vks("n", "<leader>bl", ":BufferLineCloseLeft<CR>", { desc = "Close buffers to the left" })
vks("n", "<leader>br", ":BufferLineCloseRight<CR>", { desc = "Close buffers to the right" })

-- ToggleTerm
vks("n", "<leader>tt", ":ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
vks("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
vks("n", "<leader>tv", ":ToggleTerm direction=vertical size=80<CR>", { desc = "Toggle vertical terminal" })
vks("t", "<C-x>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Refactoring
vks("n", "<leader>re", ":Refactor extract ", { desc = "Extract function" })
vks("n", "<leader>rf", ":Refactor extract_to_file ", { desc = "Extract to file" })
vks("n", "<leader>rv", ":Refactor extract_var ", { desc = "Extract variable" })
vks("n", "<leader>ri", ":Refactor inline_var<CR>", { desc = "Inline variable" })
vks("n", "<leader>rb", ":Refactor extract_block<CR>", { desc = "Extract block" })
vks("n", "<leader>rbf", ":Refactor extract_block_to_file<CR>", { desc = "Extract block to file" })

-- Comment
vks("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
vks("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Splits
vks("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertical" })
vks("n", "<leader>sh", ":split<CR>", { desc = "Split horizontal" })
vks("n", "<leader>sx", ":close<CR>", { desc = "Close split" })