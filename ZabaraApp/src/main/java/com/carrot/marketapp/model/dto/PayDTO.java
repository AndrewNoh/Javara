package com.carrot.marketapp.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PayDTO {
   
   private int payno; // amount
   private int paylog;
   private int payLogNo;
   private int deposit;
   private int withdraw;
   private String balance;

}