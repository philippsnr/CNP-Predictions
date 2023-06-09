
import 'package:cnppredictions/webseite/wartungspause.dart';

const starttext = """

<h1 style="text-align: center;"><span style="color: #ffffff;">CNP-Predictions</span></h1><h3 style="text-align: center;"><span style="color: #ffffff;">Football predictions based on AI</span></h3>

""";

const zuDenSpielen = """

<p style="text-align: center;"><span style="color: #ffffff;">Competitions <strong> ➔</strong></span></p>

""";

const impressum = """

<h1 style="text-align: center;"><span style="color: #ffffff;">Imprint</span></h1>
<h2 style="text-align: center;"><span style="color: #ffffff;">Service provider</span></h2>
<p style="text-align: center;"><span style="color: #ffffff;">Philipp Staudinger, Christoph Neumeister</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Karl-Maybach-Platz 2</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">88046 Friedrichshafen</span></p>
<h2 style="text-align: center;"><span style="color: #ffffff;">Contact</span></h2>
<p style="text-align: center;"><span style="color: #ffffff;">E-Mail:</span></p>
<p style="text-align: center;"><span style="color: #ffffff;"><a style="color: #ffffff;" href="mailto:info@cnp-predictions.de" target="_blank" rel="noopener">info@cnp-predictions.de</a></span></p>
<h2 style="text-align: center;"><span style="color: #ffffff;">Social Media</span></h2>
<p style="text-align: center;"><span style="color: #ffffff;">This imprint also applies to the following social media sites and online profiles:</span></p>
<p style="text-align: center;"><span style="color: #ffffff;"><a style="color: #ffffff;" href="https://instagram.com/cnp.predictions" target="_blank" rel="noopener" data-saferedirecturl="https://www.google.com/url?q=https://instagram.com/cnp.predictions&amp;source=gmail&amp;ust=1681753599071000&amp;usg=AOvVaw3OZRmRkf1z-NUiP5wqRu52">https://instagram.com/<wbr />cnp.predictions</a></span></p>

""";

