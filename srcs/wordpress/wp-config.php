<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '3iw' );

/** Database username */
define( 'DB_USER', '3aw' );

/** Database password */
define( 'DB_PASSWORD', 'imadabid' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'p.Qx:^P4lK06[(M(->k1rZrAiyo*HD2`3|<9*U`sGcZ2C&,UkkGqI@#^G>D 16!`' );
define( 'SECURE_AUTH_KEY',   'cHh#kL)GH(x>kOO@~Qj4fZ%;66P!v;Z}&n{<`IZwFwhDQg)O(S>)hR~wqaUCX[,g' );
define( 'LOGGED_IN_KEY',     'U2suC|a[=qM/<Bc2dL>4.%F$>nh^Zwp N2UV`AN5PajwzYv/c+J7f-@2C#4O0HNx' );
define( 'NONCE_KEY',         'nVkt<Af8JGS)s2lQUoa?!;V9eUKp|(_g<u1Y&l~&b`oTYan,g_nc^qOUDPyp0EYS' );
define( 'AUTH_SALT',         'L`[H%AUBwq.kFXN~:[8rg1Q.qbs(iDwQyL%9Foil,[s1U6`KQ-Zt<{ <Bct|^np@' );
define( 'SECURE_AUTH_SALT',  'gBGOqHLc-lQe0.xBu&X:Vn@X=3y])3Kr]m{b!# fOm%//4M~]wHcl^1y76R~Y}`+' );
define( 'LOGGED_IN_SALT',    'aV!6ZGEen].;=5Q<|hl<^m(8F=@fFmC|[i2-F2/Y#&9MJ~a@)f<K#j]8|k?vc[]!' );
define( 'NONCE_SALT',        ')YEd]|Y-BGl2QR+&Bcg=_G4A]jPaKq<E5LVrp^:_2w#jo+gatbqY*YS.-0,f*+t&' );
define( 'WP_CACHE_KEY_SALT', 'KtUR@G?yLOQAOvbPszsL#H~A8ZJ&|c!P&NMLBz=~p)Xoohw09?)e(H_jjuc{pOht' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', '6379' );
define( 'WP_REDIS_DATABASE', '0' );
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
