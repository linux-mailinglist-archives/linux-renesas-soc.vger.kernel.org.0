Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD22F3DC62F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 16:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbhGaOAX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 31 Jul 2021 10:00:23 -0400
Received: from mout.gmx.net ([212.227.15.18]:49629 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232770AbhGaOAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 10:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627740000;
        bh=QdHwj+IsnJi5IzMwqUW3TfO7oP0yxI2OFU1E0J2+TGU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=BJqMD7+9OX8NQ377fjRaZhE30oQgrpitGIE39GvNzFykzIbgNbZ+d/q7v2aYqLmiE
         Sv3+GGtXEKMWMzeON/xMzV1bLSEUEpQGWXTdUIy4E5eP7baJ3PbrqvPOzUm39eN2Vb
         xCCfmDwIZSlX73xw4BdlYquAiz8iAytx1ICTGeZU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MnaoZ-1mqcSb1xW1-00jXgJ; Sat, 31
 Jul 2021 16:00:00 +0200
Date:   Sat, 31 Jul 2021 15:59:57 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Len Baker <len.baker@gmx.com>,
        David Laight <David.Laight@ACULAB.COM>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-hardening@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drivers/soc: Remove all strcpy() uses in favor of
 strscpy()
Message-ID: <20210731135957.GB1979@titan>
References: <20210725151434.7122-1-len.baker@gmx.com>
 <CAMuHMdUdmv+YmdtjGJV2Lp_Rvar4kN4uSgSTYqXX9CtCJ+qoRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUdmv+YmdtjGJV2Lp_Rvar4kN4uSgSTYqXX9CtCJ+qoRw@mail.gmail.com>
X-Provags-ID: V03:K1:qUm0FH1ghq6WNJ/Rmut5+r4u5WV6r8/bAeCUshozt5VKgCN225P
 OrVDNggsXY8F74K9umWT8oOQrNm0KSB2wA12pRezKPZnQnkuzv0Pa8ag8DMzxfPkUuCrsHF
 Cw2zbRkmLkAvWdT9xxVsNpcMqvixb9+W3fiiykkbJvnFd+9h2rSHPeidV1grwyrPVU0dzml
 m71/ks9fqkCC4/ih+1/tQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:I5zIChcrHao=:PP4ua8BnhiZfYhDBqkXX+e
 pfVAy5oA9TszZrsLtBsAuiLyWziOyegSVk7fXycC/G/PNCXkkahPJmZZ9jL3J6t2xbFG6mpXk
 V4n4bt2lEifysR0pQ0NDyf301ZskZeF2EMj0EhRh9ivMR70oPAXr9ZWjkjHYLdlZZ6dogoC2h
 I1I8T4ZMaH6r9FcTJWNTwouRKWzVTr5PlDkSFlRTFDxSWrKgz8cRu2MSetZBxzbth04RRvUfr
 5J0h2Zymz9RSDo0bwrfqwYfuTGWqRRUDLzYvuwVi5UwC7AqE3DSx0d+HsNKwNCV6JxdI0jTtc
 kw3gMvG2uCjIeNQfJxT43LWhJqtcP4CW74mfZNNEmKcz86YOV+Q4Awry+jbJ8nsaIaPqZg0le
 Vp91poTztx+SclUEo4Y2yuiVVTxaUX+p9YoU19nzDZgbObwbxa8IUMWL0gslizXle1XfadKf6
 5CA68ILlgTbOrW6CHPOEXFwiBh8h73N6Zn5mw3CImyfanxnMyiF+ps4FMjHL1LGA0tO3nz9yx
 jj1ObyopWBSSMmtk/ClwAbC3jxqRu6Tv0An+1VrnOAp82MlB93Pj63EISyVUN18d2CTw3ZgxO
 Ohi3FTJ70/NdNGTd53U7/xQlhe+jbiYG0brDkw1oxPA2Z0M/4F41lxyZ1HudAcvJ3+J+qbZ96
 Ur3VX6j2c5LXtN9eOp2x+7DmSX//9q84boaeN+zFaHzwP93tA6LXm2JOFK8C56vzyiZQ3kcNG
 +OkOtic2hLYVFUmGJjlJRZb6Kkpq/YU6j1GyapKkoVVtzBf0UlwyApqVGICGqGgciYTpTZmAF
 KHeFmnwhN+OTkLtNXdsgfLpcBNG4fMMprBAGGKAWMajMHWmSrvYGY34nJK9S2tw5mqa8l4/Fk
 jnFAma31GosDQfVq6kVrv/JgZo5aLSaBpRGXE6GuHibVGWilvphm2m1eFodAVPMpVZmzIQnOt
 Rd0T28sbzvy7MKwYrReIPYCwyNGvtDCH8dcGMyHNF1y/qCvr/y2Y56NHOtGPTYe8okkpxgwSs
 bgHGeQdyXWujp94IdM3w5/IA4vQg3jTwFuN7vcNedePvsuRKTzPiHIlErLMI0hiRDMaBQed64
 uOYSgM/0OQq5Nf2utI/l0gBW4GiTFrHZTS0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Mon, Jul 26, 2021 at 10:03:18AM +0200, Geert Uytterhoeven wrote:
> Hi Len,
>
> On Sun, Jul 25, 2021 at 5:15 PM Len Baker <len.baker@gmx.com> wrote:
> > strcpy() performs no bounds checking on the destination buffer. This
> > could result in linear overflows beyond the end of the buffer, leading
> > to all kinds of misbehaviors. The safe replacement is strscpy().
> >
> > Signed-off-by: Len Baker <len.baker@gmx.com>
>
> Thanks for your patch!
>
> > ---
> > This is a task of the KSPP [1]
> >
> > [1] https://github.com/KSPP/linux/issues/88
>
> Any chance the almost one year old question in that ticket can be
> answered?

I'm a kernel newbie and I have chosen this task as a starting point. So,
I think that someone with more experience could answer this question.

Kees: Any comments?

>
> >  drivers/soc/renesas/rcar-sysc.c     |  6 ++++--
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> But please see my comments below...
>
> > --- a/drivers/soc/renesas/r8a779a0-sysc.c
> > +++ b/drivers/soc/renesas/r8a779a0-sysc.c
> > @@ -404,19 +404,21 @@ static int __init r8a779a0_sysc_pd_init(void)
> >         for (i =3D 0; i < info->num_areas; i++) {
> >                 const struct r8a779a0_sysc_area *area =3D &info->areas=
[i];
> >                 struct r8a779a0_sysc_pd *pd;
> > +               size_t area_name_size;
>
> I wouldn't mind a shorter name, like "n".

Ok, I will change this for the next version.

> >
> >                 if (!area->name) {
> >                         /* Skip NULLified area */
> >                         continue;
> >                 }
> >
> > -               pd =3D kzalloc(sizeof(*pd) + strlen(area->name) + 1, G=
FP_KERNEL);
> > +               area_name_size =3D strlen(area->name) + 1;
> > +               pd =3D kzalloc(sizeof(*pd) + area_name_size, GFP_KERNE=
L);
> >                 if (!pd) {
> >                         error =3D -ENOMEM;
> >                         goto out_put;
> >                 }
> >
> > -               strcpy(pd->name, area->name);
> > +               strscpy(pd->name, area->name, area_name_size);
> >                 pd->genpd.name =3D pd->name;
> >                 pd->pdr =3D area->pdr;
> >                 pd->flags =3D area->flags;
> > diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rca=
r-sysc.c
> > index 53387a72ca00..0eae5ce0eeb0 100644
> > --- a/drivers/soc/renesas/rcar-sysc.c
> > +++ b/drivers/soc/renesas/rcar-sysc.c
> > @@ -396,19 +396,21 @@ static int __init rcar_sysc_pd_init(void)
> >         for (i =3D 0; i < info->num_areas; i++) {
> >                 const struct rcar_sysc_area *area =3D &info->areas[i];
> >                 struct rcar_sysc_pd *pd;
> > +               size_t area_name_size;
>
> Likewise.

Ok, understood.

Regards,
Len
