<html>
	<head>
		<title>Grab the Next Appointments with the patient details </title>
	</head>	
	<body>
		<h1>Grab the Next Appointments with the patient details </h4>
		<h4>SELECT next_appointment,appointment_id,ppsn,full_name,sex,dob,address,phone 
			FROM Patient 
			ORDER BY ABS( DATEDIFF( patient.next_appointment, NOW() ) );</h4>
		<table border="1">
			<tr>
				<td><h2>next_appointment</h2></td>
				<td><h2>appointment_id</h2></td>
				<td><h2>ppsn</h2></td>
				<td><h2>full_name</h2></td>
				<td><h2>sex</h2></td>
				<td><h2>dob</h2></td>
				<td><h2>address</h2></td>
				<td><h2>phone</h2></td>	
			</tr>
			<?php			
				$host = "54.82.226.159:3308";
				$user = "GMIT";
				$password = "GMIT!2020";
				$database = "dental_practice";				
				
				$query = "SELECT next_appointment,appointment_id,ppsn,full_name,sex,dob,address,phone 
						  FROM Patient 
						  ORDER BY ABS( DATEDIFF( patient.next_appointment, NOW() ) );";
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['next_appointment'] . "</h2></td>";
					echo "<td><h2>" .$row['appointment_id'] . "</h2></td>";
					echo "<td><h2>" .$row['ppsn'] . "</h2></td>";
					echo "<td><h2>" .$row['full_name'] . "</h2></td>";
					echo "<td><h2>" .$row['sex'] . "</h2></td>";
					echo "<td><h2>" .$row['dob'] . "</h2></td>";
					echo "<td><h2>" .$row['address'] . "</h2></td>";
					echo "<td><h2>" .$row['phone'] . "</h2></td>";
				    echo "</tr>";
				}
			?>

		<table>
	</body>
</html>
