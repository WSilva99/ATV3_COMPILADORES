# Compiladores - Atividade 3

Para executar o projeto será preciso: Flex, Bison e GCC;

## Calculadora Requisitos

- [x] Conter um arquivo com o analisador léxico, capaz de reconhecer variáveis, operadores matemáticos e números reais.
- [x] Conter um arquivo com o analisador sintático, organizado e capaz de reconhecer e realizar as operações
- [x] Indicadores de início e m do programa
- [ ] Permitir declaração de variáveis e/ou inicialização das mesmas. Em uma única linha ou não.
- [x] Variáveis podem ser compostas por um ou mais caracteres
- [x] As operações matemáticas reconhecidas devem ser: soma, subtração, multiplicação, divisão, exponenciação e radiciação.
- [x] As operações devem ser reconhecidas com números, variáveis ou expressões.
- [ ] Obedecer a correta precedência de operadores matemáticos e parênteses
- [x] Aceitar operações de leitura e escrita para as variáveis
- [x] Breve documentação informado a sintaxe reconhecida pelo seu analisador
- [x] Fornecer um arquivo de exemplo para utilização do seu analisador

### Windows - Criar um arquivo make.bat com o seguinte código e executá-lo no terminal:

```
flex -i lex_file.l
bison bison_file.y
gcc bison_file.tab.c -o Compiler -lfl -lm
.\Compiler
```

### Linux - Criar um arquivo makefile com o seguinte código e executá-lo no terminal:

```
all: lex_file.l bison_file.y
	clear
	flex -i lex_file.l
	bison bison_file.y
	gcc bison_file.tab.c -o Compiler -lfl -lm
	./Compiler
```

## Uso da linguagem

### Início e fim do programa

```
start
  ...
end
```

### Atribuição de valores às variáveis

```
a = 3.8;
b = 93;
c = a + b;
```

### Operação de leitura

```
read(variable);
```

### Operação de escrita

```
write(variable);
write(2.6 + 9);
write(5);
```

### Operações matemáticas

<table>
    <thead>
    	<th>Operação</th>
        <th>Exemplo</th>
    </thead>
    <tbody>
    	<tr>
        	<td>Adição</td>
            <td>a + b ou 5 + 3</td>
        </tr>
        <tr>
        	<td>Subtração</td>
            <td>a - b ou 5 - 3</td>
        </tr>
        <tr>
        	<td>Multiplicação</td>
            <td>a * b ou 5 * 3</td>
        </tr>
        <tr>
        	<td>Divisão</td>
            <td>a / b ou 4 / 2</td>
        </tr>
        <tr>
        	<td>Exponenciação</td>
            <td> a ^ b ou 4 ^ 2</td>
        </tr>
        <tr>
        	<td>Radiciação</td>
            <td> ~a ou ~25</td>
        </tr>
    </tbody>
</table>
