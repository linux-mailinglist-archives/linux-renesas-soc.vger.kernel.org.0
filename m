Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA3E3123E28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 04:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfLRD4G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 22:56:06 -0500
Received: from sonic302-20.consmr.mail.ne1.yahoo.com ([66.163.186.146]:38690
        "EHLO sonic302-20.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726454AbfLRD4F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 22:56:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1576641364; bh=4BwB++bD5VfFZKTliBHkaMvpSnyzxdPPN6Ewh7w1Sjo=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=d5lX73UtBsWhi/9FW+he4jB6pV3CDvDjNYS+xgOFBFEkFuwDNEGbGi4Mo/YWWGtQylHRUq+G65DwaabV1CW2atm6OdeyLSxym5bEk8mKG/O6SDd4a82Kf56q9U8D8GrrosvT2jAgBnLxFXYglN9slnMP72hBLrsyANTs/DBNWmOZVtYWg9w6TdFe+K4VgHiGRtEvE7gG3B/1e/Mcq12r1vOnxKfgANXHQHO6oERIA7OwXntEfe+9bEwyhnHCAYz4kximsC34jzvcp8NenkwPs3UvLenFWbiSb0KBmGM0MHzFg0azu3dN5pSN1CZKIJAf12Ou3xLIGLmb9cjSMYKGdA==
X-YMail-OSG: jDXrU.sVM1lCnWa76OhBbNcG1hOuYHQnj3U3KDN6RWqAkemUlpLZ.BSdP9gjszV
 iTm3N5LA9z95RFW84fqQDCg5XcbGngxdiZA4zUQE_JKqVzHjOyTdtVil0r6C_RGe1WGjJET4wpHV
 f0ZKjJMunZXpCuLcGIQpod4PUrlyGez5imYmyr2SCrdLXOVVocJTu3fxr49qTpWeCg1EulPGEoqn
 dB.wbfVqSmVZOpbb5AWDmmhek7Zw7spNdqtq8swLgjviA6KlgdIWZLvr3zN51JehgbN4.PxUt_Dj
 zdiE_Qp2nPL5.r3_OSKWc8GOofz3zbWpjvVaM.rstKLBWLGcAaRrw7n3Kzp28TDoeUnmuOTqiBEZ
 k5PlVM6u2pobgmxSpbfVI96N8fY_wK9LSSOByf1zJwoZIwqdbqnfSzNdEp8HYclvUWNlWPlI4N5m
 GIqnkar0v6pDbhmbPjL0HlfLiq6ZE1KmNZqFNVFOCFwSo1k9S3tTEF0dSnQTzSrEElE9qxgJG8ev
 GhVMYmR60ZEXMhuDlVy4rfHIYjBGPfIx3BPsa1X6snzc6oqdEq8oDDNaAwe_W8SaNfQTzwa8IMYp
 GfQ4f_gSQgEmH0UgywmOiGtUgE74CjEiYT_QuDbTbjq6apFSWS9WviEv4llEMJ6KjKYBYiWWkBCH
 GT_xZkQ_SMKHd5BfbgTjUanv7rDmcyZhuje9Vn5TUe5v9HuyUM9ptyjd3kXge6rXhF3oukAYp.a9
 ah01bx2p7oHDLvkM0FXlUy3fL6IuH4xlTOXPqy0kqnniQnCHRRAMAf7jE7ffG9YQgszKJnNVj7Xi
 S1QgkqGVJVn7xU2USXCQ6epM2O5eSl8ISn.6XKC2n_33onX5LOhY6n1mvvfYULuu13kdHvKyQAfZ
 vz20bF5iHfxJ1GHfpx9OJofWDNEK6sUwoEZDALeEdwFf1iAA8_NMExOFgYcYL4Y7TUKmaQ0TDBg3
 BoS9qGAT4al1FNLrL.EDzpHsngE4A7BtZcAKsLLxU206qPdvxVlE1ClQiDCxk1JWFdX7suiDWza5
 PL8URR5k8_sxOA1G3gyuXyLqn0rAg6xFBihgwX0huvF2fv.6MdkEyr8jR7onSHRXx4Bp9PSwVA2x
 .CUyyIa6TbRL.vOA_INbVSLkPC1yDj9hLqOYv_qEfdEi90lKlR1bei8L_q5AEd.h2nWnPyoHiF5a
 LNCgt4Ma9IudlqyqEHcr5qNktuf4_EssTQqKEOyvt7CtCh83h0tlV89PrshRDUD5dtBke5oifBBe
 W1B6_HrV49gGRj5MOl4iECULwQF5xNB_7LIZOT3x3FWnnacbigiHjE8g4Nxy1zEe_LQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Wed, 18 Dec 2019 03:56:04 +0000
Date:   Wed, 18 Dec 2019 03:56:03 +0000 (UTC)
From:   Karl Nasrallah <knnspeed@aol.com>
To:     kuninori.morimoto.gx@renesas.com
Cc:     dalias@libc.org, geert@linux-m68k.org, ysato@users.sourceforge.jp,
        linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <2107393677.694216.1576641363699@mail.yahoo.com>
In-Reply-To: <87tv5yjssb.wl-kuninori.morimoto.gx@renesas.com>
References: <339916914.636876.1576627652112.ref@mail.yahoo.com> <339916914.636876.1576627652112@mail.yahoo.com> <87tv5yjssb.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: can someone solve string_32.h issue for SH ?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.14873 aolwebmail Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

Though ultimately I do not have a say in that, it would appear that string_=
32.h is in arch/sh/include/asm and has been there for a very long time. In =
fact, it appears that x86 also has similar utility functions defined in inl=
ine assembly: see arch/x86/include/asm. As straightforward as it would be t=
o make C versions, there may be a reason that they are in inline assembly--=
optimization would be my guess--and converting it all to C may require an o=
verhaul of the string.h backend (something I would not be much help with gi=
ven that I am unable to get modern Linux booting on my machine, which is a =
Sega Dreamcast). I also do not know what the performance implications of sw=
itching it all to C would be, if there even are any.

Hopefully this information may be useful and my asm version is alright for =
the time being; I have not been able to unearth much more on the topic of w=
hy this is structured the way it is,
-Karl Nasrallah

-----Original Message-----
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Karl Nasrallah <knnspeed@aol.com>
Cc: dalias <dalias@libc.org>; geert <geert@linux-m68k.org>; ysato <ysato@us=
ers.sourceforge.jp>; linux-sh <linux-sh@vger.kernel.org>; linux-renesas-soc=
 <linux-renesas-soc@vger.kernel.org>
Sent: Tue, Dec 17, 2019 9:01 pm
Subject: Re: can someone solve string_32.h issue for SH ?



Hi

> You're using r0 explicitly in the asm but I don't see where you're
> reserving it for your use. You need it either on the clobbers or bound
> to a dummy output with earlyclobber.
(snip)

> =C2=A0=C2=A0=C2=A0 __asm__ __volatile__ (
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 "strncpy_start:\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "mov.b @%[src]=
+,%[r0_reg]\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "cmp/eq #0,%[r=
0_reg]\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "bt.s strncpy_=
pad\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "cmp/eq %[dest=
],%[dest_end]\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "bt.s strncpy_=
end\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "mov.b %[r0_re=
g],@%[dest]\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "bra strncpy_s=
tart\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "add #1,%[dest=
]\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 "strncpy_pad:\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "bt.s strncpy_=
end\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "mov.b %[r0_re=
g],@%[dest]\n\t"
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
=A0 =C2=A0=C2=A0=C2=A0 "strncpy_end:\n\t"
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : [src] "+r" (__src), [dest] "+r" (=
__dest), [r0_reg] "+&z" (r0_register)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : [dest_end] "r" (__dest_end)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : "t","memory"

> =C2=A0=C2=A0=C2=A0 );

Or, can we use general strncpy() instead of SH assemble one ?

Thank you for your help !!
Best regards
---
Kuninori Morimoto


