//
//  SLocalize.swift
//  swiftCocoaTut
//
//  Created by Sakis Kefalas on 10/27/15.
//  Copyright © 2015 msensis. All rights reserved.
//

import Foundation

public func LocalizedString(key:String, comment:String) ->String
{
    let retVal: String? = SLocalize.Instance.getLocalizedString(key)
    
    if retVal == nil
    {
        return comment
    }
    else
    {
        return retVal!
    }
}

public func LocalizedSetLanguage(lang: String)
{
    SLocalize.Instance.setLocale(lang)
}

public func LocalizedGetLanguage() -> String
{
    return SLocalize.Instance.getLocale()
}

public func LocalizedResetLanguage()
{
    let lang: SLocalize = SLocalize.Instance
    
    lang.setLocale(SLocalize.supportedLocales[0])
}


class SLocalize
{
    static let supportedLocales = ["en","el"]
    static let SLocalizeLocaleChangedNotification : String = "SLocalizeLocaleChangedNotification"
    
    private var locale:String!
    static let Instance: SLocalize = SLocalize(locale: "en")
    var strings: Dictionary<String,Dictionary<String,String>> = Dictionary<String,Dictionary<String,String>>()
    
    private init(locale: String)
    {
        self.locale = locale
        
        initGeneralLocalizations()
    }
    
    func setLocale(newLocale:String) -> Bool
    {
        if SLocalize.supportedLocales.contains(newLocale)
        {
            self.locale = newLocale
            
            
            let notification: NSNotification = NSNotification(name: SLocalize.SLocalizeLocaleChangedNotification, object: nil)
            
            NSNotificationCenter.defaultCenter().postNotification(notification)
            
            return true
        }
        
        return false
    }
    
    func getLocale() -> String
    {
        return locale!
    }
    
    func getLocalizedString(key:String) -> String?
    {
        var localeStrings: Dictionary<String,String> = strings[locale]!
        
        return localeStrings[key]
    }
    
    func addLocalizedString(key: String,localized: Array<String>)
    {
        for var i = 0; i<localized.count; i++
        {
            let tLocale:String = SLocalize.supportedLocales[i]
            var previousLocalizations: Dictionary<String,String> = strings[tLocale]!
            
            previousLocalizations[key] = localized[i]
            
            strings[tLocale] = previousLocalizations
        }
    }
    
    subscript(key: String) -> String?
    {
        get
        {
            return getLocalizedString(key)
        }
    }
    
