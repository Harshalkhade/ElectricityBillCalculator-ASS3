<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>VoltWise | Calculation History</title>

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
               class="btn btn-calculate rounded-pill">

                <i class="bi bi-plus-lg me-1"></i>

                New Estimate

            </a>

        </div>

    </div>

</nav>



<!-- =====================================================
     HISTORY SECTION
     ===================================================== -->

<main class="history-container">

    <div class="container">


        <!-- PAGE HEADER -->

        <div class="history-heading">

            <div>

                <span class="section-label">
                    VOLTWISE RECORDS
                </span>

                <h1>
                    Calculation History
                </h1>

                <p>
                    Review your previous electricity
                    bill estimates in one place.
                </p>

            </div>


            <a href="${pageContext.request.contextPath}/"
               class="btn btn-outline-secondary">

                <i class="bi bi-calculator me-2"></i>

                Calculator

            </a>

        </div>



        <!-- =================================================
             SUMMARY CARDS
             ================================================= -->

        <div class="row g-3 mb-4">


            <div class="col-md-4">

                <div class="history-stat">

                    <div class="history-stat-icon">

                        <i class="bi bi-receipt"></i>

                    </div>


                    <div>

                        <span>
                            Total Estimates
                        </span>

                        <strong>
                            ${history.size()}
                        </strong>

                    </div>

                </div>

            </div>


            <div class="col-md-4">

                <div class="history-stat">

                    <div class="history-stat-icon">

                        <i class="bi bi-lightning-charge-fill"></i>

                    </div>


                    <div>

                        <span>
                            Usage Records
                        </span>

                        <strong>
                            ${history.size()}
                        </strong>

                    </div>

                </div>

            </div>


            <div class="col-md-4">

                <div class="history-stat">

                    <div class="history-stat-icon">

                        <i class="bi bi-clock-history"></i>

                    </div>


                    <div>

                        <span>
                            Status
                        </span>

                        <strong>
                            Active
                        </strong>

                    </div>

                </div>

            </div>

        </div>



        <!-- =================================================
             HISTORY CARD
             ================================================= -->

        <div class="history-card">


            <!-- CARD HEADER -->

            <div class="history-card-header">

                <div>

                    <h2>
                        Recent Estimates
                    </h2>

                    <p>
                        Your saved electricity calculations
                    </p>

                </div>


                <div class="history-search">

                    <i class="bi bi-search"></i>

                    <input type="text"
                           id="historySearch"
                           placeholder="Search records...">

                </div>

            </div>



            <!-- =================================================
                 EMPTY STATE
                 ================================================= -->

            <c:if test="${empty history}">

                <div class="empty-history">

                    <div class="empty-history-icon">

                        <i class="bi bi-receipt-cutoff"></i>

                    </div>


                    <h3>
                        No calculations yet
                    </h3>


                    <p>
                        Your electricity bill estimates
                        will appear here after you calculate
                        your first bill.
                    </p>


                    <a href="${pageContext.request.contextPath}/"
                       class="btn btn-calculate">

                        <i class="bi bi-lightning-charge-fill me-2"></i>

                        Create First Estimate

                    </a>

                </div>

            </c:if>



            <!-- =================================================
                 TABLE
                 ================================================= -->

            <c:if test="${not empty history}">

                <div class="table-responsive">

                    <table class="table history-table"
                           id="historyTable">

                        <thead>

                        <tr>

                            <th>
                                Consumer
                            </th>

                            <th>
                                Meter Number
                            </th>

                            <th>
                                Units
                            </th>

                            <th>
                                Month
                            </th>

                            <th>
                                Estimated Bill
                            </th>

                            <th>
                                Action
                            </th>

                        </tr>

                        </thead>


                        <tbody>


                        <c:forEach
                                var="bill"
                                items="${history}">

                            <tr class="history-row">


                                <!-- CONSUMER -->

                                <td>

                                    <div class="consumer-cell">

                                        <div class="consumer-avatar">

                                            <i class="bi bi-person-fill"></i>

                                        </div>


                                        <div>

                                            <strong>
                                                ${bill.customerName}
                                            </strong>

                                            <small>
                                                Electricity consumer
                                            </small>

                                        </div>

                                    </div>

                                </td>


                                <!-- NUMBER -->

                                <td>

                                    <span class="meter-number">

                                        ${bill.customerNumber}

                                    </span>

                                </td>


                                <!-- UNITS -->

                                <td>

                                    <span class="unit-badge">

                                        ${bill.units} kWh

                                    </span>

                                </td>


                                <!-- MONTH -->

                                <td>

                                    ${bill.billMonth}

                                </td>


                                <!-- AMOUNT -->

                                <td>

                                    <strong class="history-amount">

                                        ₹${bill.totalAmount}

                                    </strong>

                                </td>


                                <!-- ACTION -->

                                <td>

                                    <button type="button"
                                            class="history-view-btn"
                                            onclick="showBillDetails(
                                                '${bill.customerName}',
                                                '${bill.customerNumber}',
                                                '${bill.units}',
                                                '${bill.billMonth}',
                                                '${bill.totalAmount}'
                                            )">

                                        <i class="bi bi-eye"></i>

                                        View

                                    </button>

                                </td>

                            </tr>

                        </c:forEach>


                        </tbody>

                    </table>

                </div>


                <!-- NO SEARCH RESULTS -->

                <div id="noSearchResults"
                     class="no-search-results d-none">

                    <i class="bi bi-search"></i>

                    <h3>
                        No matching records
                    </h3>

                    <p>
                        Try searching with another name,
                        meter number or billing month.
                    </p>

                </div>

            </c:if>

        </div>

    </div>

