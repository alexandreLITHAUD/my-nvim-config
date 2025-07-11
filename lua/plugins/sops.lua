return {
	"lucidph3nx/nvim-sops",
	event = { "BufReadPre", "BufNewFile *.sops.*" },
	opts = {
		enabled = true,
		debug = false,
		binPath = "sops",
		defaults = {
			awsProfile = "AWS_PROFILE",
			ageKeyFile = vim.fn.expand("~/.config/sops/age/key.txt"),
			gcpCredentialsPath = "GOOGLE_APPLICATION_CREDENTIALS",
		},
	},
}
