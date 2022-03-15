package pessoas

abstract class Pessoa {
    
    String nome
    String endereco
    String dataNascimento

    static constraints = {
        
        nome nullable: false, blank: false
        endereco nullable: false, blank: false
        dataNascimento nullable: false, blank: false
    }
}
