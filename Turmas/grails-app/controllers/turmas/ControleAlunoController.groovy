package turmas

class ControleAlunoController {

   def index() { 
        
        def lista = Aluno.list()
       render(view:"/controleAluno/index", model:[alunos: lista])
       
    }
    
    def adicionar(){
        Aluno novoAluno = new Aluno()
        novoAluno.nome
        novoAluno.endereco
        novoAluno.dataNascimento
        novoAluno.matricula = 0
        
     
        render(template:"/controleAluno/form", model:[controleAluno: novoAluno])
    
    }
    
    def alterar() {
        Aluno aluno = Aluno.get(params.id)
            render(template:"/controleAluno/form", model:[controleAluno, aluno])
//        println(render)
        
    }
    
    def lista(){
        def lista = Aluno.list()
             render(template:"/controleAluno/lista", model:[alunos: lista])
    }
    
    def salvar(){
                
                Aluno aluno = null
                
		if (params.id) {
                        aluno = Aluno.get(params.id)
                    }else{
                           aluno = new Aluno()
		}		
		aluno.nome = params.nome
		aluno.endereco = params.endereco
		aluno.dataNascimento = params.dataNascimento
		aluno.matricula = params.matricula.toInteger()
		println(params)
		aluno.validate()
		if (!aluno.hasErrors()){
			aluno.save(flush:true)
			render("Salvou com sucesso")
                        println(aluno.errors)
		}else{ 
                    
                        println(aluno.errors)
			render("Ops... deu pau!")
                        println(aluno.errors)
                       
		}
	}
        
    def excluir(){
        Aluno aluno = Aluno.get(params.id)
        aluno.delete(flush:true)
        
        def lista = Aluno.list()
        render(template:"/controleAluno/lista", model:[alunos: lista])
    }
    
}
