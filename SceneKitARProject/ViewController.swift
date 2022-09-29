//
//  ViewController.swift
//  SceneKitARProject
//
//  Created by Macmini-13 on 27/09/2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        //        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        //
        //        // Set the scene to the view
        let scene = SCNScene()
        let neptuneScene = SCNScene(named: "art.scnassets/Pluto.scn")
        
        guard let neptuneNode = neptuneScene?.rootNode.childNode(withName: "pluto", recursively: true) else {
            fatalError("error")
        }
        
        neptuneNode.position = SCNVector3(0, 0, -500.0)
        let rotateAnimation = SCNAction.rotateBy(x: 0, y: -0.2, z: 0, duration: 1)
        neptuneNode.runAction(SCNAction.repeatForever(rotateAnimation))
        scene.rootNode.addChildNode(neptuneNode)
        sceneView.scene = scene
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
//    func createBox() -> ModelEntity {
//        func installGestures(on object:ModelEntity) {
//            object.generateCollisionShapes(recursive: true)
//            arView.installGestures([.rotation,.scale], for: object)
//        }
//    }
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
