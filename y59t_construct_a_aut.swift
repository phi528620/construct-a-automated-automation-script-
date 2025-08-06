import Foundation

// Simulator Configuration
struct SimulatorConfig {
    let simulationDuration: TimeInterval = 60 // 1 minute
    let automationSteps: [AutomationStep] = []
}

// Automation Step
struct AutomationStep {
    let stepName: String
    let stepDuration: TimeInterval
    let stepAction: () -> Void
}

// Simulator
class Simulator {
    private let config: SimulatorConfig
    private var currentTime: TimeInterval = 0
    
    init(config: SimulatorConfig) {
        self.config = config
    }
    
    func run() {
        print("Simulation started. Duration: \(config.simulationDuration) seconds")
        
        while currentTime <= config.simulationDuration {
            for step in config.automationSteps {
                if currentTime + step.stepDuration <= config.simulationDuration {
                    print("Executing step: \(step.stepName)")
                    step.stepAction()
                    currentTime += step.stepDuration
                }
            }
        }
        
        print("Simulation completed.")
    }
}

// Example Usage
let config = SimulatorConfig(automationSteps: [
    AutomationStep(stepName: "Step 1", stepDuration: 5, stepAction: {
        print("Step 1 action: Waiting for 5 seconds...")
        sleep(5)
        print("Step 1 action: Done.")
    }),
    AutomationStep(stepName: "Step 2", stepDuration: 10, stepAction: {
        print("Step 2 action: Waiting for 10 seconds...")
        sleep(10)
        print("Step 2 action: Done.")
    }),
    AutomationStep(stepName: "Step 3", stepDuration: 3, stepAction: {
        print("Step 3 action: Waiting for 3 seconds...")
        sleep(3)
        print("Step 3 action: Done.")
    }),
])

let simulator = Simulator(config: config)
simulator.run()