Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A33D3B07F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 16:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhFVO7O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 10:59:14 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:33369 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhFVO7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 10:59:13 -0400
Received: by mail-vk1-f169.google.com with SMTP id f2so410481vkc.0;
        Tue, 22 Jun 2021 07:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JQ4wEIgShs1tDMY6xEdLMeaLyyv/vmaNYsw1+Lv7CH4=;
        b=PI4pJAIpJiwZw0a4PX8OiHSK6QfddnEKLbIAOy6cM7hNb7h3c61EbzcHJAt67zJrlu
         IPmTOwgfnQExHVlu0s68Hv+d3pHcq/hlzupWsIFMq/7CHaZ0E1sv92VeRoVSwG7RrGYj
         m3VWlMx6jv23PV7HXnzIeH24aqmFCVlFK+K3WRMZOgmItNg6Kf9L+iPiNMlBmHt6s5W3
         E7OsJrF7v8+N5k7O5Bz5iZgDTZQmiMxKAOt4GogS3aQ+o0XdDvaLpIHfGErwcHULgaKJ
         pZ+J9pWHmcmPzVWWpSG/QgxRzZikghYN80jlWNZZbd4ue3wdvdKXBu2F3++GPG1Yb4VM
         BgEw==
X-Gm-Message-State: AOAM532IpYCcqW2wi06n+UaunhUaFvKzZpTmQoBFWsHxDHZ+tRPa19oW
        Qt2RV2Ej45m+Ls8zHbgNFuvYvLy0Zju0liw35Wnmz/h50S+ErQ==
X-Google-Smtp-Source: ABdhPJwFLYTWsHO4w9tn5tx1TRsmf2D7/1aB+UJZsn/BDn3ewv5pNMR/sA9MvUwu33iUy4lFiNrFOSQSnxhusFYru10=
X-Received: by 2002:a1f:d8c3:: with SMTP id p186mr18922917vkg.1.1624373816262;
 Tue, 22 Jun 2021 07:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
 <20210618095823.19885-2-biju.das.jz@bp.renesas.com> <CAMuHMdXLrfU99sQCbwLFifqrV4B94pzGi_DWbBvpS4-Y=Z09RA@mail.gmail.com>
 <OS0PR01MB5922B821B3893BAD08D2573A86099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922B821B3893BAD08D2573A86099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jun 2021 16:56:44 +0200
Message-ID: <CAMuHMdWQK_k3ePJpx2CF-X9TNgPYzzP8AW9N2rDjXSOAP2wNxQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update clock definitions
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Jun 22, 2021 at 11:26 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update clock
> > definitions
> > On Fri, Jun 18, 2021 at 11:58 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Update clock definitions as per the RZG2L_clock_list(Rev.02) manual.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/include/dt-bindings/clock/r9a07g044-cpg.h
> > > +++ b/include/dt-bindings/clock/r9a07g044-cpg.h

> > I do think we need a separate list of definitions for resets.  While
> > simple modules like SCIF and I2C have a one-to-one mapping from clock bits
> > to reset bits for, this is not the case for all modules.
> > E.g. SDHI has 4 clocks per instance, but only a single reset signal per
> > instance, while CANFD has a single clock, but two reset signals.
>
> OK, Agreed. We will list separate definitions for resets like,
>
> #define R9A07G044_RST_SDHI0             X1
> #define R9A07G044_RST_SDHI1             X2
> #define R9A07G044_RST_CAN               X3

Please use names that match the documentation, like
R9A07G044_SDHI0_IXRST and R9A07G044_SDHI0_CANFD_RSTP_N.

> Clk definitions
>
>         DEF_MOD("sdhi0_imclk",  R9A07G044_SDHI0_IMCLK,
>                                 CLK_SD0_DIV4,
>                                 0x554, BIT(0)),
>         DEF_MOD("sdhi0_imclk2", R9A07G044_SDHI0_IMCLK2,
>                                 CLK_SD0_DIV4,
>                                 0x554, BIT(1)),
>         DEF_MOD("sdhi0_clk_hs", R9A07G044_SDHI0_CLK_HS,
>                                 R9A07G044_CLK_SD0,
>                                 0x554, BIT(2),
>         DEF_MOD("sdhi0_aclk",   R9A07G044_SDHI0_ACLK,
>                                 R9A07G044_CLK_P1,
>                                 0x554, BIT(3)),

As each clock now corresponds to a single bit, you can store the bit
number (e.g. "0") instead of the bitmask ("BIT(0)").  This also works
for bits > 8, without needing to enlarge rzg2l_mod_clk.onoff  ;-)

> Reset definitions
> --------------------
>         DEF_RST("sdhi0_RST",    R9A07G044_RST_SDHI0,
>                                 0x854, BIT(0)),

Same here.
Note that you do not need names for resets, unlike clocks.

> And DTS instantiate both reset and clock entries.

What do you mean by "instantiate"?
The "clocks" and "resets" properties?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
