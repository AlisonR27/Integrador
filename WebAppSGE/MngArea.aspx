﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MngArea.aspx.cs" Inherits="WebAppSGE.MngArea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
           <script src="Script/default.js"></script>
    <script src="Script/jquery341.js"></script>
    <link rel="stylesheet" type="text/css" href="App_Themes/Base/Basement.css" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Gerenciamento de áreas poliesportivas </h2>
            <hr />
            <h6 class="inputTitle">Nome:</h6>
            <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="TextBoxName" runat="server"></asp:RequiredFieldValidator>
            <h6 class="inputTitle">Descrição:</h6>
            <asp:TextBox ID="TextBoxDesc" TextMode="MultiLine" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="TextBoxDesc" runat="server"></asp:RequiredFieldValidator>
            <h6 class="inputTitle"> Imagens </h6>
            <div class="imgSub">
                <img src=""/>
            </div>
            <asp:Button runat="server" Text="Fazer Upload"/>
            <br />
            <h6 class="inputTitle"> Lista de esportes: </h6>
            <div class="SportsContent">
                <div class="sportItem"></div>
            </div>
            <h6 class="inputTitle"> Lista de Esportes: </h6>
            <asp:DropDownList ID="SportsList" runat="server"></asp:DropDownList>
            <asp:Button runat="server" ID="AddSport" Text="Adicionar"/>
            <br />
            <h6 class="inputTitle"> Lista de dias: </h6>
            <div class="flexrow">
                <div class="slideDContainer">
                    <div class="slideDTitle">   
                        <h5>Domingo</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTDomInit"></asp:TextBox>
                        <br />
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTDomEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDContainer">
                    <div class="slideDTitle">   
                        <h5>Segunda</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTSegInit"></asp:TextBox>
                        <br />
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTSegEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDContainer">
                    <div class="slideDTitle">   
                        <h5>Terça</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTTerInit"></asp:TextBox>
                        <br />
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTTerEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDContainer">
                    <div class="slideDTitle">   
                        <h5>Quarta</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTQuaInit"></asp:TextBox>
                        <br />
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTQuaEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDContainer">
                    <div class="slideDTitle">   
                        <h5>Quinta</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTQuiInit"></asp:TextBox>
                        <br />
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTQuiEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDContainer">
                    <div class="slideDTitle">   
                        <h5>Sexta</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTSexInit"></asp:TextBox>
                        <br />
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTSexEnd"></asp:TextBox>
                    </div>
                </div>
                <div class="slideDContainer">
                    <div class="slideDTitle">   
                        <h5>Sábado</h5>
                    </div>
                    <div class="slideDOcult">
                       <input type="checkbox" class="checkDay"  checked/>
                        <h6> Inicio: </h6>
                        <asp:TextBox runat="server" ID="TXTSabInit"></asp:TextBox>
                        <br />
                        <h6>Fim:</h6>
                        <asp:TextBox runat="server" ID="TXTSabEnd"></asp:TextBox>
                    </div>
                </div>
            </div>     
            <asp:Button runat="server" Text="Submeter dias"/>
        </div>
        <asp:Button runat="server" OnClick="Submit" id="FormSubmit"/>
    </form>
    <script>
        //PageLoad
        $(document).ready(function () {
            $('div[class="slideDOcult"]').css("display", "block");
            $('div[class="slideDTitle"]').css("width", $('div[class="slideDOcult"]').css("width"));
            $('div[class="slideDOcult"]').css("display", "none");
            console.log('rodou');
        });
        //Ativar/Desativar Caixas de texto
        $('input[class="checkDay"]').click(function () {
            if ($(this).prop("checked") == true) { $(this).parents().children('input[type="text"]').prop("disabled", false); }
            else { $(this).parents().children('input[type="text"]').prop("disabled", true); }
        });
        //SlideDown Dias
        $('div[class="slideDTitle"]').click(function () {
            if ($(this).parents().children('div[class="slideDOcult"]').css("display") == "none") $(this).parents().children('div[class="slideDOcult"]').slideDown();
            else { $(this).parents().children('div[class="slideDOcult"]').slideUp();  }
        });
    </script>
</body>
</html>
