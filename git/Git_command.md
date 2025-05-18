git init  / inicializacia gitu



Odpojenie od povodneho projektu/repozitara
    git remote remove origin

Pripojenie k novemu repozitaru 
    git remote add origin https://github.com/Orimslav/linux_scada_ofz.git       //http

    git remote add origin git@github.com:Orimslav/linux_scada_ofz.git           //ssh


Pridanie vsetkych suborov do gitu
    git add .

Vytvorenie usera:
    git config user.name "Orimslav"
    git config user.email "orimslav@example.com"

Vytvorenie commitu s popisom aktualneho stavu
    git commit -m "Initial commit from production server"

Odoslanie projektu do noveho repozitara
    git push -u origin master

Postup na nastavenie SSH deploy key
    vytvorenie kluca
        ssh-keygen -t ed25519 -C "scadauser@production"

    potom vsetko potvrdit enter, ked sa kluc vygeneruje, treba zdat tento prikaz ktory zobrazi ssh key
        cat ~/.ssh/id_ed25519.pub

    zobrazi sa nieco taketo, treba to skopirovat do github /settings/keys
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID9bN1vUo7KZxU2O1Df3qP+0+u7yM1ZExAMPLEKEYrRk scadauser@production

Teraz nastav GitHub repozitár ako SSH remote, aby Git vedel používať tvoj nový deploy key:
    git remote set-url origin git@github.com:Orimslav/linux_scada_ofz.git

Otestuj, či SSH pripojenie na GitHub funguje:
    ssh -T git@github.com

    zobrazi sa toto
        The authenticity of host 'github.com (140.82.121.3)' can't be established.
        ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/xxxxxxxxxxxxxxxxxxxq.
        This key is not known by any other names.
        Are you sure you want to continue connecting (yes/no/[fingerprint])?

    potvrdit yes

    zobrazi sa spava 
        Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
        Hi Orimslav/linux_scada_ofz! You've successfully authenticated, but GitHub does not provide shell access.

Hotovo 👍