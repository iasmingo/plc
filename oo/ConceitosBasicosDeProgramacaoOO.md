# Conceitos Básicos de Programação Orientada a Objetos

**Perguntas iniciais:**
- Que entidades realizam o serviço?
- Como as entidades interagem?
- Como cada entidade realiza os seus serviços?

### Interface
Uma interface indica os serviços, **operações**, a serem oferecidos por uma entidade.

**interface** ServicosAgencia {
    cadastrarCliente();
    cadastrarConta();
    efetuarLogin();
}

Para escrever um serviço de uma interface, temos que indicar a **assinatura** do serviço:
- Nome do serviço
- As informações de que o serviço necessita para ser realizado (parâmetros)
- Resultado gerado pelo serviço
- Os erros que podem ocorrer durante a execução do serviço (exceções)

interface ServicosAgencia {
    void cadastrarCliente (String nome, String endereco, ...);
    ...
}

### Exceções

interface ServicosAgencia {
    void cadastrarCliente (Cliente cliente)
        **throws ClienteExistenteException**; // "throws" = palavra reservada seguida dos nomes (separados por ",") dos tipos das exceções
    String cadastrarConta(Conta conta);
    boolean efetuarLogin(String senha, String agencia, String conta);
}

As execeções são agrupadas, classificadas em tipos. Alguns desses tipos, como **Exception**, são pré-definidos; outros, como **ClienteExistenteException**, precisam ser definidos pela programadora.

### Classes
Uma classe define um **tipo**, ou seja, é o conjunto de objetos com as mesmas características (métodos e atributos). Os elementos de uma classe, por sua vez, são *objetos* com os mesmos métodos e atributos.

class NomeDaClasse {
    CorpoDaClasse
}

O corpo de uma classe pode conter:
- atributos
- métodos
- construtores
- outras classes...

class Cliente {
    private String nome;
    private String cpf;
    private String endereco;
    ...
}

**Information hiding:** a palavra reservada **private** indica que os atributos só podem ser acessados (lidos ou modificados) pelas operações da classe correspondente 
- Java não obriga o uso de private, mas vários autores consideram isso uma pré-condição para programação orientada a objetos (**usar sempre!**)
- **Bug do milênio/y2k**: o encapsulamento proporciondo pelo private poderia ter evitado o problema, já que para modificar o atributo seria necessário um método, e esse método poderia conter um lógica para validação do valor inserido

Os **atributos** a serem definidos em uma classe devem ser necessários para implementar pelo menos um dos **serviços** do sistema.

Os **métodos** a serem definidos em uma classe devem ser necessários para implementar pelo menos um dos **serviços** do sistema.

class Conta {
    ...
    void debitar(double valor) {
        saldo = saldo - valor;
    }
    String getNumero() {
        return numero;
    }
    double getSaldo() {
        return saldo;
    }
}

Além de métodos e atributos, uma classe pode conter **construtores** definindo como os atributos devem ser inicializados.

class Conta {
    ...
    Conta () {
        saldo = 0;
        numero = "";
    }
}

**Obs. 1:** este seria um construtor sem parâmetros.
**Obs. 2:** quando a inicialização é feita com valores fixos, tanto faz a classe não ter construtor (e os valores sem atribuídos diretamente na declaração dos atributos) quanto ter.

Caso não seja definido um construtor na classe, um construtor implícito default, equivalente a "NomeDaClasse() {}" é fornecido, inicializando os atributos com seus valores default (0 para int, double e outros tipos númericos; false para boolean; null para os tipos referência (String, Conta, Cliente...)).

**Overloading:** é quando o mesmo nome é utilizado para representar mais de uma construção (método, construtor, atributo) — o nome fica **sobrecarregado**. Distingue-se uma construção da outra pelo uso de "()" ou pela **quantidade**, **ordem** e **tipos** dos parâmetros da construção. Caso a distinção não possa ser feita, é gerado um erro de compilação.

### Objetos
Os elementos dos tipos definidos pela programadora (**classes**) são **objetos**. 

*Objeto conta bancária*
- Atributos: saldo, número
- Métodos (operações): crédito, débito

**Estado:** o estado atual da objeto consiste dos valores atuais dos seus atributos. No caso do objeto *conta bancária*, um exemplo de estado seria: {saldo = 875,32, número = 21.342-7}.

**Obs.:** o estado é **encapsulado**, só pode ser modificado pelos métodos do próprio objeto!

### Tipos

#### Primitivos
- Ocupam tamanho fixo (exemplo: um int sempre ocupa exatamente 4 bytes)
- São armazenados diretamente na **stack** e têm acesso muito rápido
- int, boolean, double...

#### Referência
- Armazenam referências (endereços) para objetos que estão na memória **heap**, não os valores para objetos diretamente
- A referência está na stack, o objeto está na heap
- A referência tem tamanho fixo, mas o objeto referenciado pode ter tamanho variável
- String, objetos definidos pela programadora...

**Obs. 1:** os elementos de um tipo primitivo são **valores primitivos**, enquanto os elementos de um tipo referência são **referências** para objetos.

**Por que String é uma classe?**
- Têm tamanho variável, não podem ter tamanho fixo como primitivos
- Precisam de muitos métodos (substring(), split()...)
- São imutáveis por design, cada operação cria uma nova String (complicado de implementar como primitivo)
