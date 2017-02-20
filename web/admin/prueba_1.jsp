<html>
<head>
<script>
var contLin = 3;
function agregar() {
	var tr, td;

	tr = document.all.tabla1.insertRow();
	td = tr.insertCell();
	td.innerHTML = "<select id='sel" + contLin + "'>" +
	               "<option>1" +
	               "<option>2" +
	               "<option>3";
	td = tr.insertCell();
	td.innerHTML = "<input type='text' id='t" + contLin + "1' value='t" + contLin + "1'>";
	td = tr.insertCell();
	td.innerHTML = "<input type='text' id='t" + contLin + "2' value='t" + contLin + "2'>";
	contLin++;
}
function borrarUltima() {
	ultima = document.all.tabla.rows.length - 1;
	document.all.tabla.deleteRow(ultima);
	contLin--;
}
</script>
</head>
<body>
<table id="tabla" border=1>
	<tr>
		<td><select id="sel1">
			<option>1
			<option>2
			<option>3
		</td>
		<td><input type="text" id="t11" value="t11"></td>
		<td><input type="text" id="t12" value="t12"></td>
	</tr>
	<tr>
		<td><select id="sel2">
			<option>1
			<option>2
			<option>3
		</td>
		<td><input type="text" id="t21" value="t21"></td>
		<td><input type="text" id="t22" value="t22"></td>
	</tr>
</table>
    <table id="tabla1" border=1>
	<tr>
		<td><select id="sel1">
			<option>1
			<option>2
			<option>3
		</td>
		<td><input type="text" id="t11" value="t11"></td>
		<td><input type="text" id="t12" value="t12"></td>
	</tr>
	<tr>
		<td><select id="sel2">
			<option>1
			<option>2
			<option>3
		</td>
		<td><input type="text" id="t21" value="t21"></td>
		<td><input type="text" id="t22" value="t22"></td>
	</tr>
</table>
<br>
<input type="button" value="Agregar" onclick="agregar()">
<input type="button" value="Borrar ultima" onclick="borrarUltima()">
</body>
</html>