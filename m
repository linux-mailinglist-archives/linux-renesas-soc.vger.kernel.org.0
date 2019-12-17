Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31F8123934
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 23:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbfLQWQb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 17:16:31 -0500
Received: from sonic307-10.consmr.mail.ne1.yahoo.com ([66.163.190.33]:40056
        "EHLO sonic307-10.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725805AbfLQWQa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 17:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1576620989; bh=BGLX1CLynx8QVQggMrMYgwbA4nVLitJWFEU19vNB8EM=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=aQP5HF65WE0T4HGS9OAYaJo/nV/3D5PqQsil1bM0xB0NzZ6Xj4FgbsztcqnLxBsA+k1rPtPgZQdDVKR6N9xckCFMVlI52GjRfKSmkxrSVKJQdn1rmHaJ9EumTD7aoelYACdJ2QN3eCEGvSY/c0tfQR8zWI7pPQgbCfex3S1qQ64Wa5XXR6ksc0vrx51or6/3QbfUKklG05OxAfVWOdW6QtILFHgA8JZGPyYcgORouEVdA+jVwDh80RS+fF9rZD3OZJ2bOxXEdKF/kZfnRaIgvOhwNJ5xB6En5L+VSGw7XaJEg7cTuL8H0MQxdxhcU+6TMn3fPcLOBJQDEZ3H7bMw3g==
X-YMail-OSG: 4xVIBzcVM1mc2N6ACCvMDbw8i1NkS01R83iEOvDJejTe8Tic7eiHnFJ0imagDMF
 uBen6s7WsyLvpVvQWuZG6mQRtDcWr2lU_VVpz7RCY4XU7fF0LsTgn2TcromzsjycxtRmhNDmStLj
 VMK3jvNOEzHKssGHbQZG..JHg4PmowhU1y7qwJW64xAGwpUsR8gdq786P4YIWV3dnyU2i5Fh1nId
 vJAxwTC_bbJE3L17IUgQ5839p1h.CYi2MOVpXfMIPcSiIwhBu.wy1ok9T.J9ogdCpfGlvTF9E7_2
 8j268ZEeTCKFdPy_P_ERBBCC4slOHuBQTn3HRHM0T_LMaO0S8tYzj_u8D4xNHVMc.1tDI_AqoEA0
 3V520dB.p7xVfX5KUj6w0Qed1iPqbCH.q0mxvuS7RnFfQJ0kzMemscvROd4DhpUrKh4iJrjvfzw0
 xLUVPbU4tFzudnWZ05eMXC23Qg._PXcCuPwgYQgXwksgQpiEU586uKx_5In4MawRI3O6kUPgPl_Y
 hFGPbAFoe4jHC1edUtCXw8FI1sO_fq6wa.zgbBAKTTgwHDxd9G4xjTO87ObQ80jfyr7Vdo4W.tfo
 OKRswVDPyU8DUPW42znlNjtB5PVQUCbbtlU.MRbLuhma6AWcbWTlD5uE4ZPgKyU1bxja.T64kRab
 0x6NM_CNRbgkThro1k7AZOUXGsEiDCUnsvUM2myzkiiFOidKHPDrQaQpoGSEmLfMtxGDEd5Cjgbi
 SWua7FZztyOafjLUq2441MjkKYAU.Bv4MznO97O5z80u3wjyiUKPNOmidtPY794h2oGUXJlqrjzn
 4vq3tH6JCKwW991Nh32961k_OaRUtDnxdfvoRg6RQMbedSWhhRPM1hbUMOMWBMCgKr9LrfwqcdNI
 cPtMlprjbisoejljpJP9nzvFAUQ1sIRksctgUz5hjWClMiApW4dYYBqitRwiSR4r9nzxc9QGNXUB
 M51fD5JTIleaM_KKorM9odl6lVHq6xIRb84h_oZZuxDdCqEPQmN5i77.0YSXPHAyu39jOKY.PCHA
 _nl8TGRQtUNZhZoPgTNhbupL2mKePts8VNvulQwoU1WIYVLAiFcBf4jFxfAcfqgAROTuI6vgYthV
 F28sXaKK4frLD2Zbni8Tpe420tcPoC7IRWYcUYq5niMn9T2v204bVvBcJu6O716q4eam0vH2oS6Z
 BdLjADmV2LeDiX7NjfCdsVkBPwAk.5UMx5vSE_YoUW64RuhI8Bt57r1mRYXs2whVqUodobmFLONv
 LQkD27PzzZVTtkEikiSmc10mZyuGO8vbRHlxjq6x1xbWsBR3JiewBoveVgMT0UFGqrGnyCoo-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Dec 2019 22:16:29 +0000
Date:   Tue, 17 Dec 2019 22:16:28 +0000 (UTC)
From:   Karl Nasrallah <knnspeed@aol.com>
To:     kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org
Cc:     ysato@users.sourceforge.jp, dalias@libc.org,
        linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <1933127148.546436.1576620988364@mail.yahoo.com>
In-Reply-To: <1850003495.209647.1576573784839@mail.yahoo.com>
References: <87h81zh4ap.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUHGXkmKrcZVNQo8nOcGo0h6xYgjZ+XmfGy6bJCPK9ZwQ@mail.gmail.com> <CAMuHMdUc4yyXsp4Y4Xx==3mUMrUn5DO8G-rLA_Mnv-790n6Ehg@mail.gmail.com> <871rt3gwri.wl-kuninori.morimoto.gx@renesas.com> <1850003495.209647.1576573784839@mail.yahoo.com>
Subject: Re: can someone solve string_32.h issue for SH ?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.14873 aolwebmail Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

I have a strncpy for you.

static inline char *strncpy(char *__dest, const char *__src, size_t __n)
{
=09char * retval =3D __dest;
=09const char * __dest_end =3D __dest + __n - 1;

=09// size_t is always unsigned
=09if(__n =3D=3D 0)
=09{
=09=09return retval;
=09}

=09__asm__ __volatile__ (
=09=09=09=09=09"strncpy_start:\n\t"
=09=09=09=09=09=09=09"mov.b @%[src]+,r0\n\t"
=09=09=09=09=09=09=09"cmp/eq #0,r0\n\t" // cmp/eq #imm8,r0 is its own instr=
uction
=09=09=09=09=09=09=09"bt.s strncpy_pad\n\t" // Done with the string
=09=09=09=09=09=09=09"cmp/eq %[dest],%[dest_end]\n\t" // This takes care of=
 the size parameter in only one instruction ;)
=09=09=09=09=09=09=09"bt.s strncpy_end\n\t"
=09=09=09=09=09=09=09"mov.b r0,@%[dest]\n\t"
=09=09=09=09=09=09=09"bra strncpy_start\n\t"
=09=09=09=09=09=09=09"add #1,%[dest]\n\t" // mov.b R0,@Rn+ is SH2A only, bu=
t we can fill the delay slot with the offset
=09=09=09=09=09"strncpy_pad:\n\t"
=09=09=09=09=09=09=09"bt.s strncpy_end\n\t"
=09=09=09=09=09=09=09"mov.b r0,@%[dest]\n\t"
=09=09=09=09=09=09=09"add #1,%[dest]\n\t"
=09=09=09=09=09=09=09"bra strncpy_pad\n\t"
=09=09=09=09=09=09=09"cmp/eq %[dest],%[dest_end]\n\t"
=09=09=09=09=09"strncpy_end:\n\t" // All done
=09=09: [src] "+r" (__src), [dest] "+r" (__dest)
=09=09: [dest_end] "r" (__dest_end)
=09=09: "t"
=09);

=09return retval;
}

