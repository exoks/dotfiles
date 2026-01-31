--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀
--  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀               𓐓 null_ls.lua 𓐔          
--  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀
--  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀  Engineer: oezzaou <oussama.ezzaou@gmail.com>
--  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀
--  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
--  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2026/01/20 00:06:53 by oezzaou
--  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2026/01/20 15:12:08 by oezzaou
--  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀
--  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀
--  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪
--  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃
--  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

-- ===[ null_ls: ]=============================================================
return {
	{
		-- Great pluging for management of linter & formatter as part from LSP --
		"nvimtools/none-ls.nvim",
		config = function()
			local none_ls = require("null-ls")
			none_ls.setup({
				-- formatting: formatters --
				none_ls.builtins.formatting.stylua, -- lua
				none_ls.builtins.formatting.prettier, -- js/html
				-- diagnostics: linters --
				none_ls.builtins.diagnostics.pylint, -- python
				none_ls.builtins.diagnostics.markuplint,
				-- none_ls.builtins.diagnostics.pylint.with({
				--   extra_args = {
				--     "--load-plugins=pylint_django",
				--     "--help-msg=django-not-configured",
				--     "--max-line-length=80",
				--   },
				-- }),

				-- code actions --
				-- none_ls.builtins.code_actions.flake8,

				-- debug --
				debug = true,
			})
		end,
	},
}
-- INFO:-----------------------------------------------------------------------
-- - lsp has it's builting formater & linter but none-ls allows you to use    |
--   external ones.                                                           |
-- QUESTION:[         what is the diff between linter & formater ?            ]
-- - linter : is tool that detect the errors in logic of code & suggest code  |
--   fixes (katchod l machakil li endk fi l code o katqadhom)                 |
-- - formatter: is a tool to check & reformat the code without changing the   |
--   runtime behavior of the code (khedmatha sysntax language kat9ado)        |
-- ----------------------------------------------------------------------------
-- INFO:[ Core Idea ]----------------------------------------------------------
-- - LSP servers -> provide diagnostics, formatting, code actions, competion  |
-- - CLI tools (eslint, prettier, black, stylua, shellcheck, etc.) -> just    |
--   command-line programs.                                                   |
-- > So Neovim thinks: "This is an LSP server"                                |
-- > But in reality: "It's just running a command under the hood"             |
-- - `null-ls` acts as fake LSP server                                        |
--    . It registers itself with Neovim as an LSP client                      |
--    . It implements LSP methods like:                                       |
--  -> textDocument/formatting                                                |
--  -> textDocument/publishDiagnostics                                        |
--  -> textDocument/codeAction                                                |
-- ----------------------------------------------------------------------------
