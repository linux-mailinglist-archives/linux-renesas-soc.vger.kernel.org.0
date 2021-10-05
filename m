Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802FD422D02
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 17:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235067AbhJEPzH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 11:55:07 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:40456 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234516AbhJEPzH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 11:55:07 -0400
Received: by mail-vk1-f169.google.com with SMTP id w68so9528231vkd.7;
        Tue, 05 Oct 2021 08:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q1Xw4ky1AcjioHtE7GEPS21kis1agtXPzqqWu5ElWzw=;
        b=xFx9mMFrDg5X2RRXWIqe02Tp85oRkc3FGcVtP5KXZHguvCcP13YkHtORJ6Y0Gs10Sk
         yqJs8hg/hBoI0uAIXh6CURJrrnRUJVbwXA1PYtYc9vw10yfKu2TJP5kiYe7VM2Ro2FIg
         vpwBNoUsYFjw4hhs40wn5Oz46GA/RRKcs7kK9hLgzFL+11V91+893Zd3KJaKuyLs4P+E
         TVBW8JsUz4hDK/sCge+tWcWeuBrhxfEh+ccKM3zQQNTyqfWGjMmFV0GMcb5pm8oC6qKL
         JTbZRPzjUJtPonkPn5PXw1252a8k4npclf0nQ2z4vhX3ahsI7HoWfQAhmBI5PtIqvCah
         wasA==
X-Gm-Message-State: AOAM533zMA58y0obPY55i1sR32G5yekRN4rGTTJvoO5Rl+vtxaYU8gpo
        JoUXnXvvg28GEMzmLzBESHjgPrjJ582iwNXyTUY=
X-Google-Smtp-Source: ABdhPJySyFDo2gMuB4Sog6kJpK0vNWCGJy24yOXVGi7bsv0910NttdqlkVdV/OruwFCqqcoLj7F6CU/hV2deF6QskpU=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr21287493vka.19.1633449196000;
 Tue, 05 Oct 2021 08:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210929213431.5275-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20210929213431.5275-1-nikita.yoush@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Oct 2021 17:53:04 +0200
Message-ID: <CAMuHMdWBJSPWR+Tb87GcJiv_xkYjToOarTcHu8doAFsCECEd=w@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779[56]x: add MLP clock
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Nikita,

On Wed, Sep 29, 2021 at 11:35 PM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
>
> Add clocks for MLP module on Renesas H3 and M3.
>
> Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -229,6 +229,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
>         DEF_MOD("lvds",                  727,   R8A7795_CLK_S0D4),
>         DEF_MOD("hdmi1",                 728,   R8A7795_CLK_HDMI),
>         DEF_MOD("hdmi0",                 729,   R8A7795_CLK_HDMI),
> +       DEF_MOD("mlp",                   802,   R8A7795_CLK_S2D1),
>         DEF_MOD("vin7",                  804,   R8A7795_CLK_S0D2),
>         DEF_MOD("vin6",                  805,   R8A7795_CLK_S0D2),
>         DEF_MOD("vin5",                  806,   R8A7795_CLK_S0D2),
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index 41593c126faf..9c22977e42c2 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -207,6 +207,7 @@ static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
>         DEF_MOD("du0",                   724,   R8A7796_CLK_S2D1),
>         DEF_MOD("lvds",                  727,   R8A7796_CLK_S2D1),
>         DEF_MOD("hdmi0",                 729,   R8A7796_CLK_HDMI),
> +       DEF_MOD("mlp",                   802,   R8A7796_CLK_S2D1),
>         DEF_MOD("vin7",                  804,   R8A7796_CLK_S0D2),
>         DEF_MOD("vin6",                  805,   R8A7796_CLK_S0D2),
>         DEF_MOD("vin5",                  806,   R8A7796_CLK_S0D2),
> diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> index bc1be8bcbbe4..52c5da26b756 100644
> --- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> @@ -205,6 +205,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
>         DEF_MOD("lvds",                 727,    R8A77965_CLK_S2D1),
>         DEF_MOD("hdmi0",                729,    R8A77965_CLK_HDMI),
>
> +       DEF_MOD("mlp",                  802,    R8A77965_CLK_S2D1),
>         DEF_MOD("vin7",                 804,    R8A77965_CLK_S0D2),
>         DEF_MOD("vin6",                 805,    R8A77965_CLK_S0D2),
>         DEF_MOD("vin5",                 806,    R8A77965_CLK_S0D2),

These additions look fine to me.  I'm only wondering about the
actual parent clocks, which are not well-documented in the Hardware
User's Manual.
It does say that MLP uses the Audio main bus (AXI).
The related AUDIO-DMAC uses S1D2, which runs at 266 MHz, while S2D1
runs at 400 MHz?

BTW, do you plan to enable full support for MLP in the upstream kernel?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
