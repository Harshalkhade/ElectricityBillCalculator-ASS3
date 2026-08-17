<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <meta name="description"
          content="VoltWise electricity bill calculator">

    <title>VoltWise | Electricity Bill Calculator</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Space+Grotesk:wght@500;600;700&display=swap"
          rel="stylesheet">

    <!-- Your CSS -->
    <link href="${pageContext.request.contextPath}/css/style.css"
          rel="stylesheet">

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg navbar-dark custom-navbar">

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


        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>


        <div class="collapse navbar-collapse"
             id="navbarNav">

            <ul class="navbar-nav ms-auto align-items-center">

                <li class="nav-item">

                    <a class="nav-link active"
                       href="${pageContext.request.contextPath}/">

                        <i class="bi bi-calculator me-1"></i>
                        Calculator

                    </a>

                </li>


                <li class="nav-item">

                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/history">

                        <i class="bi bi-clock-history me-1"></i>
                        History

                    </a>

                </li>


                <li class="nav-item ms-lg-3">

                    <button id="darkModeToggle"
                            class="btn btn-outline-light rounded-pill">

                        <i class="bi bi-moon-fill"
                           id="darkModeIcon"></i>

                    </button>

                </li>

            </ul>

        </div>

    </div>

</nav>


<!-- ================= HERO ================= -->

<section class="hero-section">

    <div class="container">

        <div class="row align-items-center g-5">


            <!-- LEFT SIDE -->

            <div class="col-lg-6">

                <div class="hero-badge">

                    <i class="bi bi-lightning-charge-fill"></i>

                    SMART POWER ESTIMATOR

                </div>


                <h1 class="hero-title">

                    Know Your

                    <span class="gradient-text">
                        Electricity Cost
                    </span>

                    Before the Bill Arrives.

                </h1>


                <p class="hero-subtitle">

                    Enter your electricity consumption and
                    instantly calculate your estimated bill
                    using the four tariff slabs given in the
                    assignment.

                </p>


                <div class="hero-cta">

                    <a href="#billForm"
                       class="btn btn-calculate btn-lg">

                        <i class="bi bi-calculator-fill me-2"></i>

                        Estimate My Bill

                    </a>


                    <a href="${pageContext.request.contextPath}/history"
                       class="btn btn-outline-light btn-lg">

                        <i class="bi bi-clock-history me-2"></i>

                        View History

                    </a>

                </div>


                <!-- SMALL INFO -->

                <div class="hero-info">

                    <div>

                        <i class="bi bi-lightning-charge-fill"></i>

                        <span>
                            Four slab tariff
                        </span>

                    </div>


                    <div>

                        <i class="bi bi-phone-fill"></i>

                        <span>
                            Responsive design
                        </span>

                    </div>


                    <div>

                        <i class="bi bi-check-circle-fill"></i>

                        <span>
                            Instant estimate
                        </span>

                    </div>

                </div>

            </div>


            <!-- RIGHT SIDE -->

            <div class="col-lg-6">

                <div class="calculator-card">


                    <!-- CARD HEADER -->

                    <div class="calculator-header">

                        <div class="calculator-icon">

                            <i class="bi bi-calculator-fill"></i>

                        </div>


                        <div>

                            <h2>
                                Power Estimator
                            </h2>

                            <p>
                                Calculate your monthly bill
                            </p>

                        </div>

                    </div>


                    <!-- ERROR MESSAGE -->

                    <c:if test="${not empty sessionScope.errorMessage}">

                        <div class="alert alert-danger">

                            <i class="bi bi-exclamation-triangle-fill me-2"></i>

                            ${sessionScope.errorMessage}

                        </div>

                        <c:remove var="errorMessage"
                                  scope="session"/>

                    </c:if>


                    <!-- TARIFF PANEL -->

                    <div class="tariff-note">

                        <div class="tariff-note-title">

                            <i class="bi bi-lightning-charge-fill"></i>

                            Project Tariff

                        </div>


                        <div class="tariff-note-grid">

                            <div>

                                <strong>0–50</strong>

                                <span>
                                    ₹3.50 / unit
                                </span>

                            </div>


                            <div>

                                <strong>51–150</strong>

                                <span>
                                    ₹4.00 / unit
                                </span>

                            </div>


                            <div>

                                <strong>151–250</strong>

                                <span>
                                    ₹5.20 / unit
                                </span>

                            </div>


                            <div>

                                <strong>251+</strong>

                                <span>
                                    ₹6.50 / unit
                                </span>

                            </div>

                        </div>

                    </div>


                    <!-- FORM -->

                    <form id="billForm"
                          action="${pageContext.request.contextPath}/calculate"
                          method="post"
                          class="calculator-form"
                          novalidate>


                        <!-- NAME -->

                        <div class="form-group-custom">

                            <label for="customerName">

                                <i class="bi bi-person-fill"></i>

                                Consumer Name

                            </label>


                            <input type="text"
                                   id="customerName"
                                   name="customerName"
                                   placeholder="Enter your name"
                                   maxlength="100"
                                   required>


                            <div id="nameError"
                                 class="invalid-feedback-custom">
                            </div>

                        </div>


                        <!-- CONSUMER NUMBER -->

                        <div class="form-group-custom">

                            <label for="customerNumber">

                                <i class="bi bi-hash"></i>

                                Consumer Number

                            </label>


                            <input type="text"
                                   id="customerNumber"
                                   name="customerNumber"
                                   placeholder="Example: EB1001"
                                   maxlength="50"
                                   required>


                            <div id="numberError"
                                 class="invalid-feedback-custom">
                            </div>

                        </div>


                        <!-- UNITS -->

                        <div class="form-group-custom">

                            <label for="units">

                                <i class="bi bi-speedometer2"></i>

                                Electricity Units Consumed

                            </label>


                            <div class="unit-input">

                                <input type="number"
                                       id="units"
                                       name="units"
                                       placeholder="Example: 180"
                                       min="0"
                                       step="0.01"
                                       required>

                                <span>
                                    kWh
                                </span>

                            </div>


                            <div id="unitsError"
                                 class="invalid-feedback-custom">
                            </div>


                            <!-- LIVE ESTIMATE -->

                            <div id="livePreview"
                                 class="live-preview d-none">

                                Estimated Bill:

                                <strong id="liveAmount">
                                    ₹0.00
                                </strong>

                            </div>

                        </div>


                        <!-- BILLING MONTH -->

                        <div class="form-group-custom">

                            <label for="billMonth">

                                <i class="bi bi-calendar-event"></i>

                                Billing Month

                            </label>


                            <select id="billMonth"
                                    name="billMonth"
                                    required>

                                <option value="">
                                    Select month
                                </option>

                                <option value="2026-07">
                                    July 2026
                                </option>

                                <option value="2026-08">
                                    August 2026
                                </option>

                                <option value="2026-09">
                                    September 2026
                                </option>

                                <option value="2026-10">
                                    October 2026
                                </option>

                            </select>

                            <div id="monthError"
                                 class="invalid-feedback-custom">
                            </div>

                        </div>


                        <!-- RATE SUMMARY -->

                        <div class="rate-summary">

                            <div class="rate-summary-title">

                                <i class="bi bi-info-circle-fill"></i>

                                Rate Structure

                            </div>


                            <div class="rate-row">

                                <span>
                                    First 50 units
                                </span>

                                <strong>
                                    ₹3.50
                                </strong>

                            </div>


                            <div class="rate-row">

                                <span>
                                    Next 100 units
                                </span>

                                <strong>
                                    ₹4.00
                                </strong>

                            </div>


                            <div class="rate-row">

                                <span>
                                    Next 100 units
                                </span>

                                <strong>
                                    ₹5.20
                                </strong>

                            </div>


                            <div class="rate-row">

                                <span>
                                    Above 250 units
                                </span>

                                <strong>
                                    ₹6.50
                                </strong>

                            </div>

                        </div>


                        <!-- BUTTONS -->

                        <button type="submit"
                                id="calculateBtn"
                                class="btn btn-calculate w-100">

                            <span class="btn-text">

                                <i class="bi bi-lightning-charge-fill me-2"></i>

                                Calculate Electricity Bill

                            </span>


                            <span class="btn-spinner d-none">

                                <span class="spinner-border spinner-border-sm me-2"></span>

                                Calculating...

                            </span>

                        </button>


                        <button type="reset"
                                id="resetBtn"
                                class="btn btn-reset w-100 mt-3">

                            <i class="bi bi-arrow-counterclockwise me-2"></i>

                            Clear Form

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================= FEATURES ================= -->

