   M S B A M L   `   `   `  ����T  PTextileCompanyApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullO,clr-namespace:TextileCompanyApplication.ViewTextileCompanyApplication.View  5   	   Y1clr-namespace:TextileCompanyApplication.ViewModel#TextileCompanyApplication.ViewModel  5   	   0    *TextileCompanyApplication.View.AdminWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   >local,clr-namespace:TextileCompanyApplication.View     5   	   G	viewmodel1clr-namespace:TextileCompanyApplication.ViewModel     5   	     � Title$=  7Список товаров. Администратор��5	   	   $	��650��6/   $
��1000��6<   $	��450��6I   $	��800��6Y    � WindowStartupLocation$ CenterScreen=�6h    � DataContext 5      8   2TextileCompanyApplication.ViewModel.AdminViewModel  5   
   .��5      �  � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $	��250 �6    � RowDefinitions 5   
   �� 5      $��70 �6   �� 5      $��60 �6   �� 5      $��* �6   �� 5      $��60 �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $��15,0,0,0q�6   $��/Assets/Images/logo.png��6&   �� 5      $��ООО «Ткани»��6   $��Center=�6+      TitleTextBlockStyle#��[  6F   5      �� 5    
   $��1��6   $��2��6!   $��Right=�65     TextBlockStyle#��[ 6k   ��6Q   �� *
Fullname+6k   �� 5"   
   -   5         ��Name$ ListViewProducts��5"      $��2��6-   $��Disabled=�6[   ��6:   �� *
Products+ �� SelectedItem 5#      �� *SelectedProduct+��5$      �� 5%      .R�5&      �  5'      �� 5(      $��90 �6/   �� 5)      $��* �6/   �� 5*      $	��210 �6/   .+�5-      �� $��3��6!   ��65   �� *
Background+�� 5/      ��6    �� *Image+�� 51      $��1��6%   $��10q�65   .+�52      �� #��[  6>   ��6(   �� *Name+6>   �� 53      #��[ 6>   $
��Wrap=�6f   ��6(   �� *Info+6f   �� 54      #��[ 6g   $
��Wrap=�6�   ��6(   �� *Manufacturer+ �� StringFormat$% Производитель: {0}��6�   �� 55      #��[ 6W   ��6(   �� *Price+$ Цена: {0}��6W   56      �� 58      $��2��6$   #��[ 6R   $��Right=�6z   $��Center=�59   $   ��58   4   �� *Availability+59   $   5:      5;      5=      �� 5?   
   $��2��6   $��1��6"   .+�5@      �� #��[ 6S   ��6   �� *ProductsAmount+$ Показано {0}��6S   �� 5A      $#��Название товара��6   #��[ 6/   �� 5B      -   5        	 ��Name$	 TbNameFilter��5B        TextBoxStyle#��[ 6H   ��6,   �� *
NameFilter+6n   �� 5C      $ ��Производитель��6   #��[ 6-   �� 5D      
 �� DisplayMemberPath$
 Value��6=     ComboBoxStyle#��[ 5E      ��5D      �� *Manufacturers+ 6W   �� *SelectedManufacturer+5E      �� 5F      $*��$По возрастанию цены��6     ButtonStyle#��[ 63   ��6X   �� *OrderByIncreasingCommand+�� 5G      $$��По убыванию цены��6   #��[ 60   ��6U   �� *OrderByDecreasingCommand+�� 5H      $%��Сбросить фильтры��6   #��[ 60   ��6U   �� *ClearFiltersCommand+5I      �� 5K   
   $��3��6   $ 
Horizontal=�6"   .+�5L      �� $��
Назад��6   $��Center=�6%   $
��Left=�6@   #��[ 6[   $	��120��6�   ��5M      �� *SignOutCommand+�� 5N      $��Добавить��6   $��Center=�6(   $
��Left=�6C   #��[ 6^   $	��120��6�   ��5O      �� * OpenProductAddingWindowCommand+�� 5P      $ ��Редактировать��6   $��Center=�6-   $
��Left=�6H   #��[ 6c   $	��120��6�   ��5Q      �� *!OpenProductEditingWindowCommand+�� 5R      $��Удалить��6   $��Center=�6'   $
��Left=�6B   #��[ 6]   $	��120��6�   ��5S      �� *DeleteProductCommand+5T      5U      5V      