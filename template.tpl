{{- define "icon"}}
	{{- if .IsDir}}
		{{- if .IsSymlink}}
		<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-folder-filled" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
			<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
			<path d="M9 3a1 1 0 0 1 .608 .206l.1 .087l2.706 2.707h6.586a3 3 0 0 1 2.995 2.824l.005 .176v8a3 3 0 0 1 -2.824 2.995l-.176 .005h-14a3 3 0 0 1 -2.995 -2.824l-.005 -.176v-11a3 3 0 0 1 2.824 -2.995l.176 -.005h4z" stroke-width="0" fill="currentColor"/>
			<path fill="#000" d="M2.795 17.306c0-2.374 1.792-4.314 4.078-4.538v-1.104a.38.38 0 0 1 .651-.272l2.45 2.492a.132.132 0 0 1 0 .188l-2.45 2.492a.381.381 0 0 1-.651-.272V15.24c-1.889.297-3.436 1.39-3.817 3.26a2.809 2.809 0 0 1-.261-1.193Z" style="stroke-width:.127478"/>
		</svg>
		{{- else}}
		<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-folder-filled" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
			<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
			<path d="M9 3a1 1 0 0 1 .608 .206l.1 .087l2.706 2.707h6.586a3 3 0 0 1 2.995 2.824l.005 .176v8a3 3 0 0 1 -2.824 2.995l-.176 .005h-14a3 3 0 0 1 -2.995 -2.824l-.005 -.176v-11a3 3 0 0 1 2.824 -2.995l.176 -.005h4z" stroke-width="0" fill="currentColor"/>
		</svg>
		{{- end}}
	{{- else if or (eq .Name "LICENSE") (eq .Name "README")}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-license" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M15 21h-9a3 3 0 0 1 -3 -3v-1h10v2a2 2 0 0 0 4 0v-14a2 2 0 1 1 2 2h-2m2 -4h-11a3 3 0 0 0 -3 3v11"/>
		<path d="M9 7l4 0"/>
		<path d="M9 11l4 0"/>
	</svg>
	{{- else if .HasExt ".jpg" ".jpeg" ".png" ".gif" ".webp" ".tiff" ".bmp" ".heif" ".heic" ".svg"}}
		{{- if eq .Tpl.Layout "grid"}}
		<img loading="lazy" src="{{html .Name}}">
		{{- else}}
		<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-photo" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
			<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
			<path d="M15 8h.01"/>
			<path d="M3 6a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v12a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3v-12z"/>
			<path d="M3 16l5 -5c.928 -.893 2.072 -.893 3 0l5 5"/>
			<path d="M14 14l1 -1c.928 -.893 2.072 -.893 3 0l3 3"/>
		</svg>
		{{- end}}
	{{- else if .HasExt ".mp4" ".mov" ".m4v" ".mpeg" ".mpg" ".avi" ".ogg" ".webm" ".mkv" ".vob" ".gifv" ".3gp"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-movie" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M4 4m0 2a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2z"/>
		<path d="M8 4l0 16"/>
		<path d="M16 4l0 16"/>
		<path d="M4 8l4 0"/>
		<path d="M4 16l4 0"/>
		<path d="M4 12l16 0"/>
		<path d="M16 8l4 0"/>
		<path d="M16 16l4 0"/>
	</svg>
	{{- else if .HasExt ".mp3" ".m4a" ".aac" ".ogg" ".flac" ".wav" ".wma" ".midi" ".cda"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-music" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M6 17m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0"/>
		<path d="M16 17m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0"/>
		<path d="M9 17l0 -13l10 0l0 13"/>
		<path d="M9 8l10 0"/>
	</svg>
	{{- else if .HasExt ".pdf"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-type-pdf" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4"/>
		<path d="M5 18h1.5a1.5 1.5 0 0 0 0 -3h-1.5v6"/>
		<path d="M17 18h2"/>
		<path d="M20 15h-3v6"/>
		<path d="M11 15v6h1a2 2 0 0 0 2 -2v-2a2 2 0 0 0 -2 -2h-1z"/>
	</svg>
	{{- else if .HasExt ".csv" ".tsv"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-type-csv" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4"/>
		<path d="M7 16.5a1.5 1.5 0 0 0 -3 0v3a1.5 1.5 0 0 0 3 0"/>
		<path d="M10 20.25c0 .414 .336 .75 .75 .75h1.25a1 1 0 0 0 1 -1v-1a1 1 0 0 0 -1 -1h-1a1 1 0 0 1 -1 -1v-1a1 1 0 0 1 1 -1h1.25a.75 .75 0 0 1 .75 .75"/>
		<path d="M16 15l2 6l2 -6"/>
	</svg>
	{{- else if .HasExt ".txt" ".doc" ".docx" ".odt" ".fodt" ".rtf"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-text" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z"/>
		<path d="M9 9l1 0"/>
		<path d="M9 13l6 0"/>
		<path d="M9 17l6 0"/>
	</svg>
	{{- else if .HasExt ".xls" ".xlsx" ".ods" ".fods"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-spreadsheet" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z"/>
		<path d="M8 11h8v7h-8z"/>
		<path d="M8 15h8"/>
		<path d="M11 11v7"/>
	</svg>
	{{- else if .HasExt ".ppt" ".pptx" ".odp" ".fodp"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-presentation-analytics" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M9 12v-4"/>
		<path d="M15 12v-2"/>
		<path d="M12 12v-1"/>
		<path d="M3 4h18"/>
		<path d="M4 4v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-10"/>
		<path d="M12 16v4"/>
		<path d="M9 20h6"/>
	</svg>
	{{- else if .HasExt ".zip" ".gz" ".xz" ".tar" ".7z" ".rar" ".xz" ".zst"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-zip" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M6 20.735a2 2 0 0 1 -1 -1.735v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2h-1"/>
		<path d="M11 17a2 2 0 0 1 2 2v2a1 1 0 0 1 -1 1h-2a1 1 0 0 1 -1 -1v-2a2 2 0 0 1 2 -2z"/>
		<path d="M11 5l-1 0"/>
		<path d="M13 7l-1 0"/>
		<path d="M11 9l-1 0"/>
		<path d="M13 11l-1 0"/>
		<path d="M11 13l-1 0"/>
		<path d="M13 15l-1 0"/>
	</svg>
	{{- else if .HasExt ".deb" ".dpkg"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-debian" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M12 17c-2.397 -.943 -4 -3.153 -4 -5.635c0 -2.19 1.039 -3.14 1.604 -3.595c2.646 -2.133 6.396 -.27 6.396 3.23c0 2.5 -2.905 2.121 -3.5 1.5c-.595 -.621 -1 -1.5 -.5 -2.5"/>
		<path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"/>
	</svg>
	{{- else if .HasExt ".rpm" ".exe" ".flatpak" ".appimage" ".jar" ".msi" ".apk"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-package" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M12 3l8 4.5l0 9l-8 4.5l-8 -4.5l0 -9l8 -4.5"/>
		<path d="M12 12l8 -4.5"/>
		<path d="M12 12l0 9"/>
		<path d="M12 12l-8 -4.5"/>
		<path d="M16 5.25l-8 4.5"/>
	</svg>
	{{- else if .HasExt ".ps1"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-powershell" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M4.887 20h11.868c.893 0 1.664 -.665 1.847 -1.592l2.358 -12c.212 -1.081 -.442 -2.14 -1.462 -2.366a1.784 1.784 0 0 0 -.385 -.042h-11.868c-.893 0 -1.664 .665 -1.847 1.592l-2.358 12c-.212 1.081 .442 2.14 1.462 2.366c.127 .028 .256 .042 .385 .042z"/>
		<path d="M9 8l4 4l-6 4"/>
		<path d="M12 16h3"/>
	</svg>
	{{- else if .HasExt ".py" ".pyc" ".pyo"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-python" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M12 9h-7a2 2 0 0 0 -2 2v4a2 2 0 0 0 2 2h3"/>
		<path d="M12 15h7a2 2 0 0 0 2 -2v-4a2 2 0 0 0 -2 -2h-3"/>
		<path d="M8 9v-4a2 2 0 0 1 2 -2h4a2 2 0 0 1 2 2v5a2 2 0 0 1 -2 2h-4a2 2 0 0 0 -2 2v5a2 2 0 0 0 2 2h4a2 2 0 0 0 2 -2v-4"/>
		<path d="M11 6l0 .01"/>
		<path d="M13 18l0 .01"/>
	</svg>
	{{- else if .HasExt ".bash" ".sh" ".com" ".bat" ".dll" ".so"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-script" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M17 20h-11a3 3 0 0 1 0 -6h11a3 3 0 0 0 0 6h1a3 3 0 0 0 3 -3v-11a2 2 0 0 0 -2 -2h-10a2 2 0 0 0 -2 2v8"/>
	</svg>
	{{- else if .HasExt ".dmg"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-finder" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M3 4m0 1a1 1 0 0 1 1 -1h16a1 1 0 0 1 1 1v14a1 1 0 0 1 -1 1h-16a1 1 0 0 1 -1 -1z"/>
		<path d="M7 8v1"/>
		<path d="M17 8v1"/>
		<path d="M12.5 4c-.654 1.486 -1.26 3.443 -1.5 9h2.5c-.19 2.867 .094 5.024 .5 7"/>
		<path d="M7 15.5c3.667 2 6.333 2 10 0"/>
	</svg>
	{{- else if .HasExt ".iso" ".img"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-disc" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"/>
		<path d="M12 12m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0"/>
		<path d="M7 12a5 5 0 0 1 5 -5"/>
		<path d="M12 17a5 5 0 0 0 5 -5"/>
	</svg>
	{{- else if .HasExt ".md" ".mdown" ".markdown"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-markdown" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M3 5m0 2a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v10a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2z"/>
		<path d="M7 15v-6l2 2l2 -2v6"/>
		<path d="M14 13l2 2l2 -2m-2 2v-6"/>
	</svg>
	{{- else if .HasExt ".ttf" ".otf" ".woff" ".woff2" ".eof"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-typography" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z"/>
		<path d="M11 18h2"/>
		<path d="M12 18v-7"/>
		<path d="M9 12v-1h6v1"/>
	</svg>
	{{- else if .HasExt ".go"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-golang" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M15.695 14.305c1.061 1.06 2.953 .888 4.226 -.384c1.272 -1.273 1.444 -3.165 .384 -4.226c-1.061 -1.06 -2.953 -.888 -4.226 .384c-1.272 1.273 -1.444 3.165 -.384 4.226z"/>
		<path d="M12.68 9.233c-1.084 -.497 -2.545 -.191 -3.591 .846c-1.284 1.273 -1.457 3.165 -.388 4.226c1.07 1.06 2.978 .888 4.261 -.384a3.669 3.669 0 0 0 1.038 -1.921h-2.427"/>
		<path d="M5.5 15h-1.5"/>
		<path d="M6 9h-2"/>
		<path d="M5 12h-3"/>
	</svg>
	{{- else if .HasExt ".html" ".htm"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-type-html" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4"/>
		<path d="M2 21v-6"/>
		<path d="M5 15v6"/>
		<path d="M2 18h3"/>
		<path d="M20 15v6h2"/>
		<path d="M13 21v-6l2 3l2 -3v6"/>
		<path d="M7.5 15h3"/>
		<path d="M9 15v6"/>
	</svg>
	{{- else if .HasExt ".js"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-type-js" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M3 15h3v4.5a1.5 1.5 0 0 1 -3 0"/>
		<path d="M9 20.25c0 .414 .336 .75 .75 .75h1.25a1 1 0 0 0 1 -1v-1a1 1 0 0 0 -1 -1h-1a1 1 0 0 1 -1 -1v-1a1 1 0 0 1 1 -1h1.25a.75 .75 0 0 1 .75 .75"/>
		<path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2h-1"/>
	</svg>
	{{- else if .HasExt ".css"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-type-css" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4"/>
		<path d="M8 16.5a1.5 1.5 0 0 0 -3 0v3a1.5 1.5 0 0 0 3 0"/>
		<path d="M11 20.25c0 .414 .336 .75 .75 .75h1.25a1 1 0 0 0 1 -1v-1a1 1 0 0 0 -1 -1h-1a1 1 0 0 1 -1 -1v-1a1 1 0 0 1 1 -1h1.25a.75 .75 0 0 1 .75 .75"/>
		<path d="M17 20.25c0 .414 .336 .75 .75 .75h1.25a1 1 0 0 0 1 -1v-1a1 1 0 0 0 -1 -1h-1a1 1 0 0 1 -1 -1v-1a1 1 0 0 1 1 -1h1.25a.75 .75 0 0 1 .75 .75"/>
	</svg>
	{{- else if .HasExt ".json" ".json5" ".jsonc"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-json" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M20 16v-8l3 8v-8"/>
		<path d="M15 8a2 2 0 0 1 2 2v4a2 2 0 1 1 -4 0v-4a2 2 0 0 1 2 -2z"/>
		<path d="M1 8h3v6.5a1.5 1.5 0 0 1 -3 0v-.5"/>
		<path d="M7 15a1 1 0 0 0 1 1h1a1 1 0 0 0 1 -1v-2a1 1 0 0 0 -1 -1h-1a1 1 0 0 1 -1 -1v-2a1 1 0 0 1 1 -1h1a1 1 0 0 1 1 1"/>
	</svg>
	{{- else if .HasExt ".ts"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-type-ts" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2h-1"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M9 20.25c0 .414 .336 .75 .75 .75h1.25a1 1 0 0 0 1 -1v-1a1 1 0 0 0 -1 -1h-1a1 1 0 0 1 -1 -1v-1a1 1 0 0 1 1 -1h1.25a.75 .75 0 0 1 .75 .75"/>
		<path d="M3.5 15h3"/>
		<path d="M5 15v6"/>
	</svg>
	{{- else if .HasExt ".sql"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-type-sql" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
		<path d="M5 20.25c0 .414 .336 .75 .75 .75h1.25a1 1 0 0 0 1 -1v-1a1 1 0 0 0 -1 -1h-1a1 1 0 0 1 -1 -1v-1a1 1 0 0 1 1 -1h1.25a.75 .75 0 0 1 .75 .75"/>
		<path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4"/>
		<path d="M18 15v6h2"/>
		<path d="M13 15a2 2 0 0 1 2 2v2a2 2 0 1 1 -4 0v-2a2 2 0 0 1 2 -2z"/>
		<path d="M14 20l1.5 1.5"/>
	</svg>
	{{- else if .HasExt ".db" ".sqlite" ".bak" ".mdb"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-database" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M12 6m-8 0a8 3 0 1 0 16 0a8 3 0 1 0 -16 0"/>
		<path d="M4 6v6a8 3 0 0 0 16 0v-6"/>
		<path d="M4 12v6a8 3 0 0 0 16 0v-6"/>
	</svg>
	{{- else if .HasExt ".eml" ".email" ".mailbox" ".mbox" ".msg"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-mail" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M3 7a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v10a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2v-10z"/>
		<path d="M3 7l9 6l9 -6"/>
	</svg>
	{{- else if .HasExt ".crt" ".pem" ".x509" ".cer" ".ca-bundle"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-certificate" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M15 15m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0"/>
		<path d="M13 17.5v4.5l2 -1.5l2 1.5v-4.5"/>
		<path d="M10 19h-5a2 2 0 0 1 -2 -2v-10c0 -1.1 .9 -2 2 -2h14a2 2 0 0 1 2 2v10a2 2 0 0 1 -1 1.73"/>
		<path d="M6 9l12 0"/>
		<path d="M6 12l3 0"/>
		<path d="M6 15l2 0"/>
	</svg>
	{{- else if .HasExt ".key" ".keystore" ".jks" ".p12" ".pfx" ".pub"}}
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-key" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
		<path d="M16.555 3.843l3.602 3.602a2.877 2.877 0 0 1 0 4.069l-2.643 2.643a2.877 2.877 0 0 1 -4.069 0l-.301 -.301l-6.558 6.558a2 2 0 0 1 -1.239 .578l-.175 .008h-1.172a1 1 0 0 1 -.993 -.883l-.007 -.117v-1.172a2 2 0 0 1 .467 -1.284l.119 -.13l.414 -.414h2v-2h2v-2l2.144 -2.144l-.301 -.301a2.877 2.877 0 0 1 0 -4.069l2.643 -2.643a2.877 2.877 0 0 1 4.069 0z"/>
		<path d="M15 9h.01"/>
	</svg>
	{{- else}}
		{{- if .IsSymlink}}
		<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-symlink" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
			<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
			<path d="M4 21v-4a3 3 0 0 1 3 -3h5"/>
			<path d="M9 17l3 -3l-3 -3"/>
			<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
			<path d="M5 11v-6a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2h-9.5"/>
		</svg>
		{{- else}}
		<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
			<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
			<path d="M14 3v4a1 1 0 0 0 1 1h4"/>
			<path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z"/>
		</svg>
		{{- end}}
	{{- end}}
{{- end}}
<!DOCTYPE html>
<html>
	<head>
		<title>{{html .Name}}</title>
		<link rel="canonical" href="{{.Path}}/"  />
		<meta charset="utf-8">
		<meta name="color-scheme" content="light dark">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* { padding: 0; margin: 0; box-sizing: border-box; }

body {
	font-family: Inter, system-ui, sans-serif;
	font-size: 16px;
	text-rendering: optimizespeed;
	background-color: #f3f6f7;
	min-height: 100vh;
}

img,
svg {
	vertical-align: middle;
	z-index: 1;
}

img {
	max-width: 100%;
	max-height: 100%;
	border-radius: 5px;
}

td img {
	max-width: 1.5em;
	max-height: 2em;
	object-fit: cover;
}

body,
a,
svg,
.layout.current,
.layout.current svg,
.go-up {
	color: #333;
	text-decoration: none;
}

.wrapper {
	max-width: 1200px;
	margin-left: auto;
	margin-right: auto;
}

header,
.meta {
	padding-left: 5%;
	padding-right: 5%;
}

td a {
	color: #006ed3;
	text-decoration: none;
}

td a:hover {
	color: #0095e4;
}

td a:visited {
	color: #800080;
}

td a:visited:hover {
	color: #b900b9;
}

th:first-child,
td:first-child {
	width: 5%;
}

th:last-child,
td:last-child {
	width: 5%;
}

.size,
.timestamp {
	font-size: 14px;
}

.grid .size {
	font-size: 12px;
	margin-top: .5em;
	color: #496a84;
}

header {
	padding-top: 15px;
	padding-bottom: 15px;
	box-shadow: 0px 0px 20px 0px rgb(0 0 0 / 10%);
}

.breadcrumbs {
	text-transform: uppercase;
	font-size: 10px;
	letter-spacing: 1px;
	color: #939393;
	margin-bottom: 5px;
	padding-left: 3px;
}

h1 {
	font-size: 20px;
	font-family: Poppins, system-ui, sans-serif;
	font-weight: normal;
	white-space: nowrap;
	overflow-x: hidden;
	text-overflow: ellipsis;
	color: #c5c5c5;
}

h1 a,
th a {
	color: #000;
}

h1 a {
	padding: 0 3px;
	margin: 0 1px;
}

h1 a:hover {
	background: #ffffc4;
}

h1 a:first-child {
	margin: 0;
}

header,
main {
	background-color: white;
}

main {
	margin: 3em auto 0;
	border-radius: 5px;
	box-shadow: 0 2px 5px 1px rgb(0 0 0 / 5%);
}

.meta {
	display: flex;
	gap: 1em;
	font-size: 14px;
	border-bottom: 1px solid #e5e9ea;
	padding-top: 1em;
	padding-bottom: 1em;
}

#summary {
	display: flex;
	gap: 1em;
	align-items: center;
	margin-right: auto;
}

.filter-container {
	position: relative;
	display: inline-block;
	margin-left: 1em;
}

#search-icon {
	color: #777;
	position: absolute;
	height: 1em;
	top: .6em;
	left: .5em;
}

#filter {
	padding: .5em 1em .5em 2.5em;
	border: none;
	border: 1px solid #CCC;
	border-radius: 5px;
	font-family: inherit;
	position: relative;
	z-index: 2;
	background: none;
}

.layout,
.layout svg {
	color: #9a9a9a;
}

table {
	width: 100%;
	border-collapse: collapse;
}

tbody tr,
tbody tr a,
.entry a {
	transition: all .15s;
}

tbody tr:hover,
.grid .entry a:hover {
	background-color: #f4f9fd;
}

th,
td {
	text-align: left;
}

th {
	position: sticky;
	top: 0;
	background: white;
	white-space: nowrap;
	z-index: 2;
	text-transform: uppercase;
	font-size: 14px;
	letter-spacing: 1px;
	padding: .75em 0;
}

td {
	white-space: nowrap;
}

td:nth-child(2) {
	width: 75%;
}

td:nth-child(2) a {
	padding: 1em 0;
	display: block;
}

td:nth-child(3),
th:nth-child(3) {
	padding: 0 20px 0 20px;
	min-width: 150px;
}

td .go-up {
	text-transform: uppercase;
	font-size: 12px;
	font-weight: bold;
}

.name,
.go-up {
	word-break: break-all;
	overflow-wrap: break-word;
	white-space: pre-wrap;
}

.listing .icon-tabler {
	color: #454545;
}

.listing .icon-tabler-folder-filled {
	color: #ffb900 !important;
}

.sizebar {
	position: relative;
	padding: 0.25rem 0.5rem;
	display: flex;
}

.sizebar-bar {
	background-color: #dbeeff;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 0;
	height: 100%;
	pointer-events: none;
}

.sizebar-text {
	position: relative;
	z-index: 1;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(16em, 1fr));
	gap: 2px;
}

.grid .entry {
	position: relative;
	width: 100%;
}

.grid .entry a {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 1.5em;
	height: 100%;
}

.grid .entry svg {
	width: 75px;
	height: 75px;
}

.grid .entry img {
	max-height: 200px;
	object-fit: cover;
}

.grid .entry .name {
	margin-top: 1em;
}

footer {
	padding: 40px 20px;
	font-size: 12px;
	text-align: center;
}

.caddy-logo {
	display: inline-block;
	height: 2.5em;
	margin: 0 auto;
}

@media (max-width: 600px) {
	.hideable {
		display: none;
	}

	td:nth-child(2) {
		width: auto;
	}

	th:nth-child(3),
	td:nth-child(3) {
		padding-right: 5%;
		text-align: right;
	}

	h1 {
		color: #000;
	}

	h1 a {
		margin: 0;
	}

	#filter {
		max-width: 100px;
	}

	.grid .entry {
		max-width: initial;
	}
}


@media (prefers-color-scheme: dark) {
	html {
		background: black; /* overscroll */
	}

	body {
		background: linear-gradient(180deg, rgb(34 50 66) 0%, rgb(26 31 38) 100%);
		background-attachment: fixed;
	}

	body,
	a,
	svg,
	.layout.current,
	.layout.current svg,
	.go-up {
		color: #ccc;
	}

	h1 a,
	th a {
		color: white;
	}

	h1 {
		color: white;
	}

	h1 a:hover {
		background: hsl(213deg 100% 73% / 20%);
	}

	header,
	main,
	.grid .entry {
		background-color: #101720;
	}

	tbody tr:hover,
	.grid .entry a:hover {
		background-color: #162030;
		color: #fff;
	}

	th {
		background-color: #18212c;
	}

	td a,
	.listing .icon-tabler {
		color: #abc8e3;
	}

	td a:hover,
	td a:hover .icon-tabler {
		color: white;
	}

	td a:visited {
		color: #cd53cd;
	}

	td a:visited:hover {
		color: #f676f6;
	}

	#search-icon {
		color: #7798c4;
	}

	#filter {
		color: #ffffff;
		border: 1px solid #29435c;
	}

	.meta {
		border-bottom: 1px solid #222e3b;
	}

	.sizebar-bar {
		background-color: #1f3549;
	}

	.grid .entry a {
		background-color: #080b0f;
	}

	#Wordmark path,
	#R path {
		fill: #ccc !important;
	}
	#R circle {
		stroke: #ccc !important;
	}
}

</style>
{{- if eq .Layout "grid"}}
<style>.wrapper { max-width: none; } main { margin-top: 1px; }</style>
{{- end}}
</head>
<body>
	<header>
		<div class="wrapper">
			<div class="breadcrumbs">Folder Path</div>
				<h1>
					{{range $i, $crumb := .Breadcrumbs}}<a href="{{html $crumb.Link}}">{{html $crumb.Text}}</a>{{if ne $i 0}}/{{end}}{{end}}
				</h1>
			</div>
		</header>
		<div class="wrapper">
			<main>
				<div class="meta">
					<div id="summary">
						<span class="meta-item">
							<b>{{.NumDirs}}</b> director{{if eq 1 .NumDirs}}y{{else}}ies{{end}}
						</span>
						<span class="meta-item">
							<b>{{.NumFiles}}</b> file{{if ne 1 .NumFiles}}s{{end}}
						</span>
						{{- if ne 0 .Limit}}
						<span class="meta-item">
							(of which only <b>{{.Limit}}</b> are displayed)
						</span>
						{{- end}}
					</div>
				</div>
				<div class='listing{{if eq .Layout "grid"}} grid{{end}}'>
				{{- if eq .Layout "grid"}}
				{{- range .Items}}
				<div class="entry">
					<a href="{{html .URL}}" title='{{html (.HumanModTime "January 2, 2006 at 15:04:05")}}'>
						{{template "icon" .}}
						<div class="name">{{html .Name}}</div>
						<div class="size">{{.HumanSize}}</div>
					</a>
				</div>
				{{- end}}
				{{- else}}
				<table aria-describedby="summary">
					<thead>
					<tr>
						<th></th>
						<th>
							{{- if and (eq .Sort "namedirfirst") (ne .Order "desc")}}
							<a href="?sort=namedirfirst&order=desc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}" class="icon">
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-caret-up" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
									<path d="M18 14l-6 -6l-6 6h12"/>
								</svg>
							</a>
							{{- else if and (eq .Sort "namedirfirst") (ne .Order "asc")}}
							<a href="?sort=namedirfirst&order=asc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}" class="icon">
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-caret-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
									<path d="M6 10l6 6l6 -6h-12"/>
								</svg>
							</a>
							{{- else}}
							<a href="?sort=namedirfirst&order=asc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}" class="icon sort">
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-caret-up" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
									<path d="M18 14l-6 -6l-6 6h12"/>
								</svg>
							</a>
							{{- end}}
							
							{{- if and (eq .Sort "name") (ne .Order "desc")}}
							<a href="?sort=name&order=desc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}">
								Name
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-caret-up" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
									<path d="M18 14l-6 -6l-6 6h12"/>
								</svg>
							</a>
							{{- else if and (eq .Sort "name") (ne .Order "asc")}}
							<a href="?sort=name&order=asc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}">
								Name
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-caret-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
									<path d="M6 10l6 6l6 -6h-12"/>
								</svg>
							</a>
							{{- else}}
							<a href="?sort=name&order=asc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}">
								Name
							</a>
							{{- end}}
						</th>
						<th>
							{{- if and (eq .Sort "size") (ne .Order "desc")}}
							<a href="?sort=size&order=desc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}">
								Size
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-caret-up" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
									<path d="M18 14l-6 -6l-6 6h12"/>
								</svg>
							</a>
							{{- else if and (eq .Sort "size") (ne .Order "asc")}}
							<a href="?sort=size&order=asc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}">
								Size
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-caret-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
									<path d="M6 10l6 6l6 -6h-12"/>
								</svg>
							</a>
							{{- else}}
							<a href="?sort=size&order=asc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}">
								Size
							</a>
							{{- end}}
						</th>
						<th class="hideable">
							{{- if and (eq .Sort "time") (ne .Order "desc")}}
							<a href="?sort=time&order=desc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}">
								Modified
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-caret-up" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
									<path d="M18 14l-6 -6l-6 6h12"/>
								</svg>
							</a>
							{{- else if and (eq .Sort "time") (ne .Order "asc")}}
							<a href="?sort=time&order=asc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}">
								Modified
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-caret-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
									<path d="M6 10l6 6l6 -6h-12"/>
								</svg>
							</a>
							{{- else}}
							<a href="?sort=time&order=asc{{if ne 0 .Limit}}&limit={{.Limit}}{{end}}{{if ne 0 .Offset}}&offset={{.Offset}}{{end}}">
								Modified
							</a>
							{{- end}}
						</th>
						<th class="hideable"></th>
					</tr>
					</thead>
					<tbody>
					{{- if .CanGoUp}}
					<tr>
						<td></td>
						<td>
							<a href="..">
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-corner-left-up" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
									<path d="M18 18h-6a3 3 0 0 1 -3 -3v-10l-4 4m8 0l-4 -4"/>
								</svg>
								<span class="go-up">Up</span>
							</a>
						</td>
						<td></td>
						<td class="hideable"></td>
						<td class="hideable"></td>
					</tr>
					{{- end}}
					{{- range .Items}}
					<tr class="file">
						<td></td>
						<td>
							<a href="{{html .URL}}">
								{{template "icon" .}}
								<span class="name">{{html .Name}}</span>
							</a>
						</td>
						{{- if .IsDir}}
						<td>&mdash;</td>
						{{- else}}
						<td class="size" data-size="{{.Size}}">
							<div class="sizebar">
								<div class="sizebar-bar"></div>
								<div class="sizebar-text">
									{{.HumanSize}}
								</div>
							</div>
						</td>
						{{- end}}
						<td class="timestamp hideable">
							<time datetime="{{.HumanModTime "2006-01-02T15:04:05Z"}}">{{.HumanModTime "01/02/2006 03:04:05 PM -07:00"}}</time>
						</td>
						<td class="hideable"></td>
					</tr>
					{{- end}}
					</tbody>
				</table>
				{{- end}}
			</div>
			</main>
		</div>
		<footer>
			Served with
			<a rel="noopener noreferrer" href="https://caddyserver.com">
				<svg class="caddy-logo" viewBox="0 0 379 114" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;">
					<g transform="matrix(1,0,0,1,-1982.99,-530.985)">
						<g transform="matrix(1.16548,0,0,1.10195,1823.12,393.466)">
							<g transform="matrix(1,0,0,1,0.233052,1.17986)">
								<g id="Icon" transform="matrix(0.858013,0,0,0.907485,-3224.99,-1435.83)">
									<g>
										<g transform="matrix(-0.191794,-0.715786,0.715786,-0.191794,4329.14,4673.64)">
											<path d="M3901.56,610.734C3893.53,610.261 3886.06,608.1 3879.2,604.877C3872.24,601.608 3866.04,597.093 3860.8,591.633C3858.71,589.457 3856.76,587.149 3854.97,584.709C3853.2,582.281 3851.57,579.733 3850.13,577.066C3845.89,569.224 3843.21,560.381 3842.89,550.868C3842.57,543.321 3843.64,536.055 3845.94,529.307C3848.37,522.203 3852.08,515.696 3856.83,510.049L3855.79,509.095C3850.39,514.54 3846.02,520.981 3842.9,528.125C3839.84,535.125 3838.03,542.781 3837.68,550.868C3837.34,561.391 3839.51,571.425 3843.79,580.306C3845.27,583.38 3847.03,586.304 3849.01,589.049C3851.01,591.806 3853.24,594.39 3855.69,596.742C3861.75,602.568 3869,607.19 3877.03,610.1C3884.66,612.867 3892.96,614.059 3901.56,613.552L3901.56,610.734Z" style="fill:rgb(0,144,221);"/>
										</g>
										<g transform="matrix(-0.191794,-0.715786,0.715786,-0.191794,4329.14,4673.64)">
											<path d="M3875.69,496.573C3879.62,494.538 3883.8,492.897 3888.2,491.786C3892.49,490.704 3896.96,490.124 3901.56,490.032C3903.82,490.13 3906.03,490.332 3908.21,490.688C3917.13,492.147 3925.19,495.814 3932.31,500.683C3936.13,503.294 3939.59,506.335 3942.81,509.619C3947.09,513.98 3950.89,518.816 3953.85,524.232C3958.2,532.197 3960.96,541.186 3961.32,550.868C3961.61,558.748 3960.46,566.345 3957.88,573.322C3956.09,578.169 3953.7,582.753 3950.66,586.838C3947.22,591.461 3942.96,595.427 3938.27,598.769C3933.66,602.055 3928.53,604.619 3923.09,606.478C3922.37,606.721 3921.6,606.805 3920.93,607.167C3920.42,607.448 3920.14,607.854 3919.69,608.224L3920.37,610.389C3920.98,610.432 3921.47,610.573 3922.07,610.474C3922.86,610.344 3923.55,609.883 3924.28,609.566C3931.99,606.216 3938.82,601.355 3944.57,595.428C3947.02,592.903 3949.25,590.174 3951.31,587.319C3953.59,584.168 3955.66,580.853 3957.43,577.348C3961.47,569.34 3964.01,560.422 3964.36,550.868C3964.74,540.511 3962.66,530.628 3958.48,521.868C3955.57,515.775 3951.72,510.163 3946.95,505.478C3943.37,501.962 3939.26,498.99 3934.84,496.562C3926.88,492.192 3917.87,489.76 3908.37,489.229C3906.12,489.104 3903.86,489.054 3901.56,489.154C3896.87,489.06 3892.3,489.519 3887.89,490.397C3883.3,491.309 3878.89,492.683 3874.71,494.525L3875.69,496.573Z" style="fill:rgb(0,144,221);"/>
										</g>
									</g>
									<g>
										<g transform="matrix(-3.37109,-0.514565,0.514565,-3.37109,4078.07,1806.88)">
											<path d="M22,12C22,10.903 21.097,10 20,10C19.421,10 18.897,10.251 18.53,10.649C18.202,11.006 18,11.481 18,12C18,13.097 18.903,14 20,14C21.097,14 22,13.097 22,12Z" style="fill:none;fill-rule:nonzero;stroke:rgb(0,144,221);stroke-width:1.05px;"/>
										</g>
										<g transform="matrix(-5.33921,-5.26159,-3.12106,-6.96393,4073.87,1861.55)">
											<path d="M10.315,5.333C10.315,5.333 9.748,5.921 9.03,6.673C7.768,7.995 6.054,9.805 6.054,9.805L6.237,9.86C6.237,9.86 8.045,8.077 9.36,6.771C10.107,6.028 10.689,5.444 10.689,5.444L10.315,5.333Z" style="fill:rgb(0,144,221);"/>
										</g>
									</g>
									<g id="Padlock" transform="matrix(3.11426,0,0,3.11426,3938.31,1737.25)">
										<g>
											<path d="M9.876,21L18.162,21C18.625,21 19,20.625 19,20.162L19,11.838C19,11.375 18.625,11 18.162,11L5.838,11C5.375,11 5,11.375 5,11.838L5,16.758" style="fill:none;stroke:rgb(34,182,56);stroke-width:1.89px;stroke-linecap:butt;stroke-linejoin:miter;"/>
											<path d="M8,11L8,7C8,4.806 9.806,3 12,3C14.194,3 16,4.806 16,7L16,11" style="fill:none;fill-rule:nonzero;stroke:rgb(34,182,56);stroke-width:1.89px;"/>
										</g>
									</g>
									<g>
										<g transform="matrix(5.30977,0.697415,-0.697415,5.30977,3852.72,1727.97)">
											<path d="M22,12C22,11.659 21.913,11.337 21.76,11.055C21.421,10.429 20.756,10 20,10C18.903,10 18,10.903 18,12C18,13.097 18.903,14 20,14C21.097,14 22,13.097 22,12Z" style="fill:none;fill-rule:nonzero;stroke:rgb(0,144,221);stroke-width:0.98px;"/>
										</g>
										<g transform="matrix(4.93114,2.49604,1.11018,5.44847,3921.41,1726.72)">
											<path d="M8.902,6.77C8.902,6.77 7.235,8.253 6.027,9.366C5.343,9.996 4.819,10.502 4.819,10.502L5.52,11.164C5.52,11.164 6.021,10.637 6.646,9.951C7.749,8.739 9.219,7.068 9.219,7.068L8.902,6.77Z" style="fill:rgb(0,144,221);"/>
										</g>
									</g>
								</g>
								<g id="Text">
									<g id="Wordmark" transform="matrix(1.32271,0,0,2.60848,-899.259,-791.691)">
										<g id="y" transform="matrix(0.50291,0,0,0.281607,905.533,304.987)">
											<path d="M192.152,286.875L202.629,268.64C187.804,270.106 183.397,265.779 180.143,263.391C176.888,261.004 174.362,257.99 172.563,254.347C170.765,250.705 169.866,246.691 169.866,242.305L169.866,208.107L183.21,208.107L183.21,242.213C183.21,245.188 183.896,247.822 185.268,250.116C186.64,252.41 188.465,254.197 190.743,255.475C193.022,256.754 195.501,257.393 198.182,257.393C200.894,257.393 203.393,256.75 205.68,255.463C207.966,254.177 209.799,252.391 211.178,250.105C212.558,247.818 213.248,245.188 213.248,242.213L213.248,208.107L226.545,208.107L226.545,242.305C226.545,246.707 225.378,258.46 218.079,268.64C215.735,271.909 207.835,286.875 207.835,286.875L192.152,286.875Z" style="fill:rgb(47,47,47);fill-rule:nonzero;"/>
										</g>
										<g id="add" transform="matrix(0.525075,0,0,0.281607,801.871,304.987)">
											<g transform="matrix(116.242,0,0,116.242,161.846,267.39)">
												<path d="M0.276,0.012C0.227,0.012 0.186,0 0.15,-0.024C0.115,-0.048 0.088,-0.08 0.069,-0.12C0.05,-0.161 0.04,-0.205 0.04,-0.254C0.04,-0.305 0.051,-0.35 0.072,-0.39C0.094,-0.431 0.125,-0.463 0.165,-0.487C0.205,-0.51 0.254,-0.522 0.31,-0.522C0.366,-0.522 0.413,-0.51 0.452,-0.486C0.491,-0.463 0.521,-0.431 0.542,-0.39C0.562,-0.35 0.573,-0.305 0.573,-0.256L0.573,-0L0.458,-0L0.458,-0.095L0.456,-0.095C0.446,-0.076 0.433,-0.058 0.417,-0.042C0.401,-0.026 0.381,-0.013 0.358,-0.003C0.335,0.007 0.307,0.012 0.276,0.012ZM0.307,-0.086C0.337,-0.086 0.363,-0.093 0.386,-0.108C0.408,-0.123 0.426,-0.144 0.438,-0.17C0.45,-0.195 0.456,-0.224 0.456,-0.256C0.456,-0.288 0.45,-0.317 0.438,-0.342C0.426,-0.367 0.409,-0.387 0.387,-0.402C0.365,-0.417 0.338,-0.424 0.308,-0.424C0.276,-0.424 0.249,-0.417 0.226,-0.402C0.204,-0.387 0.186,-0.366 0.174,-0.341C0.162,-0.315 0.156,-0.287 0.156,-0.255C0.156,-0.224 0.162,-0.195 0.174,-0.169C0.186,-0.144 0.203,-0.123 0.226,-0.108C0.248,-0.093 0.275,-0.086 0.307,-0.086Z" style="fill:rgb(47,47,47);fill-rule:nonzero;"/>
											</g>
											<g transform="matrix(116.242,0,0,116.242,226.592,267.39)">
												<path d="M0.306,0.012C0.265,0.012 0.229,0.006 0.196,-0.008C0.163,-0.021 0.135,-0.039 0.112,-0.064C0.089,-0.088 0.071,-0.117 0.059,-0.151C0.046,-0.185 0.04,-0.222 0.04,-0.263C0.04,-0.315 0.051,-0.36 0.072,-0.399C0.093,-0.437 0.122,-0.468 0.159,-0.489C0.196,-0.511 0.239,-0.522 0.287,-0.522C0.311,-0.522 0.333,-0.518 0.355,-0.511C0.377,-0.504 0.396,-0.493 0.413,-0.48C0.431,-0.466 0.445,-0.451 0.455,-0.433L0.456,-0.433L0.456,-0.73L0.571,-0.73L0.571,-0.261C0.571,-0.205 0.56,-0.156 0.537,-0.115C0.515,-0.074 0.484,-0.043 0.444,-0.021C0.405,0.001 0.358,0.012 0.306,0.012ZM0.306,-0.086C0.335,-0.086 0.361,-0.093 0.384,-0.107C0.406,-0.122 0.423,-0.141 0.436,-0.167C0.448,-0.192 0.455,-0.221 0.455,-0.255C0.455,-0.288 0.448,-0.317 0.436,-0.343C0.423,-0.368 0.406,-0.388 0.383,-0.402C0.361,-0.417 0.335,-0.424 0.305,-0.424C0.276,-0.424 0.251,-0.417 0.228,-0.402C0.206,-0.387 0.188,-0.368 0.175,-0.342C0.163,-0.317 0.156,-0.288 0.156,-0.255C0.156,-0.222 0.163,-0.193 0.175,-0.167C0.188,-0.142 0.206,-0.122 0.229,-0.108C0.251,-0.093 0.277,-0.086 0.306,-0.086Z" style="fill:rgb(47,47,47);fill-rule:nonzero;"/>
											</g>
											<g transform="matrix(116.242,0,0,116.242,290.293,267.39)">
												<path d="M0.306,0.012C0.265,0.012 0.229,0.006 0.196,-0.008C0.163,-0.021 0.135,-0.039 0.112,-0.064C0.089,-0.088 0.071,-0.117 0.059,-0.151C0.046,-0.185 0.04,-0.222 0.04,-0.263C0.04,-0.315 0.051,-0.36 0.072,-0.399C0.093,-0.437 0.122,-0.468 0.159,-0.489C0.196,-0.511 0.239,-0.522 0.287,-0.522C0.311,-0.522 0.333,-0.518 0.355,-0.511C0.377,-0.504 0.396,-0.493 0.413,-0.48C0.431,-0.466 0.445,-0.451 0.455,-0.433L0.456,-0.433L0.456,-0.73L0.571,-0.73L0.571,-0.261C0.571,-0.205 0.56,-0.156 0.537,-0.115C0.515,-0.074 0.484,-0.043 0.444,-0.021C0.405,0.001 0.358,0.012 0.306,0.012ZM0.306,-0.086C0.335,-0.086 0.361,-0.093 0.384,-0.107C0.406,-0.122 0.423,-0.141 0.436,-0.167C0.448,-0.192 0.455,-0.221 0.455,-0.255C0.455,-0.288 0.448,-0.317 0.436,-0.343C0.423,-0.368 0.406,-0.388 0.383,-0.402C0.361,-0.417 0.335,-0.424 0.305,-0.424C0.276,-0.424 0.251,-0.417 0.228,-0.402C0.206,-0.387 0.188,-0.368 0.175,-0.342C0.163,-0.317 0.156,-0.288 0.156,-0.255C0.156,-0.222 0.163,-0.193 0.175,-0.167C0.188,-0.142 0.206,-0.122 0.229,-0.108C0.251,-0.093 0.277,-0.086 0.306,-0.086Z" style="fill:rgb(47,47,47);fill-rule:nonzero;"/>
											</g>
										</g>
										<g id="c" transform="matrix(-0.0716462,0.31304,-0.583685,-0.0384251,1489.76,-444.051)">
											<path d="M2668.11,700.4C2666.79,703.699 2666.12,707.216 2666.12,710.766C2666.12,726.268 2678.71,738.854 2694.21,738.854C2709.71,738.854 2722.3,726.268 2722.3,710.766C2722.3,704.111 2719.93,697.672 2715.63,692.597L2707.63,699.378C2710.33,702.559 2711.57,706.602 2711.81,710.766C2712.2,717.38 2706.61,724.52 2697.27,726.637C2683.9,728.581 2676.61,720.482 2676.61,710.766C2676.61,708.541 2677.03,706.336 2677.85,704.269L2668.11,700.4Z" style="fill:rgb(46,46,46);"/>
										</g>
									</g>
									<g id="R" transform="matrix(0.426446,0,0,0.451034,-1192.44,-722.167)">
										<g transform="matrix(1,0,0,1,-0.10786,0.450801)">
											<g transform="matrix(12.1247,0,0,12.1247,3862.61,1929.9)">
												<path d="M0.073,-0L0.073,-0.7L0.383,-0.7C0.428,-0.7 0.469,-0.69 0.506,-0.67C0.543,-0.651 0.572,-0.623 0.594,-0.588C0.616,-0.553 0.627,-0.512 0.627,-0.465C0.627,-0.418 0.615,-0.377 0.592,-0.342C0.569,-0.306 0.539,-0.279 0.501,-0.259L0.57,-0.128C0.574,-0.12 0.579,-0.115 0.584,-0.111C0.59,-0.107 0.596,-0.106 0.605,-0.106L0.664,-0.106L0.664,-0L0.587,-0C0.56,-0 0.535,-0.007 0.514,-0.02C0.493,-0.034 0.476,-0.052 0.463,-0.075L0.381,-0.232C0.375,-0.231 0.368,-0.231 0.361,-0.231C0.354,-0.231 0.347,-0.231 0.34,-0.231L0.192,-0.231L0.192,-0L0.073,-0ZM0.192,-0.336L0.368,-0.336C0.394,-0.336 0.417,-0.341 0.438,-0.351C0.459,-0.361 0.476,-0.376 0.489,-0.396C0.501,-0.415 0.507,-0.438 0.507,-0.465C0.507,-0.492 0.501,-0.516 0.488,-0.535C0.475,-0.554 0.459,-0.569 0.438,-0.579C0.417,-0.59 0.394,-0.595 0.369,-0.595L0.192,-0.595L0.192,-0.336Z" style="fill:rgb(46,46,46);fill-rule:nonzero;"/>
											</g>
										</g>
										<g transform="matrix(1,0,0,1,0.278569,0.101881)">
											<circle cx="3866.43" cy="1926.14" r="8.923" style="fill:none;stroke:rgb(46,46,46);stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;"/>
										</g>
									</g>
								</g>
							</g>
						</g>
					</g>
				</svg>
			</a>
		</footer>
	</body>
</html>
