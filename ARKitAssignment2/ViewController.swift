//
//  ViewController.swift
//  ARKitAssignment2
//
//  Created by Macmini-13 on 28/09/2022.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//create box
     let box = createBox()

//Place sphere
        placeBox(box: box, at: SIMD3(x: 0,y:0, z:-0.2))


    installGestures(on: box)

    }

    func createBox() -> ModelEntity {
        let box = MeshResource.generateBox(size: 0.5)
        let boxMaterial = SimpleMaterial(color: .systemPink, roughness: 0, isMetallic: true)

        let boxEntity = ModelEntity(mesh: box, materials: [boxMaterial])

        return boxEntity
    }

    func placeBox(box:ModelEntity, at position: SIMD3<Float>) {
        let boxAnchor = AnchorEntity(world: position)
        boxAnchor.addChild(box)
        arView.scene.addAnchor(boxAnchor)
    }

    func installGestures(on object:ModelEntity) {
        object.generateCollisionShapes(recursive: true)
        arView.installGestures([.rotation,.scale], for: object)
    }
    
    
}

