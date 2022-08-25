local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

configs.setup {
    ensure_installed = {
        'lua',
        'php',
        'python',
        'javascript',
        'typescript',
    },
    sync_install = false,
    ignore_install = { '' },
    highlight = {
        enable = true,
        disable = { '' },
        additional_vim_regex_highlighting = true,
    },
    indendt = {
        enable = true,
        disable =  { 'yaml' },
    }
}
