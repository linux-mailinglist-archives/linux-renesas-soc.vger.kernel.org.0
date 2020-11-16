Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6D12B3F2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 09:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgKPIyd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 03:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgKPIyd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:54:33 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0837AC0613CF;
        Mon, 16 Nov 2020 00:54:33 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id v92so14976474ybi.4;
        Mon, 16 Nov 2020 00:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9uvqYzm7vJRprM9QB0mBykDBz4q+avxTh5rWYI73uL8=;
        b=sbI9QnKNVRy5OWXaNbmtp1n+tRxN/WDDka5vrTpMJJLvGtWps1kfCNpYMsw7WnYIFe
         rt7jJ/BYUmQ8wYcSKTpVbEoAS9Kj0llJf6jdwcew4kgbVsOydpQjM2t9UK11GVqhTT9s
         sqF4HRsCUYywaDr69F7NVzORDcfsmofzvbT3wSSS3REeL6mxAmCLuzDJbxxtwBfrYsU1
         eP5eWlgHKJgU/KKeDWL9rtn6EO0n+ntzlzE84cO0IX2M2HOwhEQYPMTeeUrzwXl61SKH
         inyfpnx3WPhxXtOiQCFm5JrYFiXLit/6w2XuB1hNCvKnf+Uha4CkgPJQfbPzXqPnbryE
         5PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9uvqYzm7vJRprM9QB0mBykDBz4q+avxTh5rWYI73uL8=;
        b=ZTBNBfBynunZb1zF2FPds7ysmxSpeNZTWWGrITt1cmxDO1BkHG3/CJ4MhiADWJQfE9
         L4u5Bw0QyE3T/b/EJBEszuFo2SBXJQRNaAwivIsZNoRKPT2FiZyVt0qMn9JotYvSVSU7
         GxXsWoQWh7H/BXyW1Ah9UpVQXrABzWyJbDioMXG691GOHaYokoWqT8MQWXUSBla/9vXy
         67NxZZNsqplCbtAZn4vtQf4M2CZXvpi6Ie1ksgE0LUcQ93oQDeyiVWoWDTa/djUccdLV
         OAbqvs+ivJZXGP4Ti13nDU88yh/ye5K811tv3y9MHryrligO9VxUvASLTRTI9hFWBhtD
         LG4A==
X-Gm-Message-State: AOAM533qb/g80hiRV1tEDHsrLR+16OJXDrxsxhSJ3Vas1koLTGIsnSAu
        pxaUKpUoflNGcfXvSHfqjhti0lvtVl7TUSP3G/o=
X-Google-Smtp-Source: ABdhPJwsyPE7PGV79HQqMkL74hnkhXl2XP725AF2ZiHNXsjN493ujW0ZNq3JynJFAvwgMR/ASvTMP4AH2dY1NHY8O9E=
X-Received: by 2002:a25:1c57:: with SMTP id c84mr23434596ybc.25.1605516872342;
 Mon, 16 Nov 2020 00:54:32 -0800 (PST)
MIME-Version: 1.0
References: <20201110125609.30246-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUky4OEvCLnDYr3C-PB+PKdSx3U5+dCfhiftDhf3RKmAQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUky4OEvCLnDYr3C-PB+PKdSx3U5+dCfhiftDhf3RKmAQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Nov 2020 08:54:06 +0000
Message-ID: <CA+V-a8sxgHASsAMmvu-qkd47MbSa3Wr1T+8_Qj05qPYircdCHQ@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: r8a774c0: Add RPC clocks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Mon, Nov 16, 2020 at 8:34 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Nov 10, 2020 at 1:56 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> > as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
> > driver.
> >
> > Add new clk type CLK_TYPE_GEN3E3_RPCSRC to register rpcsrc as a fixed
> > clock on R-Car Gen3 E3 (and also RZ/G2E which is identical to E3 SoC),
> > parent and the divider is set based on the register value CPG_RPCCKCR[4:3]
> > (parent is cross verified against MD[4:1] pins) which has been set prior
> > to booting the kernel.
> >
> > MD[4] MD[3] MD[2] MD[1]
> >   0     0     0    1     -> RPCSRC CLK source is PLL1
> >   0     0     1    1     -> RPCSRC CLK source is PLL1
> >   0     1     0    0     -> RPCSRC CLK source is PLL1
> >   1     0     1    1     -> RPCSRC CLK source is PLL1
> >   x     x     x    x     -> For any other values RPCSRC CLK source is PLL0
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > ---
> > v2->v3
> > * Implemented as a fixed clock
>
> Sounds fine to me.  If we ever need to configure this clock from Linux,
> the driver can be changed.
>
> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> > @@ -427,6 +427,19 @@ static struct clk * __init cpg_sd_clk_register(const char *name,
> >         return clk;
> >  }
> >
> > +static bool __init cpg_rpcsrc_e3_parent_is_pll0(u32 mode)
> > +{
> > +       unsigned int e3_rpcsrc = (mode & GENMASK(4, 1)) >> 1;
> > +       unsigned int pll1[] = { 0x1, 0x3, 0x4, 0xb, };
> > +       int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(pll1); i++)
> > +               if (e3_rpcsrc == pll1[i])
> > +                       return false;
>
> Did you know gcc (version 9.3.0) generates smaller code for:
>
>         switch (e3_rpcsrc) {
>         case 0x1:
>         case 0x3:
>         case 0x4:
>         case 0xb:
>                 return false;
>
>         default:
>                 return true;
>         }
>
> ?
>
That's insightful thank you for the pointer.

> > @@ -696,6 +709,42 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
> >                                                   cpg_rpcsrc_div_table,
> >                                                   &cpg_lock);
> >
> > +       case CLK_TYPE_GEN3E3_RPCSRC:
> > +               /*
> > +                * Register RPCSRC as fixed factor clock based on the
> > +                * MD[4:1] pins and CPG_RPCCKCR[4:3] register value for
> > +                * which has been set prior to booting the kernel.
> > +                */
> > +
> > +               value = (readl(base + CPG_RPCCKCR) & GENMASK(4, 3)) >> 3;
> > +               if (cpg_rpcsrc_e3_parent_is_pll0(cpg_mode)) {
> > +                       if (value != 2)
> > +                               return ERR_PTR(-EINVAL);
> > +               } else {
> > +                       if (value == 2)
> > +                               return ERR_PTR(-EINVAL);
> > +               }
>
> IMHO this cross-verification is not needed, and harmful: it prevents the
> boot loader from changing the configuration, which I think is a valid
> use case.
>
Agreed will drop this check (and also cpg_rpcsrc_e3_parent_is_pll0())

> > +
> > +               switch (value) {
> > +               case 0:
> > +                       div = 5;
> > +                       break;
> > +               case 1:
> > +                       div = 3;
> > +                       break;
> > +               case 2:
> > +                       parent = clks[core->parent >> 16];
> > +                       if (IS_ERR(parent))
> > +                               return ERR_CAST(parent);
> > +                       div = 8;
>
> R-Car D3 is very similar, but uses div = 5 instead of 8.
> Perhaps this value can be retrieved from cpg_core_clk.div?
> Of course, we can do that later, when D3 support is added.
>
Agreed, should the below be OK ?

#define DEF_FIXED_RPCSRC_E3(_name, _id, _parent0, _parent1, _div)

Cheers,
Prabhakar

> > +                       break;
> > +               case 3:
> > +               default:
> > +                       div = 2;
> > +                       break;
> > +               }
> > +               break;
> > +
> >         case CLK_TYPE_GEN3_RPC:
> >                 return cpg_rpc_clk_register(core->name, base,
> >                                             __clk_get_name(parent), notifiers);
>
> The rest looks good to me.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
