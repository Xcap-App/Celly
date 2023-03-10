//
//  NSTableView+Ext.swift
//  
//
//  Created by scchn on 2022/10/5.
//

#if os(macOS)

import AppKit

extension NSTableView {
    
    public func registerNib<T: NSTableCellView & NibReusable>(viewType: T.Type) {
        register(viewType.nib, forIdentifier: .init(viewType.reuseIdentifier))
    }
    
    public func makeView<T: NSTableCellView & Reusable>(ofType type: T.Type, owner: Any?) -> T {
        guard let view = makeView(withIdentifier: .init(type.reuseIdentifier), owner: owner) as? T else {
            fatalErrorCreatingReusable(type)
        }
        return view
    }
    
}

#endif
