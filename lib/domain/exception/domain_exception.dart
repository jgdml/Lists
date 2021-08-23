class DomainException{
    String causa;

    DomainException(this.causa);

    @override
    String toString(){
        return this.causa;
    }
}