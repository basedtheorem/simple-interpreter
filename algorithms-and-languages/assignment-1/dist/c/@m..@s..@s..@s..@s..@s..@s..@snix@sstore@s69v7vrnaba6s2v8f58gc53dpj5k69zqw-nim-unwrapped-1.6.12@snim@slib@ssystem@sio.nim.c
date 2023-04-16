/* Generated by Nim Compiler v1.6.12 */
#define NIM_INTBITS 64

#include "nimbase.h"
#include <stdio.h>
#include <string.h>
#include <errno.h>
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef far
#undef powerpc
#undef unix
#define nimfr_(x, y)
#define nimln_(x, y)
typedef struct NimStrPayload NimStrPayload;
typedef struct NimStringV2 NimStringV2;
typedef struct tyObject_IOError__Cor9bz0iUPcZott9aVoQ4ibA tyObject_IOError__Cor9bz0iUPcZott9aVoQ4ibA;
typedef struct tyObject_CatchableError__QHwIklH9a7tYMJCLn6AXmMA tyObject_CatchableError__QHwIklH9a7tYMJCLn6AXmMA;
typedef struct Exception Exception;
typedef struct RootObj RootObj;
typedef struct TNimTypeV2 TNimTypeV2;
typedef struct tySequence__ihSUJc89bjbU8suG9cPIwdVA tySequence__ihSUJc89bjbU8suG9cPIwdVA;
typedef struct tySequence__ihSUJc89bjbU8suG9cPIwdVA_Content tySequence__ihSUJc89bjbU8suG9cPIwdVA_Content;
typedef struct tyObject_EOFError__9bRY3cBhanzqecv1fxqFBEQ tyObject_EOFError__9bRY3cBhanzqecv1fxqFBEQ;
typedef struct tyObject_StackTraceEntry__wLfEwrJM9c0Txtub9aqEYwyA tyObject_StackTraceEntry__wLfEwrJM9c0Txtub9aqEYwyA;
struct NimStrPayload {
NI cap;
NIM_CHAR data[SEQ_DECL_SIZE];
};
struct NimStringV2 {
NI len;
NimStrPayload* p;
};
struct TNimTypeV2 {
void* destructor;
NI size;
NI align;
NCSTRING name;
void* traceImpl;
void* typeInfoV1;
NI flags;
};
struct RootObj {
TNimTypeV2* m_type;
};
struct tySequence__ihSUJc89bjbU8suG9cPIwdVA {
  NI len; tySequence__ihSUJc89bjbU8suG9cPIwdVA_Content* p;
};
struct Exception {
  RootObj Sup;
Exception* parent;
NCSTRING name;
NimStringV2 message;
tySequence__ihSUJc89bjbU8suG9cPIwdVA trace;
Exception* up;
};
struct tyObject_CatchableError__QHwIklH9a7tYMJCLn6AXmMA {
  Exception Sup;
};
struct tyObject_IOError__Cor9bz0iUPcZott9aVoQ4ibA {
  tyObject_CatchableError__QHwIklH9a7tYMJCLn6AXmMA Sup;
};
struct tyObject_EOFError__9bRY3cBhanzqecv1fxqFBEQ {
  tyObject_IOError__Cor9bz0iUPcZott9aVoQ4ibA Sup;
};
struct tyObject_StackTraceEntry__wLfEwrJM9c0Txtub9aqEYwyA {
NCSTRING procname;
NI line;
NCSTRING filename;
};


