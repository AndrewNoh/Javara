package com.carrot.marketapp.model.service;

import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrot.marketapp.config.mail.MailHandler;

@Service
public class MailService {

   @Autowired
   private MailHandler mailHandler;

   public void mailSend(HttpSession session, Map map) throws MessagingException {
      String htmlContent;
      mailHandler.setFrom();
      mailHandler.setTo((String) map.get("email"));
      if (map.get("type") == null) {
         mailHandler.setSubject("🎊[자바라]회원가입 인증번호입니다.");
         htmlContent ="<body style='margin: 0;box-sizing: border-box; font-family:VT323;monospace;color: #1f1f1f;'>"+
                   "<div id='showScroll' class='container' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;background:#f1f1f1;padding:20px 10px;'>"+
                       "<div class='receipt' style='margin:0 auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;width:300px;min-height:100vh;height:100%;background:#fff;box-shadow:5px 5px 19px #ccc;padding:10px;'>"+
                           "<h1 class='logo' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-align:center;padding:20px;'>JAVARA</h1>"+
                           "<div class='address' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-align:center;margin-bottom:10px;'>"+
                               "우리동네 좋은 물건 자바라"+
                           "</div>"+
                           "<div class='transactionDetails' style='margin:0 10px 10px;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;'>"+
                               "<div class='detail' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-transform:uppercase;'>Reg#17</div>"+
                               "<div class='detail' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-transform:uppercase;'>TRN#1313</div>"+
                               "<div class='detail' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-transform:uppercase;'>CSHR#00097655</div>"+
                               "<div class='detail' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-transform:uppercase;'>str#9852</div>"+
                           "</div>"+
                           "<div class='transactionDetails' style='margin:0 10px 10px;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;'>"+
                               "Helped by: Garrett"+
                           "</div>"+
                           "<div class='centerItem bold' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-weight:bold;display:flex;justify-content:center;margin-bottom:8px;'>"+
                               "<div class='item' style='margin: 0;"+
                 "box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>ExtraCare Card #: *********1875</div>"+
                       "</div>"+      
                           "<div class='survey bold' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-weight:bold;text-align:center;margin-bottom:30px;margin-top:30px;'>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323, monospace;color: #1f1f1f;'>인증번호는 </p>"+
                               "<p class='surveyID' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-size:20px;'>"+map.get("random")+
                           "</div>"+
                           "<div class='paymentDetails bold' style='margin:0 auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-weight:bold;display:flex;justify-content:space-between;width:150px;'>"+
                               "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>TOTAL</div>"+
                               "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>3.99</div>"+
                           "</div>"+
                           "<div class='paymentDetails' style='margin:0 auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;width:150px;'>"+
                               "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>CHARGE</div>"+
                               "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>3.99</div>"+
                           "</div>"+
                           "<div class='paymentDetails' style='margin:0 auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;width:150px;'>"+
                               "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>************4023</div>"+
                               "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>CH</div>"+
                           "</div>"+
                           "<div class='creditDetails' style='margin:10px auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;width:230px;font-size:14px;text-transform:uppercase;'>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>VISA CREDIT &nbsp;&nbsp;&nbsp;&nbsp; ****************</p>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>approved# 09773B</p>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>ref# 013589</p>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>tran type: SALE</p>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>AID: 30000000090755</p>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>TC: B7A2A4044AEE380A4</p>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>terminal: 69010003</p>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>no signature required</p>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>CVM: 1e0300</p>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>TMR(95): 0080081111</p>"+
                               "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>TS(9B): E900</p>"+
                           "</div>"+
                           "<div class='paymentDetails' style='margin:0 auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;width:150px;'>"+
                               "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>CHANGE</div>"+
                               "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>.00</div>"+
                           "</div>"+
                           "<div class='receiptBarcode' style='margin:10px 0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-align:center;'>"+                
                               "2003 0998 9000 8730 21"+
                           "</div>"+
                           "<div class='returnPolicy bold' style='margin:10px 20px;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-weight:bold;width:220px;display:flex;justify-content:space-between;'>"+
                               "Returns with receipt, subject to CVS Return Policy, thru 12/04/2018"+
                           "</div>"+
                           "<div class='returnPolicy' style='margin:10px 20px;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;width:220px;display:flex;justify-content:space-between;'>"+
                               "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323, monospace;color: #1f1f1f;'>October 5, 2018</div>"+
                               "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323, monospace;color: #1f1f1f;'>10:16 AM</div>"+
                           "</div>"+
                           "<div class='tripSummary' style='margin:auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;width:255px;'>"+
                               "<div class='bold' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-weight:bold;'>Trip Summary:</div>"+
                               "<div class='item' style='margin:auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;width:220px;'>"+
                                   "<div style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>Today You Saved:</div>"+
                                   "<div style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>.00</div>"+
                               "</div>"+
                               "<div class='item' style='margin:auto;box-sizing:border-box;font-family:VT323, monospace;color:#1f1f1f;display:flex;justify-content:space-between;width:220px;'>"+
                                   "<div style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>Savings Value</div>"+
                                   "<div style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>0%</div>"+
                               "</div>"+
                           "</div>"+
                           "<div class='feedback' style='margin:20px auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;'>"+
                               "<div class='break' style='margin:10px 0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-align:center;font-size:18px;font-weight:bold;'>"+
                                   "*************************************"+
                               "</div>"+         
                               "</div>"+                               
                           "</div>"+
                       "</div>"+                
               "</body>";
      } else {
         mailHandler.setSubject("🔑[자바라]임시 비밀번호입니다.");
         htmlContent ="<body style='margin: 0;box-sizing: border-box; font-family: VT323;monospace;color: #1f1f1f;'>"+
                 "<div id='showScroll' class='container' style='margin:0;box-sizing:border-box;font-family: VT323; monospace;color:#1f1f1f;background:#f1f1f1;padding:20px 10px;'>"+
                     "<div class='receipt' style='margin:0 auto;box-sizing:border-box;font-family: VT323; monospace;color:#1f1f1f;width:300px;min-height:100vh;height:100%;background:#fff;box-shadow:5px 5px 19px #ccc;padding:10px;'>"+
                         "<h1 class='logo' style='margin:0;box-sizing:border-box;font-family: VT323; monospace;color:#1f1f1f;text-align:center;padding:20px;'>JAVARA</h1>"+
                         "<div class='address' style='margin:0;box-sizing:border-box;font-family: VT323; monospace;color:#1f1f1f;text-align:center;margin-bottom:10px;'>"+
                             "우리동네 좋은 물건 자바라"+
                         "</div>"+
                         "<div class='transactionDetails' style='margin:0 10px 10px;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;'>"+
                             "<div class='detail' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-transform:uppercase;'>Reg#17</div>"+
                             "<div class='detail' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-transform:uppercase;'>TRN#1313</div>"+
                             "<div class='detail' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-transform:uppercase;'>CSHR#00097655</div>"+
                             "<div class='detail' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-transform:uppercase;'>str#9852</div>"+
                         "</div>"+
                         "<div class='transactionDetails' style='margin:0 10px 10px;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;'>"+
                             "Helped by: Garrett"+
                         "</div>"+
                         "<div class='centerItem bold' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-weight:bold;display:flex;justify-content:center;margin-bottom:8px;'>"+
                             "<div class='item' style='margin: 0;"+
               "box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>ExtraCare Card #: *********1875</div>"+
                     "</div>"+      
                         "<div class='survey bold' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-weight:bold;text-align:center;margin-bottom:30px;margin-top:30px;'>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323, monospace;color: #1f1f1f;'>임시 비밀번호는 </p>"+
                             "<p class='surveyID' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-size:20px;'>"+map.get("random")+
                         "</div>"+
                         "<div class='paymentDetails bold' style='margin:0 auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-weight:bold;display:flex;justify-content:space-between;width:150px;'>"+
                             "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>TOTAL</div>"+
                             "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>3.99</div>"+
                         "</div>"+
                         "<div class='paymentDetails' style='margin:0 auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;width:150px;'>"+
                             "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>CHARGE</div>"+
                             "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>3.99</div>"+
                         "</div>"+
                         "<div class='paymentDetails' style='margin:0 auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;width:150px;'>"+
                             "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>************4023</div>"+
                             "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>CH</div>"+
                         "</div>"+
                         "<div class='creditDetails' style='margin:10px auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;width:230px;font-size:14px;text-transform:uppercase;'>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>VISA CREDIT &nbsp;&nbsp;&nbsp;&nbsp; ****************</p>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>approved# 09773B</p>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>ref# 013589</p>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>tran type: SALE</p>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>AID: 30000000090755</p>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>TC: B7A2A4044AEE380A4</p>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>terminal: 69010003</p>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>no signature required</p>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>CVM: 1e0300</p>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>TMR(95): 0080081111</p>"+
                             "<p style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>TS(9B): E900</p>"+
                         "</div>"+
                         "<div class='paymentDetails' style='margin:0 auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;width:150px;'>"+
                             "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>CHANGE</div>"+
                             "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>.00</div>"+
                         "</div>"+
                         "<div class='receiptBarcode' style='margin:10px 0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-align:center;'>"+                
                             "2003 0998 9000 8730 21"+
                         "</div>"+
                         "<div class='returnPolicy bold' style='margin:10px 20px;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-weight:bold;width:220px;display:flex;justify-content:space-between;'>"+
                             "Returns with receipt, subject to CVS Return Policy, thru 12/04/2018"+
                         "</div>"+
                         "<div class='returnPolicy' style='margin:10px 20px;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;width:220px;display:flex;justify-content:space-between;'>"+
                             "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323, monospace;color: #1f1f1f;'>October 5, 2018</div>"+
                             "<div class='detail' style='margin: 0;box-sizing: border-box;font-family: VT323, monospace;color: #1f1f1f;'>10:16 AM</div>"+
                         "</div>"+
                         "<div class='tripSummary' style='margin:auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;width:255px;'>"+
                             "<div class='bold' style='margin:0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;font-weight:bold;'>Trip Summary:</div>"+
                             "<div class='item' style='margin:auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;display:flex;justify-content:space-between;width:220px;'>"+
                                 "<div style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>Today You Saved:</div>"+
                                 "<div style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>.00</div>"+
                             "</div>"+
                             "<div class='item' style='margin:auto;box-sizing:border-box;font-family:VT323, monospace;color:#1f1f1f;display:flex;justify-content:space-between;width:220px;'>"+
                                 "<div style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>Savings Value</div>"+
                                 "<div style='margin: 0;box-sizing: border-box;font-family: VT323; monospace;color: #1f1f1f;'>0%</div>"+
                             "</div>"+
                         "</div>"+
                         "<div class='feedback' style='margin:20px auto;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;'>"+
                             "<div class='break' style='margin:10px 0;box-sizing:border-box;font-family:VT323; monospace;color:#1f1f1f;text-align:center;font-size:18px;font-weight:bold;'>"+
                                 "*************************************"+
                             "</div>"+         
                             "</div>"+                               
                         "</div>"+
                     "</div>"+                
             "</body>";
      }
      mailHandler.setText(htmlContent, true);

      mailHandler.send();

   }

}