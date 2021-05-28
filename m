Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5974C393E2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 May 2021 09:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbhE1HxY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 May 2021 03:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhE1HxX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 May 2021 03:53:23 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0823FC061574;
        Fri, 28 May 2021 00:51:48 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id z38so4335149ybh.5;
        Fri, 28 May 2021 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QjtThE/GvdTTwDHRzO7RqKpnpwomxf3ZkcySrQwdFO8=;
        b=n96WUpjFckScqSNEnzFn0eCPHUzD52Jb779iKMf6j4qX7rctUuS2QMGfQEka+3Aaao
         gsVWRAKAqq30ZATI9czY8QsgfLhzH56Vv44Rv9nwBY4fQ+zsM5na1I6P9uOlMjmX8pWy
         AARR1E7AtcEVgxIKPqvby0Yy4FjOX7dc4HrmyLooeiLESkSX9Klv2Evt/AWUI3PILGCR
         pRz8FplnRR0nt9A4/+vPlQRg3ApKzzmC7ZwUxysTCwZr65xWYXgQAdYrfEGs9IeRukCB
         qRYZ8gQBEyrxMAvmyW/vQtP3+KipaH6yWHfTIa8n2wFAmSxss13C0G/HNplcR+ji1j2Q
         EZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QjtThE/GvdTTwDHRzO7RqKpnpwomxf3ZkcySrQwdFO8=;
        b=PBTiciQyk3kuxOh7AsZg1lnRircMQDWGyuknajiYNuvM3nz/iI4wLqWCNy0fUuF1Z7
         fylo8kfZpysU2oA900gS04FMe0i0EyIezMUoi9YnE8eltU1p/s+6BA8hzsy002rsGFUA
         5GIZMb47038/cJajWULmMFQz8bV3XXjed9gP0BkGHGbbu7fhEkCBcyflAscbZaTEVzdh
         d02C0IVgT3qwi/FOJGE/dzcin1hm2YLcD0/xAKZDZKpZaE2XlMyM+Po0qfQylCu4BirX
         N0kUUyJbAfqJaAlvowfUCTXXXtn+guw/htWHdMEET25uBKfR4FUQ8kqsfV7EWr3XUICp
         gKEQ==
X-Gm-Message-State: AOAM531Qs3/9eg0NHJ6uLkRkLYMgBqVgQSgLw4bo8RwMNYqOlDrGUfXG
        EBWCZpLBFfGgWWHYeoT+Xstpev8b7nqRWqAOCWc=
X-Google-Smtp-Source: ABdhPJwWq5KIWkIdAqgVVIgQeSChmW1pD4dENRG4Yvitazs2XGQp+jjE4SAk+lUsFx4YIMAmVUhb3uFSCgiX1n1lv5U=
X-Received: by 2002:a25:26c3:: with SMTP id m186mr9924697ybm.47.1622188307294;
 Fri, 28 May 2021 00:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXd==dM2QJN5gg0ka_7-HDQbeKZK66nmyASFJAnsVsSQA@mail.gmail.com>
In-Reply-To: <CAMuHMdXd==dM2QJN5gg0ka_7-HDQbeKZK66nmyASFJAnsVsSQA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 28 May 2021 08:51:21 +0100
Message-ID: <CA+V-a8vHQLCL+V0f7bKZOKhtgo9_Rsqy_YjBOa_gCvgZMmBLnA@mail.gmail.com>
Subject: Re: [PATCH 13/16] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, May 27, 2021 at 1:04 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 14, 2021 at 9:24 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add CPG core wrapper for RZ/G2L family.
> >
> > Based on a patch in the BSP by Binh Nguyen
> > <binh.nguyen.jz@renesas.com>.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> > --- /dev/null
> > +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
>
> > +static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
> > +{
> > +       struct mstp_clock *clock = to_mod_clock(hw);
> > +       struct cpg_mssr_priv *priv = clock->priv;
> > +       unsigned int reg = MSSR_OFF(clock->bit) * 4;
>
> The "* 4" here makes it difficult to review the module clock tables.
>
> E.g.
>
>        DEF_MOD("gic",          R9A07G044_CLK_GIC600,
>                                R9A07G044_CLK_P1,
>                                MSSR(5, BIT(0), (BIT(0) | BIT(1)))),
>
> The "5" means the CLK_ON_GIC600 register is at offset CLK_ON_R(5 * 4)
>  = 0x514.  Removing the "* 4" means you could use
> "MSSR(0x14, BIT(0), (BIT(0) | BIT(1))" instead.
>
> Unless it has unpleasant side effects, I'd even consider putting
> the full CLK_ON offset there, i.e.
> "MSSR(0x514, BIT(0), (BIT(0) | BIT(1))" and change the macros like:
>
>     #define CLK_ON_R(reg)          (reg)
>     #define CLK_MON_R(reg)         (0x680 - 0x500 + (reg))
>
OK will do that.

> > --- /dev/null
> > +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
>
> > +#define CLK_ON_R(reg)          (0x500 + reg)
> > +#define CLK_MON_R(reg)         (0x680 + reg)
> > +#define CLK_RST_R(reg)         (0x800 + reg)
> > +#define CLK_MRST_R(reg)                (0x980 + reg)
>
> The last three don't seem to be documented?
>
I have asked Chris to send the document across.

Cheers,
Prabhakar
