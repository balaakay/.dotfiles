function ColorMyPencils(color)
  color = color or "rose-pine-moon"
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_h1(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_h1(0, "NormalFloat", { bg = "none" })
end

_G.ColorMyPencils = ColorMyPencils

ColorMyPencils()
