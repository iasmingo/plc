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

### Objetos
Os elementos dos tipos definidos pela programadora (**classes**) são **objetos**. 

*Objeto conta bancária*
- Atributos: saldo, número
- Métodos (operações): crédito, débito

**Estado:** o estado atual da objeto consiste dos valores atuais dos seus atributos. No caso do objeto *conta bancária*, um exemplo de estado seria: {saldo = 875,32, número = 21.342-7}.

**Obs.:** o estado é **encapsulado**, só pode ser modificado pelos métodos do próprio objeto!