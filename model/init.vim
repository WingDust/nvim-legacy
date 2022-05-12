for file in split(glob("./container/*.vim"),'\n')
    execute 'source' file
endfor
