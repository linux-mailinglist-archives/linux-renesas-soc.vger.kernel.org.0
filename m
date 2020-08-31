Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC75D257979
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Aug 2020 14:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgHaMjB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 08:39:01 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41600 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgHaMit (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 08:38:49 -0400
Received: by mail-oi1-f196.google.com with SMTP id 2so815240ois.8;
        Mon, 31 Aug 2020 05:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pCsWJiU+SeSX/BQT94U7ntSq2DXQU2wdBG6dv3ohm/A=;
        b=snrgaOzUERKjWMwbP2Mq32S44hzGQgMsBpYMip7G6ah2ayCAjcd02Z5vMqdegoCvEo
         hE39wJAjl6x2E3Ep0AOOfAkenpev18KYk5VBE2bhW8sR4U1TlYC56JjhRBFxxgbalQqQ
         l68ldYB0UAbGZAOh9cpYPobqks9pX57gkg0xpLGmQ1rTqbIRKHXZrMTcxoxxbyLg9RhO
         9zgGKmHAUXItskNRKhkUmEiF08xs+Lq/umsPnhw7DegkHoaqvMEG65mU//Rkn5aoJFGs
         h7/kzp7oXLOibRy/WNGGCOFqUqSEd+mH6KXbY7cD1O721QTNiz60g+2Xlucq5ox07o25
         42Pg==
X-Gm-Message-State: AOAM532O1HPCr3t7opI9GPFIM45W2lZb/o6rPgbW4YhsTIMedmLT2N3W
        V8ayodtJZQdS4vsXPysDDTY/bQ0Q6ezjFOLJ2oYZyTyJHQA=
X-Google-Smtp-Source: ABdhPJzZB+2rt1wEa6gxS0s5ZyQyHRzufXJ1mYnhpK/hQPbXX6bNUonm86n9yv9d6v1JRXAsU5O4A+NuvGI1eRzAOJU=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr639635oib.54.1598877527029;
 Mon, 31 Aug 2020 05:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200825134806.25295-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200825134806.25295-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 31 Aug 2020 14:38:35 +0200
Message-ID: <CAMuHMdVcGz_C+e49pgNM=ui8bTu6Vg0A7pZY6nq7n3RdAJObgg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add clk entry for VSPR
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thanks for your patch!

On Tue, Aug 25, 2020 at 3:48 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add clock entry 130 for VSPR module, so that this module can be used

VSPR ("VSP for Resizing")

> on R8A7742 (RZ/G1H) SoC.
>
> Note: The entry for VSPR clock was accidentally dropped from RZ/G manual
> when all the information related to RT were removed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Similar details can be seen in commit 79ea9934b8df ("ARM: shmobile:
> r8a7790: Rename VSP1_(SY|RT) clocks to VSP1_(S|R)") for R-Car H2

Indeed.  And R-Car H2 and other related soCs are still affected, as that
fix never made it to the new clock drivers ;-(

> --- a/drivers/clk/renesas/r8a7742-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7742-cpg-mssr.c
> @@ -97,6 +97,7 @@ static const struct mssr_mod_clk r8a7742_mod_clks[] __initconst = {
>         DEF_MOD("tmu0",                  125,   R8A7742_CLK_CP),
>         DEF_MOD("vsp1du1",               127,   R8A7742_CLK_ZS),
>         DEF_MOD("vsp1du0",               128,   R8A7742_CLK_ZS),
> +       DEF_MOD("vspr",                  130,   R8A7742_CLK_ZS),
>         DEF_MOD("vsp1-sy",               131,   R8A7742_CLK_ZS),

While at it, can you please replace "vsp1-sy" by "vsps" (VSPS = "VSP
Standard"), and fix the other drivers, too?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
