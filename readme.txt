Vi har valgt den normale opgave, hvor der tages udgangspunkt i den udleverede kode.

Den genetiske algoritme kører på en timer, der er sat til 250 frames. Dette kan justeres, men 250 frames giver tid nok til at nå en runde, uden at vente forgæves på de biler der bare snurrer rundt.
Fitness beregningen fungerer ud fra variablerne redness og greenness, som allerede var udregnet i programmet. Der benyttes derfor ikke nogen laptime, men bilerne konvergerer stadig mod en optimal rute.
Derudover nedsættes fitness drastisk, hvis bilen bevæger sig uden for banen eller kører den gale retning. 
Bilen stoppes hvis den bevæger sig på det hvide, da den ellers kan bevæge sig på den sorte outline uden for banen og snyde vores fitness algoritme. Dette er gjort ud fra den whitedetection der forekom i programmet i forvejen.

Mutation sker ud fra den allerede tilfældige varians og bias, der var implementeret i sensorsystemet. Disse tilføjes bare en ny justerbar værdi, så generationerne udvikler sig i matingpoolen.
