class packages() {
  
  include apt

  apt::source { 'plexmediaserver':
    comment  => 'A repository for auto-updating Plex Media Server',
    location => 'https://downloads.plex.tv/repo/deb',
    release  => 'stable',
    repos    => 'public main',
    key      => {
      'id'     => 'CD665CBA0E2F88B7373F7CB997203C7B3ADCA79D',
      'server' => 'https://downloads.plex.tv/plex-keys/PlexSign.key',
    },
    include  => {
      'deb' => true,
    },
  }
}

