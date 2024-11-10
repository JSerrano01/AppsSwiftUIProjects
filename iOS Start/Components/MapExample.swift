//
//  MapExample.swift
//  iOS Start
//
//  Created by Jaime Serrano on 10/11/24.
//

import SwiftUI
import MapKit

struct MapExample: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 28.0034123, longitude: -16.0342342), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    var body: some View {
        Map()
    }
}

#Preview {
    MapExample()
}
