import 'package:just_lists/constants.dart';
import 'package:just_lists/domain/model/lista.dart';
import 'package:just_lists/domain/service/lista_service.dart';

class CreateRegistroModalController{

    var _svc = ListaService();

    Lista lista;

    late int valoresPos;

    var _validos = <bool>[];

    CreateRegistroModalController(this.lista, editMode){

        if (editMode){
            valoresPos = lista.registros[0]!.valores!.length-1;
            for (int i = 0; i < lista.registros.length; i++){
                _validos.add(false);
            }
        }
        else{
            for (int i = 0; i < lista.registros.length; i++){
                if (lista.registros[i]!.valores == null){
                    lista.registros[i]!.valores = [];
                }
                
                lista.registros[i]!.valores!.add("");
                _validos.add(false);
            }
            valoresPos = lista.registros[0]!.valores!.length-1;
        }

    }


    bool _checkValido(){
        _validos.forEach(print);
        for (var valido in _validos){
            
            if (valido == false){
                
                return false;
            }
        }
        print("yep");
        return true;
    }

    bool get isAllValido => _checkValido();

    salvar() async {
        await _svc.salvar(lista);
    }

    String getStartingValueFrom(int regIndex){
        return lista.registros[regIndex]!.valores![valoresPos] ?? "";
    }


    String? Function(String?, int) getValidator(int index){
        var tipo = lista.registros[index]!.tipo;

        if (tipo == Constants.TYPE_NAMES[Constants.TYPE_INT]){
            return validarNumero;
        }
        else if (tipo == Constants.TYPE_NAMES[Constants.TYPE_DOUBLE]){
            return validarPreco;
        }

        return (a, b) {
            _validos[index] = true;
            return null;
        };
    }


    addValOn(int indexRegistro, String val){
        lista.registros[indexRegistro]!.valores![this.valoresPos] = val;
    }

    String? validarNumero(String? numero, int index){
        try {
            int.parse(numero!);
            _validos[index] = true;
            return null;
        }
        catch (err) {
            _validos[index] = false;
            return "Somente números";
        }
    }

    String? validarPreco(String? preco, int index){
        preco?.replaceAll(",", ".");

        try{
            double.parse(preco!);
            _validos[index] = true;
            return null;
        }
        catch (err){
            _validos[index] = false;
            return "Somente preços";
        }
    }

}


