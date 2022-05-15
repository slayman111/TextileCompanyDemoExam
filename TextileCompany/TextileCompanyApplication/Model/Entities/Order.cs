//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TextileCompanyApplication.Model.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.OrderHasProduct = new HashSet<OrderHasProduct>();
            this.User = new HashSet<User>();
        }
    
        public int OrderID { get; set; }
        public int OrderStatusId { get; set; }
        public System.DateTime OrderCreateDate { get; set; }
        public System.DateTime OrderDeliveryDate { get; set; }
        public int OrderPickupPointID { get; set; }
        public int OrderCode { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderHasProduct> OrderHasProduct { get; set; }
        public virtual OrderPickupPoint OrderPickupPoint { get; set; }
        public virtual OrderStatus OrderStatus { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<User> User { get; set; }
    }
}
