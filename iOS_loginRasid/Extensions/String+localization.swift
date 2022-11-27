//
//  String+localization.swift
//  iOS_loginRasid
//
//  Created by Fintech on 27/11/2022.
//

import Foundation

extension String {
    var localize: String {
        NSLocalizedString(self, comment: "")
    }
}
