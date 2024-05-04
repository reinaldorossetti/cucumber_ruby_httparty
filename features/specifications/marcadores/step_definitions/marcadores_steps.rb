# language: pt
# encoding: utf-8

Dado("a string de entrada {string}") do |string|
  @text = string
end

Dado('os marcadores:') do |table|
  # Dado a string, faz um for each de caracteres, e inclue até encontrar o valor de pausa.
  # a regra do include? é usando o array caracteres_a_remover.
  # for each reduzido ex: @text.chars.each { |char| @caracteres_a_remover.include?(char) ? break : @new_text << char }
  @caracteres_a_remover = table.raw.flatten
  @new_text = ""
  @text.chars.each { |char|
    if @caracteres_a_remover.include?(char)
      break
    else
      @new_text << char
    end
  }
  @new_text = @new_text.strip
end

Então("a saída esperada é: {string}") do |string|
  expect(@new_text).to eq(string)
end
