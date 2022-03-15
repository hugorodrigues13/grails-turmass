package turmas

import pessoas.Pessoa

class Professor extends Pessoa{
    
//    static hasMany = [turma: Turma]
    
    static constraints = {
    }
    
    static mapping = {
//        turma joinTable:[name: "turma_professor", key: "id_professor", column: "id_turma"]
    }
}
