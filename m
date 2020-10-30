Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD3529FF2C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 08:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgJ3Hze (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 03:55:34 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:36053 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3Hze (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:55:34 -0400
Received: by mail-oo1-f67.google.com with SMTP id j6so1388632oot.3;
        Fri, 30 Oct 2020 00:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i23jS/gbz5X7YN7KU9IqT0XWSw21v9qjwEgB0M7JaQM=;
        b=P8avz5J2YYC5arHRgMlkWfbqNCHBsJwfOXqCIJ24J0T9JBhEULWpC67WEGnHPRZZuh
         Y388zxjLVNAckW5WUKGSquMdtXfHqNErsKTIvjmbkj6e68U3dqRX7GqF9A0ExewkOl9s
         MMRx1SMJHJkQ8HAHRlx5iWjhYKfn1GlSQ5glZu+pCa5mvdxDVbZyyf630fGlOjgKhKyd
         mbReQ82T2Raw9WGb66qttzpnMu7XUT3wgiIN9wJNwq6KDn4eCQdrS2eHGzwwQUCSX0DT
         L+MdnfL6bCqv822INYgmQkU7Vn367vM4jP2SabTg2EUJ7m1wEsTPqs6XRMJoWRT1M5/C
         HOOQ==
X-Gm-Message-State: AOAM532WchCJrGnQgZYohbob0MjtGCuHs6ZdFpD4BWoYAYRX9NBblMCG
        MLi3Rm8K1sw7qbi4yMXD3S4QlisLLA9Mic6eskSrAZQl80Q=
X-Google-Smtp-Source: ABdhPJzwt6U2dN2noBCm4rBxAA8dll1gAIICIkruPqhq0tUoD/H23nOY3qY9x9+ZBK5Y6BShJKmej98K+uA4CIwDFQ4=
X-Received: by 2002:a4a:e80b:: with SMTP id b11mr813437oob.1.1604044532122;
 Fri, 30 Oct 2020 00:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201029105515.16309-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVGO+DEgsTr62nA+egU2etZA_vwE9GrOG1JPWBvv90UXg@mail.gmail.com>
In-Reply-To: <CAMuHMdVGO+DEgsTr62nA+egU2etZA_vwE9GrOG1JPWBvv90UXg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Oct 2020 08:55:21 +0100
Message-ID: <CAMuHMdVPHhot+noBYwqfCtwYzKJD4hkwjBk_gwN4pDR0agwipg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a774c0: Add RPC clocks
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Oct 29, 2020 at 3:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Oct 29, 2020 at 11:55 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> > as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
> > driver.

> > +               if (e3_rpcsrc_parent) {
> > +                       parent = clks[core->parent >> 16];
> > +                       if (IS_ERR(parent))
> > +                               return ERR_CAST(parent);
> > +               }
> > +
> > +               return clk_register_divider_table(NULL, core->name,
> > +                                                 __clk_get_name(parent), 0,
> > +                                                 base + CPG_RPCCKCR, 3, 2, 0,
> > +                                                 e3_rpcsrc_parent ?
> > +                                                 cpg_rpcsrc_e3_pll1_div_table :
> > +                                                 cpg_rpcsrc_e3_pll0_div_table,
> > +                                                 &cpg_lock);
> > +
>
> So you want to keep the parent clock selection fixed, but still allow
> the system to change the divider?
> Why not support changing the parent too, by modeling this as a composite
> clock consisting of a mux and a divider?

To clarify: basically you have two options here:
  1. Model this clock as a non-mutable clock, based on the register settings
     at the time the kernel boots.  I.e. register it as a fixed-divider clock.
     This is how we handle the PLLx clocks.
  2. Model this clock as a fully-programmable clock.  I.e. implement both
     dynamic parent selection and dynamic divider selection.

You have picked something in between ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
