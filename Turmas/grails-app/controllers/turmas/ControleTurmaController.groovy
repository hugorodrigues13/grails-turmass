package turmas

class ControleTurmaController {

    def index() { 
        
        def lista = Turma.list()
       render(view:"/controleTurma/index", model:[turmas: lista])
       
    }
    
    def adicionar(){
        Turma novaTurma=new Turma()
        novaTurma.codigo = 0
        novaTurma.disciplina
        novaTurma.horario
        novaTurma.qtdMaximaAlunos = 30
        novaTurma.alunosMatriculados = 0
//        novaTurma.professor = new Professor()
//        novaTurma.professor.nome
//        novaTurma.alunos = new Aluno()
//        novaTurma.alunos.nome
     
        render(template:"/controleTurma/form", model:[controleTurma: novaTurma])
    
    }
    
    def alterar() {
        Turma turma = Turma.get(params.id)
            render(template:"/controleTurma/form", model:[controleTurma, turma])
//        println(render)
        
    }
    
    def lista(){
        def lista = Turma.list()
             render(template:"/controleTurma/lista", model:[turmas: lista])
    }
    
    def salvar(){
                
                Turma turma = null
                
		if (params.id) {
                        turma = Turma.get(params.id)
                    }else{
                           turma = new Turma()
		}		
		turma.codigo = params.codigo.toInteger()
		turma.disciplina = params.disciplina
		turma.horario = params.horario
		turma.qtdMaximaAlunos = params.qtdMaximaAlunos.toInteger()
		turma.alunosMatriculados = params.alunosMatriculados.toInteger()
		println(params)
		turma.validate()
		if (!turma.hasErrors()){
			turma.save(flush:true)
			render("Salvou com sucesso")
                        println(turma.errors)
		}else{ 
                    
                        println(turma.errors)
			render("Ops... deu pau!")
                        println(turma.errors)
                       
		}
	}
        
    def excluir(){
        Turma turma = Turma.get(params.id)
        turma.delete(flush:true)
        
        def lista = Turma.list()
        render(template:"/controleTurma/lista", model:[turmas: lista])
    }
    
}