const datenschutzErklaerung = """

<h2 style="text-align: center;"><span style="color: #ffffff;">Datenschutzerkl&auml;rung</span></h2>
<p style="text-align: center;"><span style="color: #ffffff;">Personenbezogene Daten (nachfolgend zumeist nur &bdquo;Daten&ldquo; genannt) werden von uns nur im Rahmen der Erforderlichkeit sowie zum Zwecke der Bereitstellung eines funktionsf&auml;higen und nutzerfreundlichen Internetauftritts, inklusive seiner Inhalte und der dort angebotenen Leistungen, verarbeitet.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Gem&auml;&szlig; Art. 4 Ziffer 1. der Verordnung (EU) 2016/679, also der Datenschutz-Grundverordnung (nachfolgend nur &bdquo;DSGVO&ldquo; genannt), gilt als &bdquo;Verarbeitung&ldquo; jeder mit oder ohne Hilfe automatisierter Verfahren ausgef&uuml;hrter Vorgang oder jede solche Vorgangsreihe im Zusammenhang mit personenbezogenen Daten, wie das Erheben, das Erfassen, die Organisation, das Ordnen, die Speicherung, die Anpassung oder Ver&auml;nderung, das Auslesen, das Abfragen, die Verwendung, die Offenlegung durch &Uuml;bermittlung, Verbreitung oder eine andere Form der Bereitstellung, den Abgleich oder die Verkn&uuml;pfung, die Einschr&auml;nkung, das L&ouml;schen oder die Vernichtung.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Mit der nachfolgenden Datenschutzerkl&auml;rung informieren wir Sie insbesondere &uuml;ber Art, Umfang, Zweck, Dauer und Rechtsgrundlage der Verarbeitung personenbezogener Daten, soweit wir entweder allein oder gemeinsam mit anderen &uuml;ber die Zwecke und Mittel der Verarbeitung entscheiden. Zudem informieren wir Sie nachfolgend &uuml;ber die von uns zu Optimierungszwecken sowie zur Steigerung der Nutzungsqualit&auml;t eingesetzten Fremdkomponenten, soweit hierdurch Dritte Daten in wiederum eigener Verantwortung verarbeiten.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Unsere Datenschutzerkl&auml;rung ist wie folgt gegliedert:</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">I. Informationen &uuml;ber uns als Verantwortliche</span><br /><span style="color: #ffffff;">II. Rechte der Nutzer und Betroffenen</span><br /><span style="color: #ffffff;">III. Informationen zur Datenverarbeitung</span></p>
<h3 style="text-align: center;"><span style="color: #ffffff;">I. Informationen &uuml;ber uns als Verantwortliche</span></h3>
<p style="text-align: center;"><span style="color: #ffffff;">Verantwortliche Anbieter dieses Internetauftritts im datenschutzrechtlichen Sinne sind:</span></p>
<h1 style="text-align: center;"><span style="color: #ffffff;">Philipp Staudinger & Christoph Neumeister</span><br /><span style="color: #ffffff;">Karl-Maybach-Platz 2</span><br /><span style="color: #ffffff;">88046 Friedrichshafen</span></h1>
<p style="text-align: center;"><span style="color: #ffffff;">E-Mail:&nbsp;<a style="color: #ffffff;" href="mailto:info@bundesliga-prediction.de" target="_blank" rel="noopener">info@bundesliga-prediction.de</a></span></p>
<h3 style="text-align: center;"><span style="color: #ffffff;">II. Rechte der Nutzer und Betroffenen</span></h3>
<p style="text-align: center;"><span style="color: #ffffff;">Mit Blick auf die nachfolgend noch n&auml;her beschriebene Datenverarbeitung haben die Nutzer und Betroffenen das Recht</span></p>
<ul style="text-align: center;">
<li><span style="color: #ffffff;">auf Best&auml;tigung, ob sie betreffende Daten verarbeitet werden, auf Auskunft &uuml;ber die verarbeiteten Daten, auf weitere Informationen &uuml;ber die Datenverarbeitung sowie auf Kopien der Daten (vgl. auch Art. 15 DSGVO);</span></li>
<li><span style="color: #ffffff;">auf Berichtigung oder Vervollst&auml;ndigung unrichtiger bzw. unvollst&auml;ndiger Daten (vgl. auch Art. 16 DSGVO);</span></li>
<li><span style="color: #ffffff;">auf unverz&uuml;gliche L&ouml;schung der sie betreffenden Daten (vgl. auch Art. 17 DSGVO), oder, alternativ, soweit eine weitere Verarbeitung gem&auml;&szlig; Art. 17 Abs. 3 DSGVO erforderlich ist, auf Einschr&auml;nkung der Verarbeitung nach Ma&szlig;gabe von Art. 18 DSGVO;</span></li>
<li><span style="color: #ffffff;">auf Erhalt der sie betreffenden und von ihnen bereitgestellten Daten und auf &Uuml;bermittlung dieser Daten an andere Anbieter/Verantwortliche (vgl. auch Art. 20 DSGVO);</span></li>
<li><span style="color: #ffffff;">auf Beschwerde gegen&uuml;ber der Aufsichtsbeh&ouml;rde, sofern sie der Ansicht sind, dass die sie betreffenden Daten durch den Anbieter unter Versto&szlig; gegen datenschutzrechtliche Bestimmungen verarbeitet werden (vgl. auch Art. 77 DSGVO).</span></li>
</ul>
<p style="text-align: center;"><span style="color: #ffffff;">Dar&uuml;ber hinaus ist der Anbieter dazu verpflichtet, alle Empf&auml;nger, denen gegen&uuml;ber Daten durch den Anbieter offengelegt worden sind, &uuml;ber jedwede Berichtigung oder L&ouml;schung von Daten oder die Einschr&auml;nkung der Verarbeitung, die aufgrund der Artikel 16, 17 Abs. 1, 18 DSGVO erfolgt, zu unterrichten. Diese Verpflichtung besteht jedoch nicht, soweit diese Mitteilung unm&ouml;glich oder mit einem unverh&auml;ltnism&auml;&szlig;igen Aufwand verbunden ist. Unbeschadet dessen hat der Nutzer ein Recht auf Auskunft &uuml;ber diese Empf&auml;nger.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;"><strong>Ebenfalls haben die Nutzer und Betroffenen nach Art. 21 DSGVO das Recht auf Widerspruch gegen die k&uuml;nftige Verarbeitung der sie betreffenden Daten, sofern die Daten durch den Anbieter nach Ma&szlig;gabe von Art. 6 Abs. 1 lit. f) DSGVO verarbeitet werden. Insbesondere ist ein Widerspruch gegen die Datenverarbeitung zum Zwecke der Direktwerbung statthaft.</strong></span></p>
<h3 style="text-align: center;"><span style="color: #ffffff;">III. Informationen zur Datenverarbeitung</span></h3>
<p style="text-align: center;"><span style="color: #ffffff;">Ihre bei Nutzung unseres Internetauftritts verarbeiteten Daten werden gel&ouml;scht oder gesperrt, sobald der Zweck der Speicherung entf&auml;llt, der L&ouml;schung der Daten keine gesetzlichen Aufbewahrungspflichten entgegenstehen und nachfolgend keine anderslautenden Angaben zu einzelnen Verarbeitungsverfahren gemacht werden.</span></p>
<h4 style="text-align: center;"><span style="color: #ffffff;">Instagram</span></h4>
<p style="text-align: center;"><span style="color: #ffffff;">Zur Bewerbung unserer Produkte und Leistungen sowie zur Kommunikation mit Interessenten oder Kunden betreiben wir eine Firmenpr&auml;senz auf der Plattform Instagram.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Auf dieser Social-Media-Plattform sind wir gemeinsam mit der Meta Platforms Ireland Limited, 4 Grand Canal Square, Dublin 2, Irland, verantwortlich.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Der Datenschutzbeauftragte von Instagram kann &uuml;ber ein Kontaktformular erreicht werden:</span></p>
<p style="text-align: center;"><span style="color: #ffffff;"><a style="color: #ffffff;" href="https://www.facebook.com/help/contact/540977946302970" target="_blank" rel="noopener nofollow" data-saferedirecturl="https://www.google.com/url?q=https://www.facebook.com/help/contact/540977946302970&amp;source=gmail&amp;ust=1681753599018000&amp;usg=AOvVaw3vn3LJpa6eioQ-4w5fSeO5">https://www.facebook.com/help/<wbr />contact/540977946302970</a></span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Die gemeinsame Verantwortlichkeit haben wir in einer Vereinbarung bez&uuml;glich der jeweiligen Verpflichtungen im Sinne der DSGVO geregelt. Diese Vereinbarung, aus der sich die gegenseitigen Verpflichtungen ergeben, ist unter dem folgenden Link abrufbar:</span></p>
<p style="text-align: center;"><span style="color: #ffffff;"><a style="color: #ffffff;" href="https://www.facebook.com/legal/terms/page_controller_addendum" target="_blank" rel="noopener nofollow" data-saferedirecturl="https://www.google.com/url?q=https://www.facebook.com/legal/terms/page_controller_addendum&amp;source=gmail&amp;ust=1681753599018000&amp;usg=AOvVaw0iPgWG1YPhcGzsLUZ2QEAK">https://www.facebook.com/<wbr />legal/terms/page_controller_<wbr />addendum</a></span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Rechtsgrundlage f&uuml;r die dadurch erfolgende und nachfolgend wiedergegebene Verarbeitung von personenbezogenen Daten ist Art. 6 Abs. 1 lit. f DSGVO. Unser berechtigtes Interesse besteht an der Analyse, der Kommunikation sowie dem Absatz und der Bewerbung unserer Produkte und Leistungen.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Rechtsgrundlage kann auch eine Einwilligung des Nutzers gem&auml;&szlig; Art. 6 Abs. 1 lit. a DSGVO gegen&uuml;ber dem Plattformbetreiber sein. Die Einwilligung hierzu kann der Nutzer nach Art. 7 Abs. 3 DSGVO jederzeit durch eine Mitteilung an den Plattformbetreiber f&uuml;r die Zukunft widerrufen.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Bei dem Aufruf unseres Onlineauftritts auf der Plattform Instagram werden von der Facebook Ireland Ltd. als Betreiberin der Plattform in der EU Daten des Nutzers (z.B. pers&ouml;nliche Informationen, IP-Adresse etc.) verarbeitet.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Diese Daten des Nutzers dienen zu statistischen Informationen &uuml;ber die Inanspruchnahme unserer Firmenpr&auml;senz auf Instagram. Die Facebook Ireland Ltd. nutzt diese Daten zu Marktforschungs- und Werbezwecken sowie zur Erstellung von Profilen der Nutzer. Anhand dieser Profile ist es der Facebook Ireland Ltd. beispielsweise m&ouml;glich, die Nutzer innerhalb und au&szlig;erhalb von Instagram interessenbezogen zu bewerben. Ist der Nutzer zum Zeitpunkt des Aufrufes in seinem Account auf Instagram eingeloggt, kann die Facebook Ireland Ltd. zudem die Daten mit dem jeweiligen Nutzerkonto verkn&uuml;pfen.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Im Falle einer Kontaktaufnahme des Nutzers &uuml;ber Instagram werden die bei dieser Gelegenheit eingegebenen personenbezogenen Daten des Nutzers zur Bearbeitung der Anfrage genutzt. Die Daten des Nutzers werden bei uns gel&ouml;scht, sofern die Anfrage des Nutzers abschlie&szlig;end beantwortet wurde und keine gesetzlichen Aufbewahrungspflichten, wie z.B. bei einer anschlie&szlig;enden Vertragsabwicklung, entgegenstehen.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Zur Verarbeitung der Daten werden von der Facebook Ireland Ltd. ggf. auch Cookies gesetzt.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Sollte der Nutzer mit dieser Verarbeitung nicht einverstanden sein, so besteht die M&ouml;glichkeit, die Installation der Cookies durch eine entsprechende Einstellung des Browsers zu verhindern. Bereits gespeicherte Cookies k&ouml;nnen ebenfalls jederzeit gel&ouml;scht werden. Die Einstellungen hierzu sind vom jeweiligen Browser abh&auml;ngig. Bei Flash-Cookies l&auml;sst sich die Verarbeitung nicht &uuml;ber die Einstellungen des Browsers unterbinden, sondern durch die entsprechende Einstellung des Flash-Players. Sollte der Nutzer die Installation der Cookies verhindern oder einschr&auml;nken, kann dies dazu f&uuml;hren, dass nicht s&auml;mtliche Funktionen von Facebook vollumf&auml;nglich nutzbar sind.</span></p>
<p style="text-align: center;"><span style="color: #ffffff;">N&auml;heres zu den Verarbeitungst&auml;tigkeiten, deren Unterbindung und zur L&ouml;schung der von Instagram verarbeiteten Daten finden sich in der Datenrichtlinie von Instagram:</span></p>
<p style="text-align: center;"><span style="color: #ffffff;"><a style="color: #ffffff;" href="https://help.instagram.com/519522125107875" target="_blank" rel="noopener nofollow" data-saferedirecturl="https://www.google.com/url?q=https://help.instagram.com/519522125107875&amp;source=gmail&amp;ust=1681753599018000&amp;usg=AOvVaw15qr1IPmBpe-wqQSFguPZ0">https://help.instagram.com/<wbr />519522125107875</a></span></p>
<p style="text-align: center;"><span style="color: #ffffff;">Es ist nicht ausgeschlossen, dass die Verarbeitung durch die Facebook Ireland Ltd. auch &uuml;ber die Meta Platforms, Inc., 1601 Willow Road, Menlo Park, California 94025 in den USA erfolgt.</span></p>
""";

const wartungspauseText = """

<hr style="height:2px;border-width:0;color:gray;background-color:gray">
<h1 style="text-align: center;"><span style="color: #ffffff;">maintenance break</span></h1>
<h2 style="text-align: center;"><span style="color: #ffffff;">We will be back next season</span></h2>
<hr style="height:2px;border-width:0;color:gray;background-color:gray">

""";