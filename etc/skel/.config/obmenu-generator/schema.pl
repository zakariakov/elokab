#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(xml data)},
    begin_cat: beginning of a category              {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                      {end_cat => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [
	{sep => "ArchLInux"},
    #          COMMAND                 				LABEL                ICON
    {item => ['rofi -show run', 			'تشغيل تطبيق',       'system-run']},
    {item => ['elokab-terminal', 				'الطرفية',           'terminal']},
    {item => ['firefox',                                'متصفح الويب',       'firefox']},
    {item => ['elokab-fm',                               'مدير الملفات',      'folder']},
    {item => ['gedit',                               'محرر النصوص',       'text-editor']},

     {sep => undef},

    #{sep => 'Applications'},
	 {begin_cat => ['كل التطبيقات', 'applications-other']},
    #          NAME            LABEL                ICON
   		{cat => ['utility',     'ملحقات',      'applications-utilities']},
        {cat => ['system',      'النظام',      'applications-system']},
    	{cat => ['graphics',    'الرسومات',    'applications-graphics']},
    	{cat => ['audiovideo',  'الوسائط',     'applications-multimedia']},
    	{cat => ['network',     'الانترنت',     'applications-internet']},
    	{cat => ['development', 'التطوير',     'applications-development']},
    	{cat => ['education',   'تعليمي',      'applications-science']},
    	{cat => ['game',        'الالعاب',      'applications-games']},
    	{cat => ['office',      'المكتب',      'applications-office']},
    	{cat => ['other',       'تطبيقات أخرى','applications-other']},
    	{cat => ['settings',    'اعدادات',     'gnome-settings']},
    	

	{end_cat => undef},
    
	{sep => undef},
    # Preferences
    {begin_cat => ['التفظيلات', 'preferences-desktop-theme']},  
        {item => ['tint2conf',          'Tint2 اعداد',    'tint2conf']},
        {sep => undef},
        {item => ['lxappearance',                           'المظهر',             'preferences-desktop-theme']},
        {item => ['pkexec lightdm-gtk-greeter-settings',    'اعدادات مدير الولوج',       'preferences-desktop-theme']},
        {item => ['rofi-theme-selector',                    'Rofi مظهر',          'preferences-desktop-theme']},
		{item => ['qt5ct',                    'Qt مظهر',          'preferences-desktop-theme']},
		{item => ['paranoid.py',                             'compositor',      'applications-system']},
       
    {end_cat => undef},

	{sep => undef},
	{begin_cat => ['أوبن بوكس', 'openbox']},
            {item => ["$editor ~/.config/openbox/menu.xml",     'تحرير menu.xml',                 'text-xml']},
            {item => ["$editor ~/.config/openbox/rc.xml",       'تحرير rc.xml',                   'text-xml']},
            {item => ["$editor ~/.config/openbox/autostart",    'تحرير autostart',                'text-xml']},
            {sep => undef},
            
            {item => ['obconf',                                 'اعدادات اوبن بوكس',               'openbox']},
            {item => ['obkey',                                  'اختصارات المفاتيح',               'openbox']},

            {sep => undef},
            {item => ['openbox --restart',                      'اعد تحميل أوبن بوكس',               'openbox']},
            {item => ['openbox --reconfigure',                  'تحديث اعدادات أوبن بوكس',           'openbox']},
        {end_cat => undef},
    
  
    {sep => undef},
    # obmenu-generator
    {begin_cat => ['مولد القوائم', 'menu-editor']},
        {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-source']},
        {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-source']},
        {sep  => undef},
        #{item => ['~/.config/obmenu-generator/obmenu-generator -p',       'Generate a pipe menu',              'menu-editor']},
        {item => ['~/.config/obmenu-generator/obmenu-generator -s -c',    'ولد قائمة قياسية',            'menu-editor']},
        #{item => ['~/.config/obmenu-generator/obmenu-generator -p -i',    'Generate a pipe menu with icons',   'menu-editor']},
        {item => ['~/.config/obmenu-generator/obmenu-generator -s -i -c', 'ولد قائمة قياسية مع ايقونات', 'menu-editor']},
        {sep  => undef},
        {item => ['~/.config/obmenu-generator/obmenu-generator -d',       'تحديث الايقونات',                  'gtk-refresh']},
    {end_cat => undef},
    
    {sep => undef},
    {item => ['xscreensaver-command -lock', 'قفل الشاشة', 'system-lock-screen']},
    {item => ['~/.config/openbox/rofi-sh -l', 'الخروج', 'application-exit']},
    
]
