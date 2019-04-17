<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="artistError.jsp" language="java" %>
<html>
<head>
  <title>Artists</title>
    <link href="css/use.css" rel="stylesheet" type="text/css">
</head>
<body>
<table align="center" id="artistTable" name="artistTable">
</table>
<%--<div align="center" id="myDiv">hello from html</div>--%>

<script>
    var xmlhttp = new XMLHttpRequest();
    var artistString = "";
    var artists = null;
        xmlhttp.open("GET", "http://localhost:8080/rest/artists", true);
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 &&
                xmlhttp.status == 200){
                artists = xmlhttp.responseText;
                artists = JSON.parse(artists);
                // alert(artists);
                var artistTable = document.getElementById("artistTable");
                var tableHeader = document.createElement("th");
                tableHeader.setAttribute("class", "th");
                tableHeader.setAttribute("colspan", 3);
                tableHeader.innerHTML = "<h4>Artists</h4>";
                artistTable.appendChild(tableHeader);
                var tr = document.createElement("tr");
                var idTd = document.createElement("td");
                var nameTd = document.createElement("td");
                var emptyTd = document.createElement("td");
                idTd.innerText = "Id";
                idTd.setAttribute("class", "th");
                nameTd.innerText = "Name";
                nameTd.setAttribute("class", "th");
                emptyTd.setAttribute("class", "th");
                tr.appendChild(idTd);
                tr.appendChild(nameTd);
                tr.appendChild(emptyTd);
                artistTable.appendChild(tr);
                var addForm = document.createElement("form");
                addForm.setAttribute("name", "addForm");
                addForm.setAttribute("action", "****");
                addForm.setAttribute("method", "post");
                addForm.setAttribute("accept-charset", "utf-8");
                var trAdd = document.createElement("tr");
                var tdAddEmpty = document.createElement("td");
                var tdAddName = document.createElement("td");
                var tdAddInput = document.createElement("td");
                tdAddEmpty.setAttribute("class", "td");
                tdAddName.setAttribute("class", "td");
                tdAddInput.setAttribute("class", "td");
                var nameInput = document.createElement("input");
                nameInput.setAttribute("type", "text");
                nameInput.setAttribute("name", "name");
                nameInput.setAttribute("id", "name");
                nameInput.setAttribute("value", "Name");
                nameInput.setAttribute("onblur", "if(document.getElementById('name').value == '') document.getElementById('name').value = 'Name'");
                nameInput.setAttribute("onfocus", "if(document.getElementById('name').value == 'Name') document.getElementById('name').value = ''");
                var addButton = document.createElement("input");
                addButton.setAttribute("class", "button");
                addButton.setAttribute("type", "submit");
                addButton.setAttribute("value", "Add");
                addButton.setAttribute("onclick", "addClick()");
                tdAddName.appendChild(nameInput);
                tdAddInput.appendChild(addButton);
                trAdd.appendChild(tdAddEmpty);
                trAdd.appendChild(tdAddName);
                trAdd.appendChild(tdAddInput);
                trAdd.appendChild(addForm);
                artistTable.appendChild(trAdd);
                for (var pointer = 0; pointer < artists.Artist.length; pointer++) {
                    var nextTr = document.createElement("tr");
                    var nextId = document.createElement("td");
                    nextId.setAttribute("class", "td");
                    var nextName = document.createElement("td");
                    nextName.setAttribute("class", "td");
                    nextId.innerText = artists.Artist[pointer].id;
                    nextName.innerText = artists.Artist[pointer].name;
                    var delArtTd = document.createElement("td");
                    delArtTd.setAttribute("class", "td");
                    delArtTd.innerHTML = "<form name='delForm" + artists.Artist[pointer].id + "'>" +
                        "<input class='button' type='submit' value='Delete' onclick='delClick(" + artists.Artist[pointer].id + ")'></form>";
                    nextTr.appendChild(nextId);
                    nextTr.appendChild(nextName);
                    nextTr.appendChild(delArtTd);
                    artistTable.appendChild(nextTr);
                }
            }
        }
        xmlhttp.send(null);

        function addClick() {
            var artistName = document.getElementById('name').value;
            if (artistName === 'name' || artistName === '') {
                alert('Input the name');
            } else {
                posthttp = new XMLHttpRequest();
                posthttp.open("GET", "http://localhost:8080/rest/artists/add/" + artistName, true);
                posthttp.send(null);
            }
        }

    function delClick(id) {
            posthttp = new XMLHttpRequest();
            posthttp.open("GET", "http://localhost:8080/rest/artists/del/" + id, true);
            posthttp.send(null);
    }

    // function addClick() {
    //     var artistName = document.getElementById('name').value;
    //     if (name == 'name' || name == '') {
    //         alert('Input the name');
    //     } else {
    //         var name = {
    //             id : -1,
    //             name : artistName
    //         };
    //         var jsonName = JSON.stringify(name);
    //         posthttp = new XMLHttpRequest();
    //         posthttp.open("POST", "http://localhost:8080/rest/artists/add/", true);
    //         posthttp.setRequestHeader('Content-Type', 'application/json');
    //         posthttp.send(jsonName);
    //     }
    // }
</script>

</body>
</html>