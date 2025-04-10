% Hechos básicos
planta(granado, 'Punica granatum').
planta(guazuma, 'Guazuma ulmifolia').
planta(guayacan, 'Guaiacum sanctum').
planta(hamamelis, 'Hamamelis virginica').
planta(abrojo, 'Tribulus terrestris').
planta(guazuma, 'Guazuma ulmifolia').
planta(guayacan, 'Guaiacum sanctum').
planta(hamamelis, 'Hamamelis virginica').
planta(abrojo, 'Tribulus terrestris').
planta(helenio, 'Inula helenium').
planta(quaco, 'Aristolochia adamantina').

% Propiedades de las plantas
propiedad(guazuma, antidiarreica).
propiedad(guazuma, antiinflamatoria).
propiedad(guayacan, expectorante).
propiedad(guayacan, antisifilis).
propiedad(hamamelis, hemostatica).
propiedad(hamamelis, venotonica).
propiedad(abrojo, diuretico).
propiedad(abrojo, hepatico).
propiedad(helenio, diuretico).
propiedad(helenio, pectoral).
propiedad(quaco, antidoto).
propiedad(quaco, antiinflamatorio).

% Usos medicinales
trata(guazuma, disenteria).
trata(guazuma, diarrea).
trata(guazuma, inflamacion_intestinal).
trata(guazuma, estreñimiento).
trata(guayacan, tos).
trata(guayacan, sifilis).
trata(guayacan, reumatismo).
trata(hamamelis, hemorroides).
trata(hamamelis, varices).
trata(abrojo, afecciones_pecho).
trata(abrojo, problemas_hepaticos).
trata(abrojo, inflamacion_ojos).
trata(helenio, retencion_orina).
trata(helenio, afecciones_pecho).
trata(quaco, mordeduras_ponzoñosas).
trata(quaco, picaduras).
trata(quaco, afecciones_urinarias).

% Métodos de preparación
preparacion(tintura, ['Macerar planta en alcohol', 'Dejar reposar 15 días', 'Filtrar']).
preparacion(infusion, ['Hervir agua', 'Agregar planta', 'Dejar reposar 5 minutos', 'Colar']).
preparacion(maceracion, ['Remojar planta en agua fría', 'Dejar varias horas']).
preparacion(jarabe, ['Hervir planta en agua', 'Agregar miel', 'Cocer hasta espesar']).
preparacion(cataplasma, ['Triturar hojas frescas', 'Aplicar directamente sobre la zona afectada']).

% Relación planta-preparación recomendada
preparacion_recomendada(guazuma, infusion).
preparacion_recomendada(guayacan, infusion).
preparacion_recomendada(hamamelis, tintura).
preparacion_recomendada(abrojo, infusion).
preparacion_recomendada(helenio, infusion).
preparacion_recomendada(quaco, cataplasma).

% Reglas para consultas útiles

% Qué plantas tratan una condición específica
plantas_para(Enfermedad, Plantas) :-
    findall(Planta, trata(Planta, Enfermedad), Plantas).

% Qué condiciones trata una planta específica
usos_de(Planta, Usos) :-
    findall(Uso, trata(Planta, Uso), Usos).

% Qué propiedades tiene una planta
propiedades_de(Planta, Propiedades) :-
    findall(Propiedad, propiedad(Planta, Propiedad), Propiedades).

% Cómo preparar una planta para uso medicinal
como_preparar(Planta, Preparacion, Instrucciones) :-
    preparacion_recomendada(Planta, Preparacion),
    preparacion(Preparacion, Instrucciones).

% Plantas con una propiedad específica
plantas_con_propiedad(Propiedad, Plantas) :-
    findall(Planta, propiedad(Planta, Propiedad), Plantas).

% Buscar tratamiento para una enfermedad
tratamiento_natural(Enfermedad, Planta, Preparacion) :-
    trata(Planta, Enfermedad),
    preparacion_recomendada(Planta, Preparacion).
