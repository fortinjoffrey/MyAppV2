//
//  ExerciceDefault.swift
//  myappv1testagain
//
//  Created by Joffrey Fortin on 22/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

class ExerciceDefault {
    
    let name: String
    var hasBeenSelected: Bool
    
    init(name: String, hasBeenSelected: Bool) {
        self.name = name
        self.hasBeenSelected = hasBeenSelected
    }
}

extension ChooseExercicesController {
    
    func setupDefaultExercices() {
        
        fillDefaultExercices()
        defaultExercices = defaultExercices.sorted(by: { $0.name < $1.name  })
        filteredExercices = defaultExercices
    }
    
    private func fillDefaultExercices() {
        
        // Pectoraux
        defaultExercices.append(ExerciceDefault(name: "Développé couché", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Développé incliné", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Développé décliné", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Pull over", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Dips", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Écarté Couché", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Pombes prise large", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Pompes prise serrée", hasBeenSelected: false))
        // Epaules
        defaultExercices.append(ExerciceDefault(name: "Développé militaire", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Élévations latérales", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Élévations frontales", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Oiseau", hasBeenSelected: false))
        // Abominaux
        defaultExercices.append(ExerciceDefault(name: "Crunch allongé", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Crunch obliques", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Crunch à la poulie", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Enroulement du bassin", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Obliques allongé", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Obliques gainage", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Rotation du buste à la machine", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Gainage oblique", hasBeenSelected: false))
        defaultExercices.append(ExerciceDefault(name: "Gainage planche", hasBeenSelected: false))
        
        
    }
    
}