Tested with sh4-elf-gcc 9.2.0 on a real SH7750/SH7750R-compatible system. N=
o warnings, behaves exactly as per linux (dot) die (dot) net/man/3/strncpy =
and I optimized it with some tricks I devised from writing extremely optimi=
zed x86. If there are any doubts as to the authenticity, note that I am the=
 sole author of this project: github (dot) com/KNNSpeed/AVX-Memmove

Hope this helps!
-Karl

(P.S. Consider this code public domain. If for whatever reason that doesn't=
 fly, then I give the Linux kernel community explicit permission to use it =
as they see fit.)

-----Original Message-----
From: Karl Nasrallah <knnspeed@aol.com>
To: kuninori.morimoto.gx <kuninori.morimoto.gx@renesas.com>; geert <geert@l=
inux-m68k.org>
Cc: ysato <ysato@users.sourceforge.jp>; dalias <dalias@libc.org>; linux-sh =
<linux-sh@vger.kernel.org>; linux-renesas-soc <linux-renesas-soc@vger.kerne=
l.org>
Sent: Tue, Dec 17, 2019 4:09 am
Subject: Re: can someone solve string_32.h issue for SH ?


Hello,

Give me a day or so and I can do the following things:

1) Write you all a brand new standards-conforming strncpy in SH4 asm like t=
his that is easier to read
2) Compile it with sh4-elf-GCC 9.2
3) Test it on a real SH4 (SH7750/SH7750R-like)=20

The warning, if it shows up in my test, would likely then be a GCC thing--I=
 have an idea of what it's doing, but I'll be sure after that.
Unfortunately it's 4AM here on the other side of the world right now...
-Karl



-----Original Message-----
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>; Rich Felker <dalias@libc.o=
rg>; Linux-SH <linux-sh@vger.kernel.org>; Linux-Renesas <linux-renesas-soc@=
vger.kernel.org>
Sent: Tue, Dec 17, 2019 3:51 am
Subject: Re: can someone solve string_32.h issue for SH ?



Hi Geert
Cc Yoshinori-san

> > --- a/arch/sh/include/asm/string_32.h
> > +++ b/arch/sh/include/asm/string_32.h
> > @@ -40,15 +40,15 @@ static inline char *strncpy(char *__dest, const
> > char *__src, size_t __n)
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 __asm__ __volatile__(
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 "1:\n"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 "mov.b=C2=
=A0 @%1+, %2\n\t"
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 "mov.b=C2=A0 %2=
, @%0\n\t"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 "mov.b=C2=A0 %2=
, @%0+\n\t"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 "cmp/eq #0=
, %2\n\t"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 "bt/s=C2=
=A0=C2=A0 2f\n\t"
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 " cmp/eq=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 %5,%1\n\t"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 " cmp/eq=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 %5,%0\n\t"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 "bf/s=C2=
=A0=C2=A0 1b\n\t"
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 " add=C2=A0=C2=
=A0 #1, %0\n"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 " nop\n"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 "2:"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 : "=3Dr" (=
__dest), "=3Dr" (__src), "=3D&z" (__dummy)
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 : "0" (__dest),=
 "1" (__src), "r" (__src+__n)
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 : "0" (__dest),=
 "1" (__src), "r" (__dest+__n)
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 : "memory"=
, "t");
> >
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 return __xdest;
> >
> > Does this make sense?
> > Can it be improved, by putting something useful in the delay slot?
>=20
> BTW, there seems to be a serious security issue with this strncpy()
> implementation: while it never writes more than n bytes in the
> destination buffer, it doesn't pad the destination buffer with zeroes if
> the source string is shorter than the buffer size.=C2=A0 This will leak
> data.

Yeah...
I can only do is "Reporting issue" to SH ML, unfortunately...

Thank you for your help !!
Best regards

---
Kuninori Morimoto