<section class="features-section">

    <div class="container">

        <div class="text-center section-heading">

            <span class="section-label">
                WHY VOLTWISE?
            </span>

            <h2>
                Simple. Clear. Useful.
            </h2>

            <p>
                A student-friendly electricity bill calculator
                built with Java Servlet and JSP.
            </p>

        </div>


        <div class="row g-4">


            <div class="col-md-4">

                <div class="feature-card">

                    <div class="feature-icon">
                        <i class="bi bi-lightning-charge-fill"></i>
                    </div>

                    <h3>
                        Instant Calculation
                    </h3>

                    <p>
                        Calculate your electricity cost
                        quickly using the required tariff slabs.
                    </p>

                </div>

            </div>


            <div class="col-md-4">

                <div class="feature-card">

                    <div class="feature-icon">
                        <i class="bi bi-bar-chart-fill"></i>
                    </div>

                    <h3>
                        Clear Breakdown
                    </h3>

                    <p>
                        Understand how different consumption
                        levels contribute to your final bill.
                    </p>

                </div>

            </div>


            <div class="col-md-4">

                <div class="feature-card">

                    <div class="feature-icon">
                        <i class="bi bi-phone-fill"></i>
                    </div>

                    <h3>
                        Responsive Design
                    </h3>

                    <p>
                        The interface adapts to desktop,
                        tablet and mobile screens.
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================= FOOTER ================= -->

<footer class="site-footer">

    <div class="container">

        <div class="row align-items-center">

            <div class="col-md-6">

                <div class="footer-brand">

                    <i class="bi bi-lightning-charge-fill"></i>

                    VoltWise

                </div>

                <p>
                    Electricity cost estimation made simple.
                </p>

            </div>


            <div class="col-md-6 text-md-end">

                <p>
                    &copy; 2026 VoltWise
                </p>

                <div class="tech-badges">

                    <span>
                        Java
                    </span>

                    <span>
                        Servlet
                    </span>

                    <span>
                        JSP
                    </span>

                </div>

            </div>

        </div>

    </div>

</footer>


<!-- Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


<!-- Custom JavaScript -->

<script src="${pageContext.request.contextPath}/js/script.js">
</script>

</body>

</html>