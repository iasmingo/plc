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

#### Estado 
- O estado atual da objeto consiste dos valores atuais dos seus atributos
- Exemplo: {saldo = 875,32, número = 21.342-7}.

**Obs. 1:** o estado é **encapsulado**, só pode ser modificado pelos métodos do próprio objeto!

#### Criação de objetos
Um objeto é criado através do operador **new**: new NomeDaClasse(). Assim:
- (1) O computador cria um objeto da classe NomeDaClasse e armazena na sua memória
- (2) Inicializa os atributos do objeto usando o construtor da classe (nesse exemplo, não tem parâmetros)
- (3) Associa uma referência ao objeto
- (4) Devolve a referência como resultado da avaliação

**Obs. 2:** a ordem de execução do **new** é normalmente 1-2-3-4; mas pode ser 1-3-4-2 ou 1-3-2-4.

#### Remoção de objetos
- Não existe mecanismo de remoção explícita de objetos da memória em Java
- O **Garbage Collector** de Java elimina um objeto da memória quando este não é mais referenciado
- O método **finalize** é um método da classe Object que é chamado pelo garbage collector antes de um objeto ser removido da memória (a programadora pode sobrescrevê-lo, e aí uma última ação é feita sobre o objeto antes dele morrer) 

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

### Referências para objetos
Todo o acesso e manipulação de objetos é feito **indiretamente**, através de uma referência para o objeto — ela é a "identidade" do objeto.

Referências são valores!

class Referencia {
    void redefine(Conta a) {
        Conta b = new Conta(“567-8”,55);
        a.creditar(100);
        a = b;
        a.creditar(100);
    }
}

Aqui, 'a' armazena a referência para um objeto e é passado como argumento. A partir de 'a', é possível mudar o estado desse objeto por meio do método creditar. Em seguida, é atribuída a 'a' a referência armazenada em 'b', portanto 'a' agora referencia outro objeto. Quando o método creditar é chamado novamente, ele repercute nesse outro objeto.

#### This

class Conta {
    ...
    void transferir(Conta c, double v) {
        this.debitar(v);
        c.creditar(v);
    }
}

Na chamada x.transferir(y, v), a variável **this** conterá a referência armazenada em **x** e **c** conterá a referência armazenada em **y**.

Além disso, a variável:
- Só pode ser lida, não pode-se atribuir um valor a ela
- Só pode aparecer dentro de métodos não estáticos (métodos estáticos = pertencem à classe, não a uma instância específica)
- Contém a referência para o objeto no qual um dado método está sendo executado

### Variáveis locais
- São declaradas dentro de um método ou construtor
- Só existem durante a execução do método ou construtor
- Não são inicializadas automaticamente
- Servem para armazenar resultados temporários que serão utilizados depois
- Melhoram a legibilidade do método ou do construtor, quebrando uma expressão grande em expressões menores

**Ex. 1:**
{
    ...
    Endereco e;
    e = new Endereco;
    ...
}

**Ex. 2:**
class Cliente {
    private String;
    private Endereco endereco;
    
    Cliente(String n) {
        Endereco e;
        e = new Endereco();
        endereco = e;
        nome = n;
    }
}

No **Ex. 1**, temos a utilização de uma variável para armazenar a referência do objeto criado. Já no **Ex. 2**, temos a referência do objeto criado sendo armazenada numa variável local. Para que a referência não seja perdida ao final da execução do construtor, passamos ela para o atributo endereco, que é uma variável normal.

### Aliasing
É quando mais de uma variável armazena a referência para um dado objeto.

Conta a = new Conta("12-7", 34.00);
Conta b;
b = a;
b.creditar(100);
console.println(a.getSaldo());

Nesse caso, qualquer efeito via b é refletivo via a.

### Passagem de parâmetro por valor
- Quando uma variável é inserida como argumento de um método chamado, o valor armazenado por ela é copiado, CASO A VARIÁVEL NÃO ARMAZENE UMA REFERÊNCIA
- Qualquer manipulação feita com essa cópia não repercute no objeto