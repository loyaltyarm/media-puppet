class packages() {
  
  include apt

  apt::source { 'plexmediaserver':
    comment       => 'A repository for auto-updating Plex Media Server',
    location      => 'https://downloads.plex.tv/repo/deb',
    release       => 'public',
    repos         => 'main',
    notify_update => 'true',
    key           => {
      'id'          => 'CD665CBA0E2F88B7373F7CB997203C7B3ADCA79D',
      'source'      => 'https://downloads.plex.tv/plex-keys/PlexSign.key',
    },
    include       => {
      'deb'         => true,
    },
  }
  package {
    ['plexmediaserver']:
    ensure        => installed,
    provider      => 'apt';
  }
}

