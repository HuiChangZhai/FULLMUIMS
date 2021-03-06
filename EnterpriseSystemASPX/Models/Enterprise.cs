//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace EnterpriseSystemASPX.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Enterprise
    {
        public Enterprise()
        {
            this.EnterpriseCases = new HashSet<EnterpriseCases>();
            this.EnterpriseDynamic = new HashSet<EnterpriseDynamic>();
        }
    
        public int EnterpriseID { get; set; }
        public string EnterpriseName { get; set; }
        public string EnterprisePassword { get; set; }
        public string EnterpriseUrl { get; set; }
        public string EnterpriseAddress { get; set; }
        public string EnterpriseTelphoneNumber { get; set; }
        public string EnterpriseBriefShort { get; set; }
        public string EnterpriseBrief { get; set; }
        public string EnterpriseEmail { get; set; }
        public string EnterpriseRight { get; set; }
        public string EnterpriseLogo { get; set; }
        public Nullable<System.DateTime> EnterpriseRegistTime { get; set; }
        public Nullable<bool> EnterpriseActive { get; set; }
        public Nullable<bool> EnterpriseStatus { get; set; }
        public int TemplateID { get; set; }
    
        public virtual ICollection<EnterpriseCases> EnterpriseCases { get; set; }
        public virtual ICollection<EnterpriseDynamic> EnterpriseDynamic { get; set; }
    }
}
