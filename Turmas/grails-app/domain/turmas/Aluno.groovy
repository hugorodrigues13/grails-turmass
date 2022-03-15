package turmas

import pessoas.Pessoa

class Aluno extends Pessoa {
    Integer matricula
    
    static hasMany = [turma: Turma]
//    static belongsTo = [Turma]
    
    static constraints = {
        
    }
    
     static mapping = {
        turma joinTable:[name: "turma_aluno", key: "id_aluno", column: "id_turma"]
//         turma joinTable:[name: "turma_com_alunos", key: "id_aluno", column: "id_turma"]
    }
   
}
