Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7D44123B51
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 01:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfLRAHf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 19:07:35 -0500
Received: from sonic309-22.consmr.mail.ne1.yahoo.com ([66.163.184.148]:37522
        "EHLO sonic309-22.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726141AbfLRAHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 19:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1576627653; bh=wDHiYsI7anl5inNS7Ya4ER7/hspcQc6O4dRGtpCnQIo=; h=Date:From:To:Cc:Subject:References:From:Subject; b=OGsB3kd0M3PqmO4oBiz0BDGbabxdEO1qSkr0Rky5bfaoK4n0E4KNuM8Sq302/AJAK9whv0NORcZ69hZeTkpPQB9xo/HpHQ/hBr2cf7wt3tcRN+dSgf2IjuLw6hBVWL9xn2NfldY9MpuK4LOBIA6iozotUWrnMbmwccjtUOuUKx05jhdvvO5FszSbFUBXzR9PyysI/sH8R4wAr/fCRLKopGdc5+f9ybqYaRf9f2TE5NFGCLtowsiDe4rkWeD5qMRZVvDvIsn+A8iLUp/v7jdFOlk91P4GNjcXFNFGvBDpDBtcasfA2ttjIsFCgyuyZy2b0NkdYXwZd+6xFmqojFh9aw==
X-YMail-OSG: _5aw1hgVM1kV5m8.ETmsOHMv6win84nqvh8ewT8T5kTBoUWELGCWiOJ0NiZVpO1
 K0e_TpIFQVKeDjPA3dA_Tq_W8JQvzGatdsCEC69eDcSw5cbjQL9B6uSWhZTZdqbcAuriq6Mmpv7E
 6nzatAX3HB72PF5yH2w8jmGw9xppSQj2lxxMTzQnvhfhgGEfIL6GRol0HoKi4f3tk2wo9b44r7Sa
 mj4mM03..ZsyYqfpLpDu8eVhQFhjiiSRu8DeMErNKHxF9w7QjH4ycnEh3UX_7CsCUFlEKecWRmWd
 hN4YKtrqOreCbySV8SoYvstIKXwdKvXeqoCDHEgKmR3lj13PyWKaEGe4aVF_ZPlUE9C9XI6ioFEc
 7pFLnKQIl7_uqpBkN.lQLPs_q2Rj4n_6mo2dbuqzdu5m2YP4hw6yhxy3RAecttgO126.uV3s3HDC
 n0TO33gYyAvw0WdcjFvtkkafRpdVmPl7rN.xMNTrbqawLL0aHcFdA7qN1IlTqDjWkIJh5UuUG7Z3
 .1m8pD9M_RnHt7DJdLo6bU.7ikuJ1vGJqgISa2ITwuM0FCs7OxVzIYNvJad5j3ph5PW7hqoHV.Lo
 aSULxLEFjfhBLHVaPlvbtFxKQzrNEJlZSPfbsS3KnAjqiew5BpMcf3DaiGDTcRRXenX.iAnYnZLd
 UBoskCYCfT73Le_gI3jN2gj6pVf6j6hpAPwYDgRkKLriEOJUmqkvOfM09MQP2lVvl5MTBXSKMYq8
 6HdDoHw9ZZFtLnaCX8eLbWirwQGP0Vzoqz.O0WOxudT_qYXMIDaDxDYcvHBiLnQsxLigFlozssyM
 TQqfyyXROMYVYXbKAexxlHIXzNUVhHoE0wrO97Q_1.9r92oNODD7_RrucDQkUwuMViU_9ERLi2PC
 FH65.wP.jOKZCHps5233GTRmIwgzCoyb4_d3MKxlBtxC33R3oF4BBqdc2TQeqz.df4RnVxUMmG5Y
 WTfCXWDz7W91CFgkOScUKfVM4RWmIbpFvpyBXVcK_.dmfiCkCXlJLBpJyMTgHwayENLFk5UccnyI
 12I391fE5iqEJ6IbR2Vvr99qmXiAbpleX2jJC03srDCdCDQ.AhcxUXSW3rnArWFsMzgWoKKv3IEh
 DuQwxBW1iDQt9JLfv2EVU7r_b0MI73PuDvjSqKl7Qa2o6dJu13AOOpmGu30M9ibdGZHhzDl3A0Nr
 oDWcvUbhjXX9I9FaBF1da8sGFmCtJEGnqPy.YHMP2qOclJ7qpB7iihvPUjm6eTasHwByz_uqc6go
 D4TmkXx320zH_dJFscP.51yJCyhGJbjylgSEYb8IxzqoD0VDHKAdIUbFQ0rbUcqLsC90-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Wed, 18 Dec 2019 00:07:33 +0000
Date:   Wed, 18 Dec 2019 00:07:32 +0000 (UTC)
From:   Karl Nasrallah <knnspeed@aol.com>
To:     dalias@libc.org
Cc:     kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        ysato@users.sourceforge.jp, linux-sh@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Message-ID: <339916914.636876.1576627652112@mail.yahoo.com>
Subject: Re: can someone solve string_32.h issue for SH ?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <339916914.636876.1576627652112.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14873 aolwebmail Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rich,

Thanks for the feedback. I've amended (and tested) it in two possible ways:

First:

static inline char *strncpy(char *__dest, const char *__src, size_t __n)
{
=09char * retval =3D __dest;
=09const char * __dest_end =3D __dest + __n - 1;
=09register unsigned int * r0_register __asm__ ("r0");

=09/* size_t is always unsigned */
=09if(__n =3D=3D 0)
=09{
=09=09return retval;
=09}

=09/*
=09 * Some notes:
=09 * - cmp/eq #imm8,r0 is its own instruction
=09 * - incrementing dest and comparing to dest_end handles the size parame=
ter in only one instruction
=09 * - mov.b R0,@Rn+ is SH2A only, but we can fill a delay slot with "add =
#1,%[dest]"
=09 */

=09__asm__ __volatile__ (
=09=09=09=09=09"strncpy_start:\n\t"
=09=09=09=09=09=09=09"mov.b @%[src]+,%[r0_reg]\n\t"
=09=09=09=09=09=09=09"cmp/eq #0,%[r0_reg]\n\t"
=09=09=09=09=09=09=09"bt.s strncpy_pad\n\t"
=09=09=09=09=09=09=09"cmp/eq %[dest],%[dest_end]\n\t"
=09=09=09=09=09=09=09"bt.s strncpy_end\n\t"
=09=09=09=09=09=09=09"mov.b %[r0_reg],@%[dest]\n\t"
=09=09=09=09=09=09=09"bra strncpy_start\n\t"
=09=09=09=09=09=09=09"add #1,%[dest]\n\t"
=09=09=09=09=09"strncpy_pad:\n\t"
=09=09=09=09=09=09=09"bt.s strncpy_end\n\t"
=09=09=09=09=09=09=09"mov.b %[r0_reg],@%[dest]\n\t"
=09=09=09=09=09=09=09"add #1,%[dest]\n\t"
=09=09=09=09=09=09=09"bra strncpy_pad\n\t"
=09=09=09=09=09=09=09"cmp/eq %[dest],%[dest_end]\n\t"
=09=09=09=09=09"strncpy_end:\n\t"
=09=09: [src] "+r" (__src), [dest] "+r" (__dest), [r0_reg] "+&z" (r0_regist=
er)
=09=09: [dest_end] "r" (__dest_end)
=09=09: "t","memory"
=09);

=09return retval;
}

Second:

static inline char *sh_strncpy(char *__dest, const char *__src, size_t __n)
{
=09char * retval =3D __dest;
=09const char * __dest_end =3D __dest + __n - 1;

=09/* size_t is always unsigned */
=09if(__n =3D=3D 0)
=09{
=09=09return retval;
=09}

=09/*
=09 * Some notes:
=09 * - cmp/eq #imm8,r0 is its own instruction
=09 * - incrementing dest and comparing to dest_end handles the size parame=
ter in only one instruction
=09 * - mov.b R0,@Rn+ is SH2A only, but we can fill a delay slot with "add =
#1,%[dest]"
=09 */

=09__asm__ __volatile__ (
=09=09=09=09=09"strncpy_start:\n\t"
=09=09=09=09=09=09=09"mov.b @%[src]+,r0\n\t"
=09=09=09=09=09=09=09"cmp/eq #0,r0\n\t"
=09=09=09=09=09=09=09"bt.s strncpy_pad\n\t"
=09=09=09=09=09=09=09"cmp/eq %[dest],%[dest_end]\n\t"
=09=09=09=09=09=09=09"bt.s strncpy_end\n\t"
=09=09=09=09=09=09=09"mov.b r0,@%[dest]\n\t"
=09=09=09=09=09=09=09"bra strncpy_start\n\t"
=09=09=09=09=09=09=09"add #1,%[dest]\n\t"
=09=09=09=09=09"strncpy_pad:\n\t"
=09=09=09=09=09=09=09"bt.s strncpy_end\n\t"
=09=09=09=09=09=09=09"mov.b r0,@%[dest]\n\t"
=09=09=09=09=09=09=09"add #1,%[dest]\n\t"
=09=09=09=09=09=09=09"bra strncpy_pad\n\t"
=09=09=09=09=09=09=09"cmp/eq %[dest],%[dest_end]\n\t"
=09=09=09=09=09"strncpy_end:\n\t"
=09=09: [src] "+r" (__src), [dest] "+r" (__dest)
=09=09: [dest_end] "r" (__dest_end)
=09=09: "r0","t","memory"
=09);

=09return retval;
}

I assume that a "memory" clobber would also be appropriate here?

I was unaware that explicitly using a register in extended asm meant that i=
t would need to be listed in the clobber list or otherwise reserved. Guess =
I've been doing it wrong for a while!

By the way, thank you for adding -static-pie to GCC & binutils. It's been i=
ncredibly useful in writing bare-metal code for x86!
-Karl

-----Original Message-----
From: Rich Felker <dalias@libc.org>
To: Karl Nasrallah <knnspeed@aol.com>
Cc: kuninori.morimoto.gx <kuninori.morimoto.gx@renesas.com>; geert <geert@l=
inux-m68k.org>; ysato <ysato@users.sourceforge.jp>; linux-sh <linux-sh@vger=
.kernel.org>; linux-renesas-soc <linux-renesas-soc@vger.kernel.org>
Sent: Tue, Dec 17, 2019 6:13 pm
Subject: Re: can someone solve string_32.h issue for SH ?

On Tue, Dec 17, 2019 at 10:16:28PM +0000, Karl Nasrallah wrote:
> Hello!
>=20
> I have a strncpy for you.
>=20
> static inline char *strncpy(char *__dest, const char *__src, size_t __n)
> {
> =C2=A0=C2=A0=C2=A0 char * retval =3D __dest;
> =C2=A0=C2=A0=C2=A0 const char * __dest_end =3D __dest + __n - 1;
>=20
> =C2=A0=C2=A0=C2=A0 // size_t is always unsigned
> =C2=A0=C2=A0=C2=A0 if(__n =3D=3D 0)
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return retval;
> =C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0 __asm__ __volatile__ (
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 "strncpy_start:\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "mov.b @%[src]=
+,r0\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "cmp/eq #0,r0\=
n\t" // cmp/eq #imm8,r0 is its own instruction
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "bt.s strncpy_=
pad\n\t" // Done with the string
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "cmp/eq %[dest=
],%[dest_end]\n\t" // This takes care of the size parameter in only one ins=
truction ;)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "bt.s strncpy_=
end\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "mov.b r0,@%[d=
est]\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "bra strncpy_s=
tart\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "add #1,%[dest=
]\n\t" // mov.b R0,@Rn+ is SH2A only, but we can fill the delay slot with t=
he offset
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 "strncpy_pad:\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "bt.s strncpy_=
end\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "mov.b r0,@%[d=
est]\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "add #1,%[dest=
]\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "bra strncpy_p=
ad\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "cmp/eq %[dest=
],%[dest_end]\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 "strncpy_end:\n\t" // All done
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : [src] "+r" (__src), [dest] "+r" (=
__dest)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : [dest_end] "r" (__dest_end)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : "t"
> =C2=A0=C2=A0=C2=A0 );
>=20
> =C2=A0=C2=A0=C2=A0 return retval;
> }
>=20
> Tested with sh4-elf-gcc 9.2.0 on a real SH7750/SH7750R-compatible
> system. No warnings, behaves exactly as per linux (dot) die (dot)
> net/man/3/strncpy and I optimized it with some tricks I devised from
> writing extremely optimized x86. If there are any doubts as to the
> authenticity, note that I am the sole author of this project: github
> (dot) com/KNNSpeed/AVX-Memmove

You're using r0 explicitly in the asm but I don't see where you're
reserving it for your use. You need it either on the clobbers or bound
to a dummy output with earlyclobber.


Rich

