<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>
    <title>Student Application</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
        }

        table {
            border-collapse: collapse;
            width: 70%;
            margin: 30px auto;
            background: white;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        }

        th {
            background: #007BFF;
            color: white;
            padding: 10px;
        }

        td {
            padding: 10px;
            text-align: center;
        }

        tr:nth-child(even) {
            background: #f2f2f2;
        }

        .pass {
            color: green;
            font-weight: bold;
        }

        .fail {
            color: red;
            font-weight: bold;
        }

        .distinction {
            color: blue;
            font-weight: bold;
        }
    </style>

</head>

<body>

<h2 style="text-align:center;">Student Result Application</h2>

<table border="1">
<tr>
    <th>Name</th>
    <th>Marks</th>
    <th>Branch</th>
    <th>Result</th>
    <th>Grade</th>
</tr>

<xsl:for-each select="students/student">

<tr>

<td><xsl:value-of select="name"/></td>
<td><xsl:value-of select="marks"/></td>
<td><xsl:value-of select="branch"/></td>

<!-- RESULT USING xsl:if -->
<td>
    <xsl:if test="marks &gt;= 40">
        <span class="pass">Pass</span>
    </xsl:if>

    <xsl:if test="marks &lt; 40">
        <span class="fail">Fail</span>
    </xsl:if>
</td>

<!-- GRADE USING xsl:choose -->
<td>
    <xsl:choose>

        <xsl:when test="marks &gt;= 75">
            <span class="distinction">Distinction</span>
        </xsl:when>

        <xsl:when test="marks &gt;= 60">
            First Class
        </xsl:when>

        <xsl:when test="marks &gt;= 40">
            Pass Class
        </xsl:when>

        <xsl:otherwise>
            Fail
        </xsl:otherwise>

    </xsl:choose>
</td>

</tr>

</xsl:for-each>

</table>

</body>
</html>

</xsl:template>
</xsl:stylesheet>