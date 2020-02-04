if (typeof this.compteur == 'undefined') {
    this.compteur = 1;
}
function change (id)
{
   

    if (id=='+'){
        if (this.compteur==11)
        {
            return;
        }
        else
        {
        var elmt2=this.compteur;
        elmt2="s"+elmt2;
        var x=document.getElementById("texte");
        var elmt = x.getElementsByClassName (elmt2);
        var taille=elmt.length;
        for (var i=0; i<taille;i++)
        {
            elmt[i].style.color="black";
        }
        this.compteur++;
        }
        }
    if (id=='-'){
        if (this.compteur==1)
        {
            return;
        }
        else
        {
            this.compteur--;
            var elmt2=this.compteur;
            elmt2="s"+elmt2;
            var x=document.getElementById("texte");
            var elmt = x.getElementsByClassName (elmt2);
            var taille=elmt.length;
            for (var i=0; i<taille;i++)
            {
                elmt[i].style.color="white";
            }
        }   
        }


}
function affichage (id)
{
    this.compteur=1;
    do
    {
        var elmt2=this.compteur;
        elmt2="s"+elmt2;
        var x=document.getElementById("texte");
        var elmt = x.getElementsByClassName (elmt2);
        var taille=elmt.length;
        for (var i=0; i<taille;i++)
        {
            if (this.compteur<id){
            elmt[i].style.color="black";
            }
            
            else{
            elmt[i].style.color="white";
            }
        }
        this.compteur++;
    }while(this.compteur<11);
    this.compteur=id;
}