</main>



<!-- =====================================================
     BILL DETAILS MODAL
     ===================================================== -->

<div class="modal fade"
     id="billDetailsModal"
     tabindex="-1">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">


            <div class="modal-header">

                <h5 class="modal-title">

                    <i class="bi bi-receipt me-2"></i>

                    Estimate Details

                </h5>


                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <div class="modal-body">

                <div class="modal-detail">

                    <span>
                        Consumer
                    </span>

                    <strong id="detailName">
                        -
                    </strong>

                </div>


                <div class="modal-detail">

                    <span>
                        Consumer Number
                    </span>

                    <strong id="detailNumber">
                        -
                    </strong>

                </div>


                <div class="modal-detail">

                    <span>
                        Units Consumed
                    </span>

                    <strong id="detailUnits">
                        -
                    </strong>

                </div>


                <div class="modal-detail">

                    <span>
                        Billing Month
                    </span>

                    <strong id="detailMonth">
                        -
                    </strong>

                </div>


                <div class="modal-total">

                    <span>
                        Estimated Bill
                    </span>

                    <strong id="detailAmount">
                        ₹0.00
                    </strong>

                </div>

            </div>


            <div class="modal-footer">

                <button type="button"
                        class="btn btn-reset"
                        data-bs-dismiss="modal">

                    Close

                </button>

            </div>

        </div>

    </div>

</div>



<!-- =====================================================
     FOOTER
     ===================================================== -->

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



<!-- Bootstrap -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>



<!-- =====================================================
     HISTORY JAVASCRIPT
     ===================================================== -->

<script>

document.addEventListener(
    "DOMContentLoaded",
    function () {


        const search =
            document.getElementById(
                "historySearch"
            );


        const rows =
            document.querySelectorAll(
                ".history-row"
            );


        const noResults =
            document.getElementById(
                "noSearchResults"
            );


        if (search) {

            search.addEventListener(
                "input",
                function () {

                    const query =
                        this.value
                            .toLowerCase()
                            .trim();


                    let visibleRows = 0;


                    rows.forEach(
                        function (row) {

                            const text =
                                row.textContent
                                   .toLowerCase();


                            if (
                                text.includes(query)
                            ) {

                                row.style.display =
                                    "";

                                visibleRows++;

                            } else {

                                row.style.display =
                                    "none";
                            }

                        }
                    );


                    if (
                        noResults &&
                        visibleRows === 0
                    ) {

                        noResults.classList.remove(
                            "d-none"
                        );

                    } else if (noResults) {

                        noResults.classList.add(
                            "d-none"
                        );
                    }

                }
            );
        }

    }
);



function showBillDetails(
    name,
    number,
    units,
    month,
    amount
) {

    document.getElementById(
        "detailName"
    ).textContent = name;


    document.getElementById(
        "detailNumber"
    ).textContent = number;


    document.getElementById(
        "detailUnits"
    ).textContent =
        units + " kWh";


    document.getElementById(
        "detailMonth"
    ).textContent = month;


    document.getElementById(
        "detailAmount"
    ).textContent =
        "₹" + amount;


    const modal =
        new bootstrap.Modal(
            document.getElementById(
                "billDetailsModal"
            )
        );


    modal.show();
}

</script>


</body>

</html>