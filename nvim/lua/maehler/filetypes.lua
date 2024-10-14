-- custom filetypes
vim.filetype.add({
	extension = {
		smk = "snakemake",
	},
	filename = {
		["Snakefile"] = "snakemake",
		["nextflow.config"] = "groovy",
	},
	pattern = {
		["Snakefile.*"] = "snakemake",
	},
})
