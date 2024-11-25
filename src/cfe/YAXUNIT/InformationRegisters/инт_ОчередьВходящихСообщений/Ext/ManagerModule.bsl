﻿&Вместо("ПолучитьДанныеОчередиПоИдентификатору")
Функция Мок_ПолучитьДанныеОчередиПоИдентификатору(ИдентификаторСообщения, СписокПолей)
  ПараметрыМетода = Мокито.МассивПараметров(ИдентификаторСообщения, СписокПолей);
  ПрерватьВыполнение = Ложь;

  Результат = МокитоПерехват.АнализВызова(РегистрыСведений.инт_ОчередьВходящихСообщений, "ПолучитьДанныеОчередиПоИдентификатору", ПараметрыМетода, ПрерватьВыполнение);

  Если Не ПрерватьВыполнение Тогда
    Возврат ПродолжитьВызов(ИдентификаторСообщения, СписокПолей);
  Иначе
    Возврат Результат;
  КонецЕсли;
КонецФункции

&Вместо("ЗарегистрироватьСообщение")
Функция Мок_ЗарегистрироватьСообщение(ВходящееСообщение, ПотокДанных, ИдентификаторСообщения = Неопределено)
  ПараметрыМетода = Мокито.МассивПараметров(ВходящееСообщение, ПотокДанных, ИдентификаторСообщения);
  ПрерватьВыполнение = Ложь;

  Результат = МокитоПерехват.АнализВызова(РегистрыСведений.инт_ОчередьВходящихСообщений, "ЗарегистрироватьСообщение", ПараметрыМетода, ПрерватьВыполнение);

  Если Не ПрерватьВыполнение Тогда
    Возврат ПродолжитьВызов(ВходящееСообщение, ПотокДанных, ИдентификаторСообщения);
  Иначе
    Возврат Результат;
  КонецЕсли;
КонецФункции