    private func initGeneralLocalizations()
    {
        var englishStrings: Dictionary<String,String> = Dictionary<String,String>()
        var greekStrings: Dictionary<String,String> = Dictionary<String,String>()
        //var italianStrings: Dictionary<String,String> = Dictionary<String,String>()
        // ...
        
        
        
        
        
        

        
        //---- EN Localized Strings
        
        
        englishStrings["name"] = "Name"
        englishStrings["created"] = "Created"
        
        englishStrings["show"] = "View Query"
        englishStrings["Status"] = "Status"
        englishStrings["back"] = "< Back"
        englishStrings["registration"] = "Registration"
        englishStrings["help"] = "Help"
        englishStrings["about"] = "About"
        englishStrings["home"] = "Home"
        englishStrings["register"] = "Register"
        englishStrings["changePassword"] = "Change Password"
        englishStrings["profile"] = "Profile"
        
        
        englishStrings["Individual"] = "Individual"
        englishStrings["Logout"] = "Logout"
        englishStrings["Queries"] = "Queries"
        englishStrings["AddIndividual"] = "Add Individual"
        englishStrings["EditIndividual"] = "Edit Individual"
        englishStrings["DeleteIndividual"] = "Delete Individual"
        englishStrings["Ontology"] = "Ontology"
        englishStrings["ChangePassword"] = "Change Password"
        
        
        
        englishStrings["UsernameLabel"] = "Enter Username"
        englishStrings["PasswordLabel"] = "Enter Password"
        englishStrings["NewPasswordLabel"] = "Enter New Password"
        englishStrings["EmailLabel"] = "Enter Email"
        englishStrings["ConfirmPasswordLabel"] = "Enter Confirm Password"
        englishStrings["SelectUserCategory"] = "Select User Category"
        englishStrings["UsernameMissing"] = "Please Enter Username"
        englishStrings["PasswordMissing"] = "Please Enter Password"
        englishStrings["EmailMissing"] = "Please Enter Email"
        englishStrings["ConfirmPasswordMissing"] = "Please Enter Confirm Password"
        englishStrings["UserCategoryMissing"] = "Please Select User Category"
        englishStrings["Terms"] = "Terms of use"
        englishStrings["PasswordDoesNotMatch"] = "Password Does Not Match"
        englishStrings["NotValidEmail"] = "Please Enter Valid Email"
        englishStrings["AgreeTermsOfUse"] = "Agree Terms of use"
        englishStrings["OkButton"] = "Ok"
        
        
        englishStrings["ChangePasswordFailed"] = "Change Password Failed"
        englishStrings["PasswordChangedSuccessfully"] = "Password Changed Successfully"
        englishStrings["RetrieveIndividualServiceFailed"] = "Retrieve Individual Service Failed"
        englishStrings["AddIndividualServiceSuccessful"] = "Individual Added"
        englishStrings["AddIndividualServiceFailed"] = "Add Individual Service Failed"
        englishStrings["EditIndividualServiceSuccessfull"] = "Individual Edited Successfully"
        englishStrings["EditIndividualServiceFailed"] = "Edit Individual Service Failed"
        englishStrings["DeleteIndividualServiceFailed"] = "Failed to Delete"
        
        englishStrings["NamePlaceholder"] = "Enter Name"
        englishStrings["SurnamePlaceholder"] = "Surname"
        englishStrings["EmailPlaceholder"] = "Enter Email"
        englishStrings["PasswordPlaceholder"] = "Enter Password"
        englishStrings["ConfirmPasswordPlaceholder"] = "Enter Confirm Password"
        englishStrings["GenderPlaceholder"] = "Select Gender"
        englishStrings["BirthDatePlaceholder"] = "BirthDate"
        englishStrings["PhonePlaceholder"] = "Phone"
        englishStrings["FaxPlaceholder"] = "Fax"
        englishStrings["AddressPlaceholder"] = "Address"
        englishStrings["AreaLocationPlaceholder"] = "Enter Area Location"
        englishStrings["PostCodePlaceholder"] = "Postcode"
        englishStrings["CityPlaceholder"] = "City"
        englishStrings["AreaPlaceholder"] = "Area"
        englishStrings["CountryPlaceholder"] = "Country"
        englishStrings["TimeZonePlaceholder"] = "Time Zone"
        englishStrings["ProfessionPlaceholder"] = "Profession"
        englishStrings["EducationLevelPlaceholder"] = "Education Level"
        englishStrings["PersonalIDPlaceholder"] = "Personal ID"
        englishStrings["YearOfExperiencePlaceholder"] = "Years of Experience"
        englishStrings["UpdateProfile"] = "Update Profile"
        
        englishStrings["ProfileRetrieveFailed"] = "Failed To Retrive Profile"
        englishStrings["ProfileUpdateFailed"] = "Failed To Update Profile"
        englishStrings["ProfileUpdateSuccessfully"] = "Profile Updated Successfully"
        
        englishStrings["NameMissing"] = "Please Enter Name"
        englishStrings["SurnameMissing"] = "Please Enter Surname"
        englishStrings["GenderMissing"] = "Please Select Gender"
        englishStrings["BirthDateMissing"] = "Please Select Birthdate"
        englishStrings["PhoneMissing"] = "Please Enter Phone Number"
        englishStrings["FaxMissing"] = "Please Enter Fax"
        englishStrings["AddressMissing"] = "Please Enter Address"
        englishStrings["AreaLocationMissing"] = "Please Enter Area Location"
        englishStrings["PostcodeMissing"] = "Please Enter Postcode"
        englishStrings["CityMissing"] = "Please Enter City"
        englishStrings["AreaMissing"] = "Please Enter Area"
        englishStrings["CountryMissing"] = "Please Select Country"
        englishStrings["TimezoneMissing"] = "Please Select Timezone"
        englishStrings["ProfessionMissing"] = "Please Enter Profession"
        englishStrings["EducationLevelMissing"] = "Please Select Education Level"
        englishStrings["PersonalIDMissing"] = "Please Enter Personal ID"
        englishStrings["YearsOfExperienceMissing"] = "Please Enter Years Of Experience"
        
        
        englishStrings["ChildCode"] = "Child Code"
        englishStrings["ChildCodePlaceholder"] = "Enter Child Code"
        englishStrings["Age"] = "Age"
        englishStrings["AgePlaceholder"] = "Enter Age"
        englishStrings["BirthMonth"] = "Birth Month"
        englishStrings["BirthMonthPlaceholder"] = "Month"
        englishStrings["BirthYear"] = "Birth Year"
        englishStrings["BirthYearPlaceholder"] = "Year"
        englishStrings["Sex"] = "Sex"
        englishStrings["SexPlaceholder"] = "Enter Sex"
        englishStrings["DiagnosisDate"] = "Diagnosis Date"
        englishStrings["DiagnosisDatePlaceholder"] = "Select Diagnosis Date"
        englishStrings["FunctionalityLevel"] = "Functionality Level"
        englishStrings["FunctionalityLevelPlaceholder"] = "Select Functional Level"
        englishStrings["EducationLevel"] = "Education Level"
        englishStrings["EducationLevelPlaceholder"] = "Education Level"
        englishStrings["InsuranceType"] = "Insurance Type"
        englishStrings["InsuranceTypePlaceholder"] = "Select Insurance Type"
        englishStrings["Diagnosis1"] = "Diagnosis 1"
        englishStrings["Diagnosis1Placeholder"] = "Enter Diagnosis 1"
        englishStrings["Diagnosis2"] = "Diagnosis 2"
        englishStrings["Diagnosis2Placeholder"] = "Enter Diagnosis 2"
        englishStrings["Diagnosis3"] = "Diagnosis 3"
        englishStrings["Diagnosis3Placeholder"] = "Enter Diagnosis 3"
        englishStrings["Diagnosis4"] = "Diagnosis 4"
        englishStrings["Diagnosis4Placeholder"] = "Enter Diagnosis 4"
        englishStrings["Diagnosis5"] = "Diagnosis 5"
        englishStrings["Diagnosis5Placeholder"] = "Enter Diagnosis 5"
        englishStrings["RiskFactor1"] = "Risk Factor 1"
        englishStrings["RiskFactor1Placeholder"] = "Enter Risk Factor 1"
        englishStrings["RiskFactor2"] = "Risk Factor 2"
        englishStrings["RiskFactor2Placeholder"] = "Enter Risk Factor 2"
        englishStrings["RiskFactor3"] = "Risk Factor 3"
        englishStrings["RiskFactor3Placeholder"] = "Enter Risk Factor 3"
        englishStrings["RiskFactor4"] = "Risk Factor 4"
        englishStrings["RiskFactor4Placeholder"] = "Enter Risk Factor 4"
        englishStrings["RiskFactor5"] = "Risk Factor 5"
        englishStrings["RiskFactor5Placeholder"] = "Enter Risk Factor 5"
        englishStrings["Submit"] = "Submit"
        
        
        englishStrings["ChildCodeMissing"] = "Please Enter Child Code"
        englishStrings["AgeMissing"] = "Please Enter Age"
        englishStrings["BirthMonthMissing"] = "Please Enter Birth Month"
        englishStrings["BirthYearMissing"] = "Please Enter Birth Year"
        englishStrings["SexMissing"] = "Please Enter Sex"
        englishStrings["DiagnosisDateMissing"] = "Please Select Diagnosis Date"
        englishStrings["FunctioalityLevelMissing"] = "Please Select Functionality Level"
        englishStrings["InsuranceTypeMissing"] = "Please Select Insurance Type"
        englishStrings["Diagnosis1Missing"] = "Please Enter Diagnosis 1"
        englishStrings["RiskFactor1Missing"] = "Please Enter Risk Factor 1"
        
        englishStrings["AboutText"] = "Το ΠΑΥΕΥΣ αποτελεί ένα έργο που υλοποιείται από το Εργαστήριο Πληροφοριακών Συστημάτων Διοίκησης και Επιχειρηματικής Νοημοσύνης του Πανεπιστημίου Πατρών και χρηματοδοτείται από το Υπουργείο Υγείας μέσω της δράσης «Ανθρώπινο Δυναμικό» ΕΣΠΑ 2007-2013.\n\nΠρόκειται για ένα Πρότυπο Σύστημα Υποστήριξης Ατόμων με Αυτισμό, βασιζόμενο σε ένα Ευφυές Πληροφοριακό Σύστημα. Το σύστημα παρέχει τη δυνατότητα καταχώρησης περιστατικού που χρήζει παρέμβασης αλλά και εμπλουτισμό της βάσης Γνώσης με καταχώρηση περίπτωσης. Επιπλέον, προσφέρει τη δυνατότητα αξιολόγησης των προτεινόμενων παρεμβάσεων αλλά και μια πρώιμη διάγνωση με τη μορφή ειδικά σχεδιασμένων & προσαρμοσμένων ερωτήσεων.\n\nΔικαιούχος Υλοποίησης Προγράμματος:\nΕιδικός Λογαριασμός Κονδυλίων Έρευνας (ΕΛΚΕ) Πανεπιστημίου Πατρών-Π.Δ.432/81  (Url: http://research.upatras.gr ).Εργαστήριο Πληροφοριακών Συστημάτων Διοίκησης & Επιχειρηματικής Νοημοσύνης (εΠΣΔΕΝ)\n\nΕπιστημονικός Υπεύθυνος Πράξης:\nΒουτσινάς Βασίλειος, Καθηγητής  Τμ. Διοίκησης Επιχειρήσεων Πανεπιστημίου Πατρών (email: vutsinas@upatras.gr)."
        
        englishStrings["HelpText"] = "\n<b>Πώς κάνω εγγραφή για να υποβάλω ερωτήματα (περιστατικά);</b>\nΣτην ηλεκτρονική διεύθυνση http://pavefs-cms.upatras.gr/registration συμπληρώνω τα στοιχεία που ζητούνται και αφού κάνω Αποδοχή Όρων, κάνω κλικ στο κουμπί «Αποστολή». Ελέγχω την διεύθυνση ηλεκτρονικής αλληλογραφίας που έχω δηλώσει και στην οποία έχει σταλεί μήνυμα επιτυχούς εγγραφής. Κάνω κλικ στον σύνδεσμο (Link) που έχω λάβει για ενεργοποίηση του λογαριασμού μου.\n\n<b>Κοστίζει η χρήση του ΠΑΥΕΥΣ;</b>\nΗ χρήση της εφαρμογής ΠΑΥΕΥΣ παρέχεται δωρεάν, σε αυτήν την φάση, για όλους τους τύπους χρηστών.\n\n<b>Αντιμετωπίζω τεχνικό πρόβλημα κατά την χρήση της εφαρμογής. Πού πρέπει να απευθυνθώ;</b>\nΣτην αρχική σελίδα της εφαρμογής υπάρχει Support Desk στο οποίο μπορείτε να πληκτρολογείτε το πρόβλημα που αντιμετωπίζετε ώστε να ληφθεί υπόψη από τους αρμόδιους να το επιλύσουν. Επίσης, μπορείτε να στέλνετε email στην ηλεκτρονική διεύθυνση pavefs.gr@gmail.com\n\n<b>Πόσα είδη χρηστών υπάρχουν και τι προϋποθέσεις έχει η κάθε χρήση;</b>\nΟι χρήστες διακρίνονται σε τρείς κατηγορίες: α) τον δοκιμαστικό χρήστη (guest-demo user), β) τον απλό χρήστη (registered-simple user) και γ) τον προχωρημένο χρήστη (registered-advanced user). Ο δοκιμαστικός χρήστης (demo user) θεωρείται επισκέπτης χρήστης, έχει πρόσβαση σε περιορισμένα πεδία, μπορεί να υποβάλει ερώτημα και να λάβει απάντηση από το σύστημα αλλά δεν μπορεί να διαμορφώσει την καρτέλα του ατόμου για το οποίο κάνει ερώτημα ούτε να αποθηκεύσει το ερώτημα που υπέβαλε. Ο απλός χρήστης (Regular user), έχει περισσότερες δυνατότητες, μπορεί να διαμορφώσει τόσο το προφίλ του όσο και το προφίλ του ατόμου για το οποίο κάνει ερώτημα. Επίσης, δύναται να διατηρεί ιστορικό ερωτημάτων και των αντίστοιχων απαντήσεών τους. Τέλος, ο προχωρημένος (advanced user), έχει τις ίδιες δυνατότητες με τον απλό χρήστη αλλά δύναται να προσθέτει περιπτώσεις(cases) ενώ κάνει και αξιολόγηση της απάντησης που του έδωσε το σύστημα, σε δεύτερο χρόνο"
        
        
        englishStrings["queryName"] = "Ξεκινήστε συμπληρώνοντας ένα όνομα για το περιστατικό που θα εισάγετε στη συνέχεια."
        englishStrings["genderQuestion"] = "Gender"
        englishStrings["ageQuestion"] = "Age"
        englishStrings["tmsQuestion"] = "Ημ. έναρξης περιστατικού"
        englishStrings["tmeQuestion"] = "Ημ. λήξης περιστατικού"
        
        englishStrings["d1-d5Question"] = "Diagnoses"
        englishStrings["d "] = "Diagnosis " //[d1 - d5]
        
        englishStrings["rh1-rh5Question"] = "Risk Factors"
        englishStrings["rh "] = "Risk Factor " //[rh1 - rh5]
        
        englishStrings["b11Question"] = "Τι συνέβη; Περιγράψτε επιλέγοντας αρχικά μία απο τις διαθέσιμες συμπεριφορές που περιγράφει ακριβώς ή κατά προσέγγιση την πραγματικότητα. "
        englishStrings["kb11Question"] = "Πρόκειτε για γνωστή συμπεριφορά που έχει εμφανιστεί ξανά στο παρελθόν; "
        englishStrings["bp11Question"] = "Ποιο μέρος του σώματος του ιδίου του ατόμου ή άλλου/ων αποτέλεσε τον στόχο της συμπεριφοράς; Αν δεν χρησιμοποιήθηκε κανενα μέρος, αφήστε το κένο. Διαλέξτε απο τις διαθέσιμες επιλογές."
        englishStrings["po11Question"] = "Για την εκδήλωση της συμπεριφοράς χρησιμοποιήθηκε κάποιο αντικείμενο; Διαλέξτε απο τις διαθέσιμες επιλογές. Αν δε χρησιμοποιήθηκε, αφήστε το πεδίο κενό. "
        englishStrings["dr11Question"] = "Η εκδήλωση της συμπεριφοράς οδήγησε στην καταστροφή κάποιου αντικειμένου; "
        englishStrings["f11Question"] = "Αναφερθείτε στη συχνότητα με την οποία εμφάνισε το άτομο το είδος συμπεριφοράς στο συγκεκριμένο περιστατικό."
        englishStrings["in11Question"] = "Περιγράψτε επιλέγοντας αντίστοιχα τη ένταση με την οποία εμφάνισε το άτομο τη συμπεριφορά."
        englishStrings["ij11Question"] = "Προκλήθηκε κάποιος τραυματισμός εξαιτίας του περιστατικού είτε στο ίδιο το άτομο είτε στους γύρω του;"
        englishStrings["lo11Question"] = "Πού συνέβει το περιστατικό; Επιλέξτε απο τις διαθέσιμες τοποθεσίες."
        englishStrings["lop11Question"] = "Πρόκειται για επιθυμητή τοποθεσία; (απαντήστε προαιρετικά)"
        englishStrings["lof11Question"] = "Πρόκειται για γνωστή/οικεία τοποθεσία; (απαντήστε προαιρετικά)"
        
        englishStrings["st111-st131Question "] = "Υπάρχει/ουν κάποιο/α συγκεκριμένο/α γεγονός/τα (έως 3) που θεωρείτε ότι μπορεί να αποτέλεσε/αν βασικό ερέθισμα για την εκδήλωση της συμπεριφοράς του ατόμου; Αν όχι, αφήστε τα πεδία κενά."
        englishStrings["st "] = "Event "//[st111 - st131]
        
        englishStrings["s111-s141Question "] = "Αναφερθείτε στην κατάσταση του ατόμου (συναισθηματική, φυσική, ψυχική κ.α.) λίγο πριν την εκδήλωση της συμπεριφοράς. Μπορείτε να συμπληρώσετε μέχρι 4 πεδία."
        englishStrings["s "] = "Condition "//[s111 - s141]
        
        englishStrings["p111-p131Question "] = "Ποια ήταν η κατάσταση του φυσικού περιβάλλοντος λίγο πριν τη εκδήλωση της συμπεριφοράς;"
        englishStrings["p "] = "Condition "//[p111 - p131]
        
        englishStrings["n11Question"] = "Πόσα ήταν τα άτομα που υπήρχαν στο περιβάλλον λίγο πριν την εκδήλωση του περιστατικού;"
        
        englishStrings["w111-w141Question "] = "Ποια ήταν αυτά τα άτομα (οικογένεια, φροντιστής); Ήταν γνωστά, άγνωστα ή και τα δύο; Μπορείτε να περιγράψετε έως 4 ατομα, εαν υπήρχαν περισσότερα, αναφερθείτε στις γενικές κατηγορίες"
        englishStrings["w "] = "Person "//[w111 - w141]
        
        englishStrings["l11Question"] = "Που βρισκόταν το άτομο λίγο πριν την εκδήλωση του περιστατικού;"
        englishStrings["lp11Question"] = "Πρόκειτε για επιθυμητή τοποθεσία;"
        englishStrings["lf11Question"] = "Πρόκειτε για γνωστή/οικεία τοποθεσία;"
        
        englishStrings["rp111-rp141Question "] = "Ανταποκριθήκατε με κάποιο τρόπο στη συμπεριφορά που εκδήλωσε το άτομο; Αν ναι, επιλέξετε μέχρι 4 απο τις παρακάτω παρεμβάσεις. Αν όχι, αφήστε κενά τα πεδία."
        englishStrings["rp "] = "Response "//[rp111 - rp141]
        
        englishStrings["as11Question"] = "Η ανταπόκριση σας στο περιστατικό ήταν μέρος συμφωνημένης/ σχεδιασμένης στρατηγικής διαχείρισης της συγκεκριμένης συμπεριφοράς;"
        englishStrings["op111Question"] = "Υπήρχαν άτομα στα οποία απευθυνθήκατε μετά το περιστατικο; Μπορείτε να συμπληρώσετε μέχρι ένα πεδία. Αν δεν απευθυνθήκατε αφήστε κενά τα πεδία. "
        englishStrings["orp111Question"] = "Το περιστατικό που συνέβη παρουσίασε κάποιον κίνδυνο για το ίδιο το άτομο; Αν όχι, αφήστε κενό το πεδίο."
        englishStrings["oro111Question"] = "Το περιστατικό που συνέβη παρουσίασε κάποιον κίνδυνο για τους γύρο του; Αν όχι, αφήστε κενό το πεδίο."
        englishStrings["ore111Question"] = "Μετά το συγκεκριμένο περιστατικό τέθηκαν κάποιοι περιορισμοί στο ίδιο το άτομο; Μπορείτε να συμπληρώσετε μέχρι ένα πεδίο με βάση τις διαθέσιμες επιλογές. Αν όχι, αφήστε κενό το πεδίο."
        
        englishStrings["edit"] = "Edit"
        englishStrings["cancel"] = "Cancel"
        
        
        //---- EL Localized Strings
        englishStrings["cancel"] = "Άκυρο"
        greekStrings["edit"] = "Επεξεργασία"
        greekStrings["name"] = "Όνομα"
        greekStrings["created"] = "Δημιουργήθηκε"
        
        greekStrings["show"] = "Προβολή"
        greekStrings["Status"] = "Κατάσταση"
        greekStrings["back"] = "< Πίσω"
        greekStrings["registration"] = "Εγγραφή"
        greekStrings["help"] = "Βοήθεια"
        greekStrings["about"] = "Σχετικά με"
        greekStrings["home"] = "Αρχική"
        greekStrings["register"] = "Εγγραφή"
        greekStrings["changePassword"] = "Άλλαγή κωδικού"
        greekStrings["profile"] = "Το προφίλ μου"
        greekStrings["Individual"] = "Άτομα"
        greekStrings["Logout"] = "Έξοδος"
        greekStrings["Queries"] = "Ερωτήματα"
        greekStrings["AddIndividual"] = "Προσθήκη ατόμου"
        greekStrings["EditIndividual"] = "Επεξεργασία ατόμου"
        greekStrings["DeleteIndividual"] = "Διαγραφή ατόμου"
        greekStrings["Ontology"] = "Οντολογία"
        greekStrings["ChangePassword"] = "Άλλαγή κωδικού"
        greekStrings["UsernameLabel"] = "Εισάγετε το όνομα χρήστη"
        greekStrings["PasswordLabel"]="Εισάγετε τον κωδικό πρόσβασης"
        greekStrings["NewPasswordLabel"] = "Πληκτρολογήστε το νέο κωδικό"
        greekStrings["EmailLabel"] = "Εισάγετε το Email"
        greekStrings["ConfirmPasswordLabel"] = "Εισάγετε Επιβεβαίωση κωδικού πρόσβασης"
        greekStrings["SelectUserCategory"] = "Επιλέξτε Κατηγορία Χρηστών"
        greekStrings["UsernameMissing"]="Παρακαλούμε πληκτρολογήστε το Ψευδώνυμο"
        greekStrings["PasswordMissing"]="Παρακαλώ εισάγετε τον κωδικό"
        greekStrings["EmailMissing"] = "Παρακαλώ εισάγετε Email"
        greekStrings["ConfirmPasswordMissing"] = "Παρακαλώ εισάγετε Επιβεβαίωση κωδικού πρόσβασης"
        greekStrings["UserCategoryMissing"] = "Επιλέξτε Κατηγορία Χρηστών"
        greekStrings["Terms"] = "Όροι χρησης"
        greekStrings["PasswordDoesNotMatch"] = "Ο κωδικός δεν ταιριάζει"
        greekStrings["NotValidEmail"] = "Παρακαλώ εισάγετε ένα έγκυρο Email"
        greekStrings["AgreeTermsOfUse"] = "Συμφωνώ με τους Όρους Χρήσης"
        greekStrings["OkButton"] = "Εντάξει"
        //
        greekStrings["ChangePasswordFailed"] = "Η αλλαγή κωδικού απέτυχε"
        greekStrings["PasswordChangedSuccessfully"] = "Ο κωδικός άλλαξε με επιτυχία"
        greekStrings["RetrieveIndividualServiceFailed"] = "Retrieve Individual Service Failed"
        greekStrings["AddIndividualServiceSuccessful"] = "Το άτομο προστέθηκε με επιτυχία"
        greekStrings["AddIndividualServiceFailed"] = "Παρουσιαστηκε πρόβλημα"
        greekStrings["EditIndividualServiceSuccessfull"] = "Το άτομο άλλαξε με επιτυχία"
        greekStrings["EditIndividualServiceFailed"] = "Παρουσιαστηκε πρόβλημα"
        greekStrings["DeleteIndividualServiceFailed"] = "Παρουσιαστηκε πρόβλημα κατα τη διαγραφή"
        
        greekStrings["NamePlaceholder"] = "Όνομα"
        greekStrings["SurnamePlaceholder"] = "Επίθετο"
        greekStrings["EmailPlaceholder"] = "email"
        greekStrings["PasswordPlaceholder"] = "Password"
        greekStrings["ConfirmPasswordPlaceholder"] = "Enter Confirm Password"
        greekStrings["GenderPlaceholder"] = "Φύλο"
        greekStrings["BirthDatePlaceholder"] = "Ημ. γέννησης"
        greekStrings["PhonePlaceholder"] = "Τηλέφωνο"
        greekStrings["FaxPlaceholder"] = "Fax"
        greekStrings["AddressPlaceholder"] = "Διεύθυνση"
        greekStrings["AreaLocationPlaceholder"] = "Περιοχή"
        greekStrings["PostCodePlaceholder"] = "ΤΚ"
        greekStrings["CityPlaceholder"] = "Πόλη"
        greekStrings["AreaPlaceholder"] = "Νομός ή περιφέρεια"
        greekStrings["CountryPlaceholder"] = "Χώρα"
        greekStrings["TimeZonePlaceholder"] = "Time Zone"
        greekStrings["ProfessionPlaceholder"] = "Επάγγελμα"
        greekStrings["EducationLevelPlaceholder"] = "Τύπος Εκπαίδευσης"
        greekStrings["PersonalIDPlaceholder"] = "Αριθμός Α.Δ.Τ."
        greekStrings["YearOfExperiencePlaceholder"] = "Χρόνια εμπειρίας στον αυτισμό"
        greekStrings["UpdateProfile"] = "Αποθήκευση"
        
        
        
        greekStrings["ProfileRetrieveFailed"] = "Failed To Retrive Profile"
        greekStrings["ProfileUpdateFailed"] = "Failed To Update Profile"
        greekStrings["ProfileUpdateSuccessfully"] = "Το προφιλ ανανεώθηκε με επιτυχία"
        
        greekStrings["NameMissing"] = "Παρακαλώ συμπληρώστε το όνομα"
        greekStrings["SurnameMissing"] = "Παρακαλώ συμπληρώστε το επίθετο"
        greekStrings["GenderMissing"] = "Συμπληρώστε Φύλο"
        greekStrings["BirthDateMissing"] = "Συμπληρώστε Ημ.γέννησης"
        greekStrings["PhoneMissing"] = "Συμπληρώστε το τηλέφωνο"
        greekStrings["FaxMissing"] = "Συμπληρώστε Fax"
        greekStrings["AddressMissing"] = "Συμπληρώστε Διεύθυνση"
        greekStrings["AreaLocationMissing"] = "Συμπληρώστε Περιοχή"
        greekStrings["PostcodeMissing"] = "Συμπληρώστε ΤΚ"
        greekStrings["CityMissing"] = "Συμπληρώστε Πόλη"
        greekStrings["AreaMissing"] = "Συμπληρώστε περιοχή"
        greekStrings["CountryMissing"] = "Συμπληρώστε χώρα"
        greekStrings["TimezoneMissing"] = "Συμπληρώστε Timezone"
        greekStrings["ProfessionMissing"] = "Συμπληρώστε επάγγελμα"
        greekStrings["EducationLevelMissing"] = "Συμπληρώστε επιπεδο εκπαίδευσης"
        greekStrings["PersonalIDMissing"] = "Συμπληρώστε Ταυτότητα"
        greekStrings["YearsOfExperienceMissing"] = "Συμπληρώστε Χρόνια εμπειρίας"
        
        
        greekStrings["ChildCode"] = "Κωδικός"
        greekStrings["ChildCodePlaceholder"] = "Κωδικός"
        greekStrings["Age"] = "Ηλικία"
        greekStrings["AgePlaceholder"] = "Ηλικία"
        greekStrings["BirthMonth"] = "Μήνας γέννησης"
        greekStrings["BirthMonthPlaceholder"] = "Μήνας γέννησης"
        greekStrings["BirthYear"] = "Έτος γέννησης"
        greekStrings["BirthYearPlaceholder"] = "Έτος γέννησης"
        greekStrings["Sex"] = "Φύλο"
        greekStrings["SexPlaceholder"] = "Φύλο"
        greekStrings["DiagnosisDate"] = "Ημερομηνία διάγνωσης"
        greekStrings["DiagnosisDatePlaceholder"] = "Ημερομηνία διάγνωσης"
        greekStrings["FunctionalityLevel"] = "Επίπεδο λειτουργικότητας"
        greekStrings["FunctionalityLevelPlaceholder"] = "Επίπεδο λειτουργικότητας"
        greekStrings["EducationLevel"] = "Κατηγορία μόρφωσης"
        greekStrings["EducationLevelPlaceholder"] = "Κατηγορία μόρφωσης"
        greekStrings["InsuranceType"] = "Ασφ. Φορέας"
        greekStrings["InsuranceTypePlaceholder"] = "Ασφ. Φορέας"
        greekStrings["Diagnosis1"] = "1η Διάγνωση"
        greekStrings["Diagnosis1Placeholder"] = "1η Διάγνωση"
        greekStrings["Diagnosis2"] = "2η Διάγνωση"
        greekStrings["Diagnosis2Placeholder"] = "2η Διάγνωση"
        greekStrings["Diagnosis3"] = "3η Διάγνωση"
        greekStrings["Diagnosis3Placeholder"] = "3η Διάγνωση"
        greekStrings["Diagnosis4"] = "4η Διάγνωση"
        greekStrings["Diagnosis4Placeholder"] = "4η Διάγνωση"
        greekStrings["Diagnosis5"] = "5η Διάγνωση"
        greekStrings["Diagnosis5Placeholder"] = "5η Διάγνωση"
        greekStrings["RiskFactor1"] = "Παράγοντας κινδύνου 1"
        greekStrings["RiskFactor1Placeholder"] = "Παράγοντας κινδύνου 1"
        greekStrings["RiskFactor2"] = "Παράγοντας κινδύνου 2"
        greekStrings["RiskFactor2Placeholder"] = "Παράγοντας κινδύνου 2"
        greekStrings["RiskFactor3"] = "Παράγοντας κινδύνου 3"
        greekStrings["RiskFactor3Placeholder"] = "Παράγοντας κινδύνου 3"
        greekStrings["RiskFactor4"] = "Παράγοντας κινδύνου 4"
        greekStrings["RiskFactor4Placeholder"] = "Παράγοντας κινδύνου 4"
        greekStrings["RiskFactor5"] = "Παράγοντας κινδύνου 5"
        greekStrings["RiskFactor5Placeholder"] = "Παράγοντας κινδύνου 5"
        greekStrings["Submit"] = "Αποθήκευση"
        
        greekStrings["ChildCodeMissing"] = "Συμπληρώστε κωδικό"
        greekStrings["AgeMissing"] = "Συμπληρώστε ηλικία"
        greekStrings["BirthMonthMissing"] = "Συμπληρώστε μήνα γέννησης"
        greekStrings["BirthYearMissing"] = "Συμπληρώστε έτος γέννησης"
        greekStrings["SexMissing"] = "Συμπληρώστε φύλο"
        greekStrings["DiagnosisDateMissing"] = "Συμπληρώστε ημ.διάγνωσης"
        greekStrings["FunctioalityLevelMissing"] = "Συμπληρώστε επίπεδο λειτουργικότητας"
        greekStrings["InsuranceTypeMissing"] = "Συμπληρώστε ασφ.φορέα"
        greekStrings["Diagnosis1Missing"] = "Συμπληρώστε 1η διαγνωση"
        greekStrings["RiskFactor1Missing"] = "Συμπληρώστε παράγοντα κινδύνου"
        
        greekStrings["AboutText"] = "Το ΠΑΥΕΥΣ αποτελεί ένα έργο που υλοποιείται από το Εργαστήριο Πληροφοριακών Συστημάτων Διοίκησης και Επιχειρηματικής Νοημοσύνης του Πανεπιστημίου Πατρών και χρηματοδοτείται από το Υπουργείο Υγείας μέσω της δράσης «Ανθρώπινο Δυναμικό» ΕΣΠΑ 2007-2013.\n\nΠρόκειται για ένα Πρότυπο Σύστημα Υποστήριξης Ατόμων με Αυτισμό, βασιζόμενο σε ένα Ευφυές Πληροφοριακό Σύστημα. Το σύστημα παρέχει τη δυνατότητα καταχώρησης περιστατικού που χρήζει παρέμβασης αλλά και εμπλουτισμό της βάσης Γνώσης με καταχώρηση περίπτωσης. Επιπλέον, προσφέρει τη δυνατότητα αξιολόγησης των προτεινόμενων παρεμβάσεων αλλά και μια πρώιμη διάγνωση με τη μορφή ειδικά σχεδιασμένων & προσαρμοσμένων ερωτήσεων.\n\nΔικαιούχος Υλοποίησης Προγράμματος:\nΕιδικός Λογαριασμός Κονδυλίων Έρευνας (ΕΛΚΕ) Πανεπιστημίου Πατρών-Π.Δ.432/81  (Url: http://research.upatras.gr ).Εργαστήριο Πληροφοριακών Συστημάτων Διοίκησης & Επιχειρηματικής Νοημοσύνης (εΠΣΔΕΝ)\n\nΕπιστημονικός Υπεύθυνος Πράξης:\nΒουτσινάς Βασίλειος, Καθηγητής  Τμ. Διοίκησης Επιχειρήσεων Πανεπιστημίου Πατρών (email: vutsinas@upatras.gr)."
        
        greekStrings["HelpText"] = "\n<b>Πώς κάνω εγγραφή για να υποβάλω ερωτήματα (περιστατικά);</b>\nΣτην ηλεκτρονική διεύθυνση http://pavefs-cms.upatras.gr/registration συμπληρώνω τα στοιχεία που ζητούνται και αφού κάνω Αποδοχή Όρων, κάνω κλικ στο κουμπί «Αποστολή». Ελέγχω την διεύθυνση ηλεκτρονικής αλληλογραφίας που έχω δηλώσει και στην οποία έχει σταλεί μήνυμα επιτυχούς εγγραφής. Κάνω κλικ στον σύνδεσμο (Link) που έχω λάβει για ενεργοποίηση του λογαριασμού μου.\n\n<b>Κοστίζει η χρήση του ΠΑΥΕΥΣ;</b>\nΗ χρήση της εφαρμογής ΠΑΥΕΥΣ παρέχεται δωρεάν, σε αυτήν την φάση, για όλους τους τύπους χρηστών.\n\n<b>Αντιμετωπίζω τεχνικό πρόβλημα κατά την χρήση της εφαρμογής. Πού πρέπει να απευθυνθώ;</b>\nΣτην αρχική σελίδα της εφαρμογής υπάρχει Support Desk στο οποίο μπορείτε να πληκτρολογείτε το πρόβλημα που αντιμετωπίζετε ώστε να ληφθεί υπόψη από τους αρμόδιους να το επιλύσουν. Επίσης, μπορείτε να στέλνετε email στην ηλεκτρονική διεύθυνση pavefs.gr@gmail.com\n\n<b>Πόσα είδη χρηστών υπάρχουν και τι προϋποθέσεις έχει η κάθε χρήση;</b>\nΟι χρήστες διακρίνονται σε τρείς κατηγορίες: α) τον δοκιμαστικό χρήστη (guest-demo user), β) τον απλό χρήστη (registered-simple user) και γ) τον προχωρημένο χρήστη (registered-advanced user). Ο δοκιμαστικός χρήστης (demo user) θεωρείται επισκέπτης χρήστης, έχει πρόσβαση σε περιορισμένα πεδία, μπορεί να υποβάλει ερώτημα και να λάβει απάντηση από το σύστημα αλλά δεν μπορεί να διαμορφώσει την καρτέλα του ατόμου για το οποίο κάνει ερώτημα ούτε να αποθηκεύσει το ερώτημα που υπέβαλε. Ο απλός χρήστης (Regular user), έχει περισσότερες δυνατότητες, μπορεί να διαμορφώσει τόσο το προφίλ του όσο και το προφίλ του ατόμου για το οποίο κάνει ερώτημα. Επίσης, δύναται να διατηρεί ιστορικό ερωτημάτων και των αντίστοιχων απαντήσεών τους. Τέλος, ο προχωρημένος (advanced user), έχει τις ίδιες δυνατότητες με τον απλό χρήστη αλλά δύναται να προσθέτει περιπτώσεις(cases) ενώ κάνει και αξιολόγηση της απάντησης που του έδωσε το σύστημα, σε δεύτερο χρόνο"
        greekStrings["responseText"] = "Παρακαλούμε, αξιολογείστε κάθε μία από τις παρακάτω παρεμβάσεις, οι οποίες προτάθηκαν από το ΠΑΥΕΥΣ ως απάντηση στο εν λόγω ερώτημά σας, σημειώνοντας:\n \n- είτε ότι ήταν απολύτως αποτυχημένη (δηλαδή συνεχίζει η σχετιζόμενη συμπεριφορά με αμείωτη συχνότητα και ένταση και μετά από 2-3 συνεχόμενες προσπάθειες) \n - είτε ότι ήταν μερικώς ή απολύτως επιτυχημένη\n \n Μην την αξιολογήσετε αν δεν την εφαρμόσατε καθόλου."
        
        
        greekStrings["queryName"] = "Ξεκινήστε συμπληρώνοντας ένα όνομα για το περιστατικό που θα εισάγετε στη συνέχεια."
        greekStrings["genderQuestion"] = "Φύλο"
        greekStrings["ageQuestion"] = "Ηλικία"
        greekStrings["tmsQuestion"] = "Ημ. έναρξης περιστατικού"
        greekStrings["tmeQuestion"] = "Ημ. λήξης περιστατικού"
        
        greekStrings["d1-d5Question"] = "Διαγνώσεις"
        greekStrings["d "] = "Διάγνωση " //[d1 - d5]
        
        greekStrings["rh1-rh5Question"] = "Παράγοντες κινδύνου"
        greekStrings["rh "] = "Παράγοντας κινδύνου " //[rh1 - rh5]
        
        greekStrings["b11Question"] = "Τι συνέβη; Περιγράψτε επιλέγοντας αρχικά μία απο τις διαθέσιμες συμπεριφορές που περιγράφει ακριβώς ή κατά προσέγγιση την πραγματικότητα. "
        greekStrings["kb11Question"] = "Πρόκειτε για γνωστή συμπεριφορά που έχει εμφανιστεί ξανά στο παρελθόν; "
        greekStrings["bp11Question"] = "Ποιο μέρος του σώματος του ιδίου του ατόμου ή άλλου/ων αποτέλεσε τον στόχο της συμπεριφοράς; Αν δεν χρησιμοποιήθηκε κανενα μέρος, αφήστε το κένο. Διαλέξτε απο τις διαθέσιμες επιλογές."
        greekStrings["po11Question"] = "Για την εκδήλωση της συμπεριφοράς χρησιμοποιήθηκε κάποιο αντικείμενο; Διαλέξτε απο τις διαθέσιμες επιλογές. Αν δε χρησιμοποιήθηκε, αφήστε το πεδίο κενό. "
        greekStrings["dr11Question"] = "Η εκδήλωση της συμπεριφοράς οδήγησε στην καταστροφή κάποιου αντικειμένου; "
        greekStrings["f11Question"] = "Αναφερθείτε στη συχνότητα με την οποία εμφάνισε το άτομο το είδος συμπεριφοράς στο συγκεκριμένο περιστατικό."
        greekStrings["in11Question"] = "Περιγράψτε επιλέγοντας αντίστοιχα τη ένταση με την οποία εμφάνισε το άτομο τη συμπεριφορά."
        greekStrings["ij11Question"] = "Προκλήθηκε κάποιος τραυματισμός εξαιτίας του περιστατικού είτε στο ίδιο το άτομο είτε στους γύρω του;"
        greekStrings["lo11Question"] = "Πού συνέβει το περιστατικό; Επιλέξτε απο τις διαθέσιμες τοποθεσίες."
        greekStrings["lop11Question"] = "Πρόκειται για επιθυμητή τοποθεσία; (απαντήστε προαιρετικά)"
        greekStrings["lof11Question"] = "Πρόκειται για γνωστή/οικεία τοποθεσία; (απαντήστε προαιρετικά)"
        
        greekStrings["st111-st131Question "] = "Υπάρχει/ουν κάποιο/α συγκεκριμένο/α γεγονός/τα (έως 3) που θεωρείτε ότι μπορεί να αποτέλεσε/αν βασικό ερέθισμα για την εκδήλωση της συμπεριφοράς του ατόμου; Αν όχι, αφήστε τα πεδία κενά."
        greekStrings["st "] = "Γεγονός "//[st111 - st131]
        
        greekStrings["s111-s141Question "] = "Αναφερθείτε στην κατάσταση του ατόμου (συναισθηματική, φυσική, ψυχική κ.α.) λίγο πριν την εκδήλωση της συμπεριφοράς. Μπορείτε να συμπληρώσετε μέχρι 4 πεδία."
        greekStrings["s "] = "Κατάσταση "//[s111 - s141]
        
        greekStrings["p111-p131Question "] = "Ποια ήταν η κατάσταση του φυσικού περιβάλλοντος λίγο πριν τη εκδήλωση της συμπεριφοράς;"
        greekStrings["p "] = "Κατάσταση "//[p111 - p131]
        
        greekStrings["n11Question"] = "Πόσα ήταν τα άτομα που υπήρχαν στο περιβάλλον λίγο πριν την εκδήλωση του περιστατικού;"
        
        greekStrings["w111-w141Question "] = "Ποια ήταν αυτά τα άτομα (οικογένεια, φροντιστής); Ήταν γνωστά, άγνωστα ή και τα δύο; Μπορείτε να περιγράψετε έως 4 ατομα, εαν υπήρχαν περισσότερα, αναφερθείτε στις γενικές κατηγορίες"
        greekStrings["w "] = "Άτομο "//[w111 - w141]
        
        greekStrings["l11Question"] = "Που βρισκόταν το άτομο λίγο πριν την εκδήλωση του περιστατικού;"
        greekStrings["lp11Question"] = "Πρόκειτε για επιθυμητή τοποθεσία;"
        greekStrings["lf11Question"] = "Πρόκειτε για γνωστή/οικεία τοποθεσία;"
        
        greekStrings["rp111-rp141Question "] = "Ανταποκριθήκατε με κάποιο τρόπο στη συμπεριφορά που εκδήλωσε το άτομο; Αν ναι, επιλέξετε μέχρι 4 απο τις παρακάτω παρεμβάσεις. Αν όχι, αφήστε κενά τα πεδία."
        greekStrings["rp "] = "Παρέμβαση "//[rp111 - rp141]
        
        greekStrings["as11Question"] = "Η ανταπόκριση σας στο περιστατικό ήταν μέρος συμφωνημένης/ σχεδιασμένης στρατηγικής διαχείρισης της συγκεκριμένης συμπεριφοράς;"
        greekStrings["op111Question"] = "Υπήρχαν άτομα στα οποία απευθυνθήκατε μετά το περιστατικο; Μπορείτε να συμπληρώσετε μέχρι ένα πεδία. Αν δεν απευθυνθήκατε αφήστε κενά τα πεδία. "
        greekStrings["orp111Question"] = "Το περιστατικό που συνέβη παρουσίασε κάποιον κίνδυνο για το ίδιο το άτομο; Αν όχι, αφήστε κενό το πεδίο."
        greekStrings["oro111Question"] = "Το περιστατικό που συνέβη παρουσίασε κάποιον κίνδυνο για τους γύρο του; Αν όχι, αφήστε κενό το πεδίο."
        greekStrings["ore111Question"] = "Μετά το συγκεκριμένο περιστατικό τέθηκαν κάποιοι περιορισμοί στο ίδιο το άτομο; Μπορείτε να συμπληρώσετε μέχρι ένα πεδίο με βάση τις διαθέσιμες επιλογές. Αν όχι, αφήστε κενό το πεδίο."
        englishStrings["FieldError"] = "Please complete all required fields (* )"
        greekStrings["FieldError"] = "Παρακαλώ συμπληρώστε όλα τα απαιτούμενα πεδία(* )"
        englishStrings["noindividual"] = "You have no individual"
        greekStrings["noindividual"] = "Δεν έχετε κανένα άτομο"
        
        englishStrings["chooseindividual"] = "Please choose individual"
        greekStrings["chooseindividual"] = "Παρακαλώ επιλέξτε άτομο"
        
        
        englishStrings["title"] = "Title :"
        greekStrings["title"] = "Τίτλος :"
        
        englishStrings["relatedcases"] = "Related Cases"
        greekStrings["relatedcases"] = "Προτεινόμενα περιστατικά"
        // ...
        englishStrings["results"] = "Results"
        greekStrings["results"] = "Αποτελέσματα"
        
        
        englishStrings["Query info"] = "Query info"
        greekStrings["Query info"] = "Πληροφορίες ερωτήματος"
        
        englishStrings["casename"] = "Case name"
        greekStrings["casename"] = "Όνομα περιστατικου"
        
        
        englishStrings["profilet"] = "Profile"
        greekStrings["profilet"] = "Προφίλ"
        
        strings["en"] = englishStrings
        strings["el"] = greekStrings
    }
    
}