# Import necessary libraries
import requests
import pandas as pd

# API Configuration
API_KEY = 'YOUR-KEY'  # Replace with your actual API key
BASE_URL = 'https://api.elsevier.com/content/search/scopus'
HEADERS = {
    'X-ELS-APIKey': API_KEY,
    'Accept': 'application/json'
}

# Define date ranges for data collection
DATE_RANGES = [
    ('1991-01-01', '1995-12-31'),
    ('1996-01-01', '2000-12-31'),
    ('2001-01-01', '2005-12-31'),
    ('2006-01-01', '2010-12-31'),
    ('2011-01-01', '2015-12-31'),
    ('2016-01-01', '2020-12-31'),
    ('2021-01-01', '2024-10-20')  # Current date cutoff
]

# Set pagination parameters
ITEMS_PER_PAGE = 25
MAX_RESULTS = 5000  # API-imposed limit per query

def fetch_scopus_data(start_date, end_date, country='Armenia'):
    """
    Fetch publication data from Scopus API for a specific date range and country.
    
    Parameters:
    -----------
    start_date : str
        Start date in format 'YYYY-MM-DD'
    end_date : str
        End date in format 'YYYY-MM-DD'
    country : str
        Country affiliation for publications
        
    Returns:
    --------
    list
        List of publication dictionaries with metadata
    """
    print(f"Fetching data from {start_date} to {end_date} for {country}")
    
    publications = []
    start = 0
    
    while True:
        # Define query parameters
        query_params = {
            'query': f'PUBYEAR > {start_date[:4]} AND PUBYEAR < {end_date[:4]} AND affilcountry({country})',
            'count': ITEMS_PER_PAGE,
            'start': start,
            'apiKey': API_KEY
        }
        
        # Make API request
        response = requests.get(BASE_URL, params=query_params, headers=HEADERS)
        
        # Check response status
        if response.status_code != 200:
            print(f"Error: {response.status_code}")
            break
            
        # Process the response
        data = response.json()
        total_results = int(data['search-results']['opensearch:totalResults'])
        entries = data['search-results'].get('entry', [])
        
        print(f"Found {total_results} publications for {start_date[:4]}-{end_date[:4]}")
        
        # Check if no more results
        if not entries:
            break
            
        # Extract publication data
        for entry in entries:
            publication = {
                "pub_date": entry.get('prism:coverDate', 'N/A'),
                "affiliation": entry.get('affiliation', [{'affilname': 'N/A'}])[0].get('affilname', 'N/A'),
                "country": entry.get('affiliation', [{'affiliation-country': 'N/A'}])[0].get('affiliation-country', 'N/A'),
                "doi": entry.get('prism:doi', 'N/A'),
                "pub_type": entry.get('subtypeDescription', 'N/A'),
                "journal_name": entry.get('prism:publicationName', 'N/A'),
                "open_access": entry.get('openaccessFlag', 'N/A'),
                "title": entry.get('dc:title', 'N/A'),
                "author": entry.get('dc:creator', 'N/A')
            }
            publications.append(publication)
        
        # Move to next page
        start += ITEMS_PER_PAGE
        
        # Safety check to avoid excessive API calls
        if start >= MAX_RESULTS:
            print(f"Reached maximum result limit ({MAX_RESULTS})")
            break
            
    return publications

def main():
    """
    Main function to collect Scopus data across all date ranges and save to CSV.
    """
    all_publications = []
    
    # Collect data for each date range and save
    for start_date, end_date in DATE_RANGES:
        publications = fetch_scopus_data(start_date, end_date)
        all_publications.extend(publications)
        print(f"Collected {len(publications)} publications for {start_date} to {end_date}")
    
    df = pd.DataFrame(all_publications)
    
    output_file = 'scopus_publications_armenia_1991_2024.csv'
    df.to_csv(output_file, index=False)
    print(f"Data successfully saved to {output_file}")
    print(f"Total publications collected: {len(all_publications)}")
    
    # Display data summary
    print("\nData Summary:")
    print(f"Date range: 1991-2024")
    print(f"Publication types: {df['pub_type'].nunique()} unique types")
    print(f"Open access ratio: {df['open_access'].value_counts(normalize=True).get('1', 0):.2%}")
    
    return df

# Execute the main function when run as script
if __name__ == "__main__":
    df = main()
