# -*- coding: utf-8 -*-
"""
Éditeur de Spyder

Ceci est un script temporaire.
"""

from pywinauto.application import Application
from pywinauto.mouse import click 
import win32api
import time
import os

#Warning : don't change position of the app panel after open as the script use button coordinates
#Warning : Pim Files to process must be placed in Data_MAXi folder of the software
#Warning : do not move the mouse between two pictures 

#Open PAM software ImagingWin
dir = 'C:\ImagingPamGigE\ImagingWin.exe'

filesdir = 'C:\ImagingPamGigE\Data_MAXI'
#List pim-files in the Data_MAXI folder
pim_files = [f for f in os.listdir(filesdir) if f.endswith('.pim')]
starting_file='277.pim'
site_name='Run 2'
#Cut files before starting file
pim_files=pim_files[pim_files.index(starting_file):len(pim_files)]



###Launch app in MAXI mode
app = Application(backend="uia").start(dir)
#Coordinates of the view button *******
#click(button='left', coords=(938, 586))
time.sleep(1)
app= Application(backend="uia").connect(title="Select Unit",timeout=100)
maxi=app.SelectUnit.MAXI.wrapper_object()
maxi.click()
ok=app.SelectUnit.OK.wrapper_object()
ok.click()

#Connect to the app GUI 
app = Application(backend="uia").connect(title_re="ImagingWin v2.56p*",timeout=100)

#Get handles identifiers
#app.window(title_re="ImagingWin v2.56p*").print_control_identifiers()
kin=app.window(title_re="ImagingWin v2.56p*").Kinetics.wrapper_object()
add_zone=app.window(title_re="ImagingWin v2.56p*").Add.wrapper_object()

#Find mouse coordinates
x, y = win32api.GetCursorPos()

ind=0
#Loop across all the pim files 
for file in pim_files:
    ### Open pim files automatically 
    filename=file
    #Press the open-pim file button
#    kin=app.window(title_re="ImagingWin v2.56p*").Kinetics.wrapper_object()
    kin.select()
    #Coordinates of the open button *******
    click(button='left', coords=(765, 810))
    #From the second file close automatically the save-alert window
    if ind>0:
        #Coordinates of the save info button (nein) ******
        click(button='left', coords=(992, 551))
    
    #Open the file from open window 
    #Name of the Open panel ******
    openwindow=Application(backend="uia").connect(title="Open",timeout=100)
    #openwindow.window(title_re="Open").print_control_identifiers()
    #Edit29 ******
    name=openwindow.Open['File name:Edit'].wrapper_object()
    name.type_keys(keys=filename)
    #Button16 ******
    openfile=openwindow.Open.child_window(title="Open", auto_id="1", control_type="Button").wrapper_object()
    openfile.click()
    
    ###Take measurements manually
    #Switch to Fm' tab to avoid oversaturated zones
    Fmprim=app.window(title_re="ImagingWin v2.56p*").RadioButton18.wrapper_object()
    Fmprim.click()
    #For some reason the reset button is sometimes unavailable after opening a new image
    #We zoom in / zoom out to reset it 
    #Replace by mouse coordinates as it often leads to bugs 
#    zoomin=app.window(title_re="ImagingWin v2.56p*").Zoomin.wrapper_object()
#    zoomin.click()
    #Coordinates of zoom in button ********
    click(button='left', coords=(1278, 486))
    #Coordinates of zoom out buton ********
    click(button='left', coords=(1267, 462))
#    zoomout=app.window(title_re="ImagingWin v2.56p*").Zoomout.wrapper_object()
#    zoomout.click()

    #Click reset button
    #Coordinates of reset button *********
    click(button='left', coords=(1252, 624))

    #Add several measurements waiting for user click
#    add_zone=app.window(title_re="ImagingWin v2.56p*").Add.wrapper_object()
    #You need to press the spacebar when all desired measurements have been taken
    while True:
        add_zone.click()
        a=win32api.GetKeyState(0x20)
        if a<0:
            print('Measures saved')
            break
        time.sleep(0.05)
    
    ###Save measurements
    savename=site_name+'_'+file
    #Open Report table
#    kin=app.window(title_re="ImagingWin v2.56p*").Kinetics.wrapper_object()
    kin.select()
    #Coordinates of report button ********
    click(button='left', coords=(757, 224))
    #Coordinates of export button ********
    click(button='left', coords=(616, 256))
    #Save file under desired name
    #Name of the save panel *******
    savewindow=Application(backend="uia").connect(title="Save As",timeout=100)
    #savewindow.window(title_re="Save As").print_control_identifiers()
    #Edit 29 ********
    sname=openwindow.SaveAs['File name:Edit'].wrapper_object()
    sname.type_keys(keys=savename)
    sname.type_keys("{ENTER}")
    #Press OK button of information box
    Application(backend="uia").connect(title="Informationen",timeout=100).Informationen.OK.click()
    ind=ind+1

