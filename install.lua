local files = {
  ["Q7Q6BcfF"] = "dry.lua",
  ["qx6h7Ygm"] = "miner.lua",
  ["Mw8NJYUu"] = "startup.lua",
  ["VXiHKX2A"] = "work.lua",
}

for pastebin, path in pairs(files) do
  if fs.exists(path) then
    fs.delete(path)
  end

  shell.run("pastebin get " .. pastebin .. " " .. path)
end
-- pastebin run K1rrMR7H