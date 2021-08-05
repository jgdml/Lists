enum ListValidationResult{
    VALIDO,
    NULO,
    VAZIO,
    CURTO
}

class HomeValidator{
    ListValidationResult validarTituloLista(String? titulo){
        if (titulo == null){
            return ListValidationResult.NULO;
        }
        else if (titulo.isEmpty){
            return ListValidationResult.VAZIO;
        }
        else if (titulo.length < 3){
            return ListValidationResult.CURTO;
        }
        else{
            return ListValidationResult.VALIDO;
        }
    }
}