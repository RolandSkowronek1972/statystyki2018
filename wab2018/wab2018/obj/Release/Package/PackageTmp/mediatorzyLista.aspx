﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master"  CodeBehind="mediatorzyLista.aspx.cs" Inherits="wab2018.mediatorzyLista"  enableEventValidation="false" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="userControls/historiaPowolanMediatirow.ascx" tagname="historiaPowolanMediatirow" tagprefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<%@ Register src="userControls/daneStatystyczne.ascx" tagname="daneStatystyczne" tagprefix="uc2" %>
<%@ Register src="userControls/statystykiHistoria.ascx" tagname="statystykiHistoria" tagprefix="uc4" %>
<%@ Register src="userControls/specjalizacje.ascx" tagname="specjalizacje" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
       
        .auto-style2 {
            width: 69px;
        }
        .auto-style3 {
            height: 21px;
        }
        .auto-style4 {
            width: 20px;
            height: 21px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript">
        var index = -1;
        function heja() {
         
            
             
        }
        function grid_RowClick(s, e) {
            if (tabelaSpecjalizacji.IsEditing() == true) {
                index = e.visibleIndex;
                                                
                s.UpdateEdit();                           
            }
            else{
                s.SetFocusedRowIndex(e.visibleIndex); // for better visual appearence                                
                s.StartEditRow(e.visibleIndex);  
            }
        }
        
        function grid_EndCallback(s, e) {
           if (index != -1) {
               var _index = index;
               index = -1;
               
               s.SetFocusedRowIndex(_index); // for better visual appearence
               s.StartEditRow(_index);
            }
        }
    </script>

    <div id ="mainWindow" class="newPage" onload="ShowHideDivX()">
   
        <h2>          &nbsp; Wykaz mediatorów sądowych</h2>   <br />
    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="mediatorzy" KeyFieldName="ident" Width="100%" EnableRowsCache="False" OnRowUpdating="updateMediatora" OnInitNewRow="InsertData" OnStartRowEditing="grid_StartRowEditing" OnRowInserting="grid_RowInserting" OnCancelRowEditing="grid_CancelRowEditing" OnRowValidating="grid_RowValidating" ValidationGroup = 'MyGroup' OnCommandButtonInitialize="grid_CommandButtonInitialize" ViewStateMode="Enabled">
        <Settings ShowFilterRow="True" />
        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
        <SettingsDataSecurity AllowDelete="False" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True" />
            
                     <dx:GridViewDataTextColumn Caption="Tytuł" FieldName="tytul" ShowInCustomizationForm="True" VisibleIndex="1">
                     </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Powołanie od" FieldName="data_poczatkowa" ShowInCustomizationForm="True" VisibleIndex="4">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn Caption="Imie" FieldName="imie" ShowInCustomizationForm="True" VisibleIndex="2">
                         <PropertiesTextEdit>
                             <ValidationSettings CausesValidation="True" Display="Dynamic">
                                 <RequiredField ErrorText="Pole musi być wypełnione" IsRequired="True" />
                             </ValidationSettings>
                         </PropertiesTextEdit>
                     </dx:GridViewDataTextColumn>
                      <dx:GridViewDataDateColumn Caption="Powołanie do" FieldName="data_koncowa" ShowInCustomizationForm="True" VisibleIndex="5">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn Caption="Nazwisko" FieldName="nazwisko" ShowInCustomizationForm="True" VisibleIndex="3">
                         <PropertiesTextEdit>
                             <ValidationSettings>
                                 <RequiredField ErrorText="Pole musi być wypełnione" IsRequired="True" />
                             </ValidationSettings>
                         </PropertiesTextEdit>
                     </dx:GridViewDataTextColumn>
                   
                  
                     <dx:GridViewDataCheckColumn Caption="Z" FieldName="czy_zaw" VisibleIndex="7" meta:resourcekey="GridViewDataCheckColumnResource1" ShowInCustomizationForm="True">
                         </dx:GridViewDataCheckColumn>
                     <dx:GridViewDataTextColumn Caption="Specjalizacje" FieldName="specjalizacja_opis" ShowInCustomizationForm="True" VisibleIndex="15">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Uwagi" FieldName="uwagi" ShowInCustomizationForm="True" VisibleIndex="14">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Telefon" FieldName="tel1" ShowInCustomizationForm="True" VisibleIndex="8">
                     </dx:GridViewDataTextColumn>
         
           
            <dx:GridViewDataTextColumn FieldName="specjalizacja_opis" Visible="False" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
         
           
        </Columns>
           
        <SettingsPager Mode="ShowAllRecords" />
        
        
         <ClientSideEvents RowExpanding="function(s, e) {
	}" SelectionChanged="function(s, e) {
	

}" />
        
        
         <Templates >
            <EditForm>
                 
                  <div style="padding: 4px 3px 4px" >
                    <dx:ASPxPageControl runat="server" ID="ASPxPageControl1" Width="100%">
                        <TabPages>
                         
                            <dx:TabPage Text="Dane osobowe" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                       <table style="width:100%;" onload ="heja();">
        <tr>
            <td >Tytuł</td>
            <td >
                <dx:ASPxTextBox ID="txTytul" runat="server" Width="170px" Text='<%# Eval("tytul")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td >Specjalizacja opis</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Imie</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txImie" runat="server" Width="170px" Text='<%# Eval("imie")%>' >
                    <ValidationSettings>
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="prc50 normal " rowspan="7">
                <dx:ASPxMemo ID="txSpecjalizacjeOpis" runat="server" Height="100%" Width="99%" Text='<%# Eval("specjalizacja_opis")%>'>
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Nazwisko</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txNazwisko" runat="server" Width="170px" Text='<%# Eval("nazwisko")%>'  >
                    <ValidationSettings>
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>


                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">PESEL</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txPESEL" runat="server" Width="170px" Text='<%# Eval("Pesel")%>' >
                </dx:ASPxTextBox>
            </td>
            <td class="col_20">&nbsp;</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Data powołania od: </td>
            <td class="prc25">
              
                         <dx:ASPxDateEdit ID="txPoczatekPowolania" runat="server" Value='<%# (Convert.ToDateTime(Eval("data_poczatkowa")) == DateTime.MinValue) ? Eval("now"): Eval("data_poczatkowa") %>'> 
                </dx:ASPxDateEdit>
                    
                 
               
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Data powołania do: </td>
            <td class="dxflEmptyItem">
                <dx:ASPxDateEdit ID="txDataKoncaPowolania" runat="server" Value='<%# (Convert.ToDateTime(Eval("data_koncowa")) == DateTime.MinValue) ?Eval( ( "now.AddYear(5)"+":"+"DateTime.Now.Month"+":30")): Eval("data_koncowa") %>'> 
                </dx:ASPxDateEdit>
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25"> 
 
                
         
            <dx:ASPxCheckBox ID="cbZawieszenie" runat="server"    Checked='<%# Eval("czy_zaw") != null ? Convert.ToBoolean ( Eval("czy_zaw")) : false %>'   Text="Zawieszenie" Theme="Moderno" CheckState="Unchecked" > 
            <ClientSideEvents 
                
                CheckedChanged="function(s, e) {
	         var dvPassport = document.getElementById(&quot;dvPassport&quot;);
            var  PanelZawieszen=      document.getElementById(&quot;Panel1&quot;);
                    if (s.GetCheckState() ==&quot;Checked&quot;)
                    {
                        
                        dvPassport.style.display = &quot;block&quot; ;
                                    }
                    else
                    {
                         dvPassport.style.display = &quot;none&quot; ;
                
                    }
                }" ValueChanged="function(s, e) {
             
	 var dvPassport = document.getElementById(&quot;dvPassport&quot;);
            var  PanelZawieszen=      document.getElementById(&quot;Panel1&quot;);
                    if (s.GetCheckState() ==&quot;Checked&quot;)
                    {
                        
                        dvPassport.style.display = &quot;block&quot; ;
                                    }
                    else
                    {
                         dvPassport.style.display = &quot;none&quot; ;
                
                    }

}" />
        </dx:ASPxCheckBox>
           
              
            


            </td>
            <td class="dxflEmptyItem">
                &nbsp;</td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td colspan="2" class=" normal przesuniecie prc25"> 
         
                <div id="dvPassport" style="display: none">
          
                     <table style="width:100%;">
                <tr>
                    <td  class="prc50">Data początku zawieszenia</td>
                    <td>                                                                                
                        <dx:ASPxDateEdit ID="txPoczatekZawieszenia" runat="server" Theme="Moderno"  Value='<%# ((Eval("d_zawieszenia")) == null) ? Eval("now"): Eval("d_zawieszenia") %>'> 
                          
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>Data końca zawieszenia</td>
                    <td>
                        <dx:ASPxDateEdit ID="txKoniecZawieszenia" runat="server" Theme="Moderno"  Value='<%# ((Eval("dataKoncaZawieszenia")) == null) ? Eval(  "now.AddYear(5)"+":"+"DateTime.Now.Month"+":30") : Eval("dataKoncaZawieszenia") %>'> 
                            
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
               
            </table>
                </div>
        
            </td>
       
      
            <td class="col_20">
                
       
               
                </td>
        </tr>
                                                                              
        
    </table>
   
<hr />




                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                               <dx:TabPage Text="Dane kontaktowe" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                <table style="width:100%;">
        <tr>
            <td colspan="2" class="auto-style3">Adres</td>
            <td class="auto-style4"></td>
            <td colspan="2" class="auto-style3">Adres prywatny</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Instyrucja</td>
            <td>
                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px" Text='<%# Eval("instytucja")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20">&nbsp;</td>
            <td class=" normal przesuniecie prc25">Adres</td>
            <td>
                <dx:ASPxTextBox ID="txAdresKorespondencyjny" runat="server" Width="170px" Text='<%# Eval("adr_kores")%>'>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Adres</td>
            <td>
                <dx:ASPxTextBox ID="txAdres" runat="server" Width="170px" Text='<%# Eval("ulica")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20">&nbsp;</td>
            <td class=" normal przesuniecie prc25">Kod pocztowy</td>
            <td>
                <dx:ASPxTextBox ID="txKodPocztowyKorespondencyjny" runat="server" Width="170px" Text='<%# Eval("kod_poczt_kor")%>'>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Kod pocztowy</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txKodPocztowy" runat="server" Width="170px" Text='<%# Eval("kod_poczt")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class=" normal przesuniecie prc25">Miejscowosc</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txMiejscowoscKorespondencyjny" runat="server" Width="170px" Text='<%# Eval("miejscowosc_kor")%>'>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Miejscowosc</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txMiejscowosc" runat="server" Width="170px" Text='<%# Eval("miejscowosc")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="prc25 normal">Telefon</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txTelefon2" runat="server" Width="170px" Text='<%# Eval("tel2")%>'>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Telefon </td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txTelefon1" runat="server" Width="170px" Text='<%# Eval("tel1")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20">&nbsp;</td>
            <td class="prc25 normal">&nbsp;</td>
            <td class="prc25 normal">  &nbsp;</td>
        </tr>
       
        <tr>
            <td class=" normal przesuniecie prc25">Email</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txEmail" runat="server" Width="170px" Text='<%# Eval("email")%>'>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="prc25 normal">&nbsp;</td>
            <td class="prc25 normal">&nbsp;</td>
        </tr>
        </table>
                                         
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Uwagi" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                           <dx:ASPxMemo ID="txUwagi" runat="server" Height="200px" Width="99%" Text='<%# Eval("uwagi")%>'> </dx:ASPxMemo>
                                   
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                                  <dx:TabPage Text="Specjalizacje" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
          
                                           <uc3:specjalizacje ID="specjalizacje1" runat="server" /> 

                   
     
                                 
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Dane statystyczne" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                          <uc2:daneStatystyczne ID="daneStatystyczne1" runat="server" />
     
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Historia powołań" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                     <uc1:historiaPowolanMediatirow ID="historiaPowolanMediatirow1" runat="server" />
                                        <br /> 
                                        
                                
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            
                            
                        </TabPages>
                    </dx:ASPxPageControl>
                </div>
               


        
                <div style="text-align: right; padding: 2px">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server" />
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server" />
                </div>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>
        
      <br />
    
        
    
    <dx:ASPxGridView ID="grid0" runat="server" DataSourceID="mediatorzy" AutoGenerateColumns="False" KeyFieldName="ident" Width="100%" EnableRowsCache="False" OnRowUpdating="updateMediatora" OnInitNewRow="InsertData" OnStartRowEditing="grid_StartRowEditing" OnRowInserting="grid_RowInserting" OnCancelRowEditing="grid_CancelRowEditing" OnRowValidating="grid_RowValidating" ValidationGroup = 'MyGroup' OnCommandButtonInitialize="grid_CommandButtonInitialize">
        <Settings ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True" />
            
                     <dx:GridViewDataTextColumn Caption="Tytuł" FieldName="tytul" ShowInCustomizationForm="True" VisibleIndex="1">
                     </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Powołanie od" FieldName="data_poczatkowa" ShowInCustomizationForm="True" VisibleIndex="4">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn Caption="Imie" FieldName="imie" ShowInCustomizationForm="True" VisibleIndex="2">
                         <PropertiesTextEdit>
                             <ValidationSettings CausesValidation="True" Display="Dynamic">
                                 <RequiredField ErrorText="Pole musi być wypełnione" IsRequired="True" />
                             </ValidationSettings>
                         </PropertiesTextEdit>
                     </dx:GridViewDataTextColumn>
                      <dx:GridViewDataDateColumn Caption="Powołanie do" FieldName="data_koncowa" ShowInCustomizationForm="True" VisibleIndex="5">
                     </dx:GridViewDataDateColumn>
                     <dx:GridViewDataTextColumn Caption="Nazwisko" FieldName="nazwisko" ShowInCustomizationForm="True" VisibleIndex="3">
                         <PropertiesTextEdit>
                             <ValidationSettings>
                                 <RequiredField ErrorText="Pole musi być wypełnione" IsRequired="True" />
                             </ValidationSettings>
                         </PropertiesTextEdit>
                     </dx:GridViewDataTextColumn>
                   
                  
                     <dx:GridViewDataCheckColumn Caption="Z" FieldName="czy_zaw" VisibleIndex="7" meta:resourcekey="GridViewDataCheckColumnResource1" ShowInCustomizationForm="True">
                         </dx:GridViewDataCheckColumn>
                     <dx:GridViewDataTextColumn Caption="Specjalizacje" FieldName="specjalizacja_opis" ShowInCustomizationForm="True" VisibleIndex="15">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Uwagi" FieldName="uwagi" ShowInCustomizationForm="True" VisibleIndex="14">
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Telefon" FieldName="tel1" ShowInCustomizationForm="True" VisibleIndex="8">
                     </dx:GridViewDataTextColumn>
         
           
            <dx:GridViewDataTextColumn FieldName="specjalizacja_opis" Visible="False" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
         
           
        </Columns>
           
        <SettingsPager Mode="ShowAllRecords" />
        
        
         <ClientSideEvents RowExpanding="function(s, e) {
	}" SelectionChanged="function(s, e) {
	alert(&quot;Oj!&quot;);

}" />
        
        
         <Templates >
            <EditForm>
                 
                  <div style="padding: 4px 3px 4px" >
                    <dx:ASPxPageControl runat="server" ID="ASPxPageControl2" Width="100%">
                        <TabPages>
                         
                            <dx:TabPage Text="Dane osobowe" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                 <table style="width:100%;" onload ="heja();">
        <tr>
            <td >Tytuł</td>
            <td >
                <dx:ASPxTextBox ID="txTytul0" runat="server" Width="170px" Text='<%# Eval("tytul")%>' ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td >Specjalizacja opis</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Imie</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txImie0" runat="server" Width="170px" Text='<%# Eval("imie")%>'  ReadOnly="true">
                    <ValidationSettings>
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
            <td class="prc50 normal " rowspan="8">
                <dx:ASPxMemo ID="txSpecjalizacjeOpis0" runat="server" Height="100%" Width="99%" Text='<%# Eval("specjalizacja_opis")%>'  ReadOnly="true">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Nazwisko</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txNazwisko0" runat="server" Width="170px" Text='<%# Eval("nazwisko")%>'   ReadOnly="true">
                    <ValidationSettings>
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>


                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
        </tr>
                                        <tr>
            <td class=" normal przesuniecie prc25">Instytucja</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txInstytucja0" runat="server" Width="170px" Text='<%# Eval("instytucja")%>'  >
                    <ValidationSettings>
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>


                </dx:ASPxTextBox>
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">PESEL</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txPESEL0" runat="server" Width="170px" Text='<%# Eval("Pesel")%>'  ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="col_20">&nbsp;</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Data powołania od: </td>
            <td class="prc25">
              
                         <dx:ASPxDateEdit ID="txPoczatekPowolania0" runat="server" Value='<%# (Convert.ToDateTime(Eval("data_poczatkowa")) == DateTime.MinValue) ? Eval("now"): Eval("data_poczatkowa") %>'  ReadOnly="true">
                </dx:ASPxDateEdit>
                    
                 
               
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Data powołania do: </td>
            <td class="dxflEmptyItem">
                <dx:ASPxDateEdit ID="txDataKoncaPowolania0" runat="server" Value='<%# (Convert.ToDateTime(Eval("data_koncowa")) == DateTime.MinValue) ?Eval("now.AddYear(5)"): Eval("data_koncowa") %>' ReadOnly="true"> 
                </dx:ASPxDateEdit>
            </td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25"> 
 
                
         
            <dx:ASPxCheckBox ID="cbZawieszenie0" runat="server"    Checked='<%# Eval("czy_zaw") != null ? Eval("czy_zaw") : false %>'   Text="Zawieszenie" Theme="Moderno" CheckState="Unchecked"  ReadOnly="true"> 
            <ClientSideEvents 
                
                CheckedChanged="function(s, e) {
	         var dvPassport = document.getElementById(&quot;dvPassport&quot;);
            var  PanelZawieszen=      document.getElementById(&quot;Panel1&quot;);
                    if (s.GetCheckState() ==&quot;Checked&quot;)
                    {
                        
                        dvPassport.style.display = &quot;block&quot; ;
                                    }
                    else
                    {
                         dvPassport.style.display = &quot;none&quot; ;
                
                    }
                }" ValueChanged="function(s, e) {
                alert('zmiana');
	 var dvPassport = document.getElementById(&quot;dvPassport&quot;);
            var  PanelZawieszen=      document.getElementById(&quot;Panel1&quot;);
                    if (s.GetCheckState() ==&quot;Checked&quot;)
                    {
                        
                        dvPassport.style.display = &quot;block&quot; ;
                                    }
                    else
                    {
                         dvPassport.style.display = &quot;none&quot; ;
                
                    }

}" />
        </dx:ASPxCheckBox>
           
              
            


            </td>
            <td class="dxflEmptyItem">
                &nbsp;</td>
            <td class="col_20"></td>
        </tr>
        <tr>
            <td colspan="2" class=" normal przesuniecie prc25"> 
         
                <div id="dvPassport0" style="display: none">
                    JavaScript can change the style of an HTML element.
                     <table style="width:100%;">
                <tr>
                    <td  class="prc50">Data początku zawieszenia</td>
                    <td>                                                                                
                        <dx:ASPxDateEdit ID="txPoczatekZawieszenia0" runat="server" Theme="Moderno"  Value='<%# ((Eval("d_zawieszenia")) == null) ? Eval("now"): Eval("data_poczatkowa") %>'  ReadOnly="true"> 
                          
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>Data końca zawieszenia</td>
                    <td>
                        <dx:ASPxDateEdit ID="txKoniecZawieszenia0" runat="server" Theme="Moderno"  Value='<%# ((Eval("dataKoncaZawieszenia")) == null) ? Eval("now"): Eval("data_poczatkowa") %>' ReadOnly="true"> 
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
                </div>
        
            </td>
       
      
            <td class="col_20">
                
       
               
                </td>
        </tr>
                                                                              
        
    </table>
   
   
<hr />

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                               <dx:TabPage Text="Dane kontaktowe" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                           <table style="width:100%;">
        <tr>
            <td colspan="2">Adres </td>
            <td class="auto-style2">&nbsp;</td>
            <td colspan="2">Adres prywatny</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Instytucja</td>
            <td>
                <dx:ASPxTextBox ID="txInstytucja1" runat="server" Width="170px" Text='<%# Eval("instytucja")%>' ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style2">&nbsp;</td>
            <td class=" normal przesuniecie prc25">Adres</td>
            <td>
                <dx:ASPxTextBox ID="txAdresKorespondencyjny0" runat="server" Width="170px" Text='<%# Eval("adr_kores")%>'  ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Adres</td>
            <td>
                <dx:ASPxTextBox ID="txAdres0" runat="server" Width="170px" Text='<%# Eval("ulica")%>' ReadOnly="true" >
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style2">&nbsp;</td>
            <td class=" normal przesuniecie prc25">Kod pocztowy</td>
            <td>
                <dx:ASPxTextBox ID="txKodPocztowyKorespondencyjny0" runat="server" Width="170px" Text='<%# Eval("kod_poczt_kor")%>'  ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Kod pocztowy</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txKodPocztowy0" runat="server" Width="170px" Text='<%# Eval("kod_poczt")%>'  ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style2"></td>
            <td class=" normal przesuniecie prc25">Miejscowość</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txMiejscowoscKorespondencyjny0" runat="server" Width="170px" Text='<%# Eval("miejscowosc_kor")%>' ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Miejscowosc</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txMiejscowosc0" runat="server" Width="170px" Text='<%# Eval("miejscowosc")%>' ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style2"></td>
            <td class=" normal przesuniecie prc25">Telefon</td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txTelefon4" runat="server" Width="170px" Text='<%# Eval("tel2")%>'  ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Telefon </td>
            <td class="prc25">
                <dx:ASPxTextBox ID="txTelefon3" runat="server" Width="170px" Text='<%# Eval("tel1")%>' ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style2">&nbsp;</td>
            <td class="prc25 normal">&nbsp;</td>
            <td class="prc25 normal">&nbsp;</td>
        </tr>
        <tr>
            <td class=" normal przesuniecie prc25">Email</td>
            <td class="dxflEmptyItem">
                <dx:ASPxTextBox ID="txEmail0" runat="server" Width="170px" Text='<%# Eval("email")%>' ReadOnly="true">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style2"></td>
            <td class="prc25 normal">&nbsp;</td>
            <td class="prc25 normal">&nbsp;</td>
        </tr>
        </table>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Uwagi" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                         <dx:ASPxMemo ID="txUwagi0" runat="server" Height="99%" Width="99%" Text='<%# Eval("uwagi")%>' ReadOnly="true">
                                               </dx:ASPxMemo>
                                   
                                         
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Specjalizacje" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
          
      <asp:SqlDataSource ID="specjalizacjeOsob1" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT ROW_NUMBER() OVER(ORDER BY View_SpecjalizacjeIOsoby.id_ ASC) AS Row, View_SpecjalizacjeIOsoby.Expr1 as stab, View_SpecjalizacjeIOsoby.nazwa, View_SpecjalizacjeIOsoby.id_ as idSpecjalizacji, View_SpecjalizacjeIOsoby.ident as idOsoby FROM View_SpecjalizacjeIOsoby INNER JOIN glo_specjalizacje ON View_SpecjalizacjeIOsoby.id_ = glo_specjalizacje.id_ WHERE (View_SpecjalizacjeIOsoby.ident = @ident) AND (glo_specjalizacje.grupa = 1000) ORDER BY View_SpecjalizacjeIOsoby.nazwa" UpdateCommand="UPDATE tbl_specjalizacje_osob SET id_osoby = 0 WHERE (id_osoby = 0)">
            <SelectParameters>
              
                <asp:SessionParameter Name="ident" SessionField="id_osoby" />
              
            </SelectParameters>
           
        </asp:SqlDataSource>    
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="specjalizacjeOsob" KeyFieldName="idSpecjalizacji" Theme="Moderno" EnableTheming="True">
    <SettingsDataSecurity AllowDelete="False" AllowInsert="False" AllowEdit="False" />
    <Columns>
        <dx:GridViewDataTextColumn FieldName="Row" ReadOnly="True" Visible="False" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn FieldName="stab" VisibleIndex="0">
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataTextColumn FieldName="nazwa" ReadOnly="True" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="idSpecjalizacji" Visible="False" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="idOsoby" Visible="False" VisibleIndex="4">
          
        </dx:GridViewDataTextColumn>
    </Columns>
   

