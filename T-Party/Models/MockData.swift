import Foundation

var mockRoutes = [
    RouteData(id: "1", long_name: "Bee Line", type: RouteType.lightRail, color: "ffffff"),
    RouteData(id: "2", long_name: "Cee Line", type: RouteType.lightRail, color: "ffffff"),
    RouteData(id: "3", long_name: "This is such a long name please don't display this EVER", short_name: "Lil Bus", type: RouteType.bus, color: "DEDBEF")
]

var mockStopData = mockRoutes.map { StopData(id: String(Int.random(in: 3...100)), latitude: Float.random(in: 1...100), longitude: Float.random(in: 1...100), name: "Route" + String(Int.random(in: 100...200)), route: $0) }

var mockStops = mockStopData.map { Stop(stopData: $0) }