#ifndef tySequence__ihSUJc89bjbU8suG9cPIwdVA_Content_PP
#define tySequence__ihSUJc89bjbU8suG9cPIwdVA_Content_PP
struct tySequence__ihSUJc89bjbU8suG9cPIwdVA_Content { NI cap; tyObject_StackTraceEntry__wLfEwrJM9c0Txtub9aqEYwyA data[SEQ_DECL_SIZE];};
#endif

      N_LIB_PRIVATE N_NOINLINE(void, raiseIndexError2)(NI i, NI n);
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringV2 s);
N_LIB_PRIVATE N_NOINLINE(void, raiseOverflow)(void);
N_NIMCALL(NimStringV2, rawNewString)(NI cap);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, readLine__systemZio_259)(FILE* f, NimStringV2* line);
N_LIB_PRIVATE N_NOINLINE(void, raiseRangeErrorI)(NI64 i, NI64 a, NI64 b);
N_LIB_PRIVATE N_NIMCALL(void, setLengthStrV2)(NimStringV2* s, NI newLen);
static N_INLINE(void, nimPrepareStrMutationV2)(NimStringV2* s);
N_LIB_PRIVATE N_NIMCALL(void, nimPrepareStrMutationImpl__system_2312)(NimStringV2* s);
static N_INLINE(NIM_BOOL, eqeq___system_6481)(NCSTRING x, NCSTRING y);
N_LIB_PRIVATE N_NIMCALL(void, checkErr__systemZio_153)(FILE* f);
static N_INLINE(void, appendString)(NimStringV2* dest, NimStringV2 src);
static N_INLINE(void, copyMem__system_1709)(void* dest, void* source, NI size);
static N_INLINE(void, nimCopyMem)(void* dest, void* source, NI size);
N_LIB_PRIVATE N_NIMCALL(NimStringV2, dollar___systemZdollars_3)(NI x);
N_LIB_PRIVATE N_NIMCALL(NimStringV2, cstrToNimstr)(NCSTRING str);
N_LIB_PRIVATE N_NOINLINE(void, raiseEIO__systemZio_96)(NimStringV2 msg);
N_LIB_PRIVATE N_NIMCALL(void*, nimNewObj)(NI size, NI alignment);
N_LIB_PRIVATE N_NIMCALL(void, raiseExceptionEx)(Exception* e, NCSTRING ename, NCSTRING procname, NCSTRING filename, NI line);
N_LIB_PRIVATE N_NIMCALL(void, eqdestroy___system_2636)(NimStringV2* dest);
static N_INLINE(NIM_BOOL*, nimErrorFlag)(void);
N_LIB_PRIVATE N_NOINLINE(void, raiseEOF__systemZio_123)(void);
static const struct {
  NI cap; NIM_CHAR data[7+1];
} TM__MnCJ0VAmeZ9aTATUB39cx60Q_5 = { 7 | NIM_STRLIT_FLAG, "errno: " };
static const NimStringV2 TM__MnCJ0VAmeZ9aTATUB39cx60Q_6 = {7, (NimStrPayload*)&TM__MnCJ0VAmeZ9aTATUB39cx60Q_5};
static const struct {
  NI cap; NIM_CHAR data[2+1];
} TM__MnCJ0VAmeZ9aTATUB39cx60Q_9 = { 2 | NIM_STRLIT_FLAG, " `" };
static const NimStringV2 TM__MnCJ0VAmeZ9aTATUB39cx60Q_10 = {2, (NimStrPayload*)&TM__MnCJ0VAmeZ9aTATUB39cx60Q_9};
static const struct {
  NI cap; NIM_CHAR data[1+1];
} TM__MnCJ0VAmeZ9aTATUB39cx60Q_11 = { 1 | NIM_STRLIT_FLAG, "`" };
static const NimStringV2 TM__MnCJ0VAmeZ9aTATUB39cx60Q_12 = {1, (NimStrPayload*)&TM__MnCJ0VAmeZ9aTATUB39cx60Q_11};
extern TNimTypeV2 NTIv2__Cor9bz0iUPcZott9aVoQ4ibA_;
extern TNimTypeV2 NTIv2__9bRY3cBhanzqecv1fxqFBEQ_;
static const struct {
  NI cap; NIM_CHAR data[11+1];
} TM__MnCJ0VAmeZ9aTATUB39cx60Q_24 = { 11 | NIM_STRLIT_FLAG, "EOF reached" };
static const NimStringV2 TM__MnCJ0VAmeZ9aTATUB39cx60Q_25 = {11, (NimStrPayload*)&TM__MnCJ0VAmeZ9aTATUB39cx60Q_24};
extern NIM_BOOL nimInErrorMode__system_3487;
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringV2 s) {
	NCSTRING result;
	result = (NCSTRING)0;
	{
		if (!(s.len == ((NI) 0))) goto LA3_;
		result = "";
	}
	goto LA1_;
	LA3_: ;
	{
		result = ((NCSTRING) ((*s.p).data));
	}
	LA1_: ;
	return result;
}
N_LIB_PRIVATE N_NIMCALL(void, echoBinSafe)(NimStringV2* args, NI argsLen_0) {
	size_t T5_;
	int T6_;
{	flockfile(stdout);
	{
		NimStringV2* s;
		NI i;
		s = (NimStringV2*)0;
		i = ((NI) 0);
		{
			while (1) {
				size_t T4_;
				NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_2;
				if (!(i < argsLen_0)) goto LA3;
				if (i < 0 || i >= argsLen_0){ raiseIndexError2(i,argsLen_0-1); goto BeforeRet_;
}
				s = (&args[i]);
				T4_ = (size_t)0;
				T4_ = fwrite(((void*) (nimToCStringConv((*s)))), ((size_t) ((*s).len)), ((size_t) 1), stdout);
				(void)(T4_);
				if (nimAddInt(i, ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_2)) { raiseOverflow(); goto BeforeRet_;
};
				i = (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_2);
			} LA3: ;
		}
	}
	T5_ = (size_t)0;
	T5_ = fwrite(((void*) ("\012")), ((size_t) 1), ((size_t) 1), stdout);
	(void)(T5_);
	T6_ = (int)0;
	T6_ = fflush(stdout);
	(void)(T6_);
	funlockfile(stdout);
	}BeforeRet_: ;
}
static N_INLINE(void, nimPrepareStrMutationV2)(NimStringV2* s) {
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = !(((*s).p == ((NimStrPayload*) NIM_NIL)));
		if (!(T3_)) goto LA4_;
		T3_ = ((NI)((*(*s).p).cap & ((NI) IL64(4611686018427387904))) == ((NI) IL64(4611686018427387904)));
		LA4_: ;
		if (!T3_) goto LA5_;
		nimPrepareStrMutationImpl__system_2312(s);
	}
	LA5_: ;
}
static N_INLINE(NIM_BOOL, eqeq___system_6481)(NCSTRING x, NCSTRING y) {
	NIM_BOOL result;
	result = (NIM_BOOL)0;
	{
		if (!(((void*) (x)) == ((void*) (y)))) goto LA3_;
		result = NIM_TRUE;
	}
	goto LA1_;
	LA3_: ;
	{
		NIM_BOOL T6_;
		T6_ = (NIM_BOOL)0;
		T6_ = (x == 0);
		if (T6_) goto LA7_;
		T6_ = (y == 0);
		LA7_: ;
		if (!T6_) goto LA8_;
		result = NIM_FALSE;
	}
	goto LA1_;
	LA8_: ;
	{
		int T11_;
		T11_ = (int)0;
		T11_ = strcmp(x, y);
		result = (T11_ == ((NI32) 0));
	}
	LA1_: ;
	return result;
}
static N_INLINE(void, nimCopyMem)(void* dest, void* source, NI size) {
	void* T1_;
	T1_ = (void*)0;
	T1_ = memcpy(dest, source, ((size_t) (size)));
}
static N_INLINE(void, copyMem__system_1709)(void* dest, void* source, NI size) {
	nimCopyMem(dest, source, size);
}
static N_INLINE(void, appendString)(NimStringV2* dest, NimStringV2 src) {
{	{
		NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_7;
		NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_8;
		if (!(((NI) 0) < src.len)) goto LA3_;
		if (nimAddInt(src.len, ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_7)) { raiseOverflow(); goto BeforeRet_;
};
		if (((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_7)) < ((NI) 0) || ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_7)) > ((NI) IL64(9223372036854775807))){ raiseRangeErrorI((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_7), ((NI) 0), ((NI) IL64(9223372036854775807))); goto BeforeRet_;
}
		copyMem__system_1709(((void*) ((&(*(*dest).p).data[(*dest).len]))), ((void*) ((&(*src.p).data[((NI) 0)]))), ((NI) ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_7))));
		if (nimAddInt((*dest).len, src.len, &TM__MnCJ0VAmeZ9aTATUB39cx60Q_8)) { raiseOverflow(); goto BeforeRet_;
};
		(*dest).len = (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_8);
	}
	LA3_: ;
	}BeforeRet_: ;
}
static N_INLINE(NIM_BOOL*, nimErrorFlag)(void) {
	NIM_BOOL* result;
	result = (NIM_BOOL*)0;
	result = (&nimInErrorMode__system_3487);
	return result;
}
N_LIB_PRIVATE N_NOINLINE(void, raiseEIO__systemZio_96)(NimStringV2 msg) {
	tyObject_IOError__Cor9bz0iUPcZott9aVoQ4ibA* T2_;
	NimStringV2 blitTmp;
NIM_BOOL* nimErr_;
{nimErr_ = nimErrorFlag();
	T2_ = NIM_NIL;
	T2_ = (tyObject_IOError__Cor9bz0iUPcZott9aVoQ4ibA*) nimNewObj(sizeof(tyObject_IOError__Cor9bz0iUPcZott9aVoQ4ibA), NIM_ALIGNOF(tyObject_IOError__Cor9bz0iUPcZott9aVoQ4ibA));
	(*T2_).Sup.Sup.Sup.m_type = (&NTIv2__Cor9bz0iUPcZott9aVoQ4ibA_);
	(*T2_).Sup.Sup.name = "IOError";
	blitTmp = msg;
	msg.len = 0; msg.p = NIM_NIL;
	(*T2_).Sup.Sup.message = blitTmp;
	(*T2_).Sup.Sup.parent = ((Exception*) NIM_NIL);
	raiseExceptionEx((Exception*)T2_, "IOError", "raiseEIO", "io.nim", 153);
	goto LA1_;
	{
		LA1_:;
	}
	{
		eqdestroy___system_2636((&msg));
	}
	if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
	}BeforeRet_: ;
}
N_LIB_PRIVATE N_NIMCALL(void, checkErr__systemZio_153)(FILE* f) {
NIM_BOOL* nimErr_;
{nimErr_ = nimErrorFlag();
	{
		int T3_;
		NimStringV2 msg;
		NimStringV2 colontmpD_;
		NimStringV2 colontmpD__2;
		NimStringV2 T7_;
		NCSTRING T8_;
		NimStringV2 blitTmp;
		T3_ = (int)0;
		T3_ = ferror(f);
		if (!!((T3_ == ((NI32) 0)))) goto LA4_;
		msg.len = 0; msg.p = NIM_NIL;
		colontmpD_.len = 0; colontmpD_.p = NIM_NIL;
		colontmpD__2.len = 0; colontmpD__2.p = NIM_NIL;
		T7_.len = 0; T7_.p = NIM_NIL;
		colontmpD_ = dollar___systemZdollars_3(((NI) (errno)));
		if (NIM_UNLIKELY(*nimErr_)) goto LA6_;
		T8_ = (NCSTRING)0;
		T8_ = strerror(errno);
		colontmpD__2 = cstrToNimstr(T8_);
		T7_ = rawNewString(colontmpD_.len + colontmpD__2.len + 10);
appendString((&T7_), TM__MnCJ0VAmeZ9aTATUB39cx60Q_6);
appendString((&T7_), colontmpD_);
appendString((&T7_), TM__MnCJ0VAmeZ9aTATUB39cx60Q_10);
appendString((&T7_), colontmpD__2);
appendString((&T7_), TM__MnCJ0VAmeZ9aTATUB39cx60Q_12);
		msg = T7_;
		clearerr(f);
		blitTmp = msg;
		msg.len = 0; msg.p = NIM_NIL;
		raiseEIO__systemZio_96(blitTmp);
		if (NIM_UNLIKELY(*nimErr_)) goto LA6_;
		{
			LA6_:;
		}
		{
			eqdestroy___system_2636((&colontmpD__2));
			eqdestroy___system_2636((&colontmpD_));
			eqdestroy___system_2636((&msg));
		}
		if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
	}
	LA4_: ;
	}BeforeRet_: ;
}
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, readLine__systemZio_259)(FILE* f, NimStringV2* line) {
	NIM_BOOL result;
	NI pos;
	NI sp;
NIM_BOOL* nimErr_;
{nimErr_ = nimErrorFlag();
	result = (NIM_BOOL)0;
	pos = ((NI) 0);
	sp = (((*line).len >= ((NI) 80)) ? (*line).len : ((NI) 80));
	if ((sp) < ((NI) 0) || (sp) > ((NI) IL64(9223372036854775807))){ raiseRangeErrorI(sp, ((NI) 0), ((NI) IL64(9223372036854775807))); goto BeforeRet_;
}
	setLengthStrV2((&(*line)), ((NI) (sp)));
	{
		while (1) {
			NIM_BOOL fgetsSuccess;
			void* m;
			NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_22;
			NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_23;
			{
				NI i;
				NI i_2;
				i = (NI)0;
				i_2 = ((NI) 0);
				{
					while (1) {
						NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_3;
						NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_4;
						if (!(i_2 < sp)) goto LA5;
						i = i_2;
						if (nimAddInt(pos, i, &TM__MnCJ0VAmeZ9aTATUB39cx60Q_3)) { raiseOverflow(); goto BeforeRet_;
};
						if ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_3) < 0 || (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_3) >= (*line).len){ raiseIndexError2((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_3),(*line).len-1); goto BeforeRet_;
}
						nimPrepareStrMutationV2((&(*line)));
						(*line).p->data[(NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_3)] = 10;
						if (nimAddInt(i_2, ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_4)) { raiseOverflow(); goto BeforeRet_;
};
						i_2 = (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_4);
					} LA5: ;
				}
			}
			fgetsSuccess = (NIM_BOOL)0;
			{
				while (1) {
					{
						NCSTRING T9_;
						NIM_BOOL T10_;
						if (pos < 0 || pos >= (*line).len){ raiseIndexError2(pos,(*line).len-1); goto BeforeRet_;
}
						if ((sp) < ((int) (-2147483647 -1)) || (sp) > ((int) 2147483647)){ raiseRangeErrorI(sp, ((int) (-2147483647 -1)), ((int) 2147483647)); goto BeforeRet_;
}
						T9_ = (NCSTRING)0;
						T9_ = fgets(((NCSTRING) ((&(*line).p->data[pos]))), ((int) (sp)), f);
						T10_ = (NIM_BOOL)0;
						T10_ = eqeq___system_6481(T9_, ((NCSTRING) NIM_NIL));
						fgetsSuccess = !(T10_);
						{
							if (!fgetsSuccess) goto LA13_;
							goto LA6;
						}
						LA13_: ;
						{
							if (!(errno == EINTR)) goto LA17_;
							errno = ((int) 0);
							clearerr(f);
							goto LA8;
						}
						LA17_: ;
						checkErr__systemZio_153(f);
						if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
						goto LA6;
					} LA8: ;
				}
			} LA6: ;
			if (pos < 0 || pos >= (*line).len){ raiseIndexError2(pos,(*line).len-1); goto BeforeRet_;
}
			m = memchr(((void*) ((&(*line).p->data[pos]))), ((int) 10), ((size_t) (sp)));
			{
				NI last;
				NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_13;
				NIM_BOOL T42_;
				if (!!((m == NIM_NIL))) goto LA21_;
				if (((NI) 0) < 0 || ((NI) 0) >= (*line).len){ raiseIndexError2(((NI) 0),(*line).len-1); goto BeforeRet_;
}
				if (nimSubInt(((NI) (ptrdiff_t) (m)), ((NI) (ptrdiff_t) ((&(*line).p->data[((NI) 0)]))), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_13)) { raiseOverflow(); goto BeforeRet_;
};
				last = (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_13);
				{
					NIM_BOOL T25_;
					NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_14;
					NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_15;
					NIM_BOOL T29_;
					T25_ = (NIM_BOOL)0;
					T25_ = (((NI) 0) < last);
					if (!(T25_)) goto LA26_;
					if (nimSubInt(last, ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_14)) { raiseOverflow(); goto BeforeRet_;
};
					if ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_14) < 0 || (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_14) >= (*line).len){ raiseIndexError2((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_14),(*line).len-1); goto BeforeRet_;
}
					T25_ = ((NU8)((*line).p->data[(NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_14)]) == (NU8)(13));
					LA26_: ;
					if (!T25_) goto LA27_;
					if (nimSubInt(last, ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_15)) { raiseOverflow(); goto BeforeRet_;
};
					if (((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_15)) < ((NI) 0) || ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_15)) > ((NI) IL64(9223372036854775807))){ raiseRangeErrorI((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_15), ((NI) 0), ((NI) IL64(9223372036854775807))); goto BeforeRet_;
}
					setLengthStrV2((&(*line)), ((NI) ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_15))));
					T29_ = (NIM_BOOL)0;
					T29_ = (((NI) 1) < last);
					if (T29_) goto LA30_;
					T29_ = fgetsSuccess;
					LA30_: ;
					result = T29_;
					goto BeforeRet_;
				}
				goto LA23_;
				LA27_: ;
				{
					NIM_BOOL T32_;
					NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_16;
					T32_ = (NIM_BOOL)0;
					T32_ = (((NI) 0) < last);
					if (!(T32_)) goto LA33_;
					if (nimSubInt(last, ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_16)) { raiseOverflow(); goto BeforeRet_;
};
					if ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_16) < 0 || (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_16) >= (*line).len){ raiseIndexError2((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_16),(*line).len-1); goto BeforeRet_;
}
					T32_ = ((NU8)((*line).p->data[(NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_16)]) == (NU8)(0));
					LA33_: ;
					if (!T32_) goto LA34_;
					{
						NIM_BOOL T38_;
						NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_17;
						NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_18;
						NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_19;
						NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_20;
						T38_ = (NIM_BOOL)0;
						if (nimAddInt(pos, sp, &TM__MnCJ0VAmeZ9aTATUB39cx60Q_17)) { raiseOverflow(); goto BeforeRet_;
};
						if (nimSubInt((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_17), ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_18)) { raiseOverflow(); goto BeforeRet_;
};
						T38_ = ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_18) <= last);
						if (T38_) goto LA39_;
						if (nimAddInt(last, ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_19)) { raiseOverflow(); goto BeforeRet_;
};
						if ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_19) < 0 || (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_19) >= (*line).len){ raiseIndexError2((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_19),(*line).len-1); goto BeforeRet_;
}
						T38_ = !(((NU8)((*line).p->data[(NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_19)]) == (NU8)(0)));
						LA39_: ;
						if (!T38_) goto LA40_;
						if (nimSubInt(last, ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_20)) { raiseOverflow(); goto BeforeRet_;
};
						last = (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_20);
					}
					LA40_: ;
				}
				goto LA23_;
				LA34_: ;
				LA23_: ;
				if ((last) < ((NI) 0) || (last) > ((NI) IL64(9223372036854775807))){ raiseRangeErrorI(last, ((NI) 0), ((NI) IL64(9223372036854775807))); goto BeforeRet_;
}
				setLengthStrV2((&(*line)), ((NI) (last)));
				T42_ = (NIM_BOOL)0;
				T42_ = (((NI) 0) < last);
				if (T42_) goto LA43_;
				T42_ = fgetsSuccess;
				LA43_: ;
				result = T42_;
				goto BeforeRet_;
			}
			goto LA19_;
			LA21_: ;
			{
				NI TM__MnCJ0VAmeZ9aTATUB39cx60Q_21;
				if (nimSubInt(sp, ((NI) 1), &TM__MnCJ0VAmeZ9aTATUB39cx60Q_21)) { raiseOverflow(); goto BeforeRet_;
};
				sp = (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_21);
			}
			LA19_: ;
			if (nimAddInt(pos, sp, &TM__MnCJ0VAmeZ9aTATUB39cx60Q_22)) { raiseOverflow(); goto BeforeRet_;
};
			pos = (NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_22);
			sp = ((NI) 128);
			if (nimAddInt(pos, sp, &TM__MnCJ0VAmeZ9aTATUB39cx60Q_23)) { raiseOverflow(); goto BeforeRet_;
};
			if (((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_23)) < ((NI) 0) || ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_23)) > ((NI) IL64(9223372036854775807))){ raiseRangeErrorI((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_23), ((NI) 0), ((NI) IL64(9223372036854775807))); goto BeforeRet_;
}
			setLengthStrV2((&(*line)), ((NI) ((NI)(TM__MnCJ0VAmeZ9aTATUB39cx60Q_23))));
		}
	}
	}BeforeRet_: ;
	return result;
}
N_LIB_PRIVATE N_NOINLINE(void, raiseEOF__systemZio_123)(void) {
	tyObject_EOFError__9bRY3cBhanzqecv1fxqFBEQ* T1_;
{	T1_ = NIM_NIL;
	T1_ = (tyObject_EOFError__9bRY3cBhanzqecv1fxqFBEQ*) nimNewObj(sizeof(tyObject_EOFError__9bRY3cBhanzqecv1fxqFBEQ), NIM_ALIGNOF(tyObject_EOFError__9bRY3cBhanzqecv1fxqFBEQ));
	(*T1_).Sup.Sup.Sup.Sup.m_type = (&NTIv2__9bRY3cBhanzqecv1fxqFBEQ_);
	(*T1_).Sup.Sup.Sup.name = "EOFError";
	(*T1_).Sup.Sup.Sup.message = TM__MnCJ0VAmeZ9aTATUB39cx60Q_25;
	(*T1_).Sup.Sup.Sup.parent = ((Exception*) NIM_NIL);
	raiseExceptionEx((Exception*)T1_, "EOFError", "raiseEOF", "io.nim", 156);
	goto BeforeRet_;
	}BeforeRet_: ;
}
N_LIB_PRIVATE N_NIMCALL(NimStringV2, readLine__systemZio_292)(FILE* f) {
	NimStringV2 result;
NIM_BOOL* nimErr_;
{nimErr_ = nimErrorFlag();
	result.len = 0; result.p = NIM_NIL;
	result = rawNewString(((NI) 80));
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = readLine__systemZio_259(f, (&result));
		if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
		if (!!(T3_)) goto LA4_;
		raiseEOF__systemZio_123();
		if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
	}
	LA4_: ;
	}BeforeRet_: ;
	return result;
}
