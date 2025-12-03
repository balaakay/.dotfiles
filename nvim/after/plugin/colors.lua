function ColorMyPencils()
  local colorschemes = {"rose-pine", "melange", "onenord"}
  local current = vim.g.colors_name
  local new = colorschemes[1]
  for index, value in ipairs(colorschemes) do
    if colorschemes[index] == current then
      if index == #colorschemes then
        new = colorschemes[1]
        break
      else
        new = colorschemes[index + 1]
        break
      end
    end
  end

  if new == "rose-pine" then
  vim.cmd.colorscheme("rose-pine-moon")
  end
  vim.cmd.colorscheme(new)
  if current == nil then
  else
    print("Old colorscheme: ", current, " New colorscheme: ", new)
  end

end

-- ColorMyPencils()
