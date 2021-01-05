Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A073C2EAE24
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 16:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbhAEPWi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 10:22:38 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:43330 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727155AbhAEPWi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 10:22:38 -0500
Received: by mail-oi1-f181.google.com with SMTP id q25so36328257oij.10;
        Tue, 05 Jan 2021 07:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SyJz6levXME/UC68QYJ+4uWzdWFE5a0wg54YwkbqupA=;
        b=sFr/tVBKMYMXmvM59hcEeuqJM/4x9aYYEe+YCnLFwj5OiuNJvNTavTALsQhEbzA41q
         e5DTvZsocWnPoydSPVrji+JGfbp3JSHIukjOgZ2NuKMdbyzhDsHJr+nf4d3AaydGrjOR
         CTjE9SvKyimO+TPg+h8sByWjXz8qyMiDZ09I9hjcvIzbqGwdG/3TYtiI0GneBRm9KKR1
         3jAp0GYhJh1z9eSY7/VeETslz/j3NTfpg+O5ZhL12lnKNnPkDzwkqn1zKaOPoJZQZDAE
         TjL1TuhLGgNkWjuYPd21s3Lx4rxjp9/QlLg7gy7emzIIo2cOMvCZlvQw+kBIdAbu++ai
         yiAg==
X-Gm-Message-State: AOAM531bQ38XdoKCdR2xggok27yTeAiurHzKrsNAsh+FF8IUrkrzU+kN
        QeaGOVCyhuaDV0M57aS9TneXa8rc7Jt+vQ3+bTA=
X-Google-Smtp-Source: ABdhPJzkhKmVXnk0Pj461vV/IRhT+3JmtzHyPQ5LcBcKlrPuJ0N6+JVymPrMth8UpJzTmbW/WgwN/RKozZ0duOtuXg8=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr39452oia.54.1609860117189;
 Tue, 05 Jan 2021 07:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20201227130407.10991-1-wsa+renesas@sang-engineering.com> <20201227130407.10991-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227130407.10991-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 16:21:46 +0100
Message-ID: <CAMuHMdXaOQRjp1vMwRDKK2ckBKX9BpLrqSfzGXRMnbXyKzSygQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r8a779a0: add clocks for RAVB
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Sun, Dec 27, 2020 at 2:04 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -148,6 +148,12 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
>  };
>
>  static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
> +       DEF_MOD("avb0",         211,    R8A779A0_CLK_S3D1),
> +       DEF_MOD("avb1",         212,    R8A779A0_CLK_S3D1),
> +       DEF_MOD("avb2",         213,    R8A779A0_CLK_S3D1),
> +       DEF_MOD("avb3",         214,    R8A779A0_CLK_S3D1),
> +       DEF_MOD("avb4",         215,    R8A779A0_CLK_S3D1),
> +       DEF_MOD("avb5",         216,    R8A779A0_CLK_S3D1),

For all other SoCs, we used the HP clock (S3D2 on R-Car V3U) instead
of the ZS clock as the parent clock of the EtherAVB module clocks.
Hence I think we should be consequent and use S3D2 here.

>         DEF_MOD("csi40",        331,    R8A779A0_CLK_CSI0),
>         DEF_MOD("csi41",        400,    R8A779A0_CLK_CSI0),
>         DEF_MOD("csi42",        401,    R8A779A0_CLK_CSI0),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
