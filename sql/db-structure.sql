-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Erstellungszeit: 05. Nov 2025 um 22:54
-- Server-Version: 10.11.14-MariaDB-ubu2204-log
-- PHP-Version: 8.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`) VALUES
(1, 'abc', 'kai@willam.email', NULL, 'test'),
(2, 'fafdafdafa', 'kai@beispiel.de', '', 'lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum'),
(3, 'Entfern mich!', 'kai@beispiel.de', '', 'lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum'),
(4, 'Entfern mich!', 'kai@beispiel.de', '', 'lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `datetime`) VALUES
(11, 'Beispielartikel Eins Zwei Drei', 'Dies ist ein längerer Blindtext, der keinerlei inhaltliche Bedeutung besitzt. Er dient ausschließlich dazu, die Funktionalität der Datenbank zu testen und Textfelder mit Inhalt zu füllen. Die Worte sind zufällig gewählt und ergeben keinen Sinn. Trotzdem sieht der Text aus wie ein richtiger Absatz. Wer bis hierhin liest, hat schon mehr getan als nötig. Hier endet der erste Beispieldatensatz für Testzwecke.', '2025-01-01 10:00:00'),
(12, 'Testmeldung Zwei Drei Viertel', 'Hier folgt ein weiterer Platzhaltertext in deutscher Sprache. Dieser Abschnitt wiederholt sich absichtlich in verschiedenen Variationen, um natürliche Textlängen zu simulieren. Es handelt sich nicht um echte Nachrichten, sondern um zufällige Aneinanderreihungen von Sätzen. Die Grammatik ist korrekt, der Inhalt vollkommen leer. So lässt sich gut prüfen, ob die Darstellung im Frontend ordentlich funktioniert. Damit ist auch der zweite Datensatz gefüllt.', '2025-01-02 11:30:00'),
(13, 'Dritte Nachricht – nur zum Testen', 'Ein dritter Testeintrag mit viel überflüssigem Text. Dieser Text enthält Phrasen, die keinerlei Mehrwert haben, aber schön viel Platz einnehmen. Die Absicht ist, das Layout mit realistisch wirkenden Daten zu befüllen. Wenn du diesen Satz liest, dann weißt du, dass hier nichts Bedeutendes steht. Dennoch ist der Text formatiert, sauber und vollständig. Damit erfüllt er genau den Zweck eines Dummytextes.', '2025-01-03 09:15:00'),
(14, 'Vierte Beispiel-News mit Fülltext', 'Blindtexte sind die wahren Helden der Datenbankwelt. Ohne sie wäre das Testen von Anwendungen eine trockene Angelegenheit. Dieser Text möchte nur zeigen, wie ein etwas längerer Inhalt aussehen könnte. Mehrere Sätze, keine Bedeutung, aber eine gute Struktur. Man könnte fast meinen, es handle sich um eine echte Meldung, doch in Wahrheit steckt hier nur synthetischer Unsinn drin. Ende der Mitteilung.', '2025-01-04 08:45:00'),
(15, 'Fünfter Platzhalter-Eintrag', 'Blindtexte sind die wahren Helden der Datenbankwelt. Ohne sie wäre das Testen von Anwendungen eine trockene Angelegenheit. Dieser Text möchte nur zeigen, wie ein etwas längerer Inhalt aussehen könnte. Mehrere Sätze, keine Bedeutung, aber eine gute Struktur. Man könnte fast meinen, es handle sich um eine echte Meldung, doch in Wahrheit steckt hier nur synthetischer Unsinn drin. Ende der Mitteilung. Blindtexte sind die wahren Helden der Datenbankwelt. Ohne sie wäre das Testen von Anwendungen eine trockene Angelegenheit. Dieser Text möchte nur zeigen, wie ein etwas längerer Inhalt aussehen könnte. Mehrere Sätze, keine Bedeutung, aber eine gute Struktur. \r\n\r\nMan könnte fast meinen, es handle sich um eine echte Meldung, doch in Wahrheit steckt hier nur synthetischer Unsinn drin. Ende der Mitteilung. Blindtexte sind die wahren Helden der Datenbankwelt. Ohne sie wäre das Testen von Anwendungen eine trockene Angelegenheit. Dieser Text möchte nur zeigen, wie ein etwas längerer Inhalt aussehen könnte. Mehrere Sätze, keine Bedeutung, aber eine gute Struktur. \r\n\r\n\r\nMan könnte fast meinen, es handle sich um eine echte Meldung, doch in Wahrheit steckt hier nur synthetischer Unsinn drin. Ende der Mitteilung.', '2025-01-05 14:10:00'),
(16, 'Sechste Nachricht zur Layoutprüfung', 'Eine sechste Meldung darf in einer ordentlichen Testreihe natürlich nicht fehlen. Auch hier ist alles nur simuliert. Kein Ereignis, keine Quelle, keine Bedeutung. Stattdessen wird der Text absichtlich in mittlerer Länge gehalten, um typische Artikel darzustellen. Zwischen den Zeilen steht nichts. Aber immerhin steht da etwas zwischen den Zeilen. Das sollte für Testzwecke reichen.', '2025-01-06 16:20:00'),
(17, 'Siebte Dummy-News ohne Sinn', 'Manchmal braucht man einfach nur Text, der aussieht wie Text. Diese siebte Nachricht liefert genau das. Worte folgen auf Worte, Sätze reihen sich aneinander, Sinn bleibt aus. Trotzdem erfüllt der Text den Zweck eines realistischen Testdatensatzes. Besonders wichtig ist dabei, dass auch Umlaute, Satzzeichen und deutsche Grammatik korrekt sind. Am Ende bleibt: eine Hülle ohne Inhalt.', '2025-01-07 18:00:00'),
(18, 'Achte Beispielnachricht mit Dummyinhalt', 'Dies ist ein längerer Absatz, der keinerlei realen Bezug hat. Er könnte über alles und nichts handeln. Hauptsache, er hat eine vernünftige Länge. Der Text läuft über mehrere Sätze und endet ohne Pointe. Entwickelnde können damit prüfen, ob Zeilenumbrüche, Formatierungen und Darstellungen korrekt funktionieren. In dieser Hinsicht ist der Text erstaunlich nützlich, obwohl er völlig bedeutungslos ist.', '2025-01-08 12:00:00'),
(19, 'Neunte Demo-News mit Blindtext', 'Im neunten Beispiel darf natürlich auch wieder ein schöner leerer Text stehen. Dieser Absatz enthält keine Neuigkeiten, aber dafür reichlich Buchstaben. Es ist erstaunlich, wie angenehm sinnfreier Text wirken kann, wenn er nur ordentlich gesetzt ist. Vielleicht steckt darin eine tiefe Wahrheit über die Natur der Datenbanktests. Oder auch nicht. Jedenfalls füllt dieser Eintrag die Tabelle zuverlässig.', '2025-01-09 09:00:00'),
(20, 'Zehnte Testnachricht – Abschluss der Serie', 'Hier endet unsere kleine Sammlung synthetischer Nachrichten. Der Text wiederholt noch einmal, dass er keinen Sinn ergibt, aber optisch ein echter Artikel sein könnte. Er ist formatiert, lesbar und lang genug für jedes Textfeld. Damit steht ein vollständiger Satz von Beispieldaten bereit. Wenn dieser Text angezeigt wird, funktioniert dein System offenbar wie vorgesehen.', '2025-01-10 17:45:00');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
