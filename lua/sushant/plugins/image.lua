return {
	"3rd/image.nvim",

	build = false,

	opts = {
		backend = "kitty",
		processor = "magick_cli",

		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = false,
				only_render_image_at_cursor = false,
				filetypes = { "markdown" },
			},
		},

		max_width_window_percentage = 100,
		max_height_window_percentage = 100,

		window_overlap_clear_enabled = true,
		editor_only_render_when_focused = false,
	},
}
