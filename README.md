**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

## Language support (structured)

- **LSP**: C/C++ (`clangd`), Rust (`rust-analyzer`), JavaScript/TypeScript (`ts_ls`), Prisma (`prismals`), Markdown (`marksman`), YAML (`yamlls`), JSON (`jsonls`), Terraform (`terraformls`, `tflint`), Ansible (`ansiblels`), Bash (`bashls`), Docker (`dockerls`), Jenkinsfile/Groovy (`groovyls`)
- **Formatting (conform.nvim)**: `stylua`, `prettier`, `clang-format`, `rustfmt`, `terraform_fmt`, `shfmt`
- **Linting (nvim-lint)**: `eslint_d`, `markdownlint`, `tflint`, `yamllint`, `ansible-lint`, `shellcheck`, `actionlint`
- **Treesitter parsers** include: C, C++, Rust, JavaScript, TypeScript, TSX, JSON/JSONC, YAML, Markdown, Terraform/HCL, Prisma, Groovy and more
- **Mason tool installer** auto-installs and manages core LSP servers/formatters/linters
