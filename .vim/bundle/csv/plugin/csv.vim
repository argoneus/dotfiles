if exists("g:csv_autocmd_arrange") &&
    \ !exists("#CSV_Edit#BufReadPost")
    aug CSV_Editing
	au!
	au BufReadPost,BufWritePost *.tab,*.cov,*.csv :ru! ftplugin/csv.vim | exe ":sil! InitCSV" | exe ":sil! %ArrangeCol" | setl noro
	au BufWritePre *.tab,*.cov,*.csv :%UnArrangeCol
    aug end
elseif exists("#CSV_Edit#BufReadPost")
    aug CSV_Edit
	au!
    aug end
    aug! CSV_Edit
endif
