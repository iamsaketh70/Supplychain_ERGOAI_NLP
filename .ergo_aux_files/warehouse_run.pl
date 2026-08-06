
:-(compiler_options([xpp_on,canonical])).

/********** Tabling and Trailer Control Variables ************/

#define EQUALITYnone
#define INHERITANCEflogic
#define TABLINGreactive
#define TABLINGvariant
#define CUSTOMnone

#define FLORA_INCREMENTAL_TABLING 

/************************************************************************
  file: headerinc/flrheader_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).
#mode standard Prolog

#include "flrheader.flh"
#include "flora_porting.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrheader_prog_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).
#mode standard Prolog

#include "flrheader_prog.flh"

/***********************************************************************/

#define FLORA_COMPILATION_ID 2

/************************************************************************
  file: headerinc/flrheader2_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
  It has files that must be included in the header and typically
  contain some Prolog statements. Such files cannot appear
  in flrheader.flh because flrheader.flh is included in various restricted
  contexts where Prolog statements are not allowed.

  NOT included in ADDED files (compiled for addition) -- only in LOADED
  ones and in trailers/patch
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

%% flora_tabling_methods is included here to affect preprocessing of
%% flrtable/flrhilogtable.flh dynamically
#include "flora_tabling_methods.flh"

/* note: inside flrtable.flh there are checks for FLORA_NONTABLED_DATA_MODULE
   that exclude tabling non-signature molecules
*/
#ifndef FLORA_NONTABLED_MODULE
#include "flrtable.flh"
#endif

/* if normal tabled module, then table hilog */
#if !defined(FLORA_NONTABLED_DATA_MODULE) && !defined(FLORA_NONTABLED_MODULE)
#include "flrhilogtable.flh"
#endif

#include "flrtable_always.flh"

#include "flrauxtables.flh"

%% include list of tabled predicates
#mode save
#mode nocomment "%"
#if defined(FLORA_FLT_FILENAME)
#include FLORA_FLT_FILENAME
#endif
#mode restore

/***********************************************************************/

/************************************************************************
  file: headerinc/flrdyna_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

#include "flrdyndeclare.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrindex_P_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrindex_P.flh"

/***********************************************************************/

#mode save
#mode nocomment "%"
#define FLORA_THIS_FILENAME  'warehouse_run.ergo'
#mode restore
/************************************************************************
  file: headerinc/flrdefinition_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrdefinition.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrtrailerregistry_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrtrailerregistry.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrrefreshtable_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrrefreshtable.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrdynamic_connectors_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrdynamic_connectors.flh"

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrimportedcalls_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

%% Loads the file with all the import statements for predicates
%% that must be known everywhere

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBIMPORTEDCALLS))).

/***********************************************************************/

/************************************************************************
  file: headerinc/flrpatch_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrexportcheck.flh"
#include "flrpatch.flh"
/***********************************************************************/

/************************************************************************
  file: headerinc/flropposes_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flropposes.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrhead_dispatch_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrhead_dispatch.flh"

/***********************************************************************/

/************************************************************************
  file: syslibinc/flranswer_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBANSWER))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flraggcount_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCOUNT))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrdbop_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBDBOP))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrcontrol_inc.flh

  Author(s): Michael Kifer
	     Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCONTROL))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrcontrol_inc.flh

  Author(s): Michael Kifer
	     Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCONTROL))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrdbop_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBDBOP))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrclause_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCLAUSE))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flraggmax_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBMAX))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrmetaops_inh.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif


?-(:(flrlibman,flora_load_library(FLLIBMETAOPS))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrcontrol_inc.flh

  Author(s): Michael Kifer
	     Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCONTROL))).

/***********************************************************************/

/************************************************************************
  file: libinc/flrio_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(':'(flrlibman,flora_load_system_module(FLSYSMODIO))).

/***********************************************************************/

 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'warehouse_run.fdb'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FDB_FILENAME,FLORA_THIS_MODULE_NAME,'fdb'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FDB_FILENAME,FLORA_THIS_FDB_STORAGE))).
#endif

 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'warehouse_run.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(warehouse_run,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'warehouse_run.fld'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLD_FILENAME,FLORA_THIS_MODULE_NAME,'fld'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FLD_FILENAME,FLORA_THIS_FLD_STORAGE))).
