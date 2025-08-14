# Herança, subtipos, polimorfismo e dynamic binding

### Herança
Vem da necessidade de estender classes:
- Alterar classes já existentes e adicionar propriedades ou comportamentos para representar outra classe de objetos
- Criar uma hierarquia de classes que "herdam" propriedades e comportamentos de outra classe e definem novas propriedades e comportamentos

O uso de herança também promove:
- Reuso de código, já que a descrição da **superclasse** pode ser usada para definir a **subclasse**
- Extensibilidade, pois algumas operações da **superclasse** podem ser redefinidas na **subclasse**

### Subclasse

**Comportamento:**
- Objetos da subclasse comportam-se como os objetos da superclasse

**Substituição:**
- Objetos da subclasse podem ser usados no lugar de objetos da superclasse

***Exemplo:***

public class PoupancaD {
    public PoupancaD (String n) {}
    public void creditar (double valor) {}
    public void debitar (double valor) {}
    public String getNumero() {}
    public double getSaldo() {}
    public void renderJuros(double taxa) {}
}

public class BancoD {
    public BancoD () {}
    public void cadastrarConta(Conta c) {}
    public void cadastrarPoupanca(PoupancaD p) {}
    public void creditarConta(String numero,
    double valor) {}
    public void creditarPoupanca(String numero, double valor) {}
    // ...
}

Problema: PoupancaD é apenas a extensão da definição de Conta. Clientes de Conta que também precisam trabalhar com PoupancaD terão que ter código especial para manipular poupanças. **É necessário refletir a relação entre tipos do "mundo real".**

O mais adequado seria:

public class Poupanca extends Conta {
    public Poupanca (String numero) {}
    public void renderJuros(double taxa) {}
}

### Pacotes
São como "pastas" que organizam classes relacionadas.

src/
├── com.banco.contas/
│   ├── Conta.java
│   ├── Poupanca.java
│   └── ContaEspecial.java
│
├── com.banco.clientes/
│   ├── Cliente.java
│   └── ClienteVIP.java
│
├── com.banco.seguranca/
│   ├── Autenticador.java
│   └── Criptografia.java
│
└── br.gov.banco_central/
    └── Regulacao.java

**Declaração:**
// Arquivo: com/banco/contas/Conta.java
package com.banco.contas;        // Declara que está neste pacote

public class Conta {
    String agencia;              // Package-private: só com.banco.contas pode ver
    private double saldo;        // Privado: só esta classe
    
    void operacaoInterna() {     // Package-private: só com.banco.contas
        System.out.println("Operação interna");
    }
}

### Modificadores

**Private:**
- Atributos e métodos lidos/modificados apenas dentro da própria classe
- Um atributo privado, por exemplo, só pode ser acessado por meio de um método não-privado da própria classe
- Um método privado costuma ser um método auxiliar para outros métodos não-privados da própria classe (métodos de validação etc.)
- Construtores de uma classe podem modificar seus atributos privados!

**Protected:**
- Atributos e métodos lidos/modificados por qualquer um dentro de um mesmo pacote OU por subclasses em pacotes diferentes

**Public:**
- Atributos e métodos lidos/modificados por qualquer um, inclusive em outro pacote
- API pública da classe

**Package-private (sem modificador):**
- Atributos e métodos lidos/modificados por qualquer um dentro de um mesmo pacote (subclasses APENAS se estiverem no mesmo pacote)

### Extends
- Subclasse **extends** superclasse
- Mecanismo para definição de herança e subtipos
- Herança simples: só pode herdar uma classe por vez

**Restrições:**
- Construtores não são herdados, subclasse deve criar seus próprios construtores
- Construtor default só é disponível se também estiver disponível na superclasse

public class Pessoa {
    private String nome;
    private int idade;
    
    // Construtor da superclasse
    public Pessoa(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }
    
    public String getNome() { return nome; }
    public int getIdade() { return idade; }
}

public class Funcionario extends Pessoa {
    private double salario;
    
    // CORRETO - criar construtor na subclasse
    public Funcionario(String nome, int idade, double salario) {
        super(nome, idade);      // Chama construtor da superclasse
        this.salario = salario;
    }
    
    // Pode criar outros construtores também
    public Funcionario(String nome, int idade) {
        super(nome, idade);      // Chama construtor da superclasse
        this.salario = 0.0;      // Valor padrão
    }
    
    public double getSalario() { return salario; }
}

### Dynamic Binding
É o processo onde a escolha de qual método executar é feita em tempo de execução (runtime), baseada no tipo real do objeto, não no tipo da variável.

***Static Binding***
public class Exemplo {
    public static void metodoEstatico() {
        System.out.println("Método estático");
    }
    
    public void metodoSobrecarregado(int x) {
        System.out.println("Recebeu int: " + x);
    }
    
    public void metodoSobrecarregado(String s) {
        System.out.println("Recebeu String: " + s);
    }
}

// Em tempo de COMPILAÇÃO, Java já sabe qual método chamar:
Exemplo.metodoEstatico();           // Ligação estática
exemplo.metodoSobrecarregado(10);   // Ligação estática (por tipo do parâmetro)
exemplo.metodoSobrecarregado("oi"); // Ligação estática (por tipo do parâmetro)

***Dynamic Binding***
// Em tempo de EXECUÇÃO, Java decide qual método chamar:
Conta conta = new Poupanca();       // Tipo da variável: Conta
                                    // Tipo do objeto: Poupanca
conta.creditar(100);                // Qual creditar()? Decide em runtime!

**Polimorfismo:** é a capacidade de um mesmo código se comportar de maneiras diferentes dependendo do tipo do objeto que está sendo usado!
