-- custom filetypes
vim.filetype.add({
	extension = {
		smk = "snakemake",
		gotmpl = "gotmpl",
		tmpl = "gotmpl",
	},
	filename = {
		["Snakefile"] = "snakemake",
		["nextflow.config"] = "groovy",
	},
	pattern = {
		["Snakefile.*"] = "snakemake",
	},
})