#endif

 
#if !defined(FLORA_FLS_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS_FILENAME  'warehouse_run.fls'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS_FILENAME,FLORA_THIS_MODULE_NAME,'fls'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rules %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-(FLORA_THIS_WORKSPACE(static^tblflapply)(robot_at,__Robot,__X,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(robot_is_loaded,__Robot,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),\==(__Shelf,none))),fllibexecute_delayed_calls([__Robot,__Shelf],[__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(robot_is_unloaded,__Robot,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,none,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20285,[__NX,+(__X,__DX)]),fllibdelayedliteral('\\is','warehouse_run.ergo',20286,[__NY,+(__Y,__DY)]))),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Robot,__X,__Y],[__DX,__DY,__NX,__NY,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(within_grid,__X,__Y,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(grid_cell,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(move_blocked,grid_boundary,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(14,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(within_grid,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,14)),fllibexecute_delayed_calls([__NX,__NY],[]))),[__NX,__NY],20294,'warehouse_run.ergo')))),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Robot],[__DX,__DY,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(move_blocked,robot_collision,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(16,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Other,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,16)),\==(__Other,__Robot)))),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Other,__Robot],[__DX,__DY,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(move_blocked,position_swap,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(18,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Other,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,18)),','(\==(__Other,__Robot),FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Other,___DX2,___DY2,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,18))))))),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Other,__Robot,__X,__Y,___DX2,___DY2],[__DX,__DY,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(move_blocked,loaded_under_shelf,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(20,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_loaded,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,20)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__OtherShelf,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,20)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__CarriedShelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,20)),\==(__OtherShelf,__CarriedShelf))))),fllibexecute_delayed_calls([__CarriedShelf,__DX,__DY,__NX,__NY,__OtherShelf,__Robot],[__DX,__DY,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(move_blocked,unloaded_at_picking,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(22,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_unloaded,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22)),FLORA_THIS_WORKSPACE(d^tblflapply)(is_picking_station,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,22)))),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Robot],[__DX,__DY,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(can_move,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(24,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(within_grid,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,24)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(move_blocked,___Reason,__Robot,__DX,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,24)),fllibexecute_delayed_calls([__DX,__DY,__Robot,___Reason],[]))),[___Reason,__Robot,__DX,__DY],20331,'warehouse_run.ergo'))))),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Robot,___Reason],[__DX,__DY,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(move,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(26,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(can_move,__Robot,__DX,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__OldX,__OldY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,26)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,26)),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_position,__Robot,__OldX,__OldY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_position,__Robot,__NX,__NY,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar7,__newcontextvar8)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibifthen(FLORA_THIS_MODULE_NAME,','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,26)),\==(__Shelf,none)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__Shelf,__ShX,__ShY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,26)),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(shelf_position,__Shelf,__ShX,__ShY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar11)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(shelf_position,__Shelf,__NX,__NY,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar13,__newcontextvar14)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]))),20340,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'ACTION: Robot %S moved from (%S,%S) to (%S,%S)
',flapply(args,__Robot,__OldX,__OldY,__NX,__NY),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,26)))))))),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__OldX,__OldY,__Robot,__ShX,__ShY,__Shelf],[__DX,__DY,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(try_move,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(28,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(can_move,__Robot,__DX,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28)),FLORA_THIS_WORKSPACE(d^nontblflapply)(move,__Robot,__DX,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,28)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(move_blocked,__Reason,__Robot,__DX,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,28)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'BLOCKED: Robot %S move (%S,%S) denied - %S
',flapply(args,__Robot,__DX,__DY,__Reason),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,28))),20351,'warehouse_run.ergo'),fllibexecute_delayed_calls([__DX,__DY,__Reason,__Robot],[__DX,__DY,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(can_pickup,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(30,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,30)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,30)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__Shelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,30)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,none,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,30)))))),fllibexecute_delayed_calls([__Robot,__Shelf,__X,__Y],[__Robot,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(pickup_blocked,already_carrying,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(32,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,32)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_loaded,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,32)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(pickup_blocked,not_at_shelf,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(34,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__RX,__RY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__Shelf,__SX,__SY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,34)),';'(\==(__RX,__SX),\==(__RY,__SY)))))),fllibexecute_delayed_calls([__RX,__RY,__Robot,__SX,__SY,__Shelf],[__Robot,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(pickup,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(36,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(can_pickup,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,36)),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_carries,__Robot,none,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar5,__newcontextvar6)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'ACTION: Robot %S picked up %S
',flapply(args,__Robot,__Shelf),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,36))))))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(try_pickup,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(38,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(can_pickup,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,38)),FLORA_THIS_WORKSPACE(d^nontblflapply)(pickup,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,38)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(pickup_blocked,__Reason,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,38)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'BLOCKED: Robot %S pickup of %S denied - %S
',flapply(args,__Robot,__Shelf,__Reason),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,38))),20391,'warehouse_run.ergo'),fllibexecute_delayed_calls([__Reason,__Robot,__Shelf],[__Robot,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(can_putdown,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(40,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,40)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,40)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,40)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,40)),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(is_highway,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,40)),fllibexecute_delayed_calls([__X,__Y],[]))),[__X,__Y],20405,'warehouse_run.ergo')),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_shelf_at,__Shelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,40)),fllibexecute_delayed_calls([__Shelf,__X,__Y],[]))),[__Shelf,__X,__Y],20406,'warehouse_run.ergo'))))))),fllibexecute_delayed_calls([__Robot,__Shelf,__X,__Y],[__Robot,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(other_shelf_at,__Shelf,__X,__Y,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(42,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__OtherShelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,42)),\==(__OtherShelf,__Shelf)),fllibexecute_delayed_calls([__OtherShelf,__Shelf,__X,__Y],[__Shelf,__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(putdown_blocked,not_carrying,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(44,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,44)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,44)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Carried,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,44)),\==(__Carried,__Shelf)))),fllibexecute_delayed_calls([__Carried,__Robot,__Shelf],[__Robot,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(putdown_blocked,on_highway,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(46,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,46)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,46)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,46)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,46)),FLORA_THIS_WORKSPACE(d^tblflapply)(is_highway,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,46)))))),fllibexecute_delayed_calls([__Robot,__Shelf,__X,__Y],[__Robot,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(putdown_blocked,shelf_occupied,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,48,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(48,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,48)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,48)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,48)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,48)),FLORA_THIS_WORKSPACE(d^tblflapply)(other_shelf_at,__Shelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,48)))))),fllibexecute_delayed_calls([__Robot,__Shelf,__X,__Y],[__Robot,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(putdown,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,50,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(50,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(can_putdown,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,50)),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_carries,__Robot,none,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar5,__newcontextvar6)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'ACTION: Robot %S put down %S
',flapply(args,__Robot,__Shelf),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,50))))))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(try_putdown,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,52,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(52,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(can_putdown,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,52)),FLORA_THIS_WORKSPACE(d^nontblflapply)(putdown,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,52)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(putdown_blocked,__Reason,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,52)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'BLOCKED: Robot %S putdown of %S denied - %S
',flapply(args,__Robot,__Shelf,__Reason),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,52))),20439,'warehouse_run.ergo'),fllibexecute_delayed_calls([__Reason,__Robot,__Shelf],[__Robot,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(remaining_need,__Order,__Product,__Need,'_$ctxt'(_CallerModuleVar,54,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(54,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(order_line,__Order,__Product,__Ordered,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,54)),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(delivered,__Order,__Product,__Del,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,54)),fllibdelayedliteral('\\is','warehouse_run.ergo',20456,[__Need,-(__Ordered,__Del)]),fllibdelayedliteral('\\is','warehouse_run.ergo',20457,[__Need,__Ordered]),20455,'warehouse_run.ergo'),fllibdelayedliteral(>,'warehouse_run.ergo',20458,[__Need,0]))),fllibexecute_delayed_calls([__Del,__Need,__Order,__Ordered,__Product],[__Need,__Order,__Product])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(can_deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(_CallerModuleVar,56,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(56,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(is_picking_station,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,56)),','(\==(__Shelf,none),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Product,__Available,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,56)),','(fllibdelayedliteral(>=,'warehouse_run.ergo',20469,[__Available,__Qty]),','(fllibdelayedliteral(>,'warehouse_run.ergo',20470,[__Qty,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,__Product,__Need,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,56)),fllibdelayedliteral(>=,'warehouse_run.ergo',20472,[__Need,__Qty]))))))))))),fllibexecute_delayed_calls([__Available,__Need,__Order,__Product,__Qty,__Robot,__Shelf,__X,__Y],[__Order,__Product,__Qty,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(deliver_blocked,not_at_picking_station,__Robot,___Product,___Qty,__Order,'_$ctxt'(_CallerModuleVar,58,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(58,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,58)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,58)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,58)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(is_picking_station,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,58)),fllibexecute_delayed_calls([__X,__Y],[]))),[__X,__Y],20478,'warehouse_run.ergo'))))),fllibexecute_delayed_calls([__Order,__Robot,__X,__Y],[__Order,__Robot,___Product,___Qty])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(deliver_blocked,not_carrying_shelf,__Robot,___Product,___Qty,__Order,'_$ctxt'(_CallerModuleVar,60,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(60,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,60)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,60)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,none,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,60)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(deliver_blocked,product_not_on_shelf,__Robot,__Product,___Qty,__Order,'_$ctxt'(_CallerModuleVar,62,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(62,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,62)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,62)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,62)),','(\==(__Shelf,none),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Product,___Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,62)),fllibexecute_delayed_calls([__Product,__Shelf,___Q],[]))),[__Shelf,__Product,___Q],20490,'warehouse_run.ergo')))))),fllibexecute_delayed_calls([__Order,__Product,__Robot,__Shelf,___Q],[__Order,__Product,__Robot,___Qty])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(deliver_blocked,insufficient_stock,__Robot,__Product,__Qty,__Order,'_$ctxt'(_CallerModuleVar,64,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(64,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,64)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,64)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,64)),','(\==(__Shelf,none),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Product,__Available,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,64)),fllibdelayedliteral(<,'warehouse_run.ergo',20498,[__Available,__Qty])))))),fllibexecute_delayed_calls([__Available,__Order,__Product,__Qty,__Robot,__Shelf],[__Order,__Product,__Qty,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(deliver_blocked,exceeds_order_need,__Robot,__Product,__Qty,__Order,'_$ctxt'(_CallerModuleVar,66,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(66,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,66)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,66)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,__Product,__Need,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,66)),fllibdelayedliteral(>,'warehouse_run.ergo',20504,[__Qty,__Need])))),fllibexecute_delayed_calls([__Need,__Order,__Product,__Qty,__Robot],[__Order,__Product,__Qty,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(deliver_blocked,wrong_product,__Robot,__Product,___Qty,__Order,'_$ctxt'(_CallerModuleVar,68,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(68,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,68)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,68)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(order_line,__Order,__Product,___Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,68)),fllibexecute_delayed_calls([__Order,__Product,___Q],[]))),[__Order,__Product,___Q],20509,'warehouse_run.ergo')))),fllibexecute_delayed_calls([__Order,__Product,__Robot,___Q],[__Order,__Product,__Robot,___Qty])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(_CallerModuleVar,70,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(70,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(can_deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,70)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,70)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Product,__OldStock,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,70)),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20516,[__NewStock,-(__OldStock,__Qty)]),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(shelf_stock,__Shelf,__Product,__OldStock,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(shelf_stock,__Shelf,__Product,__NewStock,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar7,__newcontextvar8)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(delivered,__Order,__Product,__OldDel,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,70)),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20521,[__NewDel,+(__OldDel,__Qty)]),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(delivered,__Order,__Product,__OldDel,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar10)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(delivered,__Order,__Product,__NewDel,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar12,__newcontextvar13)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]))),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(delivered,__Order,__Product,__Qty,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar14,__newcontextvar15)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),20519,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'ACTION: Robot %S delivered %S x%S for %S from %S
',flapply(args,__Robot,__Product,__Qty,__Order,__Shelf),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,70))))))))),fllibexecute_delayed_calls([__NewDel,__NewStock,__OldDel,__OldStock,__Order,__Product,__Qty,__Robot,__Shelf],[__Order,__Product,__Qty,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(try_deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(_CallerModuleVar,72,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(72,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(can_deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,72)),FLORA_THIS_WORKSPACE(d^nontblflapply)(deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,72)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(deliver_blocked,__Reason,__Robot,__Product,__Qty,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,72)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'BLOCKED: Delivery of %S x%S for %S denied - %S
',flapply(args,__Product,__Qty,__Order,__Reason),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,72))),20530,'warehouse_run.ergo'),fllibexecute_delayed_calls([__Order,__Product,__Qty,__Reason,__Robot],[__Order,__Product,__Qty,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(state_violation,shelf_on_highway,__Shelf,__X,__Y,'_$ctxt'(_CallerModuleVar,74,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(74,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,74)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__Shelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,74)),FLORA_THIS_WORKSPACE(d^tblflapply)(is_highway,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,74)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(state_violation,robot_collision,__R1,__R2,__X,__Y,'_$ctxt'(_CallerModuleVar,76,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(76,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__R1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,76)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__R2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,76)),','(@<(__R1,__R2),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__R1,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,76)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__R2,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,76)))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(state_violation,shelf_collision,__S1,__S2,__X,__Y,'_$ctxt'(_CallerModuleVar,78,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(78,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__S1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,78)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__S2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,78)),','(@<(__S1,__S2),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__S1,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,78)),FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__S2,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,78)))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(state_violation,race_condition,__Robot,'_$ctxt'(_CallerModuleVar,80,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(80,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,80)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_in_transit,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,80))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(shelf_follows_robot,__Robot,__Shelf,__X,__Y,'_$ctxt'(_CallerModuleVar,82,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(82,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,82)),','(\==(__Shelf,none),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,82)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alert,hazmat_reaction,__Item1,__Item2,__Shelf,'_$ctxt'(_CallerModuleVar,84,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(84,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item1,oxidizer,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,84)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item2,flammable,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,84)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item1,__Q1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,84)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20585,[__Q1,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item2,__Q2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,84)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20586,[__Q2,0]),@<(__Item1,__Item2))))))),fllibexecute_delayed_calls([__Item1,__Item2,__Q1,__Q2,__Shelf],[__Item1,__Item2,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alert,spoilage_risk,__Item,__Shelf,__Zone,'_$ctxt'(_CallerModuleVar,86,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(86,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item,frozen,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,86)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,86)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20592,[__Q,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__Shelf,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,86)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(zone_type,__Zone,__ZType,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,86)),\==(__ZType,freezer)))))),fllibexecute_delayed_calls([__Item,__Q,__Shelf,__ZType,__Zone],[__Item,__Shelf,__Zone])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alert,heavy_fall_risk,__Item,__Shelf,__Level,'_$ctxt'(_CallerModuleVar,88,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(88,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item,heavy,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,88)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,88)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20600,[__Q,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_level,__Shelf,__Level,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,88)),fllibdelayedliteral(>,'warehouse_run.ergo',20602,[__Level,5]))))),fllibexecute_delayed_calls([__Item,__Level,__Q,__Shelf],[__Item,__Level,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alert,humidity_damage,__Item,__Shelf,__Zone,'_$ctxt'(_CallerModuleVar,90,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(90,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item,paper_goods,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,90)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,90)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20607,[__Q,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__Shelf,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,90)),FLORA_THIS_WORKSPACE(d^tblflapply)(zone_humidity,__Zone,high,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,90)))))),fllibexecute_delayed_calls([__Item,__Q,__Shelf,__Zone],[__Item,__Shelf,__Zone])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alert,robot_collision,__R1,__R2,flapply(loc,__X,__Y),'_$ctxt'(_CallerModuleVar,92,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(92,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(state_violation,robot_collision,__R1,__R2,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,92)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alert,highway_block,__Shelf,__X,__Y,'_$ctxt'(_CallerModuleVar,94,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(94,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(state_violation,shelf_on_highway,__Shelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,94)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alert,protocol_error,__Robot,__X,__Y,'_$ctxt'(_CallerModuleVar,96,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(96,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,96)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_unloaded,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,96)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,96)),FLORA_THIS_WORKSPACE(d^tblflapply)(is_picking_station,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,96))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alert,unsafe_movement,__Robot,__OtherShelf,flapply(loc,__X,__Y),'_$ctxt'(_CallerModuleVar,98,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(98,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,98)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_loaded,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,98)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,98)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Carried,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,98)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__OtherShelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,98)),\==(__OtherShelf,__Carried)))))),fllibexecute_delayed_calls([__Carried,__OtherShelf,__Robot,__X,__Y],[__OtherShelf,__Robot,__X,__Y])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alert,fragile_risk,__Item,__Shelf,__Level,'_$ctxt'(_CallerModuleVar,100,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(100,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item,fragile,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,100)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,100)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20638,[__Q,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_level,__Shelf,__Level,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,100)),fllibdelayedliteral(>,'warehouse_run.ergo',20640,[__Level,5]))))),fllibexecute_delayed_calls([__Item,__Level,__Q,__Shelf],[__Item,__Level,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alert,electronic_in_freezer,__Item,__Shelf,__Zone,'_$ctxt'(_CallerModuleVar,102,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(102,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item,electronic,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,102)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,102)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20645,[__Q,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__Shelf,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,102)),FLORA_THIS_WORKSPACE(d^tblflapply)(zone_type,__Zone,freezer,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,102)))))),fllibexecute_delayed_calls([__Item,__Q,__Shelf,__Zone],[__Item,__Shelf,__Zone])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(item_in_zone,__Item,__Zone,'_$ctxt'(_CallerModuleVar,104,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(104,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,104)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20656,[__Q,0]),FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__Shelf,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,104)))),fllibexecute_delayed_calls([__Item,__Q,__Shelf,__Zone],[__Item,__Zone])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(item_on_shelf,__Item,__Shelf,'_$ctxt'(_CallerModuleVar,106,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(106,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,106)),fllibdelayedliteral(>,'warehouse_run.ergo',20661,[__Q,0])),fllibexecute_delayed_calls([__Item,__Q,__Shelf],[__Item,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ml_colocation_alert,__Item1,__Zone1,__Item2,__Zone2,'_$ctxt'(_CallerModuleVar,108,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(108,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(frequently_bought_together,__Item1,__Item2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,108)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Item1,__Zone1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,108)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Item2,__Zone2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,108)),\==(__Zone1,__Zone2)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ml_recommend_move,__Item,__CurrentZone,__BetterZone,'_$ctxt'(_CallerModuleVar,110,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(110,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Item,__CurrentZone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,110)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(zone,__BetterZone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,110)),','(\==(__BetterZone,__CurrentZone),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ml_partner_count_in_zone,__Item,__BetterZone,__BetterCount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,110)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ml_partner_count_in_zone,__Item,__CurrentZone,__CurrentCount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,110)),fllibdelayedliteral(>,'warehouse_run.ergo',20677,[__BetterCount,__CurrentCount])))))),fllibexecute_delayed_calls([__BetterCount,__BetterZone,__CurrentCount,__CurrentZone,__Item],[__BetterZone,__CurrentZone,__Item])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ml_partner_count_in_zone,__Item,__Zone,__Count,'_$ctxt'(_CallerModuleVar,112,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(112,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(fllibcount(__newdontcarevar4,[],[],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(frequently_bought_together,__Item,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,112)),FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__newdontcarevar4,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,112))),fllibexecute_delayed_calls([__Item,__newdontcarevar4,__Zone],[])),__newvar5),=(__Count,__newvar5)),fllibdelayedliteral(>,'warehouse_run.ergo',20684,[__Count,0])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(optimal_zone_for,__Item,__BestZone,__MaxCount,'_$ctxt'(_CallerModuleVar,114,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(114,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Item,___AnyZone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,114)),','(','(fllibmax(__newdontcarevar4,[],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)(ml_partner_count_in_zone,__Item,___Z,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,114)),fllibexecute_delayed_calls([__newdontcarevar4,__Item,___Z],[])),__newvar5),=(__MaxCount,__newvar5)),FLORA_THIS_WORKSPACE(d^tblflapply)(ml_partner_count_in_zone,__Item,__BestZone,__MaxCount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,114)))),fllibexecute_delayed_calls([__BestZone,__Item,__MaxCount,___AnyZone,___Z],[__BestZone,__Item,__MaxCount])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(order_zone_count,__Order,__ZoneCount,'_$ctxt'(_CallerModuleVar,116,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(116,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,116)),','(fllibcount(__newdontcarevar5,[],[],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(order_line,__Order,__Product,___Qty,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,116)),FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Product,__newdontcarevar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,116))),fllibexecute_delayed_calls([__Order,__Product,__newdontcarevar5,___Qty],[])),__newvar6),=(__ZoneCount,__newvar6))),fllibexecute_delayed_calls([__Order,__Product,__ZoneCount,___Qty],[__Order,__ZoneCount])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ml_distance_alert,__Item1,__Item2,__Dist,'_$ctxt'(_CallerModuleVar,118,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(118,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(frequently_bought_together,__Item1,__Item2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_on_shelf,__Item1,__S1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_on_shelf,__Item2,__S2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__S1,__X1,__Y1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__S2,__X2,__Y2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,118)),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20709,[__DX,abs(-(__X1,__X2))]),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20710,[__DY,abs(-(__Y1,__Y2))]),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20711,[__Dist,+(__DX,__DY)]),fllibdelayedliteral(>,'warehouse_run.ergo',20712,[__Dist,4]))))))))),fllibexecute_delayed_calls([__DX,__DY,__Dist,__Item1,__Item2,__S1,__S2,__X1,__X2,__Y1,__Y2],[__Dist,__Item1,__Item2])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(order_status,__Order,fulfilled,'_$ctxt'(_CallerModuleVar,120,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(120,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,120)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(has_remaining_need,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,120)),fllibexecute_delayed_calls([__Order],[]))),[__Order],20722,'warehouse_run.ergo'))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(order_status,__Order,in_progress,'_$ctxt'(_CallerModuleVar,122,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(122,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,122)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(has_remaining_need,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,122)),FLORA_THIS_WORKSPACE(d^tblflapply)(has_some_delivery,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,122)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(order_status,__Order,pending,'_$ctxt'(_CallerModuleVar,124,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(124,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,124)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(has_remaining_need,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,124)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(has_some_delivery,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,124)),fllibexecute_delayed_calls([__Order],[]))),[__Order],20732,'warehouse_run.ergo')))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(has_remaining_need,__Order,'_$ctxt'(_CallerModuleVar,126,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(126,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,___P,__Need,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,126)),fllibdelayedliteral(>,'warehouse_run.ergo',20736,[__Need,0])),fllibexecute_delayed_calls([__Need,__Order,___P],[__Order])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(has_some_delivery,__Order,'_$ctxt'(_CallerModuleVar,128,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(128,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(delivered,__Order,___P,__Qty,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,128)),fllibdelayedliteral(>,'warehouse_run.ergo',20740,[__Qty,0])),fllibexecute_delayed_calls([__Order,__Qty,___P],[__Order])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(shelf_for_order_product,__Order,__Product,__Shelf,__Available,'_$ctxt'(_CallerModuleVar,130,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(130,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,__Product,___Need,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,130)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Product,__Available,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,130)),fllibdelayedliteral(>,'warehouse_run.ergo',20746,[__Available,0]))),fllibexecute_delayed_calls([__Available,__Order,__Product,__Shelf,___Need],[__Available,__Order,__Product,__Shelf])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(move_toward,__Robot,__TX,__TY,'_$ctxt'(_CallerModuleVar,132,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(132,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__CX,__CY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,132)),fllibifthenelse(FLORA_THIS_MODULE_NAME,\==(__CX,__TX),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,fllibdelayedliteral(<,'warehouse_run.ergo',20753,[__CX,__TX]),=(__DX,1),=(__DX,-1),20753,'warehouse_run.ergo'),FLORA_THIS_WORKSPACE(d^nontblflapply)(try_move,__Robot,__DX,0,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,132))),fllibifthenelse(FLORA_THIS_MODULE_NAME,\==(__CY,__TY),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,fllibdelayedliteral(<,'warehouse_run.ergo',20759,[__CY,__TY]),=(__DY,1),=(__DY,-1),20759,'warehouse_run.ergo'),FLORA_THIS_WORKSPACE(d^nontblflapply)(try_move,__Robot,0,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,132))),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'NAV: Robot %S already at (%S,%S)
',flapply(args,__Robot,__TX,__TY),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,132)),20757,'warehouse_run.ergo'),20751,'warehouse_run.ergo')),fllibexecute_delayed_calls([__CX,__CY,__DX,__DY,__Robot,__TX,__TY],[__Robot,__TX,__TY])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(navigate_to,__Robot,__TX,__TY,'_$ctxt'(_CallerModuleVar,134,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(134,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__TX,__TY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,134)),!))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(navigate_to,__Robot,__TX,__TY,'_$ctxt'(_CallerModuleVar,136,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(136,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(move_toward,__Robot,__TX,__TY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,136)),FLORA_THIS_WORKSPACE(d^nontblflapply)(navigate_to,__Robot,__TX,__TY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,136))))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(fulfill_line,__Robot,__Order,__Product,__Qty,'_$ctxt'(_CallerModuleVar,138,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(138,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'
--- Fulfilling: %S x%S for %S ---
',flapply(args,__Product,__Qty,__Order),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,138)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_for_order_product,__Order,__Product,__Shelf,___Available,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,138)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__Shelf,__SX,__SY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,138)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__Shelf,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,138)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  Source: %S at (%S,%S) in %S
',flapply(args,__Shelf,__SX,__SY,__Zone),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(navigate_to,__Robot,__SX,__SY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(try_pickup,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(navigate_to,__Robot,1,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(try_deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(navigate_to,__Robot,__SX,__SY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(try_putdown,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,138)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  Line complete: %S x%S
',flapply(args,__Product,__Qty),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,138))))))))))))),fllibexecute_delayed_calls([__Order,__Product,__Qty,__Robot,__SX,__SY,__Shelf,__Zone,___Available],[__Order,__Product,__Qty,__Robot])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(fulfill_order,__Order,'_$ctxt'(_CallerModuleVar,140,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(140,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,140)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
========================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,140)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'FULFILLING ORDER: %S
',flapply(args,__Order),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,140)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'========================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,140)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(order_line,__Order,__Product,___Qty,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,140)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,__Product,__ActualNeed,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,140)),FLORA_THIS_WORKSPACE(d^nontblflapply)(fulfill_line,robot1,__Order,__Product,__ActualNeed,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,140)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  Already fulfilled: %S
',flapply(args,__Product),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,140)),20796,'warehouse_run.ergo'),20794,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'ORDER %S COMPLETE
',flapply(args,__Order),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,140)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order_status,__Order,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,140)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'STATUS: %S
',flapply(args,__Status),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,140))))))))),fllibexecute_delayed_calls([__ActualNeed,__Order,__Product,__Status,___Qty],[__Order])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(safety_report,'_$ctxt'(_CallerModuleVar,142,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(142,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,142)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'          WAREHOUSE SAFETY REPORT
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,142)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,142)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'[HAZMAT REACTIONS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,hazmat_reaction,__I1,__I2,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  CRITICAL: %S + %S on %S
',flapply(args,__I1,__I2,__S),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,142)),20816,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[SPOILAGE RISKS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,spoilage_risk,__I,__S,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  WARNING: Frozen item %S on %S in non-freezer %S
',flapply(args,__I,__S,__Z),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,142)),20820,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[HEAVY FALL RISKS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,heavy_fall_risk,__I3,__S3,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  WARNING: Heavy item %S on %S at level %S
',flapply(args,__I3,__S3,__L),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,142)),20824,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[HUMIDITY DAMAGE RISKS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,humidity_damage,__I4,__S4,__Z4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  WARNING: Paper item %S on %S in humid %S
',flapply(args,__I4,__S4,__Z4),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,142)),20828,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[FRAGILE RISKS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,fragile_risk,__I5,__S5,__L5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  CAUTION: Fragile item %S on %S at level %S
',flapply(args,__I5,__S5,__L5),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,142)),20832,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[ELECTRONIC IN FREEZER]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,electronic_in_freezer,__I6,__S6,__Z6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  WARNING: Electronic %S on %S in %S
',flapply(args,__I6,__S6,__Z6),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,142)),20836,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[ROBOT COLLISIONS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,robot_collision,__R1,__R2,__Loc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  CRITICAL: %S and %S at %S
',flapply(args,__R1,__R2,__Loc),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,142)),20840,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[HIGHWAY BLOCKAGES]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,highway_block,__Sh,__Xh,__Yh,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  CRITICAL: %S blocking highway at (%S,%S)
',flapply(args,__Sh,__Xh,__Yh),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar28,142)),20844,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[PROTOCOL ERRORS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar29,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,protocol_error,__Rp,__Xp,__Yp,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar30,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  ERROR: Unloaded %S at picking station (%S,%S)
',flapply(args,__Rp,__Xp,__Yp),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar31,142)),20848,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar32,142))))))))))))))))))))))),fllibexecute_delayed_calls([__I,__I1,__I2,__I3,__I4,__I5,__I6,__L,__L5,__Loc,__R1,__R2,__Rp,__S,__S3,__S4,__S5,__S6,__Sh,__Xh,__Xp,__Yh,__Yp,__Z,__Z4,__Z6],[])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(ml_report,'_$ctxt'(_CallerModuleVar,144,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(144,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,144)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'       ML-DRIVEN OPTIMIZATION REPORT
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,144)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,144)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'[CO-LOCATION ALERTS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,144)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(ml_colocation_alert,__Mc1,__Mz1,__Mc2,__Mz2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,144)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S (%S) <-> %S (%S)
',flapply(args,__Mc1,__Mz1,__Mc2,__Mz2),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,144)),20861,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[MOVE RECOMMENDATIONS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,144)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(ml_recommend_move,__Mi,__Mcz,__Mbz,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,144)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  SUGGEST: Move %S from %S to %S
',flapply(args,__Mi,__Mcz,__Mbz),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,144)),20865,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[ORDER PICKING EFFICIENCY]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,144)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(order_zone_count,__Eo,__Ezc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,144)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S requires visiting %S zone(s)
',flapply(args,__Eo,__Ezc),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,144)),20869,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,144))))))))))),fllibexecute_delayed_calls([__Eo,__Ezc,__Mbz,__Mc1,__Mc2,__Mcz,__Mi,__Mz1,__Mz2],[])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(order_report,'_$ctxt'(_CallerModuleVar,146,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(146,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,146)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'            ORDER STATUS REPORT
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,146)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,146)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(order,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,146)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order_status,__O,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,146)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'Order %S: %S
',flapply(args,__O,__Status),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,146)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(order_line,__O,__P,__Qty,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,146)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__O,__P,__Rem,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,146)),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20889,[__Done,-(__Qty,__Rem)]),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S: ordered=%S delivered=%S remaining=%S
',flapply(args,__P,__Qty,__Done,__Rem),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,146))),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S: ordered=%S delivered=%S remaining=0
',flapply(args,__P,__Qty,__Qty),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,146)),20887,'warehouse_run.ergo'),20885,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,146))))),20881,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,146)))))),fllibexecute_delayed_calls([__Done,__O,__P,__Qty,__Rem,__Status],[])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(inventory_report,'_$ctxt'(_CallerModuleVar,148,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(148,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,148)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'           WAREHOUSE INVENTORY REPORT
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,148)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,148)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,148)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__S,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,148)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__S,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,148)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S at (%S,%S) in %S:
',flapply(args,__S,__X,__Y,__Z),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,148)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__S,__P,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,148)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S  qty=%S
',flapply(args,__P,__Q),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,148)),20912,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,148)))))),20907,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,148)))))),fllibexecute_delayed_calls([__P,__Q,__S,__X,__Y,__Z],[])))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(full_report,'_$ctxt'(_CallerModuleVar,150,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(150,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(safety_report,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,150)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(ml_report,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,150)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(order_report,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,150)),FLORA_THIS_WORKSPACE(d^nontblflapply)(inventory_report,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,150))))))).
:-(FLORA_THIS_WORKSPACE(static^nontblflapply)(robot_report,'_$ctxt'(_CallerModuleVar,152,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(152,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,152)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'             ROBOT STATUS REPORT
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,152)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,152)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,152)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__R,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,152)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__R,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,152)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S at (%S,%S) carrying: %S
',flapply(args,__R,__X,__Y,__C),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,152)))),20932,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,152)))))),fllibexecute_delayed_calls([__C,__R,__X,__Y],[])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20240,FLORA_THIS_WORKSPACE(d^tblflapply)(robot_at,__Robot,__X,__Y,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),null,'_$_$_ergo''rule_enabled'(4,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20241,FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_loaded,__Robot,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),\==(__Shelf,none))),null,'_$_$_ergo''rule_enabled'(6,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Robot,__Shelf],[__Robot]),true)).
?-(fllibinsrulesig(8,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20242,FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_unloaded,__Robot,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,none,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8))),null,'_$_$_ergo''rule_enabled'(8,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(10,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20243,FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20285,[__NX,+(__X,__DX)]),fllibdelayedliteral('\\is','warehouse_run.ergo',20286,[__NY,+(__Y,__DY)]))),null,'_$_$_ergo''rule_enabled'(10,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Robot,__X,__Y],[__DX,__DY,__NX,__NY,__Robot]),true)).
?-(fllibinsrulesig(12,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20244,FLORA_THIS_WORKSPACE(d^tblflapply)(within_grid,__X,__Y,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(grid_cell,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),null,'_$_$_ergo''rule_enabled'(12,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(14,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20245,FLORA_THIS_WORKSPACE(d^tblflapply)(move_blocked,grid_boundary,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(within_grid,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,14)),fllibexecute_delayed_calls([__NX,__NY],[]))),[__NX,__NY],20294,'warehouse_run.ergo')))),null,'_$_$_ergo''rule_enabled'(14,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Robot],[__DX,__DY,__Robot]),true)).
?-(fllibinsrulesig(16,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20246,FLORA_THIS_WORKSPACE(d^tblflapply)(move_blocked,robot_collision,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Other,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,16)),\==(__Other,__Robot)))),null,'_$_$_ergo''rule_enabled'(16,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Other,__Robot],[__DX,__DY,__Robot]),true)).
?-(fllibinsrulesig(18,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20247,FLORA_THIS_WORKSPACE(d^tblflapply)(move_blocked,position_swap,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Other,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,18)),','(\==(__Other,__Robot),FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Other,___DX2,___DY2,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,18))))))),null,'_$_$_ergo''rule_enabled'(18,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Other,__Robot,__X,__Y,___DX2,___DY2],[__DX,__DY,__Robot]),true)).
?-(fllibinsrulesig(20,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20248,FLORA_THIS_WORKSPACE(d^tblflapply)(move_blocked,loaded_under_shelf,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_loaded,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,20)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__OtherShelf,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,20)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__CarriedShelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,20)),\==(__OtherShelf,__CarriedShelf))))),null,'_$_$_ergo''rule_enabled'(20,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__CarriedShelf,__DX,__DY,__NX,__NY,__OtherShelf,__Robot],[__DX,__DY,__Robot]),true)).
?-(fllibinsrulesig(22,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20249,FLORA_THIS_WORKSPACE(d^tblflapply)(move_blocked,unloaded_at_picking,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_unloaded,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22)),FLORA_THIS_WORKSPACE(d^tblflapply)(is_picking_station,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,22)))),null,'_$_$_ergo''rule_enabled'(22,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Robot],[__DX,__DY,__Robot]),true)).
?-(fllibinsrulesig(24,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20250,FLORA_THIS_WORKSPACE(d^tblflapply)(can_move,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(within_grid,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,24)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(move_blocked,___Reason,__Robot,__DX,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,24)),fllibexecute_delayed_calls([__DX,__DY,__Robot,___Reason],[]))),[___Reason,__Robot,__DX,__DY],20331,'warehouse_run.ergo'))))),null,'_$_$_ergo''rule_enabled'(24,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__Robot,___Reason],[__DX,__DY,__Robot]),true)).
?-(fllibinsrulesig(26,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20251,FLORA_THIS_WORKSPACE(d^nontblflapply)(move,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(can_move,__Robot,__DX,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__OldX,__OldY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,26)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(target_cell,__Robot,__DX,__DY,__NX,__NY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,26)),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_position,__Robot,__OldX,__OldY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_position,__Robot,__NX,__NY,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar7,__newcontextvar8)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibifthen(FLORA_THIS_MODULE_NAME,','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,26)),\==(__Shelf,none)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__Shelf,__ShX,__ShY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,26)),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(shelf_position,__Shelf,__ShX,__ShY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar11)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(shelf_position,__Shelf,__NX,__NY,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar13,__newcontextvar14)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]))),20340,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'ACTION: Robot %S moved from (%S,%S) to (%S,%S)
',flapply(args,__Robot,__OldX,__OldY,__NX,__NY),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,26)))))))),null,'_$_$_ergo''rule_enabled'(26,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__DX,__DY,__NX,__NY,__OldX,__OldY,__Robot,__ShX,__ShY,__Shelf],[__DX,__DY,__Robot]),true)).
?-(fllibinsrulesig(28,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20252,FLORA_THIS_WORKSPACE(d^nontblflapply)(try_move,__Robot,__DX,__DY,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(can_move,__Robot,__DX,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28)),FLORA_THIS_WORKSPACE(d^nontblflapply)(move,__Robot,__DX,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,28)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(move_blocked,__Reason,__Robot,__DX,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,28)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'BLOCKED: Robot %S move (%S,%S) denied - %S
',flapply(args,__Robot,__DX,__DY,__Reason),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,28))),20351,'warehouse_run.ergo'),null,'_$_$_ergo''rule_enabled'(28,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__DX,__DY,__Reason,__Robot],[__DX,__DY,__Robot]),true)).
?-(fllibinsrulesig(30,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20253,FLORA_THIS_WORKSPACE(d^tblflapply)(can_pickup,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,30)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,30)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__Shelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,30)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,none,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,30)))))),null,'_$_$_ergo''rule_enabled'(30,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Robot,__Shelf,__X,__Y],[__Robot,__Shelf]),true)).
?-(fllibinsrulesig(32,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20254,FLORA_THIS_WORKSPACE(d^tblflapply)(pickup_blocked,already_carrying,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,32)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_loaded,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,32)))),null,'_$_$_ergo''rule_enabled'(32,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(34,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20255,FLORA_THIS_WORKSPACE(d^tblflapply)(pickup_blocked,not_at_shelf,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__RX,__RY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__Shelf,__SX,__SY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,34)),';'(\==(__RX,__SX),\==(__RY,__SY)))))),null,'_$_$_ergo''rule_enabled'(34,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__RX,__RY,__Robot,__SX,__SY,__Shelf],[__Robot,__Shelf]),true)).
?-(fllibinsrulesig(36,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20256,FLORA_THIS_WORKSPACE(d^nontblflapply)(pickup,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(can_pickup,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,36)),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_carries,__Robot,none,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar5,__newcontextvar6)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'ACTION: Robot %S picked up %S
',flapply(args,__Robot,__Shelf),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,36))))),null,'_$_$_ergo''rule_enabled'(36,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(38,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20257,FLORA_THIS_WORKSPACE(d^nontblflapply)(try_pickup,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(can_pickup,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,38)),FLORA_THIS_WORKSPACE(d^nontblflapply)(pickup,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,38)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(pickup_blocked,__Reason,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,38)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'BLOCKED: Robot %S pickup of %S denied - %S
',flapply(args,__Robot,__Shelf,__Reason),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,38))),20391,'warehouse_run.ergo'),null,'_$_$_ergo''rule_enabled'(38,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Reason,__Robot,__Shelf],[__Robot,__Shelf]),true)).
?-(fllibinsrulesig(40,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20258,FLORA_THIS_WORKSPACE(d^tblflapply)(can_putdown,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,40)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,40)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,40)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,40)),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(is_highway,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,40)),fllibexecute_delayed_calls([__X,__Y],[]))),[__X,__Y],20405,'warehouse_run.ergo')),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_shelf_at,__Shelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,40)),fllibexecute_delayed_calls([__Shelf,__X,__Y],[]))),[__Shelf,__X,__Y],20406,'warehouse_run.ergo'))))))),null,'_$_$_ergo''rule_enabled'(40,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Robot,__Shelf,__X,__Y],[__Robot,__Shelf]),true)).
?-(fllibinsrulesig(42,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20259,FLORA_THIS_WORKSPACE(d^tblflapply)(other_shelf_at,__Shelf,__X,__Y,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__OtherShelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,42)),\==(__OtherShelf,__Shelf)),null,'_$_$_ergo''rule_enabled'(42,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__OtherShelf,__Shelf,__X,__Y],[__Shelf,__X,__Y]),true)).
?-(fllibinsrulesig(44,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20260,FLORA_THIS_WORKSPACE(d^tblflapply)(putdown_blocked,not_carrying,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,44)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,44)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Carried,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,44)),\==(__Carried,__Shelf)))),null,'_$_$_ergo''rule_enabled'(44,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Carried,__Robot,__Shelf],[__Robot,__Shelf]),true)).
?-(fllibinsrulesig(46,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20261,FLORA_THIS_WORKSPACE(d^tblflapply)(putdown_blocked,on_highway,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,46)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,46)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,46)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,46)),FLORA_THIS_WORKSPACE(d^tblflapply)(is_highway,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,46)))))),null,'_$_$_ergo''rule_enabled'(46,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Robot,__Shelf,__X,__Y],[__Robot,__Shelf]),true)).
?-(fllibinsrulesig(48,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20262,FLORA_THIS_WORKSPACE(d^tblflapply)(putdown_blocked,shelf_occupied,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,48,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,48)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,48)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,48)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,48)),FLORA_THIS_WORKSPACE(d^tblflapply)(other_shelf_at,__Shelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,48)))))),null,'_$_$_ergo''rule_enabled'(48,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Robot,__Shelf,__X,__Y],[__Robot,__Shelf]),true)).
?-(fllibinsrulesig(50,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20263,FLORA_THIS_WORKSPACE(d^nontblflapply)(putdown,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,50,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(can_putdown,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,50)),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(robot_carries,__Robot,none,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar5,__newcontextvar6)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'ACTION: Robot %S put down %S
',flapply(args,__Robot,__Shelf),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,50))))),null,'_$_$_ergo''rule_enabled'(50,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(52,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20264,FLORA_THIS_WORKSPACE(d^nontblflapply)(try_putdown,__Robot,__Shelf,'_$ctxt'(_CallerModuleVar,52,__newcontextvar1)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(can_putdown,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,52)),FLORA_THIS_WORKSPACE(d^nontblflapply)(putdown,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,52)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(putdown_blocked,__Reason,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,52)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'BLOCKED: Robot %S putdown of %S denied - %S
',flapply(args,__Robot,__Shelf,__Reason),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,52))),20439,'warehouse_run.ergo'),null,'_$_$_ergo''rule_enabled'(52,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Reason,__Robot,__Shelf],[__Robot,__Shelf]),true)).
?-(fllibinsrulesig(54,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20265,FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,__Product,__Need,'_$ctxt'(_CallerModuleVar,54,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order_line,__Order,__Product,__Ordered,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,54)),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(delivered,__Order,__Product,__Del,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,54)),fllibdelayedliteral('\\is','warehouse_run.ergo',20456,[__Need,-(__Ordered,__Del)]),fllibdelayedliteral('\\is','warehouse_run.ergo',20457,[__Need,__Ordered]),20455,'warehouse_run.ergo'),fllibdelayedliteral(>,'warehouse_run.ergo',20458,[__Need,0]))),null,'_$_$_ergo''rule_enabled'(54,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Del,__Need,__Order,__Ordered,__Product],[__Need,__Order,__Product]),true)).
?-(fllibinsrulesig(56,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20266,FLORA_THIS_WORKSPACE(d^tblflapply)(can_deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(_CallerModuleVar,56,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(is_picking_station,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,56)),','(\==(__Shelf,none),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Product,__Available,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,56)),','(fllibdelayedliteral(>=,'warehouse_run.ergo',20469,[__Available,__Qty]),','(fllibdelayedliteral(>,'warehouse_run.ergo',20470,[__Qty,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,__Product,__Need,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,56)),fllibdelayedliteral(>=,'warehouse_run.ergo',20472,[__Need,__Qty]))))))))))),null,'_$_$_ergo''rule_enabled'(56,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Available,__Need,__Order,__Product,__Qty,__Robot,__Shelf,__X,__Y],[__Order,__Product,__Qty,__Robot]),true)).
?-(fllibinsrulesig(58,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20267,FLORA_THIS_WORKSPACE(d^tblflapply)(deliver_blocked,not_at_picking_station,__Robot,___Product,___Qty,__Order,'_$ctxt'(_CallerModuleVar,58,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,58)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,58)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,58)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(is_picking_station,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,58)),fllibexecute_delayed_calls([__X,__Y],[]))),[__X,__Y],20478,'warehouse_run.ergo'))))),null,'_$_$_ergo''rule_enabled'(58,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Order,__Robot,__X,__Y],[__Order,__Robot,___Product,___Qty]),true)).
?-(fllibinsrulesig(60,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20268,FLORA_THIS_WORKSPACE(d^tblflapply)(deliver_blocked,not_carrying_shelf,__Robot,___Product,___Qty,__Order,'_$ctxt'(_CallerModuleVar,60,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,60)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,60)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,none,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,60)))),null,'_$_$_ergo''rule_enabled'(60,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(62,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20269,FLORA_THIS_WORKSPACE(d^tblflapply)(deliver_blocked,product_not_on_shelf,__Robot,__Product,___Qty,__Order,'_$ctxt'(_CallerModuleVar,62,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,62)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,62)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,62)),','(\==(__Shelf,none),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Product,___Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,62)),fllibexecute_delayed_calls([__Product,__Shelf,___Q],[]))),[__Shelf,__Product,___Q],20490,'warehouse_run.ergo')))))),null,'_$_$_ergo''rule_enabled'(62,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Order,__Product,__Robot,__Shelf,___Q],[__Order,__Product,__Robot,___Qty]),true)).
?-(fllibinsrulesig(64,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20270,FLORA_THIS_WORKSPACE(d^tblflapply)(deliver_blocked,insufficient_stock,__Robot,__Product,__Qty,__Order,'_$ctxt'(_CallerModuleVar,64,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,64)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,64)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,64)),','(\==(__Shelf,none),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Product,__Available,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,64)),fllibdelayedliteral(<,'warehouse_run.ergo',20498,[__Available,__Qty])))))),null,'_$_$_ergo''rule_enabled'(64,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Available,__Order,__Product,__Qty,__Robot,__Shelf],[__Order,__Product,__Qty,__Robot]),true)).
?-(fllibinsrulesig(66,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20271,FLORA_THIS_WORKSPACE(d^tblflapply)(deliver_blocked,exceeds_order_need,__Robot,__Product,__Qty,__Order,'_$ctxt'(_CallerModuleVar,66,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,66)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,66)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,__Product,__Need,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,66)),fllibdelayedliteral(>,'warehouse_run.ergo',20504,[__Qty,__Need])))),null,'_$_$_ergo''rule_enabled'(66,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Need,__Order,__Product,__Qty,__Robot],[__Order,__Product,__Qty,__Robot]),true)).
?-(fllibinsrulesig(68,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20272,FLORA_THIS_WORKSPACE(d^tblflapply)(deliver_blocked,wrong_product,__Robot,__Product,___Qty,__Order,'_$ctxt'(_CallerModuleVar,68,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,68)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,68)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(order_line,__Order,__Product,___Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,68)),fllibexecute_delayed_calls([__Order,__Product,___Q],[]))),[__Order,__Product,___Q],20509,'warehouse_run.ergo')))),null,'_$_$_ergo''rule_enabled'(68,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Order,__Product,__Robot,___Q],[__Order,__Product,__Robot,___Qty]),true)).
?-(fllibinsrulesig(70,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20273,FLORA_THIS_WORKSPACE(d^nontblflapply)(deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(_CallerModuleVar,70,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(can_deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,70)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,70)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Product,__OldStock,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,70)),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20516,[__NewStock,-(__OldStock,__Qty)]),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(shelf_stock,__Shelf,__Product,__OldStock,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(shelf_stock,__Shelf,__Product,__NewStock,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar7,__newcontextvar8)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(delivered,__Order,__Product,__OldDel,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,70)),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20521,[__NewDel,+(__OldDel,__Qty)]),','(fllibdelete(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(delivered,__Order,__Product,__OldDel,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,__newcontextvar10)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(delivered,__Order,__Product,__NewDel,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar12,__newcontextvar13)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]))),fllibinsert(FLORA_THIS_MODULE_NAME,[flsysdbupdate(FLORA_THIS_WORKSPACE(tblflapply)(delivered,__Order,__Product,__Qty,'_$ctxt'(_DynRuleCallerModuleVar,__newcontextvar14,__newcontextvar15)),FLORA_THIS_FDB_STORAGE,FLORA_THIS_MODULE_NAME)]),20519,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'ACTION: Robot %S delivered %S x%S for %S from %S
',flapply(args,__Robot,__Product,__Qty,__Order,__Shelf),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,70))))))))),null,'_$_$_ergo''rule_enabled'(70,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__NewDel,__NewStock,__OldDel,__OldStock,__Order,__Product,__Qty,__Robot,__Shelf],[__Order,__Product,__Qty,__Robot]),true)).
?-(fllibinsrulesig(72,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20274,FLORA_THIS_WORKSPACE(d^nontblflapply)(try_deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(_CallerModuleVar,72,__newcontextvar1)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(can_deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,72)),FLORA_THIS_WORKSPACE(d^nontblflapply)(deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,72)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(deliver_blocked,__Reason,__Robot,__Product,__Qty,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,72)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'BLOCKED: Delivery of %S x%S for %S denied - %S
',flapply(args,__Product,__Qty,__Order,__Reason),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,72))),20530,'warehouse_run.ergo'),null,'_$_$_ergo''rule_enabled'(72,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Order,__Product,__Qty,__Reason,__Robot],[__Order,__Product,__Qty,__Robot]),true)).
?-(fllibinsrulesig(74,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20275,FLORA_THIS_WORKSPACE(d^tblflapply)(state_violation,shelf_on_highway,__Shelf,__X,__Y,'_$ctxt'(_CallerModuleVar,74,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,74)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__Shelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,74)),FLORA_THIS_WORKSPACE(d^tblflapply)(is_highway,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,74)))),null,'_$_$_ergo''rule_enabled'(74,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(76,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20276,FLORA_THIS_WORKSPACE(d^tblflapply)(state_violation,robot_collision,__R1,__R2,__X,__Y,'_$ctxt'(_CallerModuleVar,76,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__R1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,76)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__R2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,76)),','(@<(__R1,__R2),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__R1,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,76)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__R2,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,76)))))),null,'_$_$_ergo''rule_enabled'(76,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(78,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20277,FLORA_THIS_WORKSPACE(d^tblflapply)(state_violation,shelf_collision,__S1,__S2,__X,__Y,'_$ctxt'(_CallerModuleVar,78,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__S1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,78)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__S2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,78)),','(@<(__S1,__S2),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__S1,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,78)),FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__S2,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,78)))))),null,'_$_$_ergo''rule_enabled'(78,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(80,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20278,FLORA_THIS_WORKSPACE(d^tblflapply)(state_violation,race_condition,__Robot,'_$ctxt'(_CallerModuleVar,80,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,80)),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_in_transit,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,80))),null,'_$_$_ergo''rule_enabled'(80,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(82,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20279,FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_follows_robot,__Robot,__Shelf,__X,__Y,'_$ctxt'(_CallerModuleVar,82,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,82)),','(\==(__Shelf,none),FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,82)))),null,'_$_$_ergo''rule_enabled'(82,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(84,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20280,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,hazmat_reaction,__Item1,__Item2,__Shelf,'_$ctxt'(_CallerModuleVar,84,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item1,oxidizer,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,84)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item2,flammable,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,84)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item1,__Q1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,84)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20585,[__Q1,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item2,__Q2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,84)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20586,[__Q2,0]),@<(__Item1,__Item2))))))),null,'_$_$_ergo''rule_enabled'(84,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Item1,__Item2,__Q1,__Q2,__Shelf],[__Item1,__Item2,__Shelf]),true)).
?-(fllibinsrulesig(86,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20281,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,spoilage_risk,__Item,__Shelf,__Zone,'_$ctxt'(_CallerModuleVar,86,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item,frozen,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,86)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,86)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20592,[__Q,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__Shelf,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,86)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(zone_type,__Zone,__ZType,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,86)),\==(__ZType,freezer)))))),null,'_$_$_ergo''rule_enabled'(86,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Item,__Q,__Shelf,__ZType,__Zone],[__Item,__Shelf,__Zone]),true)).
?-(fllibinsrulesig(88,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20282,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,heavy_fall_risk,__Item,__Shelf,__Level,'_$ctxt'(_CallerModuleVar,88,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item,heavy,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,88)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,88)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20600,[__Q,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_level,__Shelf,__Level,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,88)),fllibdelayedliteral(>,'warehouse_run.ergo',20602,[__Level,5]))))),null,'_$_$_ergo''rule_enabled'(88,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Item,__Level,__Q,__Shelf],[__Item,__Level,__Shelf]),true)).
?-(fllibinsrulesig(90,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20283,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,humidity_damage,__Item,__Shelf,__Zone,'_$ctxt'(_CallerModuleVar,90,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item,paper_goods,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,90)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,90)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20607,[__Q,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__Shelf,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,90)),FLORA_THIS_WORKSPACE(d^tblflapply)(zone_humidity,__Zone,high,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,90)))))),null,'_$_$_ergo''rule_enabled'(90,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Item,__Q,__Shelf,__Zone],[__Item,__Shelf,__Zone]),true)).
?-(fllibinsrulesig(92,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20284,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,robot_collision,__R1,__R2,flapply(loc,__X,__Y),'_$ctxt'(_CallerModuleVar,92,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(state_violation,robot_collision,__R1,__R2,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,92)),null,'_$_$_ergo''rule_enabled'(92,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(94,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20285,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,highway_block,__Shelf,__X,__Y,'_$ctxt'(_CallerModuleVar,94,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(state_violation,shelf_on_highway,__Shelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,94)),null,'_$_$_ergo''rule_enabled'(94,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(96,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20286,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,protocol_error,__Robot,__X,__Y,'_$ctxt'(_CallerModuleVar,96,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,96)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_unloaded,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,96)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,96)),FLORA_THIS_WORKSPACE(d^tblflapply)(is_picking_station,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,96))))),null,'_$_$_ergo''rule_enabled'(96,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(98,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20287,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,unsafe_movement,__Robot,__OtherShelf,flapply(loc,__X,__Y),'_$ctxt'(_CallerModuleVar,98,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,98)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_is_loaded,__Robot,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,98)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,98)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__Robot,__Carried,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,98)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__OtherShelf,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,98)),\==(__OtherShelf,__Carried)))))),null,'_$_$_ergo''rule_enabled'(98,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Carried,__OtherShelf,__Robot,__X,__Y],[__OtherShelf,__Robot,__X,__Y]),true)).
?-(fllibinsrulesig(100,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20288,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,fragile_risk,__Item,__Shelf,__Level,'_$ctxt'(_CallerModuleVar,100,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item,fragile,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,100)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,100)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20638,[__Q,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_level,__Shelf,__Level,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,100)),fllibdelayedliteral(>,'warehouse_run.ergo',20640,[__Level,5]))))),null,'_$_$_ergo''rule_enabled'(100,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Item,__Level,__Q,__Shelf],[__Item,__Level,__Shelf]),true)).
?-(fllibinsrulesig(102,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20289,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,electronic_in_freezer,__Item,__Shelf,__Zone,'_$ctxt'(_CallerModuleVar,102,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(product_property,__Item,electronic,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,102)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,102)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20645,[__Q,0]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__Shelf,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,102)),FLORA_THIS_WORKSPACE(d^tblflapply)(zone_type,__Zone,freezer,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,102)))))),null,'_$_$_ergo''rule_enabled'(102,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Item,__Q,__Shelf,__Zone],[__Item,__Shelf,__Zone]),true)).
?-(fllibinsrulesig(104,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20290,FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Item,__Zone,'_$ctxt'(_CallerModuleVar,104,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,104)),','(fllibdelayedliteral(>,'warehouse_run.ergo',20656,[__Q,0]),FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__Shelf,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,104)))),null,'_$_$_ergo''rule_enabled'(104,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Item,__Q,__Shelf,__Zone],[__Item,__Zone]),true)).
?-(fllibinsrulesig(106,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20291,FLORA_THIS_WORKSPACE(d^tblflapply)(item_on_shelf,__Item,__Shelf,'_$ctxt'(_CallerModuleVar,106,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Item,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,106)),fllibdelayedliteral(>,'warehouse_run.ergo',20661,[__Q,0])),null,'_$_$_ergo''rule_enabled'(106,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Item,__Q,__Shelf],[__Item,__Shelf]),true)).
?-(fllibinsrulesig(108,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20292,FLORA_THIS_WORKSPACE(d^tblflapply)(ml_colocation_alert,__Item1,__Zone1,__Item2,__Zone2,'_$ctxt'(_CallerModuleVar,108,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(frequently_bought_together,__Item1,__Item2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,108)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Item1,__Zone1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,108)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Item2,__Zone2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,108)),\==(__Zone1,__Zone2)))),null,'_$_$_ergo''rule_enabled'(108,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(110,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20293,FLORA_THIS_WORKSPACE(d^tblflapply)(ml_recommend_move,__Item,__CurrentZone,__BetterZone,'_$ctxt'(_CallerModuleVar,110,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Item,__CurrentZone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,110)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(zone,__BetterZone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,110)),','(\==(__BetterZone,__CurrentZone),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ml_partner_count_in_zone,__Item,__BetterZone,__BetterCount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,110)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ml_partner_count_in_zone,__Item,__CurrentZone,__CurrentCount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,110)),fllibdelayedliteral(>,'warehouse_run.ergo',20677,[__BetterCount,__CurrentCount])))))),null,'_$_$_ergo''rule_enabled'(110,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__BetterCount,__BetterZone,__CurrentCount,__CurrentZone,__Item],[__BetterZone,__CurrentZone,__Item]),true)).
?-(fllibinsrulesig(112,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20294,FLORA_THIS_WORKSPACE(d^tblflapply)(ml_partner_count_in_zone,__Item,__Zone,__Count,'_$ctxt'(_CallerModuleVar,112,__newcontextvar1)),','(','(fllibcount(__newdontcarevar4,[],[],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(frequently_bought_together,__Item,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,112)),FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__newdontcarevar4,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,112))),fllibexecute_delayed_calls([__Item,__newdontcarevar4,__Zone],[])),__newvar5),=(__Count,__newvar5)),fllibdelayedliteral(>,'warehouse_run.ergo',20684,[__Count,0])),null,'_$_$_ergo''rule_enabled'(112,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(114,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20295,FLORA_THIS_WORKSPACE(d^tblflapply)(optimal_zone_for,__Item,__BestZone,__MaxCount,'_$ctxt'(_CallerModuleVar,114,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Item,___AnyZone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,114)),','(','(fllibmax(__newdontcarevar4,[],[],','(FLORA_THIS_WORKSPACE(d^tblflapply)(ml_partner_count_in_zone,__Item,___Z,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,114)),fllibexecute_delayed_calls([__newdontcarevar4,__Item,___Z],[])),__newvar5),=(__MaxCount,__newvar5)),FLORA_THIS_WORKSPACE(d^tblflapply)(ml_partner_count_in_zone,__Item,__BestZone,__MaxCount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,114)))),null,'_$_$_ergo''rule_enabled'(114,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__BestZone,__Item,__MaxCount,___AnyZone,___Z],[__BestZone,__Item,__MaxCount]),true)).
?-(fllibinsrulesig(116,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20296,FLORA_THIS_WORKSPACE(d^tblflapply)(order_zone_count,__Order,__ZoneCount,'_$ctxt'(_CallerModuleVar,116,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,116)),','(fllibcount(__newdontcarevar5,[],[],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(order_line,__Order,__Product,___Qty,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,116)),FLORA_THIS_WORKSPACE(d^tblflapply)(item_in_zone,__Product,__newdontcarevar5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,116))),fllibexecute_delayed_calls([__Order,__Product,__newdontcarevar5,___Qty],[])),__newvar6),=(__ZoneCount,__newvar6))),null,'_$_$_ergo''rule_enabled'(116,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Order,__Product,__ZoneCount,___Qty],[__Order,__ZoneCount]),true)).
?-(fllibinsrulesig(118,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20297,FLORA_THIS_WORKSPACE(d^tblflapply)(ml_distance_alert,__Item1,__Item2,__Dist,'_$ctxt'(_CallerModuleVar,118,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(frequently_bought_together,__Item1,__Item2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_on_shelf,__Item1,__S1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(item_on_shelf,__Item2,__S2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__S1,__X1,__Y1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__S2,__X2,__Y2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,118)),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20709,[__DX,abs(-(__X1,__X2))]),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20710,[__DY,abs(-(__Y1,__Y2))]),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20711,[__Dist,+(__DX,__DY)]),fllibdelayedliteral(>,'warehouse_run.ergo',20712,[__Dist,4]))))))))),null,'_$_$_ergo''rule_enabled'(118,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__DX,__DY,__Dist,__Item1,__Item2,__S1,__S2,__X1,__X2,__Y1,__Y2],[__Dist,__Item1,__Item2]),true)).
?-(fllibinsrulesig(120,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20298,FLORA_THIS_WORKSPACE(d^tblflapply)(order_status,__Order,fulfilled,'_$ctxt'(_CallerModuleVar,120,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,120)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(has_remaining_need,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,120)),fllibexecute_delayed_calls([__Order],[]))),[__Order],20722,'warehouse_run.ergo'))),null,'_$_$_ergo''rule_enabled'(120,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(122,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20299,FLORA_THIS_WORKSPACE(d^tblflapply)(order_status,__Order,in_progress,'_$ctxt'(_CallerModuleVar,122,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,122)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(has_remaining_need,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,122)),FLORA_THIS_WORKSPACE(d^tblflapply)(has_some_delivery,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,122)))),null,'_$_$_ergo''rule_enabled'(122,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(124,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20300,FLORA_THIS_WORKSPACE(d^tblflapply)(order_status,__Order,pending,'_$ctxt'(_CallerModuleVar,124,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,124)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(has_remaining_need,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,124)),flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_naf_call)(','(FLORA_THIS_WORKSPACE(d^tblflapply)(has_some_delivery,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,124)),fllibexecute_delayed_calls([__Order],[]))),[__Order],20732,'warehouse_run.ergo')))),null,'_$_$_ergo''rule_enabled'(124,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(126,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20301,FLORA_THIS_WORKSPACE(d^tblflapply)(has_remaining_need,__Order,'_$ctxt'(_CallerModuleVar,126,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,___P,__Need,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,126)),fllibdelayedliteral(>,'warehouse_run.ergo',20736,[__Need,0])),null,'_$_$_ergo''rule_enabled'(126,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Need,__Order,___P],[__Order]),true)).
?-(fllibinsrulesig(128,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20302,FLORA_THIS_WORKSPACE(d^tblflapply)(has_some_delivery,__Order,'_$ctxt'(_CallerModuleVar,128,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(delivered,__Order,___P,__Qty,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,128)),fllibdelayedliteral(>,'warehouse_run.ergo',20740,[__Qty,0])),null,'_$_$_ergo''rule_enabled'(128,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Order,__Qty,___P],[__Order]),true)).
?-(fllibinsrulesig(130,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20303,FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_for_order_product,__Order,__Product,__Shelf,__Available,'_$ctxt'(_CallerModuleVar,130,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,__Product,___Need,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,130)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__Shelf,__Product,__Available,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,130)),fllibdelayedliteral(>,'warehouse_run.ergo',20746,[__Available,0]))),null,'_$_$_ergo''rule_enabled'(130,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Available,__Order,__Product,__Shelf,___Need],[__Available,__Order,__Product,__Shelf]),true)).
?-(fllibinsrulesig(132,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20304,FLORA_THIS_WORKSPACE(d^nontblflapply)(move_toward,__Robot,__TX,__TY,'_$ctxt'(_CallerModuleVar,132,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__CX,__CY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,132)),fllibifthenelse(FLORA_THIS_MODULE_NAME,\==(__CX,__TX),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,fllibdelayedliteral(<,'warehouse_run.ergo',20753,[__CX,__TX]),=(__DX,1),=(__DX,-1),20753,'warehouse_run.ergo'),FLORA_THIS_WORKSPACE(d^nontblflapply)(try_move,__Robot,__DX,0,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,132))),fllibifthenelse(FLORA_THIS_MODULE_NAME,\==(__CY,__TY),','(fllibifthenelse(FLORA_THIS_MODULE_NAME,fllibdelayedliteral(<,'warehouse_run.ergo',20759,[__CY,__TY]),=(__DY,1),=(__DY,-1),20759,'warehouse_run.ergo'),FLORA_THIS_WORKSPACE(d^nontblflapply)(try_move,__Robot,0,__DY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,132))),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'NAV: Robot %S already at (%S,%S)
',flapply(args,__Robot,__TX,__TY),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,132)),20757,'warehouse_run.ergo'),20751,'warehouse_run.ergo')),null,'_$_$_ergo''rule_enabled'(132,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__CX,__CY,__DX,__DY,__Robot,__TX,__TY],[__Robot,__TX,__TY]),true)).
?-(fllibinsrulesig(134,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20305,FLORA_THIS_WORKSPACE(d^nontblflapply)(navigate_to,__Robot,__TX,__TY,'_$ctxt'(_CallerModuleVar,134,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__Robot,__TX,__TY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,134)),!),null,'_$_$_ergo''rule_enabled'(134,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(136,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20306,FLORA_THIS_WORKSPACE(d^nontblflapply)(navigate_to,__Robot,__TX,__TY,'_$ctxt'(_CallerModuleVar,136,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(move_toward,__Robot,__TX,__TY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,136)),FLORA_THIS_WORKSPACE(d^nontblflapply)(navigate_to,__Robot,__TX,__TY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,136))),null,'_$_$_ergo''rule_enabled'(136,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(138,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20307,FLORA_THIS_WORKSPACE(d^nontblflapply)(fulfill_line,__Robot,__Order,__Product,__Qty,'_$ctxt'(_CallerModuleVar,138,__newcontextvar1)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'
--- Fulfilling: %S x%S for %S ---
',flapply(args,__Product,__Qty,__Order),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,138)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_for_order_product,__Order,__Product,__Shelf,___Available,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,138)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__Shelf,__SX,__SY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,138)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__Shelf,__Zone,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,138)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  Source: %S at (%S,%S) in %S
',flapply(args,__Shelf,__SX,__SY,__Zone),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(navigate_to,__Robot,__SX,__SY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(try_pickup,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(navigate_to,__Robot,1,1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(try_deliver,__Robot,__Product,__Qty,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(navigate_to,__Robot,__SX,__SY,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,138)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(try_putdown,__Robot,__Shelf,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,138)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  Line complete: %S x%S
',flapply(args,__Product,__Qty),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,138))))))))))))),null,'_$_$_ergo''rule_enabled'(138,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Order,__Product,__Qty,__Robot,__SX,__SY,__Shelf,__Zone,___Available],[__Order,__Product,__Qty,__Robot]),true)).
?-(fllibinsrulesig(140,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20308,FLORA_THIS_WORKSPACE(d^nontblflapply)(fulfill_order,__Order,'_$ctxt'(_CallerModuleVar,140,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order,__Order,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,140)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
========================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,140)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'FULFILLING ORDER: %S
',flapply(args,__Order),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,140)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'========================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,140)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(order_line,__Order,__Product,___Qty,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,140)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__Order,__Product,__ActualNeed,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,140)),FLORA_THIS_WORKSPACE(d^nontblflapply)(fulfill_line,robot1,__Order,__Product,__ActualNeed,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,140)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  Already fulfilled: %S
',flapply(args,__Product),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,140)),20796,'warehouse_run.ergo'),20794,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'ORDER %S COMPLETE
',flapply(args,__Order),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,140)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order_status,__Order,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,140)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'STATUS: %S
',flapply(args,__Status),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,140))))))))),null,'_$_$_ergo''rule_enabled'(140,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__ActualNeed,__Order,__Product,__Status,___Qty],[__Order]),true)).
?-(fllibinsrulesig(142,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20309,FLORA_THIS_WORKSPACE(d^nontblflapply)(safety_report,'_$ctxt'(_CallerModuleVar,142,__newcontextvar1)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,142)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'          WAREHOUSE SAFETY REPORT
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,142)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,142)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'[HAZMAT REACTIONS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,hazmat_reaction,__I1,__I2,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  CRITICAL: %S + %S on %S
',flapply(args,__I1,__I2,__S),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,142)),20816,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[SPOILAGE RISKS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,spoilage_risk,__I,__S,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  WARNING: Frozen item %S on %S in non-freezer %S
',flapply(args,__I,__S,__Z),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,142)),20820,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[HEAVY FALL RISKS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,heavy_fall_risk,__I3,__S3,__L,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  WARNING: Heavy item %S on %S at level %S
',flapply(args,__I3,__S3,__L),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,142)),20824,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[HUMIDITY DAMAGE RISKS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,humidity_damage,__I4,__S4,__Z4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  WARNING: Paper item %S on %S in humid %S
',flapply(args,__I4,__S4,__Z4),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,142)),20828,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[FRAGILE RISKS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar17,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,fragile_risk,__I5,__S5,__L5,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar18,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  CAUTION: Fragile item %S on %S at level %S
',flapply(args,__I5,__S5,__L5),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar19,142)),20832,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[ELECTRONIC IN FREEZER]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar20,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,electronic_in_freezer,__I6,__S6,__Z6,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar21,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  WARNING: Electronic %S on %S in %S
',flapply(args,__I6,__S6,__Z6),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar22,142)),20836,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[ROBOT COLLISIONS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar23,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,robot_collision,__R1,__R2,__Loc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar24,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  CRITICAL: %S and %S at %S
',flapply(args,__R1,__R2,__Loc),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar25,142)),20840,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[HIGHWAY BLOCKAGES]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar26,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,highway_block,__Sh,__Xh,__Yh,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar27,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  CRITICAL: %S blocking highway at (%S,%S)
',flapply(args,__Sh,__Xh,__Yh),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar28,142)),20844,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[PROTOCOL ERRORS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar29,142)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(alert,protocol_error,__Rp,__Xp,__Yp,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar30,142)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  ERROR: Unloaded %S at picking station (%S,%S)
',flapply(args,__Rp,__Xp,__Yp),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar31,142)),20848,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar32,142))))))))))))))))))))))),null,'_$_$_ergo''rule_enabled'(142,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__I,__I1,__I2,__I3,__I4,__I5,__I6,__L,__L5,__Loc,__R1,__R2,__Rp,__S,__S3,__S4,__S5,__S6,__Sh,__Xh,__Xp,__Yh,__Yp,__Z,__Z4,__Z6],[]),true)).
?-(fllibinsrulesig(144,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20310,FLORA_THIS_WORKSPACE(d^nontblflapply)(ml_report,'_$ctxt'(_CallerModuleVar,144,__newcontextvar1)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,144)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'       ML-DRIVEN OPTIMIZATION REPORT
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,144)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,144)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'[CO-LOCATION ALERTS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,144)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(ml_colocation_alert,__Mc1,__Mz1,__Mc2,__Mz2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,144)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S (%S) <-> %S (%S)
',flapply(args,__Mc1,__Mz1,__Mc2,__Mz2),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,144)),20861,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[MOVE RECOMMENDATIONS]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,144)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(ml_recommend_move,__Mi,__Mcz,__Mbz,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,144)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  SUGGEST: Move %S from %S to %S
',flapply(args,__Mi,__Mcz,__Mbz),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,144)),20865,'warehouse_run.ergo'),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
[ORDER PICKING EFFICIENCY]
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,144)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(order_zone_count,__Eo,__Ezc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,144)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S requires visiting %S zone(s)
',flapply(args,__Eo,__Ezc),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,144)),20869,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,144))))))))))),null,'_$_$_ergo''rule_enabled'(144,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Eo,__Ezc,__Mbz,__Mc1,__Mc2,__Mcz,__Mi,__Mz1,__Mz2],[]),true)).
?-(fllibinsrulesig(146,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20311,FLORA_THIS_WORKSPACE(d^nontblflapply)(order_report,'_$ctxt'(_CallerModuleVar,146,__newcontextvar1)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,146)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'            ORDER STATUS REPORT
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,146)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,146)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(order,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,146)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(order_status,__O,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,146)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'Order %S: %S
',flapply(args,__O,__Status),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,146)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(order_line,__O,__P,__Qty,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,146)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(remaining_need,__O,__P,__Rem,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,146)),','(fllibdelayedliteral('\\is','warehouse_run.ergo',20889,[__Done,-(__Qty,__Rem)]),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S: ordered=%S delivered=%S remaining=%S
',flapply(args,__P,__Qty,__Done,__Rem),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,146))),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S: ordered=%S delivered=%S remaining=0
',flapply(args,__P,__Qty,__Qty),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,146)),20887,'warehouse_run.ergo'),20885,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,146))))),20881,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,146)))))),null,'_$_$_ergo''rule_enabled'(146,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Done,__O,__P,__Qty,__Rem,__Status],[]),true)).
?-(fllibinsrulesig(148,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20312,FLORA_THIS_WORKSPACE(d^nontblflapply)(inventory_report,'_$ctxt'(_CallerModuleVar,148,__newcontextvar1)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,148)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'           WAREHOUSE INVENTORY REPORT
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,148)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,148)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(shelf,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,148)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_in_zone,__S,__Z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,148)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_position,__S,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,148)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S at (%S,%S) in %S:
',flapply(args,__S,__X,__Y,__Z),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,148)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(shelf_stock,__S,__P,__Q,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,148)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S  qty=%S
',flapply(args,__P,__Q),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,148)),20912,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,148)))))),20907,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,148)))))),null,'_$_$_ergo''rule_enabled'(148,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__P,__Q,__S,__X,__Y,__Z],[]),true)).
?-(fllibinsrulesig(150,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20313,FLORA_THIS_WORKSPACE(d^nontblflapply)(full_report,'_$ctxt'(_CallerModuleVar,150,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(safety_report,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,150)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(ml_report,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,150)),','(FLORA_THIS_WORKSPACE(d^nontblflapply)(order_report,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,150)),FLORA_THIS_WORKSPACE(d^nontblflapply)(inventory_report,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,150))))),null,'_$_$_ergo''rule_enabled'(150,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(152,'warehouse_run.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20314,FLORA_THIS_WORKSPACE(d^nontblflapply)(robot_report,'_$ctxt'(_CallerModuleVar,152,__newcontextvar1)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,152)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'             ROBOT STATUS REPORT
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,152)),','(FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'====================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,152)),','(fllibwhiledo(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(robot,__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,152)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_position,__R,__X,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,152)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(robot_carries,__R,__C,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,152)),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'  %S at (%S,%S) carrying: %S
',flapply(args,__R,__X,__Y,__C),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,152)))),20932,'warehouse_run.ergo'),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
====================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,152)))))),null,'_$_$_ergo''rule_enabled'(152,'warehouse_run.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__C,__R,__X,__Y],[]),true)).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'============================================================
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  SMART WAREHOUSE OPTIMIZATION SYSTEM - ErgoAI
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  ML-Driven Skip-Gram + Robot Automation + Safety
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'============================================================

'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'System loaded successfully.
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'Available commands:
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  %safety_report     - Show all safety violations
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  %ml_report         - Show ML optimization recommendations
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  %order_report      - Show order statuses
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  %inventory_report  - Show shelf inventory
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  %robot_report      - Show robot positions
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  %full_report       - Run all reports
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  %fulfill_order(order_1001)  - Fulfill an order
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  %try_move(robot1,1,0)       - Move robot one step
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  %try_pickup(robot1,shelf_A1) - Pick up a shelf
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'  %try_deliver(robot1,item,qty,order) - Deliver item
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).
?-(fllibprogramans(','('_$_$_ergo''silent_equal'(_CallerModuleVar,FLORA_THIS_MODULE_NAME),FLORA_WORKSPACE(\\io,d^tblflapply)(fmt_write,'%S',flapply(args,'
'),'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1))),[])).

 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'warehouse_run.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('warehouse_run.ergo',FLORA_THIS_MODULE_NAME))).

/************************************************************************
  file: headerinc/flrtrailer_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrtrailer.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrpreddef_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrpreddef.flh"

/***********************************************************************/

