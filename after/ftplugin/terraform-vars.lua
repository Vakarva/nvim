-- hclwrite (tofu fmt / tofu-ls) hardcodes 2-space indentation; match it so
-- format-on-save doesn't rewrite what was just typed
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
