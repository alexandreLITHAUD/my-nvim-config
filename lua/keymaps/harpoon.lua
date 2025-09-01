local M = {}

M.keys = function()
	local harpoon = require("harpoon")

	-- basic telescope configuration
	local conf = require("telescope.config").values
	local function toggle_telescope(harpoon_files)
		local file_paths = {}
		for _, item in ipairs(harpoon_files.items) do
			table.insert(file_paths, item.value)
		end

		require("telescope.pickers")
			.new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			})
			:find()
	end

	return {

		-- -- Add current file to harpoon
		-- vim.keymap.set("n", "<C-e>", function()
		-- 	harpoon:list():add()
		-- end, { desc = "Add file to harpoon" }),

		vim.keymap.set("n", "<C-e>", function()
			harpoon:list():add()
			local filename = vim.fn.expand("%:t")
			if filename ~= "" then
				vim.notify("Added '" .. filename .. "' to harpoon", vim.log.levels.INFO)
			else
				vim.notify("Added buffer to harpoon", vim.log.levels.INFO)
			end
		end, { desc = "Add file to harpoon" }),

		-- Remove current file from harpoon
		vim.keymap.set("n", "<C-d>", function()
			local filename = vim.fn.expand("%:t")
			harpoon:list():remove()
			if filename ~= "" then
				vim.notify("Removed '" .. filename .. "' from harpoon", vim.log.levels.WARN)
			else
				vim.notify("Removed buffer from harpoon", vim.log.levels.WARN)
			end
		end, { desc = "Remove all files from harpoon" }),

		-- Toggle harpoon telescope menu
		vim.keymap.set("n", "<leader>e", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Harpoon telescope menu" }),
	}
end

return M
