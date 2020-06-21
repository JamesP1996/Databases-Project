<html>
	<head>
		<title>Select Patients with Outstanding Bills</title>
	</head>	
	<body>
		<h1>Outstanding Balance</h4>
		<h4>Select * from Patient WHERE outstanding_balance > 0;</h4>
		<table border="1">
			<tr>
				<td><h2>ppsn</h2></td>
				<td><h2>full_name</h2></td>
				<td><h2>sex</h2></td>
				<td><h2>address</h2></td>
				<td><h2>phone</h2></td>
				<td><h2>dob</h2></td>
				<td><h2>next_appointment</h2></td>
				<td><h2>appointment_id</h2></td>	
				<td><h2>outstanding_balance</h2></td>
				<td><h2>patient_images</h2></td>	
				<td><h2>xray_image</h2></td>	
				
			</tr>
			<?php			
				$host = "54.82.226.159:3308";
				$user = "GMIT";
				$password = "GMIT!2020";
				$database = "dental_practice";				
				
				$query = "Select * from Patient WHERE outstanding_balance > 0";
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['ppsn'] . "</h2></td>";
					echo "<td><h2>" .$row['full_name'] . "</h2></td>";
					echo "<td><h2>" .$row['sex'] . "</h2></td>";
					echo "<td><h2>" .$row['address'] . "</h2></td>";
					echo "<td><h2>" .$row['phone'] . "</h2></td>";
					echo "<td><h2>" .$row['dob'] . "</h2></td>";
					echo "<td><h2>" .$row['next_appointment'] . "</h2></td>";
					echo "<td><h2>" .$row['appointment_id'] . "</h2></td>";
					echo "<td><h2>" .$row['outstanding_balance'] . "</h2></td>";
					echo '<td><h2><img src="data:image/jpeg;base64,' . base64_encode($row['patient_images']) . '" width=200 height=150 /></h2></td>';
					echo '<td><h2><img src="data:image/jpeg;base64,' . base64_encode($row['xray_image']) . '" width=200 height=150 /></h2></td>';
				    echo "</tr>";
				}
			?>

		<table>
	</body>
</html>
