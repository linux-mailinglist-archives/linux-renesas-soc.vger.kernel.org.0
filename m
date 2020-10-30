Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585C82A0298
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 11:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbgJ3KNE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 06:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgJ3KNE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 06:13:04 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C016C0613D7;
        Fri, 30 Oct 2020 03:13:04 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id b138so4658581yba.5;
        Fri, 30 Oct 2020 03:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oDcavtlo/8YUsmK9GgsBJflj43Hqu+2PyoI44vqAcTU=;
        b=biXZYjRb0GPdyR0DAE8go697q9yupBOQdA0c+g//EvceAxEz3ujehBpIeJVlIloJOd
         +0/mnmPDLYR/ky1NAX1DDieFSBHzciMTCQGtOHlmtKbQBegIKLKsemKeO9I5+rv0Nc36
         5ILbiUbNIXud/Ns21lRgoPKzNnQx1KtniiZpTRMZyi/H+MJal97kB8+TkqA+PT8n2nYn
         rotSf1sOCvT8+Kgn6jOA008cGNl/JRxz8SUZF0ZTNnhPABM6vWkRFH58i1PUSmXmzne4
         3A73hX9tuKLrGbrd/eh7jsnWJyXuOeNg0cAbEq/QlOKMZ7YkMn4r4+/4E/J8XzW15Iss
         Wy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oDcavtlo/8YUsmK9GgsBJflj43Hqu+2PyoI44vqAcTU=;
        b=UtIdRhnjHbjPS4jBs0jHg62+DH4YxWr3a74dPHYIeMepd8DGh9ofQcoQJSI0L+Stnu
         tLshrPSfILj2jz/MuqSrDlDgZ0X5fQ43itVbrsfGpffTsOy9LUu5y9/PMCz7ZlkwYch/
         D/AqOohTgYPuGm/iGXNDJtTq+iW1oprroFSu3kSJ+yJM74O8W1WvW6lEXFsTOjYPycq7
         CUppoF6CrQPDTrSr9IqJSmPrc8PfWqpW/Zvwt9r2R3bYFv9GfQuKKnXgTS70CyfL5v6t
         pdD3iaYeMuCB53xcpDjZoWbdK2RyZds6zpBJHd4iPUHhjaR1sQlsdTkHcWQSiIb4T1DD
         CR5Q==
X-Gm-Message-State: AOAM533A3ZNSQgrhkZhGlepa7tfQnaaV1UBHlJ+ipCUPFbbQoH02LWrU
        vgSRUtCSA8exAaJbdyQkAvVTty1Vgn2JfJvW14o=
X-Google-Smtp-Source: ABdhPJyof1kh9nXjlOyzIhWRhG2sDZT1FgNFvCUja1r22GV0LzsJwTnBEH9LQ9SthBE7NLhzAr5PRFCKQSWEEjs9448=
X-Received: by 2002:a25:740e:: with SMTP id p14mr2256546ybc.401.1604052783366;
 Fri, 30 Oct 2020 03:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201029105515.16309-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVGO+DEgsTr62nA+egU2etZA_vwE9GrOG1JPWBvv90UXg@mail.gmail.com>
In-Reply-To: <CAMuHMdVGO+DEgsTr62nA+egU2etZA_vwE9GrOG1JPWBvv90UXg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 30 Oct 2020 10:12:37 +0000
Message-ID: <CA+V-a8sagMFjaxxVUGMeqG5wdAWwT=oqOPHgTBZ7j0hPP1LcNw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a774c0: Add RPC clocks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Thu, Oct 29, 2020 at 2:29 PM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> Hi Prabhakar,
>
> On Thu, Oct 29, 2020 at 11:55 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Describe the RPCSRC internal clock and the RPC[D2] clocks derived from =
it,
> > as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
> > driver.
>
> Thanks for your patch!
>
> > Add new clk type CLK_TYPE_GEN3E3_RPCSRC to handle registering rpcsrc
> > clock as the source for RPCSRC can be either PLL0/PLL1 and this depends
> > on MD[1:4] pins where as compared to other R-Car Gen3 SoC's the RPCSRC
> > clock source is always PLL1.
> >
> > MD[4] MD[3] MD[2] MD[1]
> >   0     0     0    1     -> RPCSRC CLK source is PLL1
> >   0     0     1    1     -> RPCSRC CLK source is PLL1
> >   0     1     0    0     -> RPCSRC CLK source is PLL1
> >   1     0     1    1     -> RPCSRC CLK source is PLL1
> >   x     x     x    x     -> For any other values RPCSRC CLK source is P=
LL0
>
> AFAIU, the _initial values_ of the RPCCKCR bits depend on the MD pins.
> They can still be changed at run-time, and might have been changed by
> the bootloader before transferring control to Linux.
>
> > R-Car Gen3 manual Rev.2.20 has in-correct information related to
> > determining the clock source for RPCSRC.
>
> Which part of the information is not correct?
> Where can I find corrected information?
> Is my understanding above incorrect, too?
>
R-Car Gen3 HW manual mentions the below statement (page 529, Rev.2.20 manua=
l):
[R-Car E3]
When (MD4, MD3, MD2, MD1) =3D (0, 0, 0, 1) or (0, 1, 0, 0): DIV[2:0] =3D
011, DIV[4:3] =3D 00 (300 MHz PLL0)