</dx:ASPxGridView>                            

        
                   
     
                                 
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                              <dx:TabPage Text="Dane statystyczne" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                       
  
        
        <uc4:statystykiHistoria ID="statystykiHistoria1" runat="server" />
        
     
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Historia powołań" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                     <uc1:historiaPowolanMediatirow ID="historiaPowolanMediatirow2" runat="server" />
                                        <br /> 
                                        
                                
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            
                            
                        </TabPages>
                    </dx:ASPxPageControl>
                </div>
               


        
                <div style="text-align: right; padding: 2px">
                   
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton0" ReplacementType="EditFormCancelButton" runat="server" />
                </div>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>
        
        
    
    <br />
      <asp:SqlDataSource ID="mediatorzy" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT DISTINCT ulica, kod_poczt, miejscowosc, czy_zaw, tel2, email, d_zawieszenia, dataKoncaZawieszenia, GETDATE() AS now, tytul, uwagi, specjalizacja_opis, specjalizacjeWidok, miejscowosc_kor, kod_poczt_kor, adr_kores, imie, ident, data_poczatkowa, data_koncowa, pesel, tel1, typ, nazwisko, instytucja FROM tbl_osoby WHERE (czyus = 0) AND (typ = 2) AND (data_koncowa &gt;= GETDATE())" DeleteCommand="UPDATE tbl_osoby SET czyus = 1, d_usuniecia = GETDATE(), id_usuwajacego = @id_usuwajacego WHERE (ident = @ident)" UpdateCommand="UPDATE tbl_osoby SET instytucja=@instytucja, imie = @imie, nazwisko = @nazwisko, ulica = @ulica, kod_poczt = @kod_poczt, miejscowosc = @miejscowosc, data_poczatkowa = @data_poczatkowa, data_koncowa = @data_koncowa, pesel = @pesel, tytul = @tytul, czy_zaw = @czy_zaw, tel1 = @tel1, tel2 = @tel2, email = @email, adr_kores = @adr_kores, kod_poczt_kor = @kod_poczt_kor, miejscowosc_kor = @miejscowosc_kor, uwagi = @uwagi, d_zawieszenia = @d_zawieszenia, specjalizacjeWidok = @specjalizacjeWidok, specjalizacja_opis = @specjalizacja_opis, dataKoncaZawieszenia = @dataKoncaZawieszenia WHERE (ident = @ident)" InsertCommand="UPDATE tbl_osoby SET imie = @imie, nazwisko = @nazwisko, ulica = @ulica, kod_poczt = @kod_poczt, miejscowosc = @miejscowosc, data_poczatkowa = @data_poczatkowa, data_koncowa = @data_koncowa, pesel = (SELECT CASE WHEN COALESCE (@pesel , '') = '' THEN 0 ELSE @pesel END AS IsNullOrEmpty), tytul = @tytul, czy_zaw = @czy_zaw, tel1 = @tel1, tel2 = @tel2, email = @email, adr_kores = @adr_kores, kod_poczt_kor = @kod_poczt_kor, miejscowosc_kor = @miejscowosc_kor, uwagi = @uwagi, d_zawieszenia = @d_zawieszenia, specjalizacjeWidok = @specjalizacjeWidok, specjalizacja_opis = @specjalizacja_opis, dataKoncaZawieszenia = @dataKoncaZawieszenia WHERE (ident = @ident)">
          <DeleteParameters>
              <asp:SessionParameter Name="id_usuwajacego" SessionField="id_usuwajacego"/>
              <asp:SessionParameter Name="ident" SessionField="ident"/>
          </DeleteParameters>
         
          <InsertParameters>
              <asp:Parameter Name="imie" />
              <asp:Parameter Name="nazwisko" />
              <asp:Parameter Name="ulica" />
              <asp:Parameter Name="kod_poczt" />
              <asp:Parameter Name="miejscowosc" />
              <asp:Parameter Name="data_poczatkowa" />
              <asp:Parameter Name="data_koncowa" />
              <asp:Parameter Name="pesel" />
              <asp:Parameter Name="tytul" />
              <asp:Parameter Name="czy_zaw" />
              <asp:Parameter Name="tel1" />
              <asp:Parameter Name="tel2" />
              <asp:Parameter Name="email" />
              <asp:Parameter Name="adr_kores" />
              <asp:Parameter Name="kod_poczt_kor" />
              <asp:Parameter Name="miejscowosc_kor" />
              <asp:Parameter Name="uwagi" />
              <asp:Parameter Name="d_zawieszenia" />
              <asp:Parameter Name="specjalizacjeWidok" />
              <asp:Parameter Name="specjalizacja_opis" />
              <asp:Parameter Name="dataKoncaZawieszenia" />
              <asp:Parameter Name="instytucja" />
               <asp:SessionParameter Name="ident" SessionField="id_osoby"/>
          </InsertParameters>
         
          <UpdateParameters>
              <asp:Parameter Name="imie"   />
              <asp:Parameter Name="nazwisko"  />
              <asp:Parameter Name="ulica"  />
              <asp:Parameter Name="kod_poczt"   />
              <asp:Parameter Name="miejscowosc"  />
              <asp:Parameter Name="data_poczatkowa"   />
              <asp:Parameter Name="data_koncowa"  />
              <asp:Parameter Name="pesel"  />
              <asp:Parameter Name="tytul"  />
              <asp:Parameter Name="czy_zaw"  />
              <asp:Parameter Name="tel1"  />
              <asp:Parameter Name="tel2"  />
              <asp:Parameter Name="email"  />
              <asp:Parameter Name="adr_kores"  />
              <asp:Parameter Name="kod_poczt_kor"  />
              <asp:Parameter Name="miejscowosc_kor"  />
              <asp:Parameter Name="uwagi"   />
              <asp:Parameter Name="d_zawieszenia"  />
              <asp:Parameter Name="specjalizacjeWidok"   />
              <asp:Parameter Name="specjalizacja_opis"   />
              <asp:Parameter Name="dataKoncaZawieszenia"   />
              <asp:Parameter Name="ident"  />
                 <asp:Parameter Name="instytucja"  />
          </UpdateParameters>
    </asp:SqlDataSource>
        
        
        
        
       
        
        
                                     

        
          
        
        
        
        
       
       
                 <br />
        <br />
        
        
        
        
       
        
        
                                     

        
          
        
             
        
        
       
        
        
        
        
        
        
       
        
        
        
        
        
        
  
        
        
        
        
        
        
       
        
        
        
        
        
        
  
        
       
        
        
                                     

        
          
        
        
        
        
       
        
        
        
        
        
        
       
                 
                                         
        
     
        
        
        
        
        
       
        
        
        
        
        
        
  
        
        
        
        <br />
        
        
        
        
        <br />
        
                                         
        
     </div>
</asp:Content>
