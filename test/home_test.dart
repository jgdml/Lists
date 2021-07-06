import 'package:flutter_test/flutter_test.dart';
import 'package:just_lists/validations/home_validation.dart';

void main() {
    group("Home", (){

        final validator = HomeValidator();

        String? nulo;

        test("Teste de Titulo da Lista", () {
            expect(validator.validarTituloLista(nulo), ListValidationResult.NULO);
            expect(validator.validarTituloLista(""), ListValidationResult.VAZIO);
            expect(validator.validarTituloLista("ab"), ListValidationResult.CURTO);
            expect(validator.validarTituloLista("Titulo Valido"), ListValidationResult.VALIDO);
        });
    
    });
}