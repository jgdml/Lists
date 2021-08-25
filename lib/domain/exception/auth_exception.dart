class AuthException{
    String causa;

    AuthException(this.causa);

    @override
    String toString(){
        return this.causa;
    }
}