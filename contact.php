<?php
require_once "./php/helper.php";

// Einfacher Form Handler - 3 Zeiler wie gewünscht
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // TODO: Hier deine Verarbeitung implementieren
    exit(json_encode(['success' => true, 'message' => 'Nachricht wurde gesendet']));
}
?>

<!DOCTYPE html>
<html dir="ltr" lang="de">
<head>
    <?php include('./includes/head.php') ?>
    <title>Kontakt</title>
</head>
<body>
<div class="wrap">
    <?php include('./includes/header.php')?>

    <section class="contactPage page">
        <form id="contactForm" action="/includes/contact-send.php" method="post" novalidate>

                <div class="grid grid--two">
                    <div class="field">
                        <label for="name">
                            Name <span class="req">*</span>
                        </label>
                        <input
                            id="name"
                            name="name"
                            type="text"
                            value="Entfern mich!"
                            required
                            autocomplete="name"
                        />
                        <span class="error-msg" id="name-error" role="alert"></span>
                    </div>

                    <div class="field">
                        <label for="email">
                            E-Mail <span class="req">*</span>
                        </label>
                        <input
                            id="email"
                            name="email"
                            value="kai@beispiel.de"
                            type="email"
                            inputmode="email"
                            required
                            autocomplete="email"

                        />
                        <span class="error-msg" id="email-error" role="alert"></span>
                    </div>
                </div>

                <div class="field">
                    <label for="phone">
                        Telefon <span class="opt">(optional)</span>
                    </label>
                    <input
                        id="phone"
                        name="phone"
                        type="tel"
                        inputmode="tel"
                        autocomplete="tel"
                    />
                    <span class="error-msg" id="phone-error" role="alert"></span>
                </div>

                <div class="field">
                    <label for="message">
                        Nachricht <span class="req">*</span>
                    </label>
                    <textarea
                        id="message"
                        name="message"
                        required
                    >lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum</textarea>
                    <span class="error-msg" id="message-error" role="alert"></span>
                </div>

                <div class="datenschutz">
                    <label class="checkbox-container">
                        <input
                            id="datenschutz"
                            name="datenschutz"
                            type="checkbox"
                            required
                        />
                        <span class="checkbox-label">
                            Ich akzeptiere die
                            <a onclick="alert('wird noch erstellt!');" target="_blank" rel="noopener">Datenschutzbestimmungen</a>.
                        </span>
                    </label>
                    <span class="error-msg" id="privacy-error" role="alert"></span>
                </div>

                <div class="actions">
                    <button type="submit" id="submitBtn">
                        <span class="btn-text">Nachricht senden</span>
                        <span class="btn-loading" >Sende...</span>
                    </button>
                </div>


            <div class="form-status" id="formStatus" ></div>
        </form>
    </section>

    <?php include('./includes/footer.php')?>
</div>

</body>
</html>
