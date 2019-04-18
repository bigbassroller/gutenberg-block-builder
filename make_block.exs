defmodule MakeBlock do
	require EEx

	block_dash_name = "image-strip"
	block_space_name = "image strip"
  block_name = "image_strip"

  # block_template_dir = File.ls("block-template")
  # File.write("#{block_dash_name}/block_template_dir.js", block_template_dir)
  # IO.inspect to_string(block_template_dir)
  case File.ls("block-template") do
      {:ok, body} -> IO.inspect(body)
      :error -> "query error"
  end

	File.mkdir_p(block_dash_name)

  packagejson = EEx.eval_file "block-template/package.json.eex", [block_dash_name: block_dash_name]
  File.write("#{block_dash_name}/package.json", packagejson)

  File.mkdir_p("#{block_dash_name}/src")
  srcindexjs = EEx.eval_file "block-template/src/index.js.eex", [block_dash_name: block_dash_name, block_space_name: block_space_name]
  File.write("#{block_dash_name}/src/index.js", srcindexjs)

  indexphp = EEx.eval_file "block-template/index.php.eex", [block_dash_name: block_dash_name, block_name: block_name]
  File.write("#{block_dash_name}/index.php", indexphp)

  editorcss = EEx.eval_file "block-template/editor.css.eex", [block_dash_name: block_dash_name, block_name: block_name]
  File.write("#{block_dash_name}/editor.css", editorcss)

  stylecss = EEx.eval_file "block-template/style.css.eex", [block_dash_name: block_dash_name, block_name: block_name]
  File.write("#{block_dash_name}/style.css", stylecss)

  File.cp_r("block-template/languages", "#{block_dash_name}/languages")
  File.cp("block-template/.gitignore", "#{block_dash_name}/.gitignore")
end