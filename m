Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077D03A6687
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 14:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbhFNM3H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 08:29:07 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:34759 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbhFNM3G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 08:29:06 -0400
Received: by mail-vs1-f51.google.com with SMTP id q2so7679186vsr.1;
        Mon, 14 Jun 2021 05:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L711Ag5/juTcjNB1RgOqhXyWwY1X5qNPuCaA8YLk/r8=;
        b=NrUWrxh8hk650QJWgyCAS/BJmxGxUPkLZkDqPh1jfT6wrIGaX5XWkT4Az1iKWTaRoK
         oyXX2F+WxmAFRsTfpXhd4LpCxlKo8rS4Hxrc8g70cFlkY0bPSbjFrMNHHMZkbesmlaD5
         MB8VybkRJZPMvCcBK71Ggvt7afPzxkA8G3kGLWmIgptgmN63NkfVp89i54FkLP9dg5kd
         RbZV/d04sf6cTgteJ1C6cE1HEZQJW0srnfVmJ5kN64acq13IAEGCmOl/FwvWa75nozz4
         pQwKbgA/8t61IHhsIgEv4rQGbNRlD/td0NaHSX19SLAVKe7ZhHmtih3z1slG8+tdswxK
         VRuA==
X-Gm-Message-State: AOAM530EBsI3eSTVPfWMyQwYIFxqRDBnBf/qpc7sLtJ1WSFs41mAW5wd
        +vlLkrGQWyaYYf6Qw3oNU4zbi77dB96iRBKqfgLvfb4UIv44qw==
X-Google-Smtp-Source: ABdhPJzJzMoR7QaIUWLeMNtZpbsPkPwFzSXE3b+XiGq9/GotFfq9AlOUR3wi0QAgWIicTFKnkDCP+HM79VqTbqvBkEs=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr16867962vsr.40.1623673611590;
 Mon, 14 Jun 2021 05:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com> <20210611134642.24029-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210611134642.24029-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 14:26:40 +0200
Message-ID: <CAMuHMdXpOGWLMXph9OGeZqZiy33O_y5z2XfAf0YzQgb4q_8+rA@mail.gmail.com>
Subject: Re: [PATCH 2/6] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jun 11, 2021 at 3:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add clock entries for USB{0,1}.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -88,6 +88,12 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
>         DEF_MOD("dmac",         R9A07G044_CLK_DMAC,
>                                 R9A07G044_CLK_P1,
>                                 0x52c, (BIT(0) | BIT(1)), (BIT(0) | BIT(1))),
> +       DEF_MOD("usb0",         R9A07G044_CLK_USB0,
> +                               R9A07G044_CLK_P1,
> +                               0x578, (BIT(0) | BIT(2) | BIT(3)), (BIT(0) | BIT(2) | BIT(3))),
> +       DEF_MOD("usb1",         R9A07G044_CLK_USB1,
> +                               R9A07G044_CLK_P1,
> +                               0x578, (BIT(1) | BIT(3)), (BIT(1) | BIT(3))),
>         DEF_MOD("scif0",        R9A07G044_CLK_SCIF0,
>                                 R9A07G044_CLK_P0,
>                                 0x584, BIT(0), BIT(0)),

While the above matches the datasheet, I see a problem with the
implementation. As BIT(3) of the CPG_{CLKON,CLKMON,RST}_USB is shared by
the two USB2.0 channels, disabling USB_PCLK or asserting USB_PRESETN
will affect both channels.  So it looks like you need special handling
to make sure that doesn't happen while the other channel is in use.

Or am I missing something?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
