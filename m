Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A95FC123F63
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 07:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbfLRGGT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 01:06:19 -0500
Received: from sonic307-56.consmr.mail.ne1.yahoo.com ([66.163.190.31]:44553
        "EHLO sonic307-56.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725912AbfLRGGT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 01:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1576649177; bh=YQKJf1wZ9nXo3g23WvjNw1Bq9D4YFDFQzc6OT4L2iwI=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=g5tnVEIKtQKWQmNUruEw85hKCtj8mkP409e8Iu9JRkiyNl/QpKGnx32l9hjT6ns59+muu9V6PjcvITs0YSXwSC8iMgwIDCfE6fCY6dzJXylHGLG560eikvbFVXeq001maRiX03TMkTkCfnuV8zcty44Rpi+zFieCPFwpb5/5U6vl7VS/S9LQXAJjCPNa2JZg9p6GuA0H4vbrRcg60fK+4vm2tS4u3XSgiFIDj5AMuSkX1JyO2cZuZ+5Qp/dOGF8x/Hy2gMlGu/etZtBWfb985idqYcGfzjYIT6wyiKah9FgS+40eVPp4gPFu9UXj3ceJegsIYqn4GIGOoA1icpy62A==
X-YMail-OSG: q.IDR7wVM1kq0ybHFM0RHUORQbg.P057z2mdO6gJg6.wL0ScK1nHKFpMfAsOrxo
 lXcxzGrvesYZ1YMRBYI.QB4_kNy9pfTjDXRJ6H4n0DoMpzS5zpcYbJ3ek.Z72VS3ABXxI.cEh87A
 wYXbRS1JsmOqQ7EM0_sXKtohOmkp.Sfl.SbEragRM5tE_OV_N_dVAM5RPFdiY.7uCuXAWNAbTaPu
 AUBGxR6T.TiPx6jpOa.QIiZDhfkQNeCV6SgaRMHQg2L.LgEHBxximqYLO1.7kgbyqeqTyfhkD2Lm
 0DGW8I6Z2ij8wVG0LLczgGKmJ21UaB.00uiMXcnpZ5tMieT18eY_znpZPA4hLkDliSspZMN2XFCW
 M2iW77W0YPR1f6uuGDaW9aZEjK8sgZ_CBtuyVs7SzSloyBf.__FJZK7i5l8LSyXkNFQN24kTX.ii
 caGW92n5lwQXS1AmnV13qJE9UK.8a2upg2H59e9l56MiNlnI8_5y3SzmskhdIh5D6isXrRxjwPLB
 j6MyfONXuARvJzC53dzRvND9i98UwxjD2R9XgcQE5wn1A52e8XlRbiExz6MDa0vnCyLnwSR84otD
 2G01hO_QZB7fpD4jpuOTQT939H6SiSfh5eR6c0.LOnVDrDoG2rJU76y.5XUILsScb0Esaf1P8nOb
 EeXwPEyWGMzbg4Kcfwqsio2GQ1_MnnM5duc0W963OmuYZIMOfrKge3_gwlFruBJ8cDMjicJTdZys
 r1a6G31fYT9mRt50vWRWyMxzLEcCnFYew5uzzXr.TXNDT0JD_SluOtTnpzxCcnGETJMG2l_WDftc
 kFd.DQk.._6PCW8t7tU1Nd1HvyTRhvBU8pTajl7Ux.wt3QP0ECdU6p_fZp0ZzrhVZgFhNt74ns5k
 d5ITJZyEiFOGHqBAmgEQht28B3nzPOat6mZ7SPUS0nR0OlqjeyqCboYJHdBs_OLLrgJvc7WIILgP
 Aw7qlwVPtcUaNDWfv5GTUF5C.D26vttiXTfqKNjQHd9WFaW1Dwkxw_owixy7uWJYaIlPEQdK_TiQ
 _SghPs_bj.Qw0gb4eV6dmhDZAyl1RoDT7T4JbZsghWPLTFFWkdAiqVMTqaP824ZnTHA0FO.HYkmm
 gSHYAV0UDHqB5l85QNFxYKyiFnXZnzdW5U2721yWMhicrxL2o8erl7MgYN8kZ8.0nPYQCpxLo_jH
 nHZGv7Qqzh2IqA2dni1nVCq2JCIKrFQi1p8qdWGvn5OV7vFafM6Sr7VnwJK.vwKhK2tL_ssWpHbV
 BoahxnWU.A2yuHpBwJK3.6m0f4u2o36bbtZr63OlUmWxc8TjH5FG0fKC6jXVa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 18 Dec 2019 06:06:17 +0000
Date:   Wed, 18 Dec 2019 06:06:12 +0000 (UTC)
From:   Karl Nasrallah <knnspeed@aol.com>
To:     kuninori.morimoto.gx@renesas.com
Cc:     dalias@libc.org, geert@linux-m68k.org, ysato@users.sourceforge.jp,
        linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <622503158.752777.1576649172224@mail.yahoo.com>
In-Reply-To: <87a77qjjjp.wl-kuninori.morimoto.gx@renesas.com>
References: <339916914.636876.1576627652112.ref@mail.yahoo.com> <339916914.636876.1576627652112@mail.yahoo.com> <87tv5yjssb.wl-kuninori.morimoto.gx@renesas.com> <2107393677.694216.1576641363699@mail.yahoo.com> <87a77qjjjp.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: can someone solve string_32.h issue for SH ?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.14873 aolwebmail Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

> Hi Karl
>
> Thank you for your help
>
> > Or, can we use general strncpy() instead of SH assemble one ?
>(snip)
> > Though ultimately I do not have a say in that, it would appear that str=
ing_32.h is in arch/sh/include/asm
> > and has been there for a very long time.
> > In fact, it appears that x86 also has similar utility functions defined=
 in inline assembly:
> > see arch/x86/include/asm. As straightforward as it would be to make C v=
ersions, there may be a reason
> > that they are in inline assembly--optimization would be my guess--and c=
onverting it all to C may require>
> > an overhaul of the string.h backend (something I would not be much help=
 with given that I am unable to get
> > modern Linux booting on my machine, which is a Sega Dreamcast).
> > I also do not know what the performance implications of switching it al=
l to C would be, if there even are any.
> >
> > Hopefully this information may be useful and my asm version is alright =
for the time being;
> > I have not been able to unearth much more on the topic of why this is s=
tructured the way it is,
>
> How about this ?
> You / I post each patch
> (=3D Me:=C2=A0 use generic strnpy() patch
>=C2=A0  You: fixup SH strnpy() patch)
> And follow SH maintainer's judge

That sounds fine to me!

However, I may need to find a better way to send e-mails than via this webc=
lient before doing so. It would appear I've been mucking up pretty badly wi=
th reply formatting (sorry!!! I don't know how to fix this thread in the ma=
iling list archives... I had no idea that replying like a normal e-mail was=
 a terrible thing to do!!).

-Karl Nasrallah
