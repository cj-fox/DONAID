/* THIS IS THE TRANSLATION FILE. IF YOU NEED TO ADD ANY NEW TRANSLATION, JUST ADD
* THE KEYWORD IN HERE IN EVERY LANGUAGE AND MATCH IS WITH ITS TRANSLATION
* DON'T FORGET TO PUT A ".tr" AFTER EVERY KEYWORD YOU WANT TRANSLATED,
* FOR EXAMPLE IF YOU WANT TO TRANSLATE "HELLO" ONLY IN SPANISH, YOU ADD IN HERE UNDER
* THE ES LANGUAGE : "Hello": "Hola"
* AFTER THAT, GO IN THE CODE AND PUT "Hello".tr WHEREVER YOU NEED IT. */

import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "Donor User Manual":"Donor User Manual",
          "Organization User Manual":"Organization User Manual",
          "Policy":"Policy",
          "User Manual":"User Manual",
          "please_provide_a_monthly_donation_amount_minimum_of_one_dollar":
              "Please provide a monthly donation amount minimum of \$1",
          "please_enter_a_valid_cvc": "Please enter a valid CVC.",
          "year": "Year",
          "please_enter_a_valid_expiration_year":
              "Please enter a valid expiration year.",
          "month": "Month",
          "please_enter_a_valid_expiration_month":
              "Please enter a valid expiration month.",
          "card_number": "Card Number",
          "please_enter_a_valid_card_number":
              "Please enter a valid card number.",
          "adoptions_can_only_be_made_in_whole_dollar_amounts":
              "Adoptions can only be made in whole dollar amounts.",
          "are_you_sure_you_want_to_cancel_this_adoption":
              "Are you sure you want to cancel this adoption? Cancelling will prevent you from further recurring payments. You can readopt this beneficiary from the Beneficiaries page. Would you like to continue with canceling this adoption?",
          "resuming_adoption_charity_would_you_like_to_continue":
              "Resuming this charity will make it visible to donors again. Once you resume this charity you can deactivate it again from My Beneficiaries page. Would you like to continue?",
          "no_inactive_adoptions_to_show": "No inactive adoptions to show.",
          "please_enter_adoption_name": "Please enter adoption name.",
          "edit_adoption": "Edit Adoption",
          "no_active_adoptions_to_show": "No active adoptions to show.",
          "monthly_donation_amount": "Monthly Donation Amount",
          "adopt": "Adopt",
          "monthly_amount": "Monthly Amount: \$",
          "cancel_adoption": "Cancel Adoption",
          "my_adoptions": "My Adoptions",
          "set_beneficiary_up_for_adoption":
              "Set beneficiary up for adoption: ",
          "you_currently_have_no_donation_history_to_generate_a_pdf":
              "You currently have no donation history to generate a pdf.",
          "can_not_generate_a_pdf": "Can Not Generate a PDF",
          "this_organization_does_not_have_any_active_beneficiaries_at_this_time":
              "This organization doesn\'t have any \nactive beneficiaries at this time.",
          "this_organization_does_not_have_any_active_campaigns_at_this_time":
              "This organization does not have any \nactive campaigns at this time.",
          "your_information": "Your Information",
          "_unique_donors": " unique donors",
          "donations": "Donations",
          "statistics": "Statistics",
          "urgent_case_approvals": "Urgent Case Approvals",
          "This charity has reached it\'s goal!":
              "This charity has reached it\'s goal!",
          "Denials": "Denials",
          "Edit Urgent Case": "Edit Urgent Case",
          "Urgent case resubmitted!": "Urgent case resubmitted!",
          "This urgent case is pending approval.":
              "This urgent case is pending approval",
          "Attention:": "Attention:",
          "Your Urgent Case Was Denied": "Your Urgent Case Was Denied",
          "After administrative review, your urgent case was denied for the following reason:":
              "After administrative review, your urgent case was denied for the following reason:",
          "No denied urgent cases to show.": "No denied urgent cases to show.",
          "_campaigns": "Campaigns",
          "No new visits": "No new visits",
          "Did this visit result in a donation?":
              "Did this visit result in a donation?",
          "Gateway Visits": "Gateway Visits",
          "Please enter the amount that was donated.":
              "Please enter the amount that was donated.",
          "Confirm Donation": "Confirm Donation",
          "Please confirm that this visit to your gateway did not result in a donation.":
              "Please confirm that this visit to your gateway did not result in a donation.",
          "Resuming this charity will make it visible to donors again. Once you resume this charity you can deactivate it again from the dashboard or the My Beneficiaries page. Would you like to continue?":
              "Resuming this charity will make it visible to donors again. Once you resume this charity you can deactivate it again from the dashboard or the My Beneficiaries page. Would you like to continue?",
          "Deleting this charity will completely remove it from the application. Would you like to continue?":
              "Deleting this charity will completely remove it from the application. Would you like to continue?",
          "Stopping this charity will make it not visible to donors. Once you stop this charity you can reactivate it from the Inactive Charities page. Would you like to continue with stopping this charity?":
              "Stopping this charity will make it not visible to donors. Once you stop this charity you can reactivate it from the Inactive Charities page. Would you like to continue with stopping this charity?",
          "Delete": "Delete",
          "The email you chose is already in use.":
              "The email you chose is already in use.",
          "Are You Sure?": "Are You Sure?",
          "We see that you have entered a donation amount greater than \$999. We appreciate your generosity, but please confirm that this amount is correct to proceed.":
              "We see that you have entered a donation amount greater than \$999. We appreciate your generosity, but please confirm that this amount is correct to proceed.",
          "Sort By": "Sort By",
          "Country": "Country",
          "Send": "Send",
          "Message": "Message",
          "Subject": "Subject",
          "Question": "Question",
          "General": "General",
          "Help": "Help",
          "Suggestion": "Suggestion",
          "Other": "Other",
          "Please select a category": "Please select a category",
          "Please enter a valid subject": "Please enter a valid subject",
          "Please enter a valid message": "Please enter a valid message",
          "Contact Us": "Contact Us",
          "contact_admin": "Contact Admin",
          "My Favorites": "My Favorites",
          "Favorite Page": "Favorite Page",
          "No favorites found": "No favorites found",
          "type_a_message": "Type a message",
          "message": "Messages",
          "no": "No",
          "yes": "Yes",
          "do_you_want_to_delete_conversation":
              "Do you want to Delete that Conversation",
          "organization": "Organizations",
          "_organization": "Organization",
          "detour!": "Detour!",
          "the_organization_that_created":
              'The organization that created this charity is not based in the United States. Due to this, we cannot process your payment. A link to the payment gateway is below',
          "ok": "OK",
          "donate": "Donate",
          "home": "Home",
          "search": "Search",
          "notifications": "Notifications",
          "donor": "Donor",
          "settings": "Settings",
          "profile": "Profile",
          "about": "About",
          "donation_history": "Donation History",
          "help": "Help",
          "logout": "Logout",
          "no_active_beneficiaries_to_show": "No active beneficiaries to show.",
          "beneficiaries": "Beneficiaries",
          "please_enter_a_valid_payment_amount":
              "Please enter a valid payment amount.",
          "please_provide_a_donation_minimum":
              "Please provide a donation minimum of \$0.50",
          "donation_amount": "Donation Amount",
          "beneficiary_is_no_longer_available":
              "Beneficiary is no longer available to donate to.",
          "paid_successfully": "Paid successfully!",
          "payment_cancelled!": "Payment cancelled.",
          "compaign_is_no_longer_available_to_donate":
              "Campaign is no longer available to donate to.",
          "categories": "Categories",
          "no_compaigns_in_this_category": "No campaigns in this category.",
          "campaigns": "Campaigns",
          "urgent_case": "Urgent Case",
          "campaign": "Campaign",
          "beneficiary": "Beneficiary",
          "no_donation_history": "No donation history.",
          "make_a_donation_to_see_it_here!": "Make a donation to see it here!",
          "dashboard": "Dashboard",
          "see_more": "See more >",
          "urgent_cases": "Urgent Cases",
          "no_active_urgent_sases_show": "No active urgent cases to show.",
          "edit_profile": "Edit Profile",
          "cancel": "Cancel",
          "save": "Save",
          "edit": "Edit",
          "name": "Name",
          "first_name": "First Name",
          "please_enter_first_name.": "Please enter first name.",
          "last_name": "Last Name",
          "please_enter_last_name.": "Please enter last name.",
          "phone_number": "Phone Number",
          "please_enter_your_phone_number.": "Please enter your phone number.",
          "please_enter_a_valid_phone_number.":
              "Please enter a valid phone number.",
          "donaid": "DONAID",
          "reset": "RESET",
          "category": "Category",
          "charity_type": "Charity Type",
          "raised'": "Raised'",
          "end_date": "End Date",
          "no_results_found": "No results found",
          "ugent_case_is_no_longer":
              "Urgent case is no longer available to donate to.",
          "pending_approvals": "Pending Approvals & Denials",
          "expired_charities": "Expired Charities",
          "inactive_charities": "Inactive Charities",
          "success": "Success",
          "the_information_you_entered+has_been_added":
              "The information you entered has been added.",
          "close": "Close",
          "add_beneficiary": "Add Beneficiary",
          "required_fields": "required fields",
          "please_enter_a_nickname": "Please enter a nickname.",
          "nickname": "Nickname",
          "please_enter_a_biography": "Please enter a biography.",
          "biography": "Biography",
          "please_enter_a_goal_amount.": "Please enter a goal amount.",
          "please_enter_a_valid_goal_amount":
              "Please enter a valid goal amount",
          "goal_amount": "Goal Amount",
          "goal": "Goal",
          "please_enter_end_date.": "Please enter end date.",
          "beneficiaries_cannot_have_a_duration_longer_than_1_year.":
              "Beneficiaries cannot have a duration longer than 1 year.",
          "enter_end_date": "Enter End Date",
          "please_fill_in_the_category": "Please fill in the category.",
          "submit": "Submit",
          "beneficiary_created!": "Beneficiary created!",
          "add_campaign": "Add Campaign",
          "please_enter_a_title.": "Please enter a title.",
          "title": "Title",
          "_campaign": "Campaign",
          "please_enter_a_description.": "Please enter a description.",
          "description": "Description",
          "campaigns_cannot_have_a_duration_longer_than_1_year.":
              "Campaigns cannot have a duration longer than 1 year.",
          "campaign_created!": "Campaign created!",
          "create_campaign": "Create Campaign",
          "select_an_item_you_would_like_to_create: ":
              "Select an item you would like to create: ",
          "create_urgent_case": "Create Urgent Case",
          "create_beneficiary": "Create Beneficiary",
          "add_urgent_case": "Add Urgent Case",
          "urgent_cases_cannot_have_a_duration_longer":
              "Urgent cases cannot have a duration longer than 6 months.",
          "urgent_cases_must_receive_approval":
              "Urgent cases must receive approval from an administrator before they are displayed to donors.",
          "note": "Note:",
          "urgent_case_submitted!": "Urgent case submitted!",
          "edit_beneficiary": "Edit Beneficiary",
          "please_enter_beneficiary_name.": "Please enter beneficiary name.",
          "edit_campaign": "Edit Campaign",
          "please_enter_campaign_title.": "Please enter campaign title.",
          "campaign_description": "Campaign Description",
          "my_beneficiaries": "My Beneficiaries",
          "no_active_campaigns_to_show": "No active campaigns to show.",
          "my_campaigns": "My Campaigns",
          "my_urgent_cases": "My Urgent Cases",
          "are_you_sure?": "Are You Sure?",
          "stop_charity": "Stop Charity",
          "_urgent_cases": "Urgent Cases",
          "resume_charity": "Resume Charity",
          "note:this_charity_has_expired":
              "Note: This charity has expired. To reactive this charity and make it visible to donors again, edit the end date for the charity.",
          "_beneficiary": "Beneficiary",
          "upload_profile_picture_or_logo.": "Upload profile picture or logo.",
          "organization_description": "Organization Description",
          "gateway_link": "Gateway Link",
          "please_enter_gateway_link.": "Please enter gateway link.",
          "no_expired_beneficiaries_to_show":
              "No expired beneficiaries to show.",
          "no_expired_campaigns_to_show.": "No expired campaigns to show.",
          "no_expired_urgent_cases_to_show.":
              "No expired urgent cases to show.",
          "campaigns": "Campaigns",
          "no_inactive_beneficiaries_to_show.":
              "No inactive beneficiaries to show.",
          "no_inactive_campaigns_to_show.": "No inactive campaigns to show.",
          "no_inactive_urgent_cases_to_show.":
              "No inactive urgent cases to show.",
          "_note:this_charity_has_expired": "Note: This charity has expired.",
          "no_pending_urgent_cases_to_show.":
              "No pending urgent cases to show.",
          "_pending_approvals": "Pending Approvals",
          "alert": "Alert",
          " ":
              "The email you chose is already in use. Please choose another email address.",
          "donor_registration": "Donor Registration",
          "please_enter_your_first_name.": "Please enter your first name.",
          "please_enter_your_last_name.": "Please enter your last name.",
          "please_enter_your_email.": "Please enter your email.",
          "please_enter_a_valid_email_address.":
              "Please enter a valid email address.",
          "email": "Email",
          "password_must_be_at_least_6_characters.":
              "Password must be at least 6 characters.",
          "password": "Password",
          "passwords_do_not_match": "Passwords do not match",
          "confirm_password": "Confirm Password",
          "all_account_information_is_kept_private":
              "All account information is kept private unless you choose to share it at a later time.",
          "register": "Register",
          "organizations_are_required_to_upload":
              "Organizations are required to upload images of documents to verify their organization.",
          "organizations_are_Required_to_specify":
              "Organizations are required to specify the country that their organization is based in.",
          "organization_registration": "Organization Registration",
          "please_enter_your_organization_name.":
              "Please enter your organization name.",
          "organization_name": "Organization Name",
          "please_enter_a_phone_number.": "Please enter a phone number.",
          "please_provide_street_address.": "Please provide street address.",
          "street_address": "Street Address",
          "please_provide_city.": "Please provide city.",
          "city": "City",
          "please_provide_postal_code.": "Please provide postal code.",
          "postal_code": "Postal Code",
          "countries_not_based_in_the_united_states":
              "Countries not based in the United States must provide their own\n gateway.",
          "link_to_payment_gateway": "Link to Payment Gateway",
          "select_country": "Select Country",
          "upload_document_to_verify":
              "Upload document to verify organization.",
          "select_the_type_of_account": "Select the type of account:",
          "something_wrong": "Something Wrong",
          "login_cancelled_by_user": "Login cancelled by user",
          "login": "Login",
          "guest_login": "Guest Login",
          "select_language": "Select Language",
          "language": "Language",
          "english": "English",
          "arabic": "Arabic",
          "spanish": "Spanish",
          "lan": "LAN",
          "hold_on_a_second!": "Hold on a second!",
          "cannot_log_in_with_that_email":
              "Cannot log in with that email and password. Please enter valid credentials.",
          "hang_on!": "Hang on!",
          "your_organizationaccount_has_not_yet_been_approved":
              "Your organization account has not yet been approved by the admin. You must wait for approval before you can login to this account.",
          "your_donor_account_has_been_disabled_by_the_administrator":
              "Your donor account has been disabled by the administrator. If you think this may have been a mistake,please send an email to donaidmobileapp1@gmail.com",
          "reset_link_sent!": "Reset Link Sent!",
          "check_your_email_to_reset_password":
              "Check Your Email to Reset Password",
          "forgot_password!": "Forgot Password?",
          "adoptions": "Adoptions"
        },
        'fr_FR': {
          "Donor User Manual":"Manuel de l’utilisateur du donateur",
          "Organization User Manual":"Manuel de l’utilisateur de l’organisation",
          "Policy":"Politique",
          "User Manual":"Manuel",
          "please_provide_a_monthly_donation_amount_minimum_of_one_dollar":
              "Veuillez fournir un montant de don mensuel minimum de 1 \$",
          "please_enter_a_valid_cvc": "Veuillez entrer un CVC valide.",
          "year": "An",
          "please_enter_a_valid_expiration_year":
              "Veuillez saisir une année d'expiration valide.",
          "month": "Mois",
          "please_enter_a_valid_expiration_month":
              "Veuillez saisir un mois d'expiration valide.",
          "card_number": "Numéro de carte",
          "please_enter_a_valid_card_number":
              "S'il vous plaît entrez un numéro de carte valide.",
          "adoptions_can_only_be_made_in_whole_dollar_amounts":
              "Les adoptions ne peuvent être faites qu'en dollars entiers.",
          "are_you_sure_you_want_to_cancel_this_adoption":
              "Êtes-vous sûr de vouloir annuler cette adoption, vous pouvez réadopter ce bénéficiaire à partir de la page Bénéficiaires. Voulez-vous continuer avec l'annulation de cette adoption ?",
          "resuming_adoption_charity_would_you_like_to_continue":
              "La reprise de cette association la rendra à nouveau visible pour les donateurs. Une fois que vous avez repris cet organisme de bienfaisance, vous pouvez le désactiver à nouveau à partir de la page Mes bénéficiaires. Voulez-vous continuer?",
          "no_inactive_adoptions_to_show":
              "Aucune adoption inactive à afficher.",
          "please_enter_adoption_name": "Veuillez entrer le nom d'adoption.",
          "edit_adoption": "Modifier l'adoption",
          "no_active_adoptions_to_show": "Aucune adoption active à afficher.",
          "monthly_donation_amount": "Montant du don mensuel",
          "adopt": "Adopter",
          "monthly_amount": "Montant mensuel: \$",
          "cancel_adoption": "Annuler l'adoption",
          "my_adoptions": "Mes adoptions",
          "set_beneficiary_up_for_adoption":
              "Configurer le bénéficiaire pour l'adoption: ",
          "This charity has reached it\'s goal!":
              "Cet organisme de bienfaisance a atteint son objectif!",
          "you_currently_have_no_donation_history_to_generate_a_pdf":
              "Vous n'avez actuellement aucun historique de dons pour générer un PDF.",
          "can_not_generate_a_pdf": "Impossible de générer un PDF",
          "this_organization_does_not_have_any_active_beneficiaries_at_this_time":
              "Cette organisation n'a aucun \nbénéficiaire actif pour le moment.",
          "this_organization_does_not_have_any_active_campaigns_at_this_time":
              "Cette organisation n'a \naucune campagne active pour le moment.",
          "your_information": "Vos informations",
          "_unique_donors": " donateurs uniques",
          "donations": "Des dons",
          "statistics": "Statistiques",
          "urgent_case_approvals": "Approbations de cas urgents",
          "Denials": "Refus",
          "Edit Urgent Case": "Modifier le cas urgent",
          "Urgent case resubmitted!": "Cas urgent soumis à nouveau",
          "This urgent case is pending approval.":
              "Cette affaire urgente est en attente d’approbation.",
          "Attention:": "Attention:",
          "Your Urgent Case Was Denied": "Votre cas urgent a été refusé",
          "After administrative review, your urgent case was denied for the following reason:":
              "Après examen administratif, votre cas urgent a été refusé pour la raison suivante:",
          "No denied urgent cases to show.":
              "Aucun cas urgent refusé à montrer.",
          "No new visits": "Pas de nouvelles visites",
          "Did this visit result in a donation?":
              "Cette visite a-t-elle donné lieu à un don?",
          "Gateway Visits": "Visites de passerelle",
          "Please enter the amount that was donated.":
              "Veuillez entrer le montant qui a été donné.",
          "Confirm Donation": "Confirmer le don",
          "Please confirm that this visit to your gateway did not result in a donation.":
              "Veuillez confirmer que cette visite à votre portail n’a pas donné lieu à un don.",
          "Resuming this charity will make it visible to donors again. Once you resume this charity you can deactivate it again from the dashboard or the My Beneficiaries page. Would you like to continue?":
              "La reprise de cet organisme de bienfaisance le rendra à nouveau visible pour les donateurs. Une fois que vous avez repris cet organisme de bienfaisance, vous pouvez le désactiver à nouveau à partir du tableau de bord ou de la page Mes bénéficiaires. Voulez-vous continuer?",
          "Deleting this charity will completely remove it from the application. Would you like to continue?":
              "La suppression de cet organisme de bienfaisance le supprimera complètement de l’application. Voulez-vous continuer?",
          "Stopping this charity will make it not visible to donors. Once you stop this charity you can reactivate it from the Inactive Charities page. Would you like to continue with stopping this charity?":
              "L’arrêt de cet organisme de bienfaisance le rendra invisible pour les donateurs. Une fois que vous avez arrêté cet organisme de bienfaisance, vous pouvez le réactiver à partir de la page Organismes de bienfaisance inactifs. Aimeriez-vous continuer à mettre fin à cet organisme de bienfaisance?",
          "Delete": "Supprimer",
          "The email you chose is already in use.":
              "L’e-mail que vous avez choisi est déjà utilisé",
          "Are You Sure?": "Es-tu sûr?",
          "We see that you have entered a donation amount greater than \$999. We appreciate your generosity, but please confirm that this amount is correct to proceed.":
              "Nous voyons que vous avez inscrit un montant de don supérieur à 999 \$. Nous apprécions votre générosité, mais veuillez confirmer que ce montant est correct pour continuer.",
          "Sort By": "Trier par",
          "Country": "Pays",
          "Send": "Envoyer",
          "Message": "Message",
          "Subject": "Objet",
          "Question": "Question",
          "General": "Generale",
          "Help": "Aide",
          "Suggestion": "Suggestion",
          "Other": "Autre",
          "Please select a category": "Veuillez sélectionner une catégorie",
          "Please enter a valid subject": "Veuillez saisir un sujet valide",
          "Please enter a valid message": "Veuillez saisir un message valide",
          "Contact Us": "Contactez-nous",
          "My Favorites": "Mes favoris",
          "Favorite Page": "Favorite Page",
          "No favorites found": "Aucun favori trouvé",
          "contact_admin": "Contacter l'administrateur",
          "type_a_message": "Tapez/écrivez un message",
          "message": "Message",
          "no": "Non",
          "yes": "Oui",
          "do_you_want_to_delete_conversation":
              "Voulez vous supprimer votre conversation",
          "organization": "Organization",
          "_organization": "Organization",
          "detour!": "Détour!",
          "the_organization_that_created":
              'L’organisation qui a créé cette charité n’est pas basé au Etas-Unis. Grace a cela, nous ne pouvons pas proceder avec votre payment.',
          "ok": "OK",
          "donate": "Détour",
          "home": "Accueil",
          "search": "Recherche",
          "notifications": "Notifications",
          "donor": "Dons",
          "settings": "Paramètres",
          "profile": "Profile",
          "about": "En savoir plus",
          "donation_history": "Historic des dons ",
          "help": "Aide",
          "logout": "Se déconnecter ",
          "no_active_beneficiaries_to_show":
              "Pas de bénéficiaires actifs a monter",
          "beneficiaries": "Bénéficiaires ",
          "please_enter_a_valid_payment_amount":
              "Veuillez enregister un montant de payment valide ",
          "please_provide_a_donation_minimum":
              "Veuillez choisir un dons minimum de 0.50\$",
          "donation_amount": "Montant des dons",
          "beneficiary_is_no_longer_available":
              "Le bénéficiaire n'est plus disponible pour faire un don.",
          "paid_successfully": "Payment accepter!",
          "payment_cancelled!": "Payment annuler.",
          "compaign_is_no_longer_available_to_donate":
              "La campagne n'est plus disponible pour faire un don..",
          "categories": "Catégories",
          "no_compaigns_in_this_category":
              "Pas de campagne dans cette catégorie.",
          "campaigns": "Campagnes",
          "urgent_case": "Cas Urgent",
          "campaign": "Campagne",
          "beneficiary": "Bénéficiaire",
          "no_donation_history": "Aucun historique de don.",
          "make_a_donation_to_see_it_here!": "Faites un don pour le voir ici!",
          "dashboard": "Tableau de bord",
          "see_more": "Voir plus >",
          "urgent_cases": "Cas Urgents",
          "no_active_urgent_sases_show": "Aucun cas urgent actif à afficher.",
          "edit_profile": "Editer le Profile",
          "cancel": "Annuler",
          "save": "Sauvgarder",
          "edit": "Editer",
          "name": "Nom",
          "first_name": "Prénom",
          "please_enter_first_name.": "Veuillez saisir le Prénom.",
          "last_name": "Nom",
          "please_enter_last_name.": "Veuillez saisir le Nom.",
          "phone_number": "Phone Number",
          "please_enter_your_phone_number.":
              "Veuillez mettre votre numero de telephone.",
          "please_enter_a_valid_phone_number.":
              "Veuillez mettre un numero de telephone valide.",
          "donaid": "DONAID",
          "reset": "RESET",
          "category": "Catégorie",
          "charity_type": "Type de Charité",
          "raised'": "montant recueilli'",
          "end_date": "date de fin",
          "no_results_found": "Aucun resultat trouver",
          "ugent_case_is_no_longer":
              "Le cas urgent n'est plus disponible pour faire un don.",
          "pending_approvals": "Approbations et refus en attente",
          "expired_charities": "Charités Expiré",
          "inactive_charities": "Charités Inactive",
          "success": "Succès",
          "the_information_you_entered+has_been_added":
              "Les informations saisies ont été ajoutées.",
          "close": "Fermer",
          "add_beneficiary": "Ajouter un beneficiaires",
          "required_fields": "Champs obligatoires",
          "please_enter_a_nickname": "Veuillez saisir un pseudo.",
          "nickname": "Pseudo",
          "please_enter_a_biography": "Veuillez saisir une Biographie.",
          "biography": "Biographie",
          "please_enter_a_goal_amount.":
              "Veuillez saisir un montant d'objectif.",
          "please_enter_a_valid_goal_amount":
              "Veuillez saisir un montant d'objectif valide",
          "goal_amount": "Objectif Montant",
          "goal": "Objectif",
          "please_enter_end_date.": "Veuillez saisir la date de fin.",
          "beneficiaries_cannot_have_a_duration_longer_than_1_year.":
              "Les bénéficiaires ne peuvent avoir une durée supérieure à 1 an..",
          "enter_end_date": "Saisir une date de fin",
          "please_fill_in_the_category":
              "S’il vous plaît remplir la catégorie.",
          "submit": "Envoyer",
          "beneficiary_created!": "Bénéficiaire créé!",
          "add_campaign": "Ajouter une campagne",
          "please_enter_a_title.": "Veuillez saisir un titre.",
          "title": "Titre",
          "_campaign": "Campagne",
          "please_enter_a_description.": "Veuillez saisir une description.",
          "description": "Description",
          "campaigns_cannot_have_a_duration_longer_than_1_year.":
              "Les campagnes ne peuvent avoir une durée supérieure à un an..",
          "campaign_created!": "Campagne créé!",
          "create_campaign": "Créer une Campagne",
          "select_an_item_you_would_like_to_create: ":
              "Sélectionnez un élément que vous souhaitez créer: ",
          "create_urgent_case": "Créer un Cas Urgent",
          "create_beneficiary": "Créer un beneficiaires",
          "add_urgent_case": "Ajouter un Cas Urgent",
          "urgent_cases_cannot_have_a_duration_longer":
              "Les cas urgents ne peuvent avoir une durée supérieure à 6 mois.",
          "urgent_cases_must_receive_approval":
              "Les cas urgents doivent être approuvés par un administrateur avant d'être affichés aux donneurs.",
          "note": "Note:",
          "urgent_case_submitted!": "Cas urgent soumis!",
          "edit_beneficiary": "Editer le Bénéficiaire",
          "please_enter_beneficiary_name.":
              "Veuillez saisir le prenom du bénéficiaire.",
          "edit_campaign": "Editer la Campagne",
          "please_enter_campaign_title.":
              "Veuillez saisir le titre de la campagne.",
          "campaign_description": "Description de la campagne",
          "my_beneficiaries": "Mes bénéficiaires",
          "no_active_campaigns_to_show": "Aucune campagne active à afficher.",
          "my_campaigns": "Mes Campagnes",
          "my_urgent_cases": "Mes cas urgents",
          "are_you_sure?": "Vous êtes sûr?",
          "stop_charity": "Arrêter la charité",
          "_urgent_cases": "Cas urgents",
          "resume_charity": "Résumé de la  Charité",
          "note:this_charity_has_expired":
              "Note : Cette charité a expiré. Pour réactiver cet charité et la rendre à nouveau visible aux donneurs, éditez la date de fin de la charité.",
          "_beneficiary": "bénéficiaire",
          "upload_profile_picture_or_logo.":
              "Téléchargez votre photo de profil ou votre logo.",
          "organization_description": "Description de l'organisation",
          "gateway_link": "Lien vers le portail",
          "please_enter_gateway_link.":
              "Veuillez saisir le lien de la portail.",
          "no_expired_beneficiaries_to_show":
              "Aucun bénéficiaire expiré à afficher.",
          "no_expired_campaigns_to_show.":
              "Aucune campagne expirée à afficher.",
          "no_expired_urgent_cases_to_show.":
              "Aucun cas urgent expiré à afficher.",
          "_campaigns": "Campagnes",
          "no_inactive_beneficiaries_to_show.":
              "Aucun bénéficiaire inactif à afficher.",
          "no_inactive_campaigns_to_show.":
              "Aucune campagne inactive à afficher.",
          "no_inactive_urgent_cases_to_show.":
              "Aucun cas urgent inactif à afficher.",
          "_note:this_charity_has_expired": "Note : Cette charité a expiré.",
          "no_pending_urgent_cases_to_show.":
              "Aucun cas urgent en attente à afficher.",
          "_pending_approvals": "Approbations en attente",
          "alert": "Alerte",
          " ":
              "L'adresse mail que vous avez choisie est déjà utilisée. Veuillez choisir une autre adresse mail.",
          "donor_registration": "Inscription des donneurs",
          "please_enter_your_first_name.": "Veuillez saisir votre prénom.",
          "please_enter_your_last_name.": "Veuillez saisir votre nom.",
          "please_enter_your_email.": "Veuillez saisir votre adresse mail.",
          "please_enter_a_valid_email_address.":
              "Veuillez saisir un adresse mail valide.",
          "email": "Email",
          "password_must_be_at_least_6_characters.":
              "Le mot de passe doit comporter au moins 6 caractères.",
          "password": "mot de passe",
          "passwords_do_not_match": "Le mot de passe ne correspondent pas",
          "confirm_password": "Confirmer le mot de passe",
          "all_account_information_is_kept_private":
              "Toutes les informations relatives au compte restent privées, sauf si vous décidez de les partager ultérieurement.",
          "register": "Registre",
          "organizations_are_required_to_upload":
              "Les organisations doivent télécharger des images de documents pour vérifier leur organisation.",
          "organizations_are_Required_to_specify":
              "Les organisations doivent préciser le pays dans lequel elles sont basées.",
          "organization_registration": "Enregistrement de l'organisation",
          "please_enter_your_organization_name.":
              "Veuillez saisir le nom de votre organisation.",
          "organization_name": "nom de l'organisation",
          "please_enter_a_phone_number.":
              "Veuillez saisir un numéro de téléphone.",
          "please_provide_street_address.":
              "Veuillez indiquer l'adresse de la rue.",
          "street_address": "Adresse de la rue",
          "please_provide_city.": "Veuillez indiquer la ville.",
          "city": "Ville",
          "please_provide_postal_code.": "Veuillez indiquer le code postal.",
          "postal_code": "Code Postal",
          "countries_not_based_in_the_united_states":
              "Les pays qui ne sont pas basés aux États-Unis doivent fournir leur propre portail.",
          "link_to_payment_gateway": "Lien vers la portail de paiement",
          "select_country": "Sélectionnez le pays",
          "upload_document_to_verify":
              "Télécharger le document pour vérifier l'organisation.",
          "select_the_type_of_account": "Sélectionnez le type du compte:",
          "something_wrong": "quelque chose ne va pas",
          "login_cancelled_by_user": "Connexion annulée par l'utilisateur",
          "login": "Connexion",
          "guest_login": "Connexion invité",
          "select_language": "Sélectionner une langue",
          "language": "Langue",
          "english": "English",
          "arabic": "Arabic",
          "spanish": "Spanish",
          "lan": "LAN",
          "hold_on_a_second!": "Attendez une seconde.!",
          "cannot_log_in_with_that_email":
              "Impossible de se connecter avec cet address mail et ce mot de passe. Veuillez saisir des informations d'identification valides.",
          "hang_on!": "Attendez!",
          "your_organizationaccount_has_not_yet_been_approved":
              "Le compte de votre organisation n'a pas encore été approuvé par l'administrateur. Vous devez attendre la validation avant de pouvoir vous connecter à ce compte.",
          "your_donor_account_has_been_disabled_by_the_administrator":
              "Votre compte de donneur a été désactivé par l'administrateur. Si vous pensez qu'il s'agit d'une erreur, veuillez envoyer un courriel à donaidmobileapp1@gmail.com.",
          "reset_link_sent!": "Lien de réinitialisation envoyé!",
          "check_your_email_to_reset_password":
              "Vérifiez votre courriel pour réinitialiser votre mot de passe",
          "forgot_password!": "Mot de passe oublié?",
          "adoptions": "Adoptions"
        },
        'ar_SA': {
          "Donor User Manual":"دليل مستخدم الجهات المانحة",
          "Organization User Manual":"دليل مستخدم المؤسسة",
          "Policy":"السياسات",
          "User Manual":"دليل المستخدم",
          "please_provide_a_monthly_donation_amount_minimum_of_one_dollar":
              "يرجى تقديم مبلغ تبرع شهري لا يقل عن 1 دولار",
          "please_enter_a_valid_cvc":
              "الرجاء إدخال رمز التحقق من البطاقة (CVC) صالحًا.",
          "year": "سنة",
          "please_enter_a_valid_expiration_year":
              "الرجاء إدخال سنة انتهاء صالحة.",
          "month": "شهر",
          "please_enter_a_valid_expiration_month":
              "الرجاء إدخال شهر انتهاء صالح.",
          "card_number": "رقم البطاقة",
          "please_enter_a_valid_card_number":
              "الرجاء إدخال رقم بطاقة سارية المفعول.",
          "adoptions_can_only_be_made_in_whole_dollar_amounts":
              "لا يمكن إجراء عمليات التبني إلا بمبالغ كاملة بالدولار.",
          "are_you_sure_you_want_to_cancel_this_adoption":
              "هل أنت متأكد أنك تريد إلغاء هذا التبني ، يمكنك إعادة اختيار هذا المستفيد من صفحة المستفيدين. هل ترغب في الاستمرار في إلغاء هذا التبني؟",
          "resuming_adoption_charity_would_you_like_to_continue":
              "استئناف هذه المؤسسة الخيرية سيجعلها مرئية للمانحين مرة أخرى. بمجرد استئناف هذه المؤسسة الخيرية ، يمكنك إلغاء تنشيطها مرة أخرى من صفحة المستفيدون. هل ترغب في الاستمرار؟",
          "no_inactive_adoptions_to_show":
              "لا توجد عمليات تبني غير نشطة للعرض.",
          "please_enter_adoption_name": "الرجاء إدخال اسم الاعتماد.",
          "edit_adoption": "تحرير الاعتماد",
          "no_active_adoptions_to_show": "لا توجد عمليات تبني نشطة لعرضها.",
          "monthly_donation_amount": "مبلغ التبرع الشهري",
          "adopt": "يتبنى",
          "monthly_amount": "المبلغ الشهري: \$",
          "cancel_adoption": "إلغاء الاعتماد",
          "my_adoptions": "عمليات التبني الخاصة بي",
          "set_beneficiary_up_for_adoption": "تعيين المستفيد للتبني: ",
          "you_currently_have_no_donation_history_to_generate_a_pdf":
              "ليس لديك حاليًا أي سجل تبرعات لإنشاء ملف PDF.",
          "can_not_generate_a_pdf": "لا يمكن إنشاء ملف PDF",
          "this_organization_does_not_have_any_active_beneficiaries_at_this_time":
              "لا يوجد لدى هذه المنظمة أي \n مستفيدين نشطين في الوقت الحالي.",
          "this_organization_does_not_have_any_active_campaigns_at_this_time":
              "هذه المنظمة ليس لديها\n أي حملات نشطة في هذا الوقت.",
          "your_information": "معلوماتك",
          "_unique_donors": " المتبرعين الفريدين",
          "donations": "التبرعات",
          "statistics": "إحصائيات",
          "urgent_case_approvals": "الموافقات العاجلة للحالة",
          "This charity has reached it\'s goal!":
              "لقد وصلت هذه المؤسسة الخيرية إلى هدفها!",
          "Denials": "النفي",
          "Edit Urgent Case": "تعديل الحالة العاجلة",
          "Urgent case resubmitted!": "إعادة تقديم حالة عاجلة!",
          "This urgent case is pending approval.":
              "ولا تزال هذه الحالة العاجلة في انتظار الموافقة.",
          "Attention:": "اهتمام:",
          "Your Urgent Case Was Denied": "تم رفض قضيتك العاجلة",
          "After administrative review, your urgent case was denied for the following reason:":
              "بعد المراجعة الإدارية، تم رفض قضيتك العاجلة للسبب التالي:",
          "No denied urgent cases to show.":
              "لا يوجد حالات عاجلة مرفوضة لإظهارها.",
          "No new visits": "لا توجد زيارات جديدة",
          "Did this visit result in a donation?":
              "هل أسفرت هذه الزيارة عن تبرع؟",
          "Gateway Visits": "زيارات البوابة",
          "Please enter the amount that was donated.":
              "يرجى إدخال المبلغ الذي تم التبرع به.",
          "Confirm Donation": "تأكيد التبرع",
          "Please confirm that this visit to your gateway did not result in a donation.":
              "يرجى التأكد من أن هذه الزيارة إلى بوابتك لم تسفر عن تبرع",
          "Resuming this charity will make it visible to donors again. Once you resume this charity you can deactivate it again from the dashboard or the My Beneficiaries page. Would you like to continue?":
              "إن استئناف هذه المؤسسة الخيرية سيجعلها مرئية للمتبرعين مرة أخرى. بمجرد استئناف هذه المؤسسة الخيرية ، يمكنك إلغاء تنشيطها مرة أخرى من لوحة التحكم أو صفحة المستفيدين مني. هل ترغب في المتابعة؟",
          "Deleting this charity will completely remove it from the application. Would you like to continue?":
              "سيؤدي حذف هذه المؤسسة الخيرية إلى إزالتها تماما من التطبيق. هل ترغب في المتابعة؟",
          "Stopping this charity will make it not visible to donors. Once you stop this charity you can reactivate it from the Inactive Charities page. Would you like to continue with stopping this charity?":
              "إن وقف هذه المؤسسة الخيرية سيجعلها غير مرئية للمانحين. بمجرد إيقاف هذه المؤسسة الخيرية ، يمكنك إعادة تنشيطها من صفحة الجمعيات الخيرية غير النشطة. هل ترغب في الاستمرار في إيقاف هذه المؤسسة الخيرية؟",
          "Delete": "حذف",
          "The email you chose is already in use.":
              "البريد الإلكتروني الذي اخترته قيد الاستخدام بالفعل",
          "Are You Sure?": "هل أنت متأكد؟",
          "We see that you have entered a donation amount greater than \$999. We appreciate your generosity, but please confirm that this amount is correct to proceed.":
              "نرى أنك أدخلت مبلغ تبرع أكبر من 999 دولارا. نحن نقدر كرمك ، ولكن يرجى التأكد من أن هذا المبلغ صحيح للمتابعة.",
          "Sort By": "ترتيب حسب",
          "Country": "بلد",
          "Send": "ارسل",
          "Message": "رسالة",
          "Subject": "موضوع",
          "Question": "سؤال",
          "General": "عام",
          "Help": "تعليمات",
          "Suggestion": "اقتراح",
          "Other": "آخر",
          "Please select a category": "يرجى اختيار فئة",
          "Please enter a valid subject": "الرجاء إدخال موضوع صالح",
          "Please enter a valid message": "الرجاء إدخال رسالة صحيحة",
          "Contact Us": "اتصل بنا",
          "My Favorites": "مفضلاتي",
          "Favorite Page": "الصفحة المفضلة",
          "No favorites found": "لم يتم العثور على المفضلة",
          "contact_admin": "اتصل بالمسؤول",
          "type_a_message": " اكتب رسالة",
          "message": " رسائل",
          "no": " لا",
          "yes": " نعم",
          "do_you_want_to_delete_conversation": " هل تريد حذف تلك المحادثة",
          "organization": "جمعية",
          "_organization": " جمعية",
          "detour!": " التفاف!",
          "the_organization_that_created":
              'المنظمة التي أنشأت هذه الجمعية الخيرية لا يقع مقرها في الولايات المتحدة. لهذا السبب ، لا يمكننا معالجة دفعتك..',
          "ok": " نعم",
          "donate": " يتبرع",
          "home": " الصفحة الرئيسية",
          "search": " بحث",
          "notifications": " إشعارات",
          "donor": " جهات مانحة",
          "settings": " إعدادات",
          "profile": " حساب تعريفي",
          "about": " بخصوص",
          "donation_history": " تاريخ التبرع",
          "help": " مساعدة",
          "logout": " تسجيل خروج",
          "no_active_beneficiaries_to_show": " لا يوجد مستفيد نشط لإظهاره",
          "beneficiaries": " المستفيدون ",
          "please_enter_a_valid_payment_amount": " الرجاء إدخال مبلغ دفع صالح",
          "please_provide_a_donation_minimum":
              " يرجى تقديم تبرع بحد أدنى 0.50 دولار",
          "donation_amount": " مبلغ التبرع",
          "beneficiary_is_no_longer_available":
              " المستفيد لم يعد متاحًا للتبرع إليه",
          "paid_successfully": " تم الدفع بنجاح!",
          "payment_cancelled!": " تم إلغاء الدفع",
          "compaign_is_no_longer_available_to_donate":
              " الحملة لم تعد متاحة للتبرع لها",
          "categories": " فئات",
          "no_compaigns_in_this_category": " لا توجد حملات في هذه الفئة",
          "campaigns": " الحملات",
          "urgent_case": " حالة عاجلة",
          "campaign": " الحملات",
          "beneficiary": " المستفيد",
          "no_donation_history": " لا يوجد تاريخ تبرع",
          "make_a_donation_to_see_it_here!": " تبرع لرؤيتها هنا!",
          "dashboard": " لوحة القيادة",
          "see_more": " رؤية المزيد>",
          "urgent_cases": " الحالات المستعجلة",
          "no_active_urgent_sases_show": " لا توجد حالات عاجلة نشطة لإظهارها",
          "edit_profile": " تعديل الملف الشخصي",
          "cancel": " يلغي",
          "save": " يحفظ",
          "edit": " يحرر",
          "name": " اسم",
          "first_name": " الاسم الأول",
          "please_enter_first_name.": " الرجاء إدخال الاسم الأول",
          "last_name": " الكنية",
          "please_enter_last_name.": " الرجاء إدخال الاسم الأخير",
          "phone_number": " رقم التليفون",
          "please_enter_your_phone_number.": " يرجى إدخال رقم الهاتف الخاص بك",
          "please_enter_a_valid_phone_number.": " يرجى إدخال رقم هاتف صالح",
          "donaid": " دون ايد",
          "reset": " إعادة تعيين",
          "category": " فئة",
          "charity_type": " نوع المؤسسة الخيرية",
          "raised'": " رفع'",
          "end_date": " تاريخ الانتهاء",
          "no_results_found": " لم يتم العثور على نتائج",
          "ugent_case_is_no_longer": " الحالة العاجلة لم تعد متاحة للتبرع لها",
          "pending_approvals": " الموافقات المعلقة والرفض",
          "expired_charities": " الجمعيات الخيرية منتهية الصلاحية",
          "inactive_charities": " الجمعيات الخيرية غير النشطة",
          "success": " نجاح",
          "the_information_you_entered+has_been_added":
              " تمت إضافة المعلومات التي أدخلتها",
          "close": " غلق",
          "add_beneficiary": " إضافة مستفيد",
          "required_fields": " الحقول المطلوبة",
          "please_enter_a_nickname": " يرجى إدخال اسم مستعار",
          "nickname": " اسم الشهرة",
          "please_enter_a_biography": " الرجاء إدخال السيرة الذاتية",
          "biography": " سيرة شخصية",
          "please_enter_a_goal_amount.": " الرجاء إدخال مبلغ الهدف",
          "please_enter_a_valid_goal_amount": " الرجاء إدخال مبلغ هدف صالح",
          "goal_amount": " مبلغ الهدف",
          "goal": " هدف",
          "please_enter_end_date.": " الرجاء إدخال تاريخ الانتهاء",
          "beneficiaries_cannot_have_a_duration_longer_than_1_year.":
              " لا يمكن أن تزيد مدة المستفيدين عن سنة واحدة",
          "enter_end_date": " أدخل تاريخ الانتهاء",
          "please_fill_in_the_category": " الرجاء ملء الفئة",
          "submit": " يقدم",
          "beneficiary_created!": " تم إنشاء المستفيد!",
          "add_campaign": " أضف حملة",
          "please_enter_a_title.": " الرجاء إدخال عنوان",
          "title": " لقب",
          "_campaign": " حملة",
          "please_enter_a_description.": " الرجاء إدخال وصف",
          "description": " وصف",
          "campaigns_cannot_have_a_duration_longer_than_1_year.":
              " لا يمكن أن تزيد مدة الحملات عن عام واحد",
          "campaign_created!": " تم إنشاء الحملة!",
          "create_campaign": " أنشئ حملة",
          "select_an_item_you_would_like_to_create: ":
              " حدد العنصر الذي ترغب في إنشائه:",
          "create_urgent_case": " إنشاء حالة عاجلة",
          "create_beneficiary": " إنشاء مستفيد",
          "add_urgent_case": " إضافة حالة عاجلة",
          "urgent_cases_cannot_have_a_duration_longer":
              " لا يمكن أن تزيد مدة الحالات المستعجلة عن 6 أشهر",
          "urgent_cases_must_receive_approval":
              " يجب أن تحصل الحالات العاجلة على موافقة من المسؤول قبل عرضها على المتبرعين",
          "note": " ملحوظة:",
          "urgent_case_submitted!": " تم إرسال الحالة العاجلة!",
          "edit_beneficiary": " تحرير المستفيد",
          "please_enter_beneficiary_name.": " الرجاء إدخال اسم المستفيد.",
          "edit_campaign": " تحرير الحملة",
          "please_enter_campaign_title.": " الرجاء إدخال عنوان الحملة",
          "campaign_description": " وصف الحملة",
          "my_beneficiaries": " المستفيدون مني",
          "no_active_campaigns_to_show": " لا توجد حملات نشطة للعرض.",
          "my_campaigns": " حملاتي",
          "my_urgent_cases": " حالاتي العاجلة",
          "are_you_sure?": " هل أنت واثق؟",
          "stop_charity": " أوقفوا الصدقة",
          "_urgent_cases": " الحالات المستعجلة ",
          "resume_charity": " استئناف الأعمال الخيرية",
          "note:this_charity_has_expired":
              " ملاحظة: هذه المؤسسة الخيرية قد انتهت صلاحيتها. لإعادة تنشيط هذه المؤسسة الخيرية وجعلها مرئية للمتبرعين مرة أخرى ، قم بتحرير تاريخ انتهاء المؤسسة الخيرية.",
          "_beneficiary": "المستفيد",
          "upload_profile_picture_or_logo.":
              " تحميل صورة الملف الشخصي أو الشعار.",
          "organization_description": " وصف المنظمة",
          "gateway_link": " ارتباط البوابة",
          "please_enter_gateway_link.": " الرجاء إدخال رابط البوابة",
          "no_expired_beneficiaries_to_show":
              " لا المستفيدين منتهية الصلاحية لإظهار",
          "no_expired_campaigns_to_show.":
              " لا توجد حملات منتهية الصلاحية للعرض",
          "no_expired_urgent_cases_to_show.":
              " لا توجد حالات عاجلة منتهية الصلاحية لإظهارها",
          "_campaigns": " الحملات",
          "no_inactive_beneficiaries_to_show.":
              " لا يوجد مستفيدون غير نشطون لإظهارهم",
          "no_inactive_campaigns_to_show.": " لا توجد حملات غير نشطة للعرض",
          "no_inactive_urgent_cases_to_show.":
              " لا توجد حالات عاجلة غير نشطة لإظهارها ",
          "_note:this_charity_has_expired":
              " ملاحظة: هذه المؤسسة الخيرية قد انتهت صلاحيتها.",
          "no_pending_urgent_cases_to_show.":
              " ملاحظة: هذه المؤسسة الخيرية قد انتهت صلاحيتها. ",
          "_pending_approvals": " الموافقات المعلقة.",
          "alert": " إنذار",
          " ":
              " البريد الإلكتروني الذي اخترته قيد الاستخدام بالفعل. الرجاء اختيار عنوان بريد إلكتروني آخر.",
          "donor_registration": " تسجيل المتبرعين",
          "please_enter_your_first_name.": " يرجى ادخال الاسم الاول",
          "please_enter_your_last_name.": " الرجاء إدخال اسمك الأخير.",
          "please_enter_your_email.": " رجاءا أدخل بريدك الإلكتروني.",
          "please_enter_a_valid_email_address.":
              " لو سمحت أدخل بريد إليكتروني صالح ",
          "email": " بريد الالكتروني",
          "password_must_be_at_least_6_characters.":
              " يجب أن تتكون كلمة المرور من 6 أحرف على الأقل",
          "password": " كلمة المرور",
          "passwords_do_not_match": " كلمة المرور غير مطابقة",
          "confirm_password": " تأكيد كلمة المرور",
          "all_account_information_is_kept_private":
              " يتم الاحتفاظ بخصوصية جميع معلومات الحساب ما لم تختر مشاركتها في وقت لاحق.",
          "register": " تسجيل",
          "organizations_are_required_to_upload":
              " يتعين على المنظمات تحميل صور المستندات للتحقق من مؤسستهم",
          "organizations_are_Required_to_specify":
              " يتعين على المنظمات تحديد الدولة التي يقع مقر منظمتها فيها.",
          "organization_registration": " تسجيل المنظمة",
          "please_enter_your_organization_name.": " الرجاء إدخال اسم مؤسستك.",
          "organization_name": " اسم المنظمة.",
          "please_enter_a_phone_number.": " الرجاء إدخال رقم هاتف.",
          "please_provide_street_address.": " يرجى تقديم عنوان الشارع.",
          "street_address": " عنوان الشارع.",
          "please_provide_city.": " يرجى تقديم المدينة.",
          "city": " مدينة.",
          "please_provide_postal_code.": " يرجى تقديم الرمز البريدي ",
          "postal_code": " رمز بريدي.",
          "countries_not_based_in_the_united_states":
              " يجب على البلدان غير الموجودة في الولايات المتحدة توفير \n العبّارة الخاصة بها.",
          "link_to_payment_gateway": " رابط لبوابة الدفع",
          "select_country": " حدد الدولة",
          "upload_document_to_verify": " تحميل الوثيقة للتحقق من المنظمة.",
          "select_the_type_of_account": " حدد نوع الحساب",
          "something_wrong": " هل هناك خطب ما؟",
          "login_cancelled_by_user": " تم إلغاء تسجيل الدخول من قبل المستخدم",
          "login": "تسجيل الدخول",
          "guest_login": " زائر الرجاء تسجيل الدخول",
          "select_language": " اختار اللغة",
          "language": " اللغة",
          "english": " إنجليزي",
          "arabic": " عربي",
          "spanish": " الأسبانية",
          "lan": "LAN",
          "hold_on_a_second!": " إنتظر لحظة!",
          "cannot_log_in_with_that_email":
              " لا يمكن تسجيل الدخول بهذا البريد الإلكتروني وكلمة المرور. الرجاء إدخال بيانات اعتماد صالحة.",
          "hang_on!": " انتظر!",
          "your_organizationaccount_has_not_yet_been_approved":
              " لم يوافق المسؤول على حساب مؤسستك. يجب أن تنتظر الموافقة قبل أن تتمكن من تسجيل الدخول إلى هذا الحساب.",
          "your_donor_account_has_been_disabled_by_the_administrator":
              " تم تعطيل حساب المتبرع الخاص بك من قبل المسؤول. إذا كنت تعتقد أن هذا قد يكون خطأً ، فيرجى إرسال بريد إلكتروني إلى donaidmobileapp1@gmail.com ",
          "reset_link_sent!": " تم إرسال رابط إعادة التعيين!",
          "check_your_email_to_reset_password":
              " تحقق من بريدك الإلكتروني لإعادة تعيين كلمة المرور",
          "forgot_password!": " هل نسيت كلمة السر؟",
          "adoptions": "التبني"
        },
        'es_ES': {
          "Donor User Manual":"Manual de usuario del donante",
          "Organization User Manual":"Manual de usuario de la organización",
          "Policy":"Política",
          "User Manual":"Manual de usuario",
          "please_provide_a_monthly_donation_amount_minimum_of_one_dollar":
              "Proporcione un monto de donación mensual mínimo de \$ 1",
          "please_enter_a_valid_cvc": "Introduzca un CVC válido.",
          "year": "Año",
          "please_enter_a_valid_expiration_year":
              "Introduzca un año de caducidad válido.",
          "month": "Mes",
          "please_enter_a_valid_expiration_month":
              "Introduzca un mes de caducidad válido.",
          "card_number": "Número de tarjeta",
          "please_enter_a_valid_card_number":
              "Por favor, introduzca un número de tarjeta válido.",
          "adoptions_can_only_be_made_in_whole_dollar_amounts":
              "Las adopciones solo se pueden hacer en cantidades enteras en dólares.",
          "are_you_sure_you_want_to_cancel_this_adoption":
              "¿Está seguro de que desea cancelar esta adopción? Puede volver a adoptar a este beneficiario desde la página Beneficiarios. ¿Le gustaría continuar con la cancelación de esta adopción?",
          "resuming_adoption_charity_would_you_like_to_continue":
              "Reanudar esta organización benéfica la hará visible para los donantes nuevamente. Una vez que reanude esta organización benéfica, puede desactivarla nuevamente desde la página Mis beneficiarios. ¿Te gustaria continuar?",
          "no_inactive_adoptions_to_show":
              "No hay adopciones inactivas para mostrar.",
          "please_enter_adoption_name": "Ingrese el nombre de adopción.",
          "edit_adoption": "Editar adopción",
          "no_active_adoptions_to_show":
              "No hay adopciones activas para mostrar.",
          "monthly_donation_amount": "Cantidad de donación mensual",
          "adopt": "Adoptar",
          "monthly_amount": "Cantidad mensual: \$",
          "cancel_adoption": "Cancelar Adopción",
          "my_adoptions": "Mis adopciones",
          "set_beneficiary_up_for_adoption":
              "Establecer beneficiario para adopción: ",
          "you_currently_have_no_donation_history_to_generate_a_pdf":
              "Actualmente no tienes historial de donaciones para generar un PDF.",
          "can_not_generate_a_pdf": "No se puede generar un PDF",
          "this_organization_does_not_have_any_active_beneficiaries_at_this_time":
              "Esta organización no tiene ningún \nbeneficiario activo en este momento.",
          "this_organization_does_not_have_any_active_campaigns_at_this_time":
              "Esta organización no tiene campañas \nactivas en este momento.",
          "your_information": "Tu información",
          "_unique_donors": " donantes únicos",
          "donations": "Donaciones",
          "statistics": "Estadísticas",
          "urgent_case_approvals": "Aprobaciones de casos urgentes",
          "This charity has reached it\'s goal!":
              "¡Esta organización benéfica ha alcanzado su objetivo!",
          "Denials": "Negaciones",
          "Edit Urgent Case": "Editar caso urgente",
          "Urgent case resubmitted!": "¡Caso urgente reenviado!",
          "This urgent case is pending approval.":
              "Este caso urgente está pendiente de aprobación.",
          "Attention:": "Atención:",
          "Your Urgent Case Was Denied": "Su caso urgente fue denegado",
          "After administrative review, your urgent case was denied for the following reason:":
              "Después de la revisión administrativa, su caso urgente fue denegado por la siguiente razón:",
          "No denied urgent cases to show.":
              "No se negaron casos urgentes para mostrar.",
          "No new visits": "No hay nuevas visitas",
          "Did this visit result in a donation?":
              "¿Esta visita resultó en una donación?",
          "Gateway Visits": "Visitas a la puerta de enlace",
          "Please enter the amount that was donated.":
              "Por favor, introduzca la cantidad que fue donada.",
          "Confirm Donation": "Confirmar donación",
          "Please confirm that this visit to your gateway did not result in a donation.":
              "Por favor, confirme que esta visita a su puerta de enlace no resultó en una donación",
          "Resuming this charity will make it visible to donors again. Once you resume this charity you can deactivate it again from the dashboard or the My Beneficiaries page. Would you like to continue?":
              "Reanudar esta organización benéfica la hará visible nuevamente para los donantes. Una vez que reanude esta organización benéfica, puede desactivarla nuevamente desde el panel de control o la página Mis beneficiarios. ¿Te gustaría continuar?",
          "Deleting this charity will completely remove it from the application. Would you like to continue?":
              "Eliminar esta organización benéfica la eliminará por completo de la aplicación. ¿Te gustaría continuar?",
          "Stopping this charity will make it not visible to donors. Once you stop this charity you can reactivate it from the Inactive Charities page. Would you like to continue with stopping this charity?":
              "Detener esta organización benéfica hará que no sea visible para los donantes. Una vez que detenga esta organización benéfica, puede reactivarla desde la página Organizaciones benéficas inactivas. ¿Te gustaría seguir parando esta caridad?",
          "Delete": "Borrar",
          "The email you chose is already in use.":
              "El correo electrónico que elegiste ya está en uso",
          "Are You Sure?": "¿Estás seguro?",
          "We see that you have entered a donation amount greater than \$999. We appreciate your generosity, but please confirm that this amount is correct to proceed.":
              "Vemos que ha ingresado un monto de donación superior a \$999. Agradecemos su generosidad, pero por favor confirme que esta cantidad es correcta para proceder.",
          "Sort By": "Ordenar por",
          "Country": "País",
          "Send": "Enviar",
          "Message": "Mensaje",
          "Subject": "Asunto",
          "Question": "Pregunta",
          "General": "General",
          "Help": "Ayuda",
          "Suggestion": "Sugerencia",
          "Other": "Otro",
          "Please select a category": "Seleccione una categoría",
          "Please enter a valid subject": "Introduzca un asunto válido",
          "Please enter a valid message": "Introduce un mensaje válido",
          "Contact Us": "Contáctenos",
          "My Favorites": "Mis favoritos",
          "Favorite Page": "Página favorita",
          "No favorites found": "No se han encontrado favoritos",
          "contact_admin": "Administrador de contacto",
          "type_a_message": "Escriba un mensaje",
          "message": "Mensajes",
          "no": "No",
          "yes": "Sí",
          "do_you_want_to_delete_conversation":
              "¿Quieres eliminar esa conversación?",
          "organization": "Organizaciones",
          "_organization": "Organización",
          "detour!": "desvío!",
          "the_organization_that_created":
              'La organización que creó esta organización benéfica no tiene su sede en los Estados Unidos. Debido a esto, no podemos procesar su pago.',
          "ok": "OK",
          "donate": "Donar",
          "home": "Casa",
          "search": "Búsqueda",
          "notifications": "Notificaciones",
          "donor": "Donante",
          "settings": "Ajustes",
          "profile": "Perfil",
          "about": "Sobre",
          "donation_history": "Historial de donaciones",
          "help": "Ayuda",
          "logout": "Cerrar sesión",
          "no_active_beneficiaries_to_show":
              "No hay beneficiarios activos para mostrar.",
          "beneficiaries": "Beneficiarios",
          "please_enter_a_valid_payment_amount":
              "Ingrese un monto de pago válido.",
          "please_provide_a_donation_minimum":
              "Proporcione una donación mínima de \$0.50",
          "donation_amount": "Monto de donación",
          "beneficiary_is_no_longer_available":
              "El beneficiario ya no está disponible para donar.",
          "paid_successfully": "¡Pagado con éxito!",
          "payment_cancelled!": "Pago cancelado.",
          "compaign_is_no_longer_available_to_donate":
              "La campaña ya no está disponible para donar a.",
          "categories": "Categorías",
          "no_compaigns_in_this_category": "No hay campañas en esta categoría.",
          "campaigns": "Campañas",
          "urgent_case": "Caso urgente",
          "campaign": "Campaña",
          "beneficiary": "Beneficiario",
          "no_donation_history": "Sin historial de donaciones.",
          "make_a_donation_to_see_it_here!":
              "¡Haz una donación para verlo aquí!",
          "dashboard": "Tablero",
          "see_more": "Ver más",
          "urgent_cases": "Casos Urgentes",
          "no_active_urgent_sases_show":
              "No hay casos urgentes activos para mostrar.",
          "edit_profile": "Editar perfil",
          "cancel": "Cancelar",
          "save": "Salvar",
          "edit": "Editar",
          "name": "Nombre",
          "first_name": "Primer Nombre",
          "please_enter_first_name.": "Por favor, introduzca el nombre.",
          "last_name": "Apellido",
          "please_enter_last_name.": "Por favor, introduzca el apellido.",
          "phone_number": "Número de teléfono",
          "please_enter_your_phone_number.":
              "Por favor, introduzca su número de teléfono.",
          "please_enter_a_valid_phone_number.":
              "Por favor ingrese un número de teléfono válido.",
          "donaid": "DONAID",
          "reset": "REINICIAR",
          "category": "Categoría",
          "charity_type": "Tipo de caridad",
          "raised'": "Elevado",
          "end_date": "Fecha final",
          "no_results_found": "No se han encontrado resultados",
          "ugent_case_is_no_longer":
              "El caso urgente ya no está disponible para donar a.",
          "pending_approvals": "Aprobaciones y denegaciones pendientes",
          "expired_charities": "Organizaciones benéficas vencidas",
          "inactive_charities": "Organizaciones benéficas inactivas",
          "success": "Éxito",
          "the_information_you_entered+has_been_added":
              "La información que ingresaste ha sido agregada.",
          "close": "Cerrar",
          "add_beneficiary": "Añadir Beneficiario",
          "required_fields": "Campos requeridos",
          "please_enter_a_nickname": "Por favor escribe un apodo.",
          "nickname": "Apodo",
          "please_enter_a_biography": "Por favor, introduzca una biografía.",
          "biography": "Biografía",
          "please_enter_a_goal_amount.": "Introduzca un importe objetivo.",
          "please_enter_a_valid_goal_amount":
              "Introduce un importe de objetivo válido",
          "goal_amount": "Importe del objetivo",
          "goal": "Meta",
          "please_enter_end_date.": "Introduzca la fecha de finalización.",
          "beneficiaries_cannot_have_a_duration_longer_than_1_year.":
              "Los beneficiarios no pueden tener una duración mayor a 1 año.",
          "enter_end_date": "Ingrese la fecha de finalización",
          "please_fill_in_the_category": "Por favor complete la categoría.",
          "submit": "Enviar",
          "beneficiary_created!": "Beneficiario creado!",
          "add_campaign": "Agregar campaña",
          "please_enter_a_title.": "Introduzca un título.",
          "title": "Título",
          "_campaign": "Campaña",
          "please_enter_a_description.": "Por favor ingrese una descripción.",
          "description": "Descripción",
          "campaigns_cannot_have_a_duration_longer_than_1_year.":
              "Las campañas no pueden tener una duración superior a 1 año.",
          "campaign_created!": "¡Campaña creada!",
          "create_campaign": "Crear campaña",
          "select_an_item_you_would_like_to_create: ":
              "Seleccione un artículo que le gustaría crear: ",
          "create_urgent_case": "Crear Caso Urgente",
          "create_beneficiary": "Crear Beneficiario",
          "add_urgent_case": "Agregar Caso Urgente",
          "urgent_cases_cannot_have_a_duration_longer":
              "Los casos urgentes no pueden tener una duración superior a 6 meses.",
          "urgent_cases_must_receive_approval":
              "Los casos urgentes deben recibir la aprobación de un administrador antes de mostrarse a los donantes.",
          "note": "Nota:",
          "urgent_case_submitted!": "¡Caso urgente enviado!",
          "edit_beneficiary": "Editar beneficiario",
          "please_enter_beneficiary_name.":
              "Por favor ingrese el nombre del beneficiario.",
          "edit_campaign": "Editar campaña",
          "please_enter_campaign_title.": "Ingrese el título de la campaña.",
          "campaign_description": "Descripción de la campaña",
          "my_beneficiaries": "Mis beneficiarios",
          "no_active_campaigns_to_show":
              "No hay campañas activas para mostrar.",
          "my_campaigns": "Mis campañas",
          "my_urgent_cases": "Mis Casos Urgentes",
          "are_you_sure?": "Estas seguro",
          "stop_charity": "detener la caridad",
          "_urgent_cases": "Casos urgentes",
          "resume_charity": "reanudar la caridad",
          "note:this_charity_has_expired":
              "Nota: esta organización benéfica ha caducado. Para reactivar esta organización benéfica y hacerla visible para los donantes nuevamente, edite la fecha de finalización de la organización benéfica.",
          "_beneficiary": "Beneficiario",
          "upload_profile_picture_or_logo.": "Subir foto de perfil o logo.",
          "organization_description": "Descripción de la organización",
          "gateway_link": "Enlace de puerta de enlace",
          "please_enter_gateway_link.":
              "Ingrese el enlace de la puerta de enlace.",
          "no_expired_beneficiaries_to_show":
              "No hay beneficiarios vencidos para mostrar.",
          "no_expired_campaigns_to_show.":
              "No hay campañas caducadas para mostrar.",
          "no_expired_urgent_cases_to_show.":
              "No hay casos urgentes vencidos para mostrar.",
          "_campaigns": "Campañas",
          "no_inactive_beneficiaries_to_show.":
              "No hay beneficiarios inactivos para mostrar.",
          "no_inactive_campaigns_to_show.":
              "No hay campañas inactivas para mostrar.",
          "no_inactive_urgent_cases_to_show.":
              "No hay casos urgentes inactivos para mostrar.",
          "_note:this_charity_has_expired":
              "Nota: esta organización benéfica ha caducado.",
          "no_pending_urgent_cases_to_show.":
              "No hay casos urgentes pendientes para mostrar.",
          "_pending_approvals": "Aprobaciones pendientes",
          "alert": "Alerta",
          " ":
              "El correo electrónico que eligió ya está en uso. Elija otra dirección de correo electrónico.",
          "donor_registration": "Registro de donantes",
          "please_enter_your_first_name.":
              "Por favor, introduzca su nombre de pila.",
          "please_enter_your_last_name.": "Por favor ingrese su apellido.",
          "please_enter_your_email.":
              "Por favor introduzca su correo electrónico.",
          "please_enter_a_valid_email_address.":
              "Por favor, introduce una dirección de correo electrónico válida.",
          "email": "Correo electrónico",
          "password_must_be_at_least_6_characters.":
              "La contraseña debe tener al menos 6 caracteres.",
          "password": "Clave",
          "passwords_do_not_match": "Las contraseñas no coinciden",
          "confirm_password": "Confirmar contraseña",
          "all_account_information_is_kept_private":
              "Toda la información de la cuenta se mantiene privada a menos que elija compartirla más adelante.",
          "register": "Registrarse",
          "organizations_are_required_to_upload":
              "Las organizaciones deben cargar imágenes de documentos para verificar su organización.",
          "organizations_are_Required_to_specify":
              "Las organizaciones deben especificar el país en el que se encuentra su organización.",
          "organization_registration": "Registro de la organización",
          "please_enter_your_organization_name.":
              "Ingrese el nombre de su organización.",
          "organization_name": "Nombre de la Organización",
          "please_enter_a_phone_number.":
              "Por favor, introduzca un número de teléfono.",
          "please_provide_street_address.":
              "Proporcione la dirección de la calle.",
          "street_address": "Dirección",
          "please_provide_city.": "Proporcione la ciudad.",
          "city": "Ciudad",
          "please_provide_postal_code.":
              "Por favor proporcione el código postal.",
          "postal_code": "Código postal",
          "countries_not_based_in_the_united_states":
              "Los países que no se encuentran en los Estados Unidos deben proporcionar su propia \npuerta de enlace.",
          "link_to_payment_gateway": "Enlace a Pasarela de Pago",
          "select_country": "Seleccionar país",
          "upload_document_to_verify":
              "Cargue el documento para verificar la organización.",
          "select_the_type_of_account": "seleccione el tipo de cuenta:",
          "something_wrong": "Ocurre algo",
          "login_cancelled_by_user":
              "Inicio de sesión cancelado por el usuario",
          "login": "Acceso",
          "guest_login": "Acceso de usuario invitado",
          "select_language": "Seleccione el idioma",
          "language": "Idioma",
          "english": "English",
          "arabic": "Arabic",
          "spanish": "Spanish",
          "lan": "LAN",
          "hold_on_a_second!": "¡Espera un segundo!",
          "cannot_log_in_with_that_email":
              "No se puede iniciar sesión con ese correo electrónico y contraseña. Por favor ingrese credenciales válidas.",
          "hang_on!": "¡Aférrate!",
          "your_organizationaccount_has_not_yet_been_approved":
              "El administrador aún no ha aprobado la cuenta de su organización. Debe esperar la aprobación antes de poder iniciar sesión en esta cuenta.",
          "your_donor_account_has_been_disabled_by_the_administrator":
              "Su cuenta de donante ha sido deshabilitada por el administrador. Si cree que esto puede haber sido un error, envíe un correo electrónico a donaidmobileapp1@gmail.com",
          "reset_link_sent!": "Restablecer enlace enviado!",
          "check_your_email_to_reset_password":
              "Revise su correo electrónico para restablecer la contraseña",
          "forgot_password!": "¿Has olvidado tu contraseña?",
          "adoptions": "Adopciones"
        }
      };
}
