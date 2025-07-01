class CompanyProfile {
  final String name;
  final String ticker;
  final String exchange;
  final String webUrl;
  final String logo;
  final String industry;
  final String ipo;
  final double marketCapitalization;
  final double shareOutstanding;
  final String country;
  final String phone;
  final String currency;

  CompanyProfile({
    required this.name,
    required this.ticker,
    required this.exchange,
    required this.webUrl,
    required this.logo,
    required this.industry,
    required this.ipo,
    required this.marketCapitalization,
    required this.shareOutstanding,
    required this.country,
    required this.phone,
    required this.currency,
  });

  factory CompanyProfile.fromJson(Map<String, dynamic> json) {
    return CompanyProfile(
      name: json['name'] ?? 'N/A',
      ticker: json['ticker'] ?? 'N/A',
      exchange: json['exchange'] ?? 'N/A',
      webUrl: json['weburl'] ?? 'N/A',
      logo: json['logo'] ?? '',
      industry: json['finnhubIndustry'] ?? 'N/A',
      ipo: json['ipo'] ?? 'N/A',
      marketCapitalization: (json['marketCapitalization'] ?? 0).toDouble(),
      shareOutstanding: (json['shareOutstanding'] ?? 0).toDouble(),
      country: json['country'] ?? 'N/A',
      phone: json['phone'] ?? 'N/A',
      currency: json['currency'] ?? 'N/A',
    );
  }
}
