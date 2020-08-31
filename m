Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E51257B2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Aug 2020 16:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgHaOS6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 10:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgHaOS4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 10:18:56 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554E6C061573;
        Mon, 31 Aug 2020 07:18:56 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id h20so4107581ybj.8;
        Mon, 31 Aug 2020 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vPzA/szbiOJ4LZqmMIhJgb16iEL9gpjeImZDHNLa1K4=;
        b=AiV0tOH4tua4r/vbE/jeaLQJk25JCMzI1fGfk9/wqIdAdkDhez205t7pYCcXymDlHn
         J9Zl/z8dl6MbUsaUzLBMjmvzIceGaR9Gct+RmVQ/SbQRsE7sHaJpOssmZm8h1enNTy4y
         zTwf3J0eE8fyK3Q2b0Jaj9bylrHsNjphmHGQmudeSO/AZIjCvga0xIMbk9qvpsl3nfyM
         tQKDPPnPId6/NU+j6AOTXCX8Fn9vfPu3vkRrBOXjLUxO6W381rNEXxi9JfONSVGaYPpn
         F6JLhb4MUzwDiZrZjH+gopud/F6HNMqhUAu031OnhzgVYo5m4o+ChgEJhXnNHmKv80Bk
         eyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vPzA/szbiOJ4LZqmMIhJgb16iEL9gpjeImZDHNLa1K4=;
        b=fVgHGt/SPDWGXNRgL+a1CBwuF1FmVeJttyOiujN8xMwiGmB7ga7dX+8WEvNha5QZpy
         5MI3A/LUAEMgGpVHyjhT1POnoa4kbXed91zwpvvxpdKU2HtWypCORTnVmED7wcO7gILC
         fBUPetvfdsrwzA4BxywKO3g94rrtLVZwqeoZbPv4cpsxktOUXyGZIp0KU0w7bF+gHVlJ
         R9IHko8rX6yQr6JoDoKdq9bwQ7frxv7HnNhFQnASwRifNzRFwEl5ylSpah31LfyFW6KO
         JUaU6mKLrYieivXaxciI/6wrz1b+J0vF9MVlhSRpA9kqIqGX+JOE4142SfQlZGpfU3VA
         1ZCQ==
X-Gm-Message-State: AOAM530rCRi8aQcgcKOgRdXbwovYbD37GiX1yMuYC0QUXPUzYl4J9wHp
        HkYa3b6WIh76xH5ufhC5/cdCjza3Y+kghK/wH6A=
X-Google-Smtp-Source: ABdhPJxSTs3UD78TilStje9+W40Pevt8nfLuWLrVXscOYtAfK/JkBiBHmW9zKsARiP0rESdwi90FVSuyOoIUF6PlWII=
X-Received: by 2002:a25:2a58:: with SMTP id q85mr2710830ybq.518.1598883535216;
 Mon, 31 Aug 2020 07:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200825134806.25295-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVcGz_C+e49pgNM=ui8bTu6Vg0A7pZY6nq7n3RdAJObgg@mail.gmail.com>
In-Reply-To: <CAMuHMdVcGz_C+e49pgNM=ui8bTu6Vg0A7pZY6nq7n3RdAJObgg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 31 Aug 2020 15:18:29 +0100
Message-ID: <CA+V-a8v-KP95VXN84JzS5tJd6=ONy0+Pvse57PqgpWp20nNRxA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add clk entry for VSPR
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for your review.

On Mon, Aug 31, 2020 at 1:38 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, Aug 25, 2020 at 3:48 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add clock entry 130 for VSPR module, so that this module can be used
>
> VSPR ("VSP for Resizing")
>
> > on R8A7742 (RZ/G1H) SoC.
> >
> > Note: The entry for VSPR clock was accidentally dropped from RZ/G manual
> > when all the information related to RT were removed.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > Similar details can be seen in commit 79ea9934b8df ("ARM: shmobile:
> > r8a7790: Rename VSP1_(SY|RT) clocks to VSP1_(S|R)") for R-Car H2
>
> Indeed.  And R-Car H2 and other related soCs are still affected, as that
> fix never made it to the new clock drivers ;-(
>
> > --- a/drivers/clk/renesas/r8a7742-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a7742-cpg-mssr.c
> > @@ -97,6 +97,7 @@ static const struct mssr_mod_clk r8a7742_mod_clks[] __initconst = {
> >         DEF_MOD("tmu0",                  125,   R8A7742_CLK_CP),
> >         DEF_MOD("vsp1du1",               127,   R8A7742_CLK_ZS),
> >         DEF_MOD("vsp1du0",               128,   R8A7742_CLK_ZS),
> > +       DEF_MOD("vspr",                  130,   R8A7742_CLK_ZS),
> >         DEF_MOD("vsp1-sy",               131,   R8A7742_CLK_ZS),
>
> While at it, can you please replace "vsp1-sy" by "vsps" (VSPS = "VSP
> Standard"), and fix the other drivers, too?
>
Sure i'll get that done in v2.

Cheers,
Prabhakar

> Thanks!
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
