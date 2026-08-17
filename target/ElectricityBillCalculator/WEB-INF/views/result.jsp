<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>VoltWise | Bill Result</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Space+Grotesk:wght@500;600;700&display=swap"
          rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/style.css"
          rel="stylesheet">

</head>


<body>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<nav class="navbar navbar-dark custom-navbar">

    <div class="container">

        <a class="navbar-brand d-flex align-items-center gap-2"
           href="${pageContext.request.contextPath}/">

            <div class="brand-icon">

                <i class="bi bi-lightning-charge-fill"></i>

            </div>

            <span class="brand-name">
                VoltWise
            </span>

        </a>


        <div>

            <a href="${pageContext.request.contextPath}/"
               class="btn btn-outline-light rounded-pill">

                <i class="bi bi-calculator me-1"></i>

                New Estimate

            </a>

        </div>

    </div>

</nav>



<!-- =====================================================
     RESULT
     ===================================================== -->

<main class="result-container">

    <div class="result-card">


        <!-- SUCCESS ICON -->

        <div class="text-center">

            <div class="result-icon">

                <i class="bi bi-check-lg"></i>

            </div>


            <h1>
                Bill Estimate Ready
            </h1>


            <p class="text-muted">

                Your electricity cost has been
                calculated using the required tariff slabs.

            </p>

        </div>



        <!-- =================================================
             CUSTOMER INFORMATION
             ================================================= -->

        <div class="row g-3 mt-4">


            <div class="col-md-6">

                <div class="info-box">

                    <span class="info-label">

                        <i class="bi bi-person-fill"></i>

                        Consumer Name

                    </span>


                    <strong>
                        ${bill.customerName}
                    </strong>

                </div>

            </div>


            <div class="col-md-6">

                <div class="info-box">

                    <span class="info-label">

                        <i class="bi bi-hash"></i>

                        Consumer Number

                    </span>


                    <strong>
                        ${bill.customerNumber}
                    </strong>

                </div>

            </div>


            <div class="col-md-6">

                <div class="info-box">

                    <span class="info-label">

                        <i class="bi bi-speedometer2"></i>

                        Units Consumed

                    </span>


                    <strong>

                        ${bill.units}

                        <small>kWh</small>

                    </strong>

                </div>

            </div>


            <div class="col-md-6">

                <div class="info-box">

                    <span class="info-label">

                        <i class="bi bi-calendar-event"></i>

                        Billing Month

                    </span>


                    <strong>
                        ${bill.billMonth}
                    </strong>

                </div>

            </div>

        </div>



        <!-- =================================================
             TOTAL
             ================================================= -->

        <div class="total-bill">

            <span>
                ESTIMATED ELECTRICITY BILL
            </span>


            <strong>
                ₹${bill.totalAmount}
            </strong>

        </div>



        <!-- =================================================
             TARIFF BREAKDOWN
             ================================================= -->

        <div class="mt-4">

            <div class="d-flex
                        justify-content-between
                        align-items-center
                        mb-3">

                <h2 class="h5 mb-0">

                    <i class="bi bi-bar-chart-fill me-2"></i>

                    Tariff Breakdown

                </h2>


                <span class="badge rounded-pill"
                      style="background:#e8f8f8;color:#007f7f;">

                    Slab Based

                </span>

            </div>


            <div class="table-responsive">

                <table class="table result-table">

                    <thead>

                    <tr>

                        <th>
                            Slab
                        </th>

                        <th>
                            Units
                        </th>

                        <th>
                            Rate / Unit
                        </th>

                        <th class="text-end">
                            Amount
                        </th>

                    </tr>

                    </thead>


                    <tbody>


                    <!-- FIRST SLAB -->

                    <tr>

                        <td>

                            <strong>
                                First 50 units
                            </strong>

                            <small>
                                0–50
                            </small>

                        </td>

                        <td>
                            ${bill.slab1Units}
                        </td>

                        <td>
                            ₹3.50
                        </td>

                        <td class="text-end">
                            ₹${bill.slab1Amount}
                        </td>

                    </tr>


                    <!-- SECOND SLAB -->

                    <tr>

                        <td>

                            <strong>
                                Next 100 units
                            </strong>

                            <small>
                                51–150
                            </small>

                        </td>

                        <td>
                            ${bill.slab2Units}
                        </td>

                        <td>
                            ₹4.00
                        </td>

                        <td class="text-end">
                            ₹${bill.slab2Amount}
                        </td>

                    </tr>


                    <!-- THIRD SLAB -->

                    <tr>

                        <td>

                            <strong>
                                Next 100 units
                            </strong>

                            <small>
                                151–250
                            </small>

                        </td>

                        <td>
                            ${bill.slab3Units}
                        </td>

                        <td>
                            ₹5.20
                        </td>

                        <td class="text-end">
                            ₹${bill.slab3Amount}
                        </td>

                    </tr>


                    <!-- FOURTH SLAB -->

                    <tr>

                        <td>

                            <strong>
                                Above 250 units
                            </strong>

                            <small>
                                251+
                            </small>

                        </td>

                        <td>
                            ${bill.slab4Units}
                        </td>

                        <td>
                            ₹6.50
                        </td>

                        <td class="text-end">
                            ₹${bill.slab4Amount}
                        </td>

                    </tr>


                    </tbody>


                    <tfoot>

                    <tr>

                        <th colspan="3">
                            Estimated Total
                        </th>

                        <th class="text-end">

                            ₹${bill.totalAmount}

                        </th>

                    </tr>

                    </tfoot>

                </table>

            </div>

        </div>



        <!-- =================================================
             PROJECT NOTE
             ================================================= -->

        <div class="result-note">

            <i class="bi bi-info-circle-fill"></i>

            <div>

                <strong>
                    How was this calculated?
                </strong>

                <p>

                    The total is calculated progressively:
                    each group of units is charged according
                    to its applicable tariff slab.

                </p>

            </div>

        </div>



        <!-- =================================================
             ACTION BUTTONS
             ================================================= -->

        <div class="result-actions">

            <a href="${pageContext.request.contextPath}/"
               class="btn btn-calculate">

                <i class="bi bi-lightning-charge-fill me-2"></i>

                Calculate Another Bill

            </a>


            <a href="${pageContext.request.contextPath}/history"
               class="btn btn-reset">

                <i class="bi bi-clock-history me-2"></i>

                View History

            </a>

        </div>

    </div>

</main>



<!-- =====================================================
     FOOTER
     ================================================= -->

<footer class="site-footer">

    <div class="container text-center">

        <div class="footer-brand">

            <i class="bi bi-lightning-charge-fill"></i>

            VoltWise

        </div>

        <p>
            Simple electricity cost estimation.
        </p>

    </div>

</footer>


</body>

</html>