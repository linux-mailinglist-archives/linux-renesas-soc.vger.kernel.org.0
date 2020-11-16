Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA552B4004
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 10:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbgKPJkK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 04:40:10 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:42454 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728498AbgKPJkK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 04:40:10 -0500
Received: by mail-ot1-f49.google.com with SMTP id h16so11262011otq.9;
        Mon, 16 Nov 2020 01:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ozWL5OAdv4loIOYSI2yw5b8cevUZnV5lZwb9w6X66dI=;
        b=AjyuUFcd1/euDFc0wSKAnk4T6aBrbAHIwOToNcHca5ovSWo8G15iROYADDU00DH188
         lAGREQbKH42aTDDEqBNDTCerLcOTE2JrAkCGzcHXuGRJPV7Z12iRPE47kUx97iV3Dz3v
         feqJN3IcD9YetDJnTglBvEIopdZwhwjHdUGi5ExebXxdf1UsnGpnYf7ISZUc/XUseXGc
         Q+4Hk0moL6pe1fDuhDpOlKl7uAgQtaRo3Jut/3jSr/ORhjkuJTXEk3w+FCrPVO3UgBDg
         YSpokQdpQcEuDQ3iG78tFgH2vk0Zd4AfuZ1nBPuWNp01PFXcOGCvaez/VvZNkrdp4Dl+
         0yIg==
X-Gm-Message-State: AOAM533nSiJL89yAdUGzapf4/aB3gDvS0Rm+v0ZMy5avaBOVlggsynXM
        i+M0l2Z0+d31h1oQMuqjMQmmbQi01RPtLNyfqpQ=
X-Google-Smtp-Source: ABdhPJw7n2VYocrj3d8OUp4CkB9RuXyfyKFAWDv7dExWP3Tgt++vCdlJBPXqExdqc3laPYRWmHYvRLDaKGXS+v+Qrvk=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr9929476otc.145.1605519609344;
 Mon, 16 Nov 2020 01:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20201110125609.30246-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUky4OEvCLnDYr3C-PB+PKdSx3U5+dCfhiftDhf3RKmAQ@mail.gmail.com> <TYBPR01MB53099FFA01431B1E5188B8C686E30@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB53099FFA01431B1E5188B8C686E30@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Nov 2020 10:39:58 +0100
Message-ID: <CAMuHMdX+RdE0kgqWNatNBBy_GPiihxcC3exAYi76a50qSHvDMA@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: r8a774c0: Add RPC clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Nov 16, 2020 at 10:03 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3] clk: renesas: r8a774c0: Add RPC clocks
> > On Tue, Nov 10, 2020 at 1:56 PM Lad Prabhakar <prabhakar.mahadev-
> > lad.rj@bp.renesas.com> wrote:
> > > Describe the RPCSRC internal clock and the RPC[D2] clocks derived from
> > > it, as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0)
> > > CPG/MSSR driver.
> > >
> > > Add new clk type CLK_TYPE_GEN3E3_RPCSRC to register rpcsrc as a fixed
> > > clock on R-Car Gen3 E3 (and also RZ/G2E which is identical to E3 SoC),
> > > parent and the divider is set based on the register value
> > > CPG_RPCCKCR[4:3] (parent is cross verified against MD[4:1] pins) which
> > > has been set prior to booting the kernel.
> > >
> > > MD[4] MD[3] MD[2] MD[1]
> > >   0     0     0    1     -> RPCSRC CLK source is PLL1
> > >   0     0     1    1     -> RPCSRC CLK source is PLL1
> > >   0     1     0    0     -> RPCSRC CLK source is PLL1
> > >   1     0     1    1     -> RPCSRC CLK source is PLL1
> > >   x     x     x    x     -> For any other values RPCSRC CLK source is
> > PLL0
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > ---
> > > v2->v3
> > > * Implemented as a fixed clock
> >
> > Sounds fine to me.  If we ever need to configure this clock from Linux,
> > the driver can be changed.
> >
> > > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c

> > > @@ -696,6 +709,42 @@ struct clk * __init
> > rcar_gen3_cpg_clk_register(struct device *dev,
> > >                                                   cpg_rpcsrc_div_table,
> > >                                                   &cpg_lock);
> > >
> > > +       case CLK_TYPE_GEN3E3_RPCSRC:
> > > +               /*
> > > +                * Register RPCSRC as fixed factor clock based on the
> > > +                * MD[4:1] pins and CPG_RPCCKCR[4:3] register value for
> > > +                * which has been set prior to booting the kernel.
> > > +                */
> > > +
> > > +               value = (readl(base + CPG_RPCCKCR) & GENMASK(4, 3)) >>
> > 3;
> > > +               if (cpg_rpcsrc_e3_parent_is_pll0(cpg_mode)) {
> > > +                       if (value != 2)
> > > +                               return ERR_PTR(-EINVAL);
> > > +               } else {
> > > +                       if (value == 2)
> > > +                               return ERR_PTR(-EINVAL);
> > > +               }
> >
> > IMHO this cross-verification is not needed, and harmful: it prevents the
> > boot loader from changing the configuration, which I think is a valid use
> > case.
>
> But this check validates, whether bootloader done wrong configuration or not?
> For eg:- PLL1 and setting wrong divider value in RPCCKCR.
>
> It allows bootloader for changing right configurations. I may be wrong. Please correct me if I am wrong.

What is a wrong configuration? According to the RPCSRC docs, DIV[4:3]
select both the parent clock and the divider.
All four possible values are valid.

MD[4:1] select the boot device, and determine the _initial values_ of
the DIV[4:0] bits.  Nothing in the documentation says they cannot be
changed later, after which the DIV[4:3] bits no longer match MD[4:1].

If you want to be really sure, you can change the bits, and measure the
impact on the RPC clock signal.

A long time ago, I did a similar thing for PLL0CR.CKSEL on R-Car D3, and
looked at the impact on the serial console (albeit with remote access,
i.e. no console output if kernel and hardware didn't agree ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
