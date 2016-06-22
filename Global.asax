<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">
    
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        InitializeRoutes(RouteTable.Routes);
        Global.LoadGlobalData();
    }
    
    private void InitializeRoutes(RouteCollection routes)
    {
        routes.MapPageRoute(routeName:"Default1", routeUrl:"", physicalFile:"~/Default.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "home" } });
        routes.MapPageRoute(routeName:"Default", routeUrl:"default", physicalFile:"~/Default.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "home" } });
        routes.MapPageRoute(routeName:"Services", routeUrl:"services", physicalFile:"~/Services.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "services" } });
        routes.MapPageRoute(routeName:"Pricing", routeUrl:"pricing", physicalFile:"~/Pricing.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "pricing" } });
        routes.MapPageRoute(routeName:"Contact", routeUrl:"contact", physicalFile:"~/Contact.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "contact" } });
        routes.MapPageRoute(routeName:"SignIn", routeUrl:"signin", physicalFile:"~/SignIn.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "signin" } });
        routes.MapPageRoute(routeName:"About", routeUrl:"about", physicalFile:"~/About.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "about" } });
        routes.MapPageRoute(routeName:"WhyUs", routeUrl:"whyus", physicalFile:"~/WhyUs.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "contactus" } });
        routes.MapPageRoute(routeName:"TermsOfUse", routeUrl:"termsofuse", physicalFile:"~/TermsOfUse.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "contactus" } });
        routes.MapPageRoute(routeName:"Disclaimer", routeUrl:"disclaimer", physicalFile:"~/Disclaimer.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "contactus" } });
        routes.MapPageRoute(routeName:"PrivacyPolicy", routeUrl:"privacypolicy", physicalFile:"~/PrivacyPolicy.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "contactus" } });
        routes.MapPageRoute(routeName:"UploadForm16", routeUrl:"uploadform16", physicalFile:"~/GetForm16.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "uploadform16" } });
        routes.MapPageRoute(routeName:"Permanent", routeUrl:"permanent/{Data1}", physicalFile:"~/Permanent.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "permanent" }, { "Data1", "0" } });
        routes.MapPageRoute(routeName:"Salary", routeUrl:"salary/{Data1}", physicalFile:"~/Income/Default.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "salary" }, { "Data1", "-1" } });
        routes.MapPageRoute(routeName:"CapitalGain", routeUrl:"capitalgain/{Data1}/{Data2}", physicalFile:"~/Income/CapitalGain.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "capitalgain" }, { "Data1", "" }, { "Data2", "" } });
        //routes.MapPageRoute(routeName: "saleofshare_lt", routeUrl: "saleofshare_lt", physicalFile: "~/Income/CapitalGain.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "saleofshare_lt" } });
        //routes.MapPageRoute(routeName: "saleoflandorbuilding_lt", routeUrl: "saleoflandorbuilding_lt", physicalFile: "~/Income/CapitalGain.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "saleoflandorbuilding_lt" } });
        routes.MapPageRoute(routeName:"HouseProperty", routeUrl:"houseproperty/{Data1}", physicalFile:"~/Income/HouseProperty.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "houseproperty" }, { "Data1", "-1" } });
        routes.MapPageRoute(routeName:"OtherIncome", routeUrl:"otherincome", physicalFile:"~/Income/OtherIncome.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "otherincome" } });
        routes.MapPageRoute(routeName:"selftaxpayment", routeUrl:"selftaxpayment/{Data1}", physicalFile:"~/TaxPaid/SelfTaxPayment.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "selftaxpayment" }, { "Data1", "0" } });
        routes.MapPageRoute(routeName:"tds", routeUrl:"tds/{Data1}", physicalFile:"~/TaxPaid/TdsSummary.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "tds" }, { "Data1", "-1" } });
        routes.MapPageRoute(routeName:"address", routeUrl:"address/{Data1}/{Data2}", physicalFile:"~/Address.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "address" }, { "Data1", "0" }, { "Data2", "-1" } });
        routes.MapPageRoute(routeName:"deduction", routeUrl:"deduction", physicalFile:"~/Deductions/MoreDeductions.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "deduction" } });
        routes.MapPageRoute(routeName:"moredeductions", routeUrl:"moredeductions", physicalFile:"~/Deductions/MoreDeductions.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "moredeductions" } });
        routes.MapPageRoute(routeName:"donation", routeUrl:"donation", physicalFile:"~/Deductions/Donation.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "donation" } });
        routes.MapPageRoute(routeName:"donationadd", routeUrl:"donationadd/{Data1}", physicalFile:"~/Deductions/AddDonation.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "donationadd" }, { "Data1", "0" } });
        routes.MapPageRoute(routeName:"assets", routeUrl:"assets", physicalFile:"~/Income/AddAssets.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "assets" } });
        routes.MapPageRoute(routeName:"changeassessmentyear", routeUrl:"changeassessmentyear", physicalFile:"~/ChangeAssessmentYear.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "changeassessmentyear" } });

        routes.MapPageRoute(routeName:"additionalinformation", routeUrl:"additionalinformation/{Data1}/{Data2}", physicalFile:"~/TaxFiling/AdditionalInformation.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "additionalinformation" }, { "Data1", "-1" }, { "Data2", "-1" } });

        routes.MapPageRoute(routeName:"personalinfo", routeUrl:"personalinfo", physicalFile:"~/PersonalInformation.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Action", "peronalinfo" } });
                
        //login
        routes.MapPageRoute(routeName:"register", routeUrl:"Account/Register", physicalFile:"~/Account/Register.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { });
        routes.MapPageRoute(routeName:"login", routeUrl:"Account/Login", physicalFile:"~/Account/Login.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { });
        routes.MapPageRoute(routeName:"manage", routeUrl:"Account/Manage", physicalFile:"~/Account/Manage.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { });
        
        //reports and admin tasks
        routes.MapPageRoute(routeName:"users", routeUrl:"users", physicalFile:"~/Master/Users.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { });
        routes.MapPageRoute(routeName:"reports", routeUrl:"reports", physicalFile:"~/Master/Reports.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { });
        routes.MapPageRoute(routeName:"reportdetail", routeUrl:"reportdetail/{Data1}", physicalFile:"~/Master/ReportDetails.aspx", checkPhysicalUrlAccess:true, defaults:new RouteValueDictionary() { { "Data1", "0" } });
        
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs
    }
    
    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
    }
    
    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
    }
</script>
