<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Investment Management Report</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
                    th, td { border: 1px solid #ddd; padding: 8px; }
                    th { background-color: #f4f4f4; }
                    h1 { text-align: center; }
                </style>
            </head>
            <body>
                <h1>Investment Management Report</h1>
                
                <h2>Investor Details</h2>
                <table>
                    <tbody>
                        <tr>
                            <td>ID</td>
                            <td><xsl:value-of select="InvestmentManagement/Investor/ID"/></td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td><xsl:value-of select="InvestmentManagement/Investor/Name"/></td>
                        </tr>
                        <tr>
                            <td>Date of Birth</td>
                            <td><xsl:value-of select="InvestmentManagement/Investor/DateOfBirth"/></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><xsl:value-of select="InvestmentManagement/Investor/Email"/></td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td><xsl:value-of select="InvestmentManagement/Investor/PhoneNumber"/></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td>
                                <xsl:value-of select="concat(InvestmentManagement/Investor/Address/Street, ', ', 
                                                InvestmentManagement/Investor/Address/City, ', ', 
                                                InvestmentManagement/Investor/Address/State, ' ', 
                                                InvestmentManagement/Investor/Address/ZipCode, ', ', 
                                                InvestmentManagement/Investor/Address/Country)"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <h2>Investments</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th>Performance</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="InvestmentManagement/Investor/Investment">
                            <tr>
                                <td><xsl:value-of select="Type"/></td>
                                <td><xsl:value-of select="Amount"/> <xsl:value-of select="Amount/@currency"/></td>
                                <td><xsl:value-of select="Date"/></td>
                                <td>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Value</th>
                                                <th>Change</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><xsl:value-of select="InvestmentPerformance/PerformanceDate"/></td>
                                                <td><xsl:value-of select="InvestmentPerformance/Value"/> <xsl:value-of select="InvestmentPerformance/Value/@currency"/></td>
                                                <td><xsl:value-of select="InvestmentPerformance/Change"/></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                
                <h2>Total Value</h2>
                <table>
                    <tbody>
                        <tr>
                            <td><xsl:value-of select="InvestmentManagement/Investor/TotalValue"/> <xsl:value-of select="InvestmentManagement/Investor/TotalValue/@currency"/></td>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
