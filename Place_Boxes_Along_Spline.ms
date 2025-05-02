-- Reset globals (if needed)
global pickedBox = undefined
global pickedSpline = undefined

-- Clear any existing dialog
try (destroyDialog boxSplineUI) catch()

-- Define and show the rollout UI
rollout boxSplineUI "Box Along Spline" width:200
(
    -- Controls
    spinner spnCount "Number of Boxes:" range:[2,100,10] type:#integer
    button btnPickBox "Pick Box"
    button btnPickSpline "Pick Spline"
    button btnCopy "Place Copies"
    button btnClose "Close"

    -- Pick Box
    on btnPickBox pressed do (
        local obj = pickObject msg:"Pick a Box"
        if isValidNode obj and classof obj == Box then (
            pickedBox = obj
            format "Picked Box: %\n" pickedBox.name
        ) else (
            messageBox "Please select a valid Box object."
        )
    )

    -- Pick Spline
    on btnPickSpline pressed do (
        local obj = pickObject msg:"Pick a Spline"
        if isValidNode obj and isKindOf obj Shape then (
            pickedSpline = obj
            format "Picked Spline: %\n" pickedSpline.name
        ) else (
            messageBox "Please select a valid Spline."
        )
    )

    -- Create Copies Along Spline
    on btnCopy pressed do (
        if pickedBox == undefined or pickedSpline == undefined then (
            messageBox "Pick both a Box and a Spline first."
        ) else (
            local count = spnCount.value
            local step = 1.0 / (count - 1)

            for i = 0 to (count - 1) do (
                local t = i * step
                local pt = interpCurve3D pickedSpline 1 t
                local newBox = copy pickedBox
                newBox.position = pt
            )
        )
    )

    -- Close dialog
    on btnClose pressed do (
        destroyDialog boxSplineUI
    )
)

createDialog boxSplineUI
