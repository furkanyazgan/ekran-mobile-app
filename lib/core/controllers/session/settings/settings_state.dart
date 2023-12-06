enum SettingsPageStatuses { EditProfile, EditName, EditEmail, ChangeCategories, PreferredConnection, Password }

class SettingsState {
  SettingsPageStatuses settingsPageStatuses;

  SettingsState({
    this.settingsPageStatuses = SettingsPageStatuses.EditProfile,
  });

  SettingsState copyWith({SettingsPageStatuses? settingsPageStatuses}) {
    return SettingsState(
      settingsPageStatuses: settingsPageStatuses ?? this.settingsPageStatuses,
    );
  }
}
