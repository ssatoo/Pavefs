//
//  QueryParams.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 24/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

class QueryParams: NSObject {

    var selChild :String!
    var queryName :String!
    var gender :String!
    var age :String!
    var tms :String!
    var tme :String!
    var d1 :String!
    var d2 :String!
    var d3 :String!
    var d4 :String!
    var d5 :String!
    var rh1 :String!
    var rh2 :String!
    var rh3 :String!
    var rh4 :String!
    var rh5 :String!
    var b11 :String!
    var kb11 :String!
    var bp11 :String!
    var po11 :String!
    var dr11 :String!
    var f11 :String!
    var in11 :String!
    var ij11 :String!
    var lo11 :String!
    var lop11 :String!
    var lof11 :String!
    var st111 :String!
    var st121 :String!
    var st131 :String!
    var s111 :String!
    var s121 :String!
    var s131 :String!
    var s141 :String!
    var p111 :String!
    var p121 :String!
    var p131 :String!
    var n11 :String!
    var w111 :String!
    var w121 :String!
    var w131 :String!
    var w141 :String!
    var l11 :String!
    var lp11 :String!
    var lf11 :String!
    var rp111 :String!
    var rp121 :String!
    var rp131 :String!
    var rp141 :String!
    var as11 :String!
    var op111 :String!
    var orp111 :String!
    var oro111 :String!
    var ore111 :String!
    
    override init()
    {
        super.init()
        
        self.selChild = ""
        self.queryName = ""
        self.gender = ""
        self.age = ""
        self.tms = ""
        self.tme = ""
        self.d1 = ""
        self.d2 = ""
        self.d3 = ""
        self.d4 = ""
        self.d5 = ""
        self.rh1 = ""
        self.rh2 = ""
        self.rh3 = ""
        self.rh4 = ""
        self.rh5 = ""
        self.b11 = ""
        self.kb11 = ""
        self.bp11 = ""
        self.po11 = ""
        self.dr11 = ""
        self.f11 = ""
        self.in11 = ""
        self.ij11 = ""
        self.lo11 = ""
        self.lop11 = ""
        self.lof11 = ""
        self.st111 = ""
        self.st121 = ""
        self.st131 = ""
        self.s111 = ""
        self.s121 = ""
        self.s131 = ""
        self.s141 = ""
        self.p111 = ""
        self.p121 = ""
        self.p131 = ""
        self.n11 = ""
        self.w111 = ""
        self.w121 = ""
        self.w131 = ""
        self.w141 = ""
        self.l11 = ""
        self.lp11 = ""
        self.lf11 = ""
        self.rp111 = ""
        self.rp121 = ""
        self.rp131 = ""
        self.rp141 = ""
        self.as11 = ""
        self.op111 = ""
        self.orp111 = ""
        self.oro111 = ""
        self.ore111 = ""

        
    }
    
    func MakePararmsForQuery(Note:String)->String{
        let param = Note.stringByReplacingOccurrencesOfString("Class_", withString: "")
        return param
    }
}


