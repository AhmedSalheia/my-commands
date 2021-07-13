<?php

function copyRand($from,$to,$pref='')
{
    if (!is_dir($from))
    {
        echo 'Please Give A Valid Directory To Copy From';exit();
    }
    if (!is_dir($to))
    {
        mkdir($to);
    }

    $dir = dir($from);
    while($file = $dir->read())
    {
        if ($file === '.' || $file === '..')
        {
            continue;
        }

        if (is_dir(trim($dir->path,'\\').'\\'.$file))
        {
            copyRand(trim($dir->path,'\\').'\\'.$file,$to,$pref);
        }else
        {
            $name = $pref.uniqid();
            $name .= '.'.array_reverse(explode('.',$file))[0];
            copy(trim($dir->path,'\\').'\\'.$file,trim($to,'\\').'\\'.$name);
        }
    }
}

if (!isset($argv[3]))
{
    $argv[3] = '';
}
copyRand($argv[1],$argv[2],$argv[3]);