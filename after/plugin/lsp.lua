-- mason
require('mason').setup({})

-- ==== LSP defaults / capabilities ====
local cmp_caps = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config.defaults = vim.lsp.config.defaults or {}
vim.lsp.config.defaults.capabilities = vim.tbl_deep_extend(
  'force',
  vim.lsp.config.defaults.capabilities or vim.lsp.protocol.make_client_capabilities(),
  cmp_caps
)

-- mason-lspconfig
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = { 'lua_ls', 'eslint', 'ts_ls', 'rust_analyzer' },
  handlers = {
    -- default handler for all servers
    function(server_name)
      vim.lsp.config[server_name].setup({
        -- kan lämnas tomt; defaults.capabilities ovan slår ändå igenom
      })
    end,

    -- server-specifika overrides

    -- Lua
    lua_ls = function()
      vim.lsp.config.lua_ls.setup({
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim', 'require' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      })
    end,
  },
})

-- null-ls / none-ls
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = true })
      end,
    })
  end,
})

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- === LSP UI / keybinds ===
local function highlight_symbol(event)
  local id = vim.tbl_get(event, 'data', 'client_id')
  local client = id and vim.lsp.get_client_by_id(id)
  if client == nil or not client.supports_method('textDocument/documentHighlight') then
    return
  end

  local group = vim.api.nvim_create_augroup('highlight_symbol', { clear = false })
  vim.api.nvim_clear_autocmds({ buffer = event.buf, group = group })

  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    group = group,
    buffer = event.buf,
    callback = vim.lsp.buf.document_highlight,
  })

  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    group = group,
    buffer = event.buf,
    callback = vim.lsp.buf.clear_references,
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<leader>fa', '<cmd>EslintFixAll<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', 'gq', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    highlight_symbol(event)
  end,
})

-- nvim-cmp
local cmp = require('cmp')
cmp.setup({
  sources = { { name = 'nvim_lsp' } },
  snippet = {
    expand = function(args) vim.snippet.expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

-- diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN]  = '▲',
      [vim.diagnostic.severity.HINT]  = '⚑',
      [vim.diagnostic.severity.INFO]  = '»',
    },
  },
})
