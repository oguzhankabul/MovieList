//
//  L10n.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import Foundation

private final class BundleToken {
    static let bundle: Bundle = {
        Bundle(for: BundleToken.self)
    }()
}

public class L10n {
    public static func get(_ key: String, parameter: [CVarArg] = []) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: "Localizable")
        return String(format: format, locale: Locale.current, arguments: parameter)
    }
    
    static var language: String {
        return "en"
    }
}

public extension L10n {
    static let movie_list_title = get("movie_list_title")
}
