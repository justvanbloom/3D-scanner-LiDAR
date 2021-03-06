/*
See LICENSE folder for this sample’s licensing information.

Abstract:
View controller extension for the on-boarding experience.
*/

import UIKit
import ARKit

extension NewScanViewController: ARCoachingOverlayViewDelegate {
    
    func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
        //resetButton.isHidden = true
        //planeDetectionButton.isHidden = true
        saveButton.isHidden = true
 
        
        // Disables user interaction when the coaching overlay activates.
        view.isUserInteractionEnabled = false
      
    }

    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        resetButton.isHidden = false
        planeDetectionButton.isHidden = false
        saveButton.isHidden = false
      
        // Re-enables user interaction once the coaching overlay deactivates.
        view.isUserInteractionEnabled = true
    }

    func coachingOverlayViewDidRequestSessionReset(_ coachingOverlayView: ARCoachingOverlayView) {
        resetButtonPressed(self)
    }

    func setupCoachingOverlay() {
        // Set up coaching view
        coachingOverlay.session = arView.session
        coachingOverlay.delegate = self
        
        coachingOverlay.translatesAutoresizingMaskIntoConstraints = false
        arView.addSubview(coachingOverlay)
        
        NSLayoutConstraint.activate([
            coachingOverlay.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coachingOverlay.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            coachingOverlay.widthAnchor.constraint(equalTo: view.widthAnchor),
            coachingOverlay.heightAnchor.constraint(equalTo: view.heightAnchor)
            ])
    }
}
