largeur=70;
ep=25;
hauteur=60;
r_filament=1.85;
r_m3=2;
ecrou_m3=3.2;
ecart_pignon=4+1.1;
ecart_605=7+1.5;

long_605=30;
ep_605=10;
r_m5=2.9;

module double_extrudeur(){
	difference(){
		cube([largeur,hauteur,ep]);

		//trous généraux pour passage filament
		translate([17.7,-5,ep/2]){rotate([-90,0,0])cylinder(r=r_filament, h=hauteur+10, $fn=50);}
		translate([52.3,-5,ep/2]){rotate([-90,0,0])cylinder(r=r_filament, h=hauteur+10, $fn=50);}

		//trous de fixation sur plaque alu
		translate([5,-5,ep/2]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		translate([largeur-5,-5,ep/2]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		translate([5,10-4,ep/2]){rotate([-90,30,0])cylinder(r=ecrou_m3, h=5, $fn=6);}
		translate([largeur-5,10-4,ep/2]){rotate([-90,30,0])cylinder(r=ecrou_m3, h=5, $fn=6);}

		//trous pour fixation des moteurs gauche
		translate([17.7+ecart_pignon,10,-5]){cylinder(r=r_m3, h=ep+10, $fn=50);}
		translate([17.7+ecart_pignon,10+44.55,-5]){cylinder(r=r_m3, h=ep+10, $fn=50);}

		translate([17.7+ecart_pignon,10,-0.01]){cylinder(r=4, h=9, $fn=50);}
		translate([17.7+ecart_pignon,10+44.55,-0.01]){cylinder(r=4, h=9, $fn=50);}

		//trous pour fixation des moteurs droite
		translate([52.3-ecart_pignon,10,-5]){cylinder(r=r_m3, h=ep+10, $fn=50);}
		translate([52.3-ecart_pignon,10+44.55,-5]){cylinder(r=r_m3, h=ep+10, $fn=50);}

		translate([52.3-ecart_pignon,10,ep-9]){cylinder(r=4, h=ep+10, $fn=50);}
		translate([52.3-ecart_pignon,10+44.55,ep-9]){cylinder(r=4, h=ep+10, $fn=50);}

		//extrusions pour encastrement bloc moteur et pignon gauche
		translate([17.7+ecart_pignon,10+44.55/2,-5]){cylinder(r=5, h=ep+10, $fn=100);}
		translate([17.7+ecart_pignon,10+44.55/2,ep-3]){cylinder(r=11.2, h=ep, $fn=100);}
		translate([17.7+ecart_pignon,10+44.55/2,ep-10]){cylinder(r=7, h=ep, $fn=100);}

		//extrusions pour encastrement bloc moteur et pignon droite
		translate([52.3-ecart_pignon,10+44.55/2,-5]){cylinder(r=5, h=ep+10, $fn=100);}
		translate([52.3-ecart_pignon,10+44.55/2,-0.01]){cylinder(r=7, h=9, $fn=100);}
		translate([52.3-ecart_pignon,10+44.55/2,8.98]){cylinder(r1=7, r2=5, h=1, $fn=100);}
		translate([52.3-ecart_pignon,10+44.55/2,-0.01]){cylinder(r=11.2, h=3, $fn=100);}
		translate([52.3-ecart_pignon,10+44.55/2,2.98]){cylinder(r1=11.2, r2=7, h=2, $fn=100);}
		
		
		//trous pour roulements 605ZZ
		hull(){
			translate([17.7-ecart_605,10+44.55/2,-5]){cylinder(r=7.5, h=ep+10, $fn=100);}
			translate([17.7-ecart_605+10,10+44.55/2,-5]){cylinder(r=5, h=ep+10, $fn=100);}
		}

		hull(){
			translate([52.3+ecart_605,10+44.55/2,-5]){cylinder(r=7.5, h=ep+10, $fn=100);}
			translate([52.3+ecart_605-10,10+44.55/2,-5]){cylinder(r=5, h=ep+10, $fn=100);}
		}
		
		

		//extrusions pour libérer les roulements
		translate([-5,10,-5]){cube([17.7-ecart_605+5,hauteur,ep+10]);}
		translate([52.3+ecart_605,10,-5]){cube([17.7-ecart_605+5,hauteur,ep+10]);}

		//extrusion pour libérer les vis de fixation des courroies
		translate([largeur/2-14,-5,-5]){cube([28,9,ep+10]);}

		//extrusion haute pour alléger la pièce
		hull(){
			translate([largeur/2,hauteur/2+10,-5]){cylinder(r=4, h=ep+10, $fn=100);}
			translate([largeur/2,hauteur+20,-5]){cylinder(r=10, h=ep+10, $fn=100);}
		}

		//extrusion basse pour alléger la pièce
		hull(){
			translate([largeur/2,hauteur/2-10,-5]){cylinder(r=4, h=ep+10, $fn=100);}
			translate([largeur/2,-10,-5]){cylinder(r=10, h=ep+10, $fn=100);}
		}

		//extrusions pour bloquer les têtes
		translate([17.7,-5,ep/2]){rotate([-90,0,0])cylinder(r=5, h=12, $fn=100);}
		translate([17.7,-5,ep/2]){rotate([-90,0,0])cylinder(r=8.5, h=9, $fn=100);}
		translate([52.3,-5,ep/2]){rotate([-90,0,0])cylinder(r=5, h=12, $fn=100);}
		translate([52.3,-5,ep/2]){rotate([-90,0,0])cylinder(r=8.5, h=9, $fn=100);}

		//trous traversants pour serrer les ressorts
		translate([-5,10+44.55/2-15+5,6]){rotate([0,90,0])cylinder(r=r_m5, h=100, $fn=50);}
		translate([-5,10+44.55/2-15+5,6]){rotate([0,90,0])cylinder(r=r_m5+0.5, h=44, $fn=50);}
		

		translate([-5,10+44.55/2-15+5,ep-6]){rotate([0,90,0])cylinder(r=r_m5, h=100, $fn=50);}
		translate([31,10+44.55/2-15+5,ep-6]){rotate([0,90,0])cylinder(r=r_m5+0.5, h=100, $fn=50);}
		

		translate([-5,10+44.55/2-15+long_605-5,6]){rotate([0,90,0])cylinder(r=r_m5, h=100, $fn=50);}
		translate([-5,10+44.55/2-15+long_605-5,6]){rotate([0,90,0])cylinder(r=r_m5+0.5, h=40, $fn=50);}
		

		translate([-5,10+44.55/2-15+long_605-5,ep-6]){rotate([0,90,0])cylinder(r=r_m5, h=100, $fn=50);}
		translate([31,10+44.55/2-15+long_605-5,ep-6]){rotate([0,90,0])cylinder(r=r_m5+0.5, h=100, $fn=50);}

		//extrusions pour alléger les côtés de la pièce
		hull(){
			translate([10,15,-5]){cylinder(r=5, h=ep+10, $fn=50);}
			translate([10,hauteur-10,-5]){cylinder(r=5, h=ep+10, $fn=50);}
		}

		hull(){
			translate([largeur-10,15,-5]){cylinder(r=5, h=ep+10, $fn=50);}
			translate([largeur-10,hauteur-10,-5]){cylinder(r=5, h=ep+10, $fn=50);}
		}


	}
}

module support_605(){
	difference(){
		cube([ep,long_605,ep_605+1.8]);

		//extrusion pour passage roulement
		translate([ep/2-3,long_605/2-8,-5]){cube([6,16,10+10]);}

		//passage d'axe
		hull(){
			translate([-5,15,ep_605]){rotate([0,90,0])cylinder(r=2.5, h=ep+10, $fn=50);}
			translate([-5,15,ep_605+5]){rotate([0,90,0])cylinder(r=2.5, h=ep+10, $fn=50);}
		}
		

		//extrusion pour libérer un peu le bloc
		translate([-5,long_605/2+6,ep_605-3]){cube([ep+10,20,5]);}
		translate([-5,-5,ep_605-3]){cube([ep+10,5+long_605/2-6,5]);}

		//extrusion pour enlever un peu de largeur à la partie montante
		translate([0,0,ep_605-3]){cube([4,30,5]);}
		translate([ep-4,0,ep_605-3]){cube([10,30,5]);}

		//trous pour serrage
		translate([6,5,-5]){cylinder(r=3.3, h=ep+10, $fn=50);}
		translate([ep-6,5,-5]){cylinder(r=3.3, h=ep+10, $fn=50);}
		translate([6,long_605-5,-5]){cylinder(r=3.3, h=ep+10, $fn=50);}
		translate([ep-6,long_605-5,-5]){cylinder(r=3.3, h=ep+10, $fn=50);}

		//rognage sur les bords pour ne pas frotter sur les blocs moteurs
		translate([-1,-5,-5]){cube([2,long_605+10,ep_605+10]);}
		translate([ep-1,-5,-5]){cube([2,long_605+10,ep_605+10]);}

	}

}


double_extrudeur();
translate([-0,10+44.55/2-15,ep]){rotate([0,90,0])support_605();}
translate([largeur,10+44.55/2-15,0]){rotate([0,-90,0])support_605();}

//support_605();
