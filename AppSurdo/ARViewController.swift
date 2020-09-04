//
//  ARViewController.swift
//  AppSurdo
//
//  Created by Luis Pereira on 31/08/20.
//  Copyright © 2020 Luis Pereira. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import ARKit

//@property (nonatomic, assign) BOOL isSomethingEnabled;
//#import "EquationViewController.swift"
var facts: [String]! = []



class ARViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    var baseLoaded:Bool = false
    
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    
    @IBOutlet weak var popView: UIView!
    var numbers = [10,7,5]
    @IBOutlet weak var popLabel: UILabel!
    
    var cubes: [SCNNode]!
    var cardButtons: [UIButton] = []
    var currentCard = 0
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = [.showFeaturePoints]
        
        cardButtons = [card1,card2,card3]
        cubes = []
        for i in sceneView.scene.rootNode.childNodes{
            if i.name == "cube"{
                cubes.append(i)
            }
        }
        
        popLabel.numberOfLines = 0
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/mainScene.scn")!
        
        // Set the scene to the view
        //sceneView.scene = scene
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if baseLoaded == false{
            addScenario(location: (touches.first?.location(in: sceneView))!)
        }else{
            print("Scenario loaded")
            
            
            //Checking if cube was found
            let touch = touches.first!

            if(touch.view == self.sceneView){
                print("touch working")
                let viewTouchLocation:CGPoint = touch.location(in: sceneView)
                guard let result = sceneView.hitTest(viewTouchLocation, options: nil).first else {
                    return
                }
                if result.node.name == "cube" {
                    loadFactWithNumber(number: numbers[currentCard])
                    popView.isHidden = false
                    cardButtons[currentCard].setImage(UIImage(named: "CardActive"), for: .normal)
                    currentCard+=1
                    result.node.removeFromParentNode()
                    
                    if(currentCard==3){
                        nextButton.isHidden = false
                    }
                }
            }
        }
        
    }
    
    func addScenario(location:CGPoint){
        let hitResult = sceneView.hitTest(location, types: [.existingPlaneUsingExtent])
        if hitResult.count > 0 {
            let result = hitResult.first!
            let newPosition = SCNVector3(result.worldTransform.columns.3.x, result.worldTransform.columns.3.y, result.worldTransform.columns.3.z)
            let scene = SCNScene(named: "art.scnassets/mainScene.scn")!
            let rootNode = scene.rootNode.childNode(withName: "BaseReference", recursively: false)
            rootNode?.position = newPosition
            sceneView.scene = scene
            print("Load scenario")
            baseLoaded = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        UIApplication.shared.isIdleTimerDisabled = true
        sceneView.autoenablesDefaultLighting = true
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    func addNodeAtLocation(location:CGPoint){
        print("adding node...")
    }
    
   /* func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        print("new plane")
        // Cast ARAnchor as ARPlaneAnchor
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        // Create SCNGeometry from ARPlaneAnchor details
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        let planeGeometry = SCNPlane(width: width, height: height)
        
        // Add material to geometry
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.blue.withAlphaComponent(0.8)
        planeGeometry.materials = [material]
        
        // Create a SCNNode from geometry
        let planeNode = SCNNode(geometry: planeGeometry)
        planeNode.position = SCNVector3(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
        planeNode.eulerAngles.x = -.pi / 2
        
        // Add the newly created plane node as a child of the node created for the ARAnchor
        
        node.addChildNode(planeNode)
        
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        print("update plane")
        guard let planeAnchor = anchor as? ARPlaneAnchor, let planeNode = node.childNodes.first,
            let planeGeometry = planeNode.geometry as? SCNPlane else { return }
        
        // Update the dimensions of the plane geometry based on the plane anchor.
        planeGeometry.width = CGFloat(planeAnchor.extent.x)
        planeGeometry.height = CGFloat(planeAnchor.extent.z)
        
        // Update the position of the plane node based on the plane anchor.
        planeNode.position = SCNVector3(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        print("removed")
    }*/
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
   
            
    @IBAction func tapCollect(_ sender: UIButton) {
  
        popView.isHidden = true
        popLabel.text = ""
    }
    
    
    func loadFactWithNumber(number:Int) {
        let urlStrin = "http://numbersapi.com/" + String(number)
        let url = URL(string: urlStrin)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in do {
            
            //let decoder = JSONDecoder()
            let jsonData = String(data: data!, encoding: .utf8) as String?
            //self.fact = jsonData
            print(jsonData!)
            facts.append(jsonData!)
            let encoded = self.hideNumbers(fact: jsonData!)
            DispatchQueue.main.async {
                self.popLabel.text = encoded
            }
        } catch {
            print("Deu ruim")
            }
        }
      
        task.resume()
    }
   
    override func prepare (for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "EquationSegue" {
            let vcEquation = segue.destination as? EquationViewController
            vcEquation?.factsOfNumbers = [facts[0], facts[1], facts[2]]
        }
    }
    
    func hideNumbers(fact:String)->String{
        
        let hidedString = Array(fact)
        var newString = String()
        for index in hidedString.indices{
            
            if hidedString[index].isNumber{
                newString.append("?")
            }else{
                newString.append(hidedString[index])
            }
        
        }
        return newString
    }
    
}
