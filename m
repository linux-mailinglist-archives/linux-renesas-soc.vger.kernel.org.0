Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB0F42671D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 11:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239258AbhJHJsb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 05:48:31 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:46927 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239243AbhJHJsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 05:48:31 -0400
Received: by mail-vs1-f54.google.com with SMTP id o15so5036139vsr.13;
        Fri, 08 Oct 2021 02:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dDxXTwD9W/UyPRLFm8DBvWQ1XnuyqNvFuXxe/PQ3Qq4=;
        b=Abvxb+roQllLFBG0m2uzsaR5CSOy/QpAWnkmQMvQy7DleHDanKb/ZUEoRSqmTop7K6
         Az02pvq0ls5ubEvFT1SddUAFgxOdJ82zs7npth+k03buKCPY2uknYypf5c4U8rti5Xd0
         mfVRXVSRL8Yx/RzxvCm5vuZyi3W/FNcL/hW3D53cQRY4hWvgNrIC1Y34lsEeCHmZ4vsc
         l/dXGR10IrRkktLfR3UiQNM+OM9YsnWotAb5Dyhv4fqvyzCXscVllbU7DWsTGFKkpKnD
         08+LjhthgxpBsTWjBO5xbRLi5Ywa/ZunI4UT/ksb3aBtOMgh53cUb79evwV5WEhw4fTk
         87Og==
X-Gm-Message-State: AOAM531WqPsHgmyLHxwnG4+vM/vZDuUYT7kd5fqWDtjzI4THmj0VZzK1
        KshVzXgy5Aed1HhvJtUsxxjWwIaFKE0hY2Fi6AchFax+
X-Google-Smtp-Source: ABdhPJzw7MkI9yt1Um/Q10RUSzsIWk90cMyMklD09KpTvfB0X06hXwD55iL3BU5JWqcfh0iC4Uh+Z1FSMAxpC+1MwtM=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr9471328vse.50.1633686396056;
 Fri, 08 Oct 2021 02:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211007111434.8665-1-biju.das.jz@bp.renesas.com> <20211007111434.8665-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211007111434.8665-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Oct 2021 11:46:25 +0200
Message-ID: <CAMuHMdUD6CEUWnL+PAowN1fAoTpuh6=JXt8gwCgeqH2u0Cpv5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drivers: clk: renesas: rzg2l-cpg: Add SDHI clk mux support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
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

On Thu, Oct 7, 2021 at 1:14 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI clk mux support to select SDHI clock from different clock
> sources.
>
> As per HW manual, direct clock switching from 533MHz to 400MHz and
> vice versa is not recommended. So added support for handling this
> in mux.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> This patch depend upon [1]
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210928130132.15022-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> v1->v2:
>  * Removed flags and mux flags
>  * Added readl_poll_timeout to check CPG_CLKSTATUS.SELSDHIx_STS bit
>  * Added curly braces around val in rzg2l_cpg_sd_clk_mux_get_parent()

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
