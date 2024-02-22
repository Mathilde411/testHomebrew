cmake_minimum_required(VERSION 3.13)
include_guard(GLOBAL)

function(__dkp_target_derive_name outvar target suffix)
	get_target_property(dir ${target} BINARY_DIR)
	get_target_property(outname ${target} OUTPUT_NAME)
	if(NOT outname)
		set(outname "${target}")
	endif()

	set(${outvar} "${dir}/${outname}${suffix}" PARENT_SCOPE)
endfunction()

function(__dkp_asm_lang outvar func)
	get_property(languages GLOBAL PROPERTY ENABLED_LANGUAGES)
	if("ASM" IN_LIST languages)
		set(${outvar} ASM PARENT_SCOPE)
	elseif("C" IN_LIST languages)
		set(${outvar} C PARENT_SCOPE)
	else()
		message(FATAL_ERROR "${func}: the ASM language is currently disabled, enable it in project() or with enable_language()")
	endif()
endfunction()
