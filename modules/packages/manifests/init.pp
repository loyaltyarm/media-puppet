class packages() {
  
  include apt

  apt::source { 'plexmediaserver':
    comment  => 'A repository for auto-updating Plex Media Server',
    location => 'https://downloads.plex.tv/repo/deb',
<<<<<<< HEAD
    release  => 'public',
    repos    => 'main',
    key      => {
      'id'     => 'CD665CBA0E2F88B7373F7CB997203C7B3ADCA79D',
      'source' => 'https://downloads.plex.tv/plex-keys/PlexSign.key',
=======
    release  => 'stable',
    repos    => 'public main',
    key      => {
      'id'     => 'CD665CBA0E2F88B7373F7CB997203C7B3ADCA79D',
      'server' => 'https://downloads.plex.tv/plex-keys/PlexSign.key',
>>>>>>> 982c1e2a493aa657334b1429ecafb989ddb4d0af
    },
    include  => {
      'deb' => true,
    },
  }
<<<<<<< HEAD

  package {
    ['plexmediaserver']:
    ensure   => installed,
    provider => 'apt';
  }
=======
>>>>>>> 982c1e2a493aa657334b1429ecafb989ddb4d0af
}

