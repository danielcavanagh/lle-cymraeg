import EctoEnum

defenum(AccountRole, :account_role, [:admin, :person])
defenum(Gender, :gender, [:male, :female, :other])
defenum(InvitationType, :invitation_type, [:direct, :location])
defenum(InvitationStatus, :invitation_status, [:pending, :accepted, :declined, :maybe])
defenum(LanguageFrequency, :language_frequency, [:sometimes, :often, :always])
defenum(LanguageProficiency, :language_proficiency, [:beginner, :intermediate, :expert, :native])
