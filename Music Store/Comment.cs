//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Assignment2
{
    using System;
    using System.Collections.Generic;
    
    public partial class Comment
    {
        public int CommentId { get; set; }
        public string Text { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int Products_ProductId { get; set; }
        public string Username { get; set; }
    
        public virtual Product Product { get; set; }
    }
}
