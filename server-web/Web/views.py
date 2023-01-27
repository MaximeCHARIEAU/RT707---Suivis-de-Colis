from django.shortcuts import render

# Create your views here.
from .forms import NomPrenomAgeForm
from .models import Personne

def afficher_formulaire(request):
    form = NomPrenomAgeForm()
    return render(request, 'template.html', {'form': form})


def soumettre_formulaire(request):
    if request.method == 'POST':
        form = NomPrenomAgeForm(request.POST)
        if form.is_valid():
            # Récupération des données soumises
            nom = form.cleaned_data['nom']
            prenom = form.cleaned_data['prenom']
            age = form.cleaned_data['age']
            # Création d'un nouvel objet Personne
            personne = Personne(nom=nom, prenom=prenom, age=age)
            # Enregistrement de l'objet dans la base de données
            personne.save()
            # Redirection vers la page de confirmation
            return redirect('confirmation')
    else:
        form = NomPrenomAgeForm()
    return render(request, 'formulaire.html', {'form': form})