Confirming with internal team this should be below:

When (MD4, MD3, MD2, MD1) =3D (0, 0, 0, 1) or (0, 1, 0, 0): DIV[2:0] =3D
011, DIV[4:3] =3D 00 (80 MHz PLL1)

This should be fixed in the next version of the document, and when
available I'll ask Chris P to send it across.

> > --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
>
> > @@ -73,6 +74,12 @@ static const struct cpg_core_clk r8a774c0_core_clks[=
] __initconst =3D {
> >         DEF_FIXED(".s2",       CLK_S2,             CLK_PLL1,       4, 1=
),
> >         DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1=
),
> >         DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1=
),
> > +       DEF_BASE(".rpcsrc",    CLK_RPCSRC, CLK_TYPE_GEN3E3_RPCSRC, (CLK=
_PLL1 << 16) | CLK_PLL0),
>
> You may want to add a new DEF_* helper macro for this.
>
> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> > @@ -441,6 +441,14 @@ static const struct clk_div_table cpg_rpcsrc_div_t=
able[] =3D {
> >         { 2, 5 }, { 3, 6 }, { 0, 0 },
> >  };
> >
> > +static const struct clk_div_table cpg_rpcsrc_e3_pll0_div_table[] =3D {
> > +       { 2, 8 }, { 0, 0 },
> > +};
> > +
> > +static const struct clk_div_table cpg_rpcsrc_e3_pll1_div_table[] =3D {
> > +       { 0, 5 }, { 1, 3 }, { 3, 2 }, { 0, 0 },
> > +};
> > +
> >  static const struct clk_div_table cpg_rpc_div_table[] =3D {
> >         { 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 }, { 0, 0 },
> >  };
> > @@ -515,6 +523,18 @@ static struct clk * __init cpg_rpcd2_clk_register(=
const char *name,
> >         return clk;
> >  }
> >
> > +static int __init cpg_rpcsrc_e3_get_parent(u32 mode)
> > +{
> > +       unsigned int e3_rpcsrc =3D (mode & GENMASK(4, 1)) >> 1;
> > +       unsigned int pll1[] =3D { 0x1, 0x3, 0x4, 0xb, };
> > +       int i;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(pll1); i++)
> > +               if (e3_rpcsrc =3D=3D pll1[i])
> > +                       return 1;
> > +
> > +       return 0;
> > +}
> >
> >  static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdat=
a;
> >  static unsigned int cpg_clk_extalr __initdata;
> > @@ -552,6 +572,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(stru=
ct device *dev,
> >         const struct clk *parent;
> >         unsigned int mult =3D 1;
> >         unsigned int div =3D 1;
> > +       int e3_rpcsrc_parent;
> >         u32 value;
> >
> >         parent =3D clks[core->parent & 0xffff];   /* some types use hig=
h bits */
> > @@ -696,6 +717,22 @@ struct clk * __init rcar_gen3_cpg_clk_register(str=
uct device *dev,
> >                                                   cpg_rpcsrc_div_table,
> >                                                   &cpg_lock);
> >
> > +       case CLK_TYPE_GEN3E3_RPCSRC:
> > +               e3_rpcsrc_parent =3D cpg_rpcsrc_e3_get_parent(cpg_mode)=
;
>
> This is not correct if the boot loader has changed the parent clock.
>
You mean by manually togelling the MD pins before we get into Linux ?

> > +               if (e3_rpcsrc_parent) {
> > +                       parent =3D clks[core->parent >> 16];
> > +                       if (IS_ERR(parent))
> > +                               return ERR_CAST(parent);
> > +               }
> > +
> > +               return clk_register_divider_table(NULL, core->name,
> > +                                                 __clk_get_name(parent=
), 0,
> > +                                                 base + CPG_RPCCKCR, 3=
, 2, 0,
> > +                                                 e3_rpcsrc_parent ?
> > +                                                 cpg_rpcsrc_e3_pll1_di=
v_table :
> > +                                                 cpg_rpcsrc_e3_pll0_di=
v_table,
> > +                                                 &cpg_lock);
> > +
>
> So you want to keep the parent clock selection fixed, but still allow
> the system to change the divider?
> Why not support changing the parent too, by modeling this as a composite
> clock consisting of a mux and a divider?
>
I will investigate this further (read more about composite clocks).
Below are the values for RPC and RPCD2,

RPC=CF=95 =3D 320 MHz, RPCD2=CF=95 =3D 160MHz.
RPC=CF=95 =3D 160 MHz, RPCD2=CF=95 =3D 80MHz.
RPC=CF=95 =3D 80 MHz, RPCD2=CF=95 =3D 40MHz.

Cheers,
Prabhakar
