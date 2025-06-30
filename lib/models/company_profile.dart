class CompanyProfile {
  final String sector;
  final String industry;
  final String ceo;
  final String description;
  final String website;
  final int fullTimeEmployees;

  CompanyProfile({
    required this.sector,
    required this.industry,
    required this.ceo,
    required this.description,
    required this.website,
    required this.fullTimeEmployees,
  });

  factory CompanyProfile.fromJson(Map<String, dynamic> json) {
    return CompanyProfile(
      sector: json['sector'] ?? 'N/A',
      industry: json['industry'] ?? 'N/A',
      ceo: json['ceo'] ?? 'N/A',
      description: json['description'] ?? 'N/A',
      website: json['website'] ?? 'N/A',
      fullTimeEmployees: json['fullTimeEmployees'] ?? 0,
    );
  }
}
