handle_open = fn 
 {:ok, file}  -> "#{IO.read(file, :line)}"
 {_,   error} -> "Error:  #{:file.format_error(error)}"
end
IO.puts handle_open.(File.open("hello.txt"))      # call with a file that exists
IO.puts handle_open.(File.open("nonexistent"))   # and then with one that doesn't

# File.cp_r("two-column-callout", "tmp-block")

# File.open "tmp-block/src/index.js", fn(file) ->
#   IO.read(file, :line) |> IO.inspect
# end



# File.open "templatecopy/sub-directory/index.js", fn(file) ->
#   IO.read(file, :line) |> IO.inspect
# end

File.rm_rf("templatecopy")

File.cp_r("template", "templatecopy")

case File.read("templatecopy/sub-directory/index.js") do
  {:ok, body}      -> IO.puts(body)
  str = String.replace(body, "you", "hey you", global: true)
  {:error, reason} -> IO.puts("There was an error: #{reason}")
end



File.stream!("hello.txt") 
|> Stream.map(&String.strip/1)
|> Stream.with_index
|> Stream.map(fn ({line, index}) -> IO.puts "#{index + 1} #{line}" end)
|> Stream.run

IO.puts(String.length("hello.txt"))


File.write("example.txt", "Hello, <%= name %>!")
EEx.eval_file "example.txt", [name: "World"]




# defmodule Render do
# 	require EEx
# 	EEx.function_from_file(:def, :base,
# 		EEx.eval_file "./template/index.js.eex",
# 		[name: "baz"]
# 		)

# end





# https://hexdocs.pm/elixir/String.html

