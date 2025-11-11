return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "goimports",
        "gofumpt",
        "gopls",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
