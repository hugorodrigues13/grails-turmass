package turmas

class ControleProfessorController {

    def index() { 
        
        def lista = Turma.list()
       render(view:"/controleProfessor/index", model:[professor: lista])
       
    }
    
    def adicionar(){
        Professor novoProfessor = new Professor()
        novoProfessor.nome
        novoProfessor.endereco
        novoProfessor.dataNascimento
        
     
        render(template:"/controleProfessor/form", model:[controleProfessor: novoProfessor])
    
    }
    
    def alterar() {
        Professor professor = Professor.get(params.id)
            render(template:"/controleProfessor/form", model:[controleProfessor, professor])
//        println(render)
        
    }
    
    def lista(){
        def lista = Professor.list()
             render(template:"/controleProfessor/lista", model:[professor: lista])
    }
    
    def salvar(){
                
                Professor professor = null
                
		if (params.id) {
                        professor = Professor.get(params.id)
                    }else{
                           professor = new Professor()
		}		
		professor.nome = params.nome
		professor.endereco = params.endereco
		professor.dataNascimento = params.dataNascimento
		println(params)
		professor.validate()
		if (!professor.hasErrors()){
			professor.save(flush:true)
			render("Salvou com sucesso")
                        println(professor.errors)
		}else{ 
                    
                        println(professor.errors)
			render("Ops... deu pau!")
                        println(professor.errors)
                       
		}
	}
        
    def excluir(){
        Professor professor = Professor.get(params.id)
        professor.delete(flush:true)
        
        def lista = Professor.list()
        render(template:"/controleProfessor/lista", model:[professor: lista])
    }
    
}
