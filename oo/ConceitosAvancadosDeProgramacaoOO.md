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

### Extends
- Subclasse **extends** superclasse
- Mecanismo para definição de herança e subtipos
- Herança simples: só pode herdar uma classe por vez

**Restrições:**
- Atributos e métodos privados são herdados, mas não podem ser acessados diretamente
- Qualificador **protected**: visibilidade restrita ao pacote e às subclasses de outros pacotes
- Construtores não são herdados
- Construtor default só é disponível se também for disponível na superclasse

