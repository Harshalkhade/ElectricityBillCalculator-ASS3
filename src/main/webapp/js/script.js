/* =========================================================
   VOLTWISE - ELECTRICITY BILL CALCULATOR
   Main UI JavaScript
   ========================================================= */

document.addEventListener("DOMContentLoaded", function () {

    /* =====================================================
       ELEMENTS
       ===================================================== */

    const form = document.getElementById("billForm");

    const customerName =
        document.getElementById("customerName");

    const customerNumber =
        document.getElementById("customerNumber");

    const unitsInput =
        document.getElementById("units");

    const billMonth =
        document.getElementById("billMonth");

    const calculateBtn =
        document.getElementById("calculateBtn");

    const resetBtn =
        document.getElementById("resetBtn");

    const livePreview =
        document.getElementById("livePreview");

    const liveAmount =
        document.getElementById("liveAmount");

    const darkModeToggle =
        document.getElementById("darkModeToggle");

    const darkModeIcon =
        document.getElementById("darkModeIcon");


    /* =====================================================
       TARIFF CALCULATION
       ===================================================== */

    function calculateElectricityBill(units) {

        let remaining = units;

        let total = 0;


        // First 50 units
        if (remaining > 0) {

            const firstSlab =
                Math.min(remaining, 50);

            total += firstSlab * 3.50;

            remaining -= firstSlab;
        }


        // Next 100 units
        if (remaining > 0) {

            const secondSlab =
                Math.min(remaining, 100);

            total += secondSlab * 4.00;

            remaining -= secondSlab;
        }


        // Next 100 units
        if (remaining > 0) {

            const thirdSlab =
                Math.min(remaining, 100);

            total += thirdSlab * 5.20;

            remaining -= thirdSlab;
        }


        // Above 250 units
        if (remaining > 0) {

            total += remaining * 6.50;
        }


        return total;
    }


    /* =====================================================
       LIVE BILL PREVIEW
       ===================================================== */

    if (unitsInput) {

        unitsInput.addEventListener(
            "input",
            function () {

                const units =
                    parseFloat(this.value);


                if (
                    isNaN(units) ||
                    units < 0
                ) {

                    livePreview.classList.add(
                        "d-none"
                    );

                    return;
                }


                const amount =
                    calculateElectricityBill(units);


                liveAmount.textContent =
                    "₹" + amount.toFixed(2);


                livePreview.classList.remove(
                    "d-none"
                );
            }
        );
    }


    /* =====================================================
       FORM VALIDATION
       ===================================================== */

    function showError(
        input,
        errorId,
        message
    ) {

        const group =
            input.closest(
                ".form-group-custom"
            );

        const error =
            document.getElementById(errorId);


        if (group) {

            group.classList.add(
                "has-error"
            );
        }


        if (error) {

            error.textContent =
                message;
        }
    }


    function clearError(
        input,
        errorId
    ) {

        const group =
            input.closest(
                ".form-group-custom"
            );

        const error =
            document.getElementById(errorId);


        if (group) {

            group.classList.remove(
                "has-error"
            );
        }


        if (error) {

            error.textContent = "";
        }
    }


    function validateForm() {

        let valid = true;


        /* ---------------------------------------------
           NAME
           --------------------------------------------- */

        if (!customerName.value.trim()) {

            showError(
                customerName,
                "nameError",
                "Please enter the consumer name."
            );

            valid = false;

        } else if (
            customerName.value.trim().length < 2
        ) {

            showError(
                customerName,
                "nameError",
                "Name must contain at least 2 characters."
            );

            valid = false;

        } else {

            clearError(
                customerName,
                "nameError"
            );
        }


        /* ---------------------------------------------
           CONSUMER NUMBER
           --------------------------------------------- */

        if (!customerNumber.value.trim()) {

            showError(
                customerNumber,
                "numberError",
                "Please enter the consumer number."
            );

            valid = false;

        } else {

            clearError(
                customerNumber,
                "numberError"
            );
        }


        /* ---------------------------------------------
           UNITS
           --------------------------------------------- */

        const units =
            parseFloat(unitsInput.value);


        if (
            unitsInput.value === "" ||
            isNaN(units)
        ) {

            showError(
                unitsInput,
                "unitsError",
                "Please enter electricity units."
            );

            valid = false;

        } else if (units < 0) {

            showError(
                unitsInput,
                "unitsError",
                "Units cannot be negative."
            );

            valid = false;

        } else {

            clearError(
                unitsInput,
                "unitsError"
            );
        }


        /* ---------------------------------------------
           BILLING MONTH
           --------------------------------------------- */

        if (!billMonth.value) {

            showError(
                billMonth,
                "monthError",
                "Please select the billing month."
            );

            valid = false;

        } else {

            clearError(
                billMonth,
                "monthError"
            );
        }


        return valid;
    }


    /* =====================================================
       CLEAR ERRORS WHILE TYPING
       ===================================================== */

    if (customerName) {

        customerName.addEventListener(
            "input",
            function () {

                clearError(
                    customerName,
                    "nameError"
                );
            }
        );
    }


    if (customerNumber) {

        customerNumber.addEventListener(
            "input",
            function () {

                clearError(
                    customerNumber,
                    "numberError"
                );
            }
        );
    }


    if (unitsInput) {

        unitsInput.addEventListener(
            "input",
            function () {

                clearError(
                    unitsInput,
                    "unitsError"
                );
            }
        );
    }


    if (billMonth) {

        billMonth.addEventListener(
            "change",
            function () {

                clearError(
                    billMonth,
                    "monthError"
                );
            }
        );
    }


    /* =====================================================
       FORM SUBMISSION
       ===================================================== */

    if (form) {

        form.addEventListener(
            "submit",
            function (event) {

                if (!validateForm()) {

                    event.preventDefault();

                    return;
                }


                /*
                 * Do not prevent the form submission.
                 * The Servlet will receive the form and
                 * calculate the final bill.
                 */

                if (calculateBtn) {

                    const buttonText =
                        calculateBtn.querySelector(
                            ".btn-text"
                        );

                    const spinner =
                        calculateBtn.querySelector(
                            ".btn-spinner"
                        );


                    if (buttonText) {

                        buttonText.classList.add(
                            "d-none"
                        );
                    }


                    if (spinner) {

                        spinner.classList.remove(
                            "d-none"
                        );
                    }


                    calculateBtn.disabled =
                        true;
                }
            }
        );
    }


    /* =====================================================
       RESET FORM
       ===================================================== */

    if (resetBtn) {

        resetBtn.addEventListener(
            "click",
            function () {

                setTimeout(
                    function () {

                        /*
                         * Remove validation errors
                         */

                        document
                            .querySelectorAll(
                                ".form-group-custom"
                            )
                            .forEach(
                                function (group) {

                                    group.classList.remove(
                                        "has-error"
                                    );
                                }
                            );


                        /*
                         * Clear error messages
                         */

                        document
                            .querySelectorAll(
                                ".invalid-feedback-custom"
                            )
                            .forEach(
                                function (error) {

                                    error.textContent =
                                        "";
                                }
                            );


                        /*
                         * Hide live preview
                         */

                        if (livePreview) {

                            livePreview.classList.add(
                                "d-none"
                            );
                        }


                        /*
                         * Restore calculate button
                         */

                        if (calculateBtn) {

                            const buttonText =
                                calculateBtn.querySelector(
                                    ".btn-text"
                                );

                            const spinner =
                                calculateBtn.querySelector(
                                    ".btn-spinner"
                                );


                            if (buttonText) {

                                buttonText.classList.remove(
                                    "d-none"
                                );
                            }


                            if (spinner) {

                                spinner.classList.add(
                                    "d-none"
                                );
                            }


                            calculateBtn.disabled =
                                false;
                        }

                    },
                    50
                );
            }
        );
    }


    /* =====================================================
       DARK MODE
       ===================================================== */

    function enableDarkMode() {

        document.body.classList.add(
            "dark-mode"
        );


        if (darkModeIcon) {

            darkModeIcon.className =
                "bi bi-sun-fill";
        }


        localStorage.setItem(
            "voltwise-theme",
            "dark"
        );
    }


    function disableDarkMode() {

        document.body.classList.remove(
            "dark-mode"
        );


        if (darkModeIcon) {

            darkModeIcon.className =
                "bi bi-moon-fill";
        }


        localStorage.setItem(
            "voltwise-theme",
            "light"
        );
    }


    /*
     * Load saved theme
     */

    const savedTheme =
        localStorage.getItem(
            "voltwise-theme"
        );


    if (savedTheme === "dark") {

        enableDarkMode();

    } else {

        disableDarkMode();
    }


    /*
     * Toggle theme
     */

    if (darkModeToggle) {

        darkModeToggle.addEventListener(
            "click",
            function () {

                if (
                    document.body.classList.contains(
                        "dark-mode"
                    )
                ) {

                    disableDarkMode();

                } else {

                    enableDarkMode();
                }
            }
        );
    }


    /* =====================================================
       SMOOTH SCROLL TO CALCULATOR
       ===================================================== */

    document
        .querySelectorAll(
            'a[href="#billForm"]'
        )
        .forEach(
            function (link) {

                link.addEventListener(
                    "click",
                    function (event) {

                        const target =
                            document.getElementById(
                                "billForm"
                            );


                        if (target) {

                            event.preventDefault();


                            target.scrollIntoView({
                                behavior: "smooth",
                                block: "center"
                            });


                            /*
                             * Highlight calculator
                             */

                            target.style.transition =
                                "box-shadow 0.3s ease";


                            target.style.boxShadow =
                                "0 0 0 5px rgba(0,166,166,0.12)";


                            setTimeout(
                                function () {

                                    target.style.boxShadow =
                                        "";

                                },
                                1200
                            );
                        }
                    }
                );
            }
        );


    /* =====================================================
       NUMBER INPUT PROTECTION
       ===================================================== */

    if (unitsInput) {

        unitsInput.addEventListener(
            "keydown",
            function (event) {

                /*
                 * Prevent minus sign.
                 */

                if (
                    event.key === "-" ||
                    event.key === "e"
                ) {

                    event.preventDefault();
                }
            }
        );
    }


    /* =====================================================
       CONSUMER NUMBER FORMAT
       ===================================================== */

    if (customerNumber) {

        customerNumber.addEventListener(
            "input",
            function () {

                /*
                 * Keep the consumer number clean.
                 * Allows letters, numbers and hyphens.
                 */

                this.value =
                    this.value
                        .replace(
                            /[^a-zA-Z0-9-]/g,
                            ""
                        )
                        .toUpperCase();
            }
        );
    }


    /* =====================================================
       INITIAL MESSAGE
       ===================================================== */

    console.log(
        "VoltWise electricity calculator loaded successfully."
    );

});