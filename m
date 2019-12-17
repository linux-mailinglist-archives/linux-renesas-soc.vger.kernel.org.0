Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C23122754
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 10:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfLQJJt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 04:09:49 -0500
Received: from sonic317-34.consmr.mail.ne1.yahoo.com ([66.163.184.45]:44482
        "EHLO sonic317-34.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726690AbfLQJJs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 04:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1576573786; bh=aXpl4+9nDg5VKeVPYhyWEJLdImIBPLEBF/My+9ERp2k=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=rkG1A7uOCmZk4gRvGJ1rhRnomT7X7dglgI2v6iLCrpbg+GD7Xx8T0ZCzxbKTlAdQZvZ61Y5r+zGc0vkhYDPiDKvINBvaxXIlWua+RTGErvOYOklV8kd6tTvJVsr+0c24fntdN4akcvntiO9ETiy/a/4Z6nP31cj8L9SGqbGvzsk+HPuD2wdQK7/kzL8Xqgsjuk6ITS8Uba0vvlTcTUwBJyuyUOYQvHqw2gmjHzzZkqwBiJfBF/MVibxC/S7S44i44wFFaBU9ZRnId+onOmfiO+mCf4Z7owX8iqqo8HnZqdHXEVFFtygobev4JjSWDi4gklbiUeMfbyuPYubWhZVQxw==
X-YMail-OSG: icy1zroVM1nCiTHRIWya1n7eA9EnL39nsUaxr5yTW4ZEZjpMa7JsLOlnOz.EkUX
 mjhiij5SjVBBIDPRWmswor3K8e_x2x2q25dwQzujt36hrcnGppRZoTVQLAjD_BcXSDuB3wsQvquP
 XKcwKdfEj9ULcIk_WYqstfNm7_bElUuAqNRiIWHxZkSQN_atFCg0GePUZEyiHHdGToXY5rHu0P2g
 rEFokMu1TYYA1bmVrWp9DVhDemQ5X8uZ6ZnV.E4yERqK2gCUMCL4NXveadq2F8Frjn9avbigaccn
 xYpuksvbMkqWgndh_GUIw_FftO1mVIRCi6IS0aZgFvfoEEyN0BXvY6mHxgWHuhUyjAjjP9h1GbDi
 nwvAx1I3cl0LAvnQHk.PmUiUjy56Jcjksu3iPKb1B1Fepoup4PWlbyL.pxdeD72wjPjRf3kdnjai
 t1mvufClquFLZQh2BKFgrHzso1gx7o2MixEHETP8YULIS95b6g9DwTT3cav9ki0r4Us6EQ0JH3rD
 2ZNlh6OkVMh8jWaF1tmSFk9eoSaU7cfMPS.jPeXDPO5QYO2OIU2joQE5ulc_U8AIv0q1d077MB7h
 vl9HuZqHYCrUVzIGQjBg9Fsu1RwJWnG1oS64jyaJrjqGkD83BOsHB04TH5zzBdEogQSWn3IEJWlX
 aewSrmPKDVH.YdqmD3uvE76pelXaHLELdWP.eqY9YJEl9pUCePOWkyN7PAToDDyu7OPbky_ghssk
 hT_2icWRufaB2eksEkohJ5OyZfHXYVwHfvJNBnB.LA64y3VqOI64DKd0ZSa9NLhRwQ3ktbu0PjcQ
 2q6d8pUh.vLnXN58_mpQs88TeQGVde9ZP03JAFdWDELDq82hzBFnDT9v.BT4hJRZ_PSb.79WKFqB
 i5j1i3TQxxI5K3edWbw2RGTmAd_cQbCZ3ATShMsolI7iKKl_Gxnn1RLoZA7IQCSXOGkxpXvARAeN
 7MSVK0nZhvhMJF_VVgzfDtqhFPdsEzr48CK6uVCMpjVaza8PwmLB7IVGOTpdBwuHFNn7jALmOtf5
 auLmu3mvU6wbIsyNPjovhEBsUrCfhQ1Px.wKj6LNCtwELIq2w9Dk1qcv2P8.MHF84kt6pv2IZ3XI
 H8KvYdFrvwkFLIfUXMlj6S88ddVnEhr_tk5zUWvs7RatrDW4Dg.n2bYdknFaS6FTiVYa8s_NW.WI
 k3_r.uDvSy4nwBlDGrvzYdV2P2akF4YU2GM4nvhkGgrnTBclyPo.OBU86_mONwgI3p5sdbLNMYbr
 Atb0iLtu3V4CceDxY73ghiixYf99dDRdaM3anItX0sz99ERPJI8yUVlxleVWLfkb1oD6P
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Dec 2019 09:09:46 +0000
Date:   Tue, 17 Dec 2019 09:09:44 +0000 (UTC)
From:   Karl Nasrallah <knnspeed@aol.com>
To:     kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org
Cc:     ysato@users.sourceforge.jp, dalias@libc.org,
        linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <1850003495.209647.1576573784839@mail.yahoo.com>
In-Reply-To: <871rt3gwri.wl-kuninori.morimoto.gx@renesas.com>
References: <87h81zh4ap.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUHGXkmKrcZVNQo8nOcGo0h6xYgjZ+XmfGy6bJCPK9ZwQ@mail.gmail.com> <CAMuHMdUc4yyXsp4Y4Xx==3mUMrUn5DO8G-rLA_Mnv-790n6Ehg@mail.gmail.com> <871rt3gwri.wl-kuninori.morimoto.gx@renesas.com>
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
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0  __asm__ __volatile__(
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  "1:\n"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  "mov.b=C2=A0 @%=
1+, %2\n\t"
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  "mov.b=C2=A0 %2, @%0=
\n\t"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  "mov.b=C2=A0 %2, @%0=
+\n\t"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  "cmp/eq #0, %2\=
n\t"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  "bt/s=C2=A0  2f=
\n\t"
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  " cmp/eq=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 %5,%1\n\t"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  " cmp/eq=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 %5,%0\n\t"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  "bf/s=C2=A0  1b=
\n\t"
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  " add=C2=A0  #1, %0\=
n"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  " nop\n"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  "2:"
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  : "=3Dr" (__des=
t), "=3Dr" (__src), "=3D&z" (__dummy)
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  : "0" (__dest), "1" =
(__src), "r" (__src+__n)
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  : "0" (__dest), "1" =
(__src), "r" (__dest+__n)
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  : "memory", "t"=
);
> >
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0  return __xdest;
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

