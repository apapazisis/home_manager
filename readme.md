1. Για την εγκατάσταση του Nix Package Manager
```
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
```

2. Ενεργοποίηση των Flakes για να μπορεί να τα διαβάζει το Nix. Tα flakes είναι το αντίστοιχο package.json αρχείο.

Πιθανόν να έχει δημιουργηυθεί σε global mode το αρχείο
/etc/nix/nix.conf με ενεργοποιημένα τα flakes οπότε η παρακάτω ρύθμισει να είναι optional

- Ρυθμίσεις που αφορούν μόνο τον χρήστη σου
```
mkdir -p ~/.config/nix
```

- Ρυθμίσεις που αφορούν ολόκληρο το σύστημα
```
mkdir -p /etc/nix/nix.conf
```

3. Στο flake.nix ορίζουμε 

nix-shell -p home-manager --run "home-manager switch -b backup --flake .#default --impure"