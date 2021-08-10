Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A482E3E7CF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 18:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242198AbhHJQBC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 12:01:02 -0400
Received: from mout.gmx.net ([212.227.15.18]:41865 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239131AbhHJQBA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 12:01:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628611197;
        bh=G3sM2QcP/MH50Zmwdjb3PS8F5QBGj5Y8VFa/7F2tPSc=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=RLpZ0hqW/lrGAmurvpvHUFQYaAYshU/EL8HTj09Xa1VJXzVbI1pET09X0faIk0+qF
         TZkmhHf9CmViqUxAAUCF+NxxGBpaiXeCn21JdMnfMEJPC5rbvtkbFoNvkRdRzCd495
         83pnkOLc/giyhG64K1K/d/2czIyz0vQGQlpCbT94=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MAOJV-1mOBOw2Arz-00Bp83; Tue, 10
 Aug 2021 17:59:57 +0200
Date:   Tue, 10 Aug 2021 17:59:53 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Len Baker <len.baker@gmx.com>,
        Kees Cook <keescook@chromium.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/3] drivers/soc/renesas: Prefer memcpy over strcpy
Message-ID: <20210810155953.GB2508@titan>
References: <20210808125012.4715-1-len.baker@gmx.com>
 <20210808125012.4715-3-len.baker@gmx.com>
 <39485c0e-511c-50a0-83be-f9ce6fc47e67@petrovitsch.priv.at>
 <c33adb9e-9604-3d89-5a5b-152eb03e5b54@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c33adb9e-9604-3d89-5a5b-152eb03e5b54@wanadoo.fr>
X-Provags-ID: V03:K1:FPnUfg9bHq3mnp/YBiXnJfdCYth5+kd8VoT92LWLiyrQC/T7qWV
 XqEMPQaChEtvXvpYQ0FF7Z/k5XfSetPCvutFfenyLdouGF3+8FbQSDYSzaKDcHfI9Dhk9pT
 nqMVMtEa8s6Uo4e8R+j6kuHpbSoJjrUwp2ujWigdUNW475H61eXq4DWibqEpwgxIo8irZ9S
 IzLJgN8K5DUg2AmYmO3Sw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xVByGEykzDo=:h92VZnFlg+VkvKpiRFRLaQ
 xPYCBWL7ImYXcrI8PHzLKgnvx0U0nAtR8VXIPzxaGS2RH0f/a614v6z4l9jMI4XuUhRBM0SNc
 RuACv5zcKcI6FLS9IDVu9IUViF/ptqpi0Aqs5HiXD0QXfLE+FSZHZezBncVgpaBNKN2Q9i9Bk
 feL7SK5a6hi14JIlmQUwYFqIsltXxuJw9HRh2QIQD1Xg765Kj9vMVFB16B+udtvO1OFoIHaz8
 1wYWiODPzdSr/W6iLzLVQsP2xXPk8fZK35qAAMoH7/StbKKXMBwM/LYg5X5DPtGu9X3gznpGm
 JeAY0UZIAdYpRDmEck7ZCoCp94aHNDAZlWPiJrRRb8XcNzmPoj2EsdGdvW0I1DZk8P9TuVmI0
 RxcEs0TnCOOYmHKUo+Ryt4Le5QGsqbK4Ai7/cUCXGpIgAyqUnIYml4CuTj1xo9D3ekA0kzVZa
 pTuhuID0mA6mXzjJ+CET5Re8VGiODsRFBidz9sYs52BdOywTUQPl/RtaMJiuTc/rKoE/pMfY6
 FuWrq+2/cHU/F81lxmccNBCnkIq6lyIAZh2g3k67QqaYYLfg0JCLE4l07Qv/5QCKJTDM/ErHF
 J4kKjwxvybFLkYGtQI0x9Zwu+W++8SuHokR6PzwSJewR2zUtE6MxRgdeCVKiZNkX78ywQu5fc
 R7fq/cl3ZxhUWU4xBVY8FjoglKJkk4IeYaHrXRWB5JaYQY9bceFzcP4vqIkSLdIBMKOqWmVMw
 HaDIyZYNKaVxwrelDBPKQQic2rIJOD4MmoaehCgoZm4fzhqYHTrqgJSXSRaDgYE9+2xrPbfV6
 /ymc1tDje2S0RCukp5/WGd7pyM02KN0T90vEOdW7N3jZJgEoJ3TjEAOtpuPHZ/vt11jsOi3Aa
 /RinBa12sewbhNvzgkynJtSYppciAYDzrWoefKvl0s/UWr/czYfX+jxhLbOUyrP+ujaE//g/s
 Abm1m2QG0QgguPkPwb/TNHJJxMcMpk8lRU8elMr0+SXj/9HMPg+3KlW+31nWHNdu48xI91lK7
 Uto3xv0v7UtLZdO/NNKyXcbdhNYwgT6KHHSNVRPUGG4QxQgzgGES+DV70EO3koX3cakEsBsV6
 CP/4wY6tXJQB6khciYOs09qXEJsZgqDA44XBavobn8ilwZL/8/FvePXAg==
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Sun, Aug 08, 2021 at 07:06:30PM +0200, Christophe JAILLET wrote:
> Hi,
>
> Le 08/08/2021 =E0 17:35, Bernd Petrovitsch a =E9crit=A0:
> > Hi all!
> >
> > On 08/08/2021 14:50, Len Baker wrote:
> > > strcpy() performs no bounds checking on the destination buffer. This
> > > could result in linear overflows beyond the end of the buffer, leadi=
ng
> > > to all kinds of misbehaviors. So, use memcpy() as a safe replacement=
.
> > >
> > > This is a previous step in the path to remove the strcpy() function
> > > entirely from the kernel.
> > >
> > > Signed-off-by: Len Baker <len.baker@gmx.com>
> > > ---
> > >   drivers/soc/renesas/r8a779a0-sysc.c | 6 ++++--
> > >   drivers/soc/renesas/rcar-sysc.c     | 6 ++++--
> > >   2 files changed, 8 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/soc/renesas/r8a779a0-sysc.c b/drivers/soc/renes=
as/r8a779a0-sysc.c
> > > index d464ffa1be33..7410b9fa9846 100644
> > > --- a/drivers/soc/renesas/r8a779a0-sysc.c
> > > +++ b/drivers/soc/renesas/r8a779a0-sysc.c
> > > @@ -404,19 +404,21 @@ static int __init r8a779a0_sysc_pd_init(void)
> > >   	for (i =3D 0; i < info->num_areas; i++) {
> > >   		const struct r8a779a0_sysc_area *area =3D &info->areas[i];
> > >   		struct r8a779a0_sysc_pd *pd;
> > > +		size_t n;
> > >
> > >   		if (!area->name) {
> > >   			/* Skip NULLified area */
> > >   			continue;
> > >   		}
> > >
> > > -		pd =3D kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
> > > +		n =3D strlen(area->name) + 1;
> > > +		pd =3D kzalloc(sizeof(*pd) + n, GFP_KERNEL);
> > Zeroing the allocated bytes is not needed since it's completly
> > overwritten with the strcpy()/memcpy().
>
> The strcpy()/memcpy() only overwrites the pd->name field, not the whole =
pd
> structure.

You are right.

> I think that it is needed to keep the kzalloc.

Yes, I think so. The kzalloc is needed to guarantee that the whole struct =
is
initialize (all the members are initialized with zeros).

Regards,
Len

>
> Just my 2c,
> CJ
>
> > >   		if (!pd) {
> > >   			error =3D -ENOMEM;
> > >   			goto out_put;
> > >   		}
> > >
> > > -		strcpy(pd->name, area->name);
> > > +		memcpy(pd->name, area->name, n);
> > >   		pd->genpd.name =3D pd->name;
> > >   		pd->pdr =3D area->pdr;
> > >   		pd->flags =3D area->flags;
> >
> > And similar for the second hunk.
> >
> > MfG,
> > 	Bernd
> >
>
