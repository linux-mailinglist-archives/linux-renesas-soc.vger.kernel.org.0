Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0084A5E67
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 15:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239391AbiBAOgo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 09:36:44 -0500
Received: from mail-vk1-f174.google.com ([209.85.221.174]:34698 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239387AbiBAOgn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 09:36:43 -0500
Received: by mail-vk1-f174.google.com with SMTP id j185so10641428vkc.1;
        Tue, 01 Feb 2022 06:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Al7yQnSF9IlD1H2DFNIlSXlCMrqCG66VikNtkW+kQig=;
        b=Rc5lvoDr7kT959usMpEexxl5MC4ibbCl94QeZ6JdaYaeBxk6PKszHFHBwvRTGUjsYt
         dgnqi6BuDOB0QhwXu6ongR/KXLbpJzgbL4PeZ102MGLDWG9ciN/I99JHqONbJYNDnkIF
         xu9Ev80QEBnUlFZfkwrtOJ7uHCM7mh7j6W/jEq+PB02jiNjjuNbUHKZgeMuuxY58yQZi
         Bj+p1D5ZoOv8L4qwl8nYfb1fugcFCRWhtxCfIR/Y1Ynh7xBtqv/i/Rjc5jKkB68OA3/4
         k9MZqLenL1IAydbyizHcqrFpT1eNESrlbbWWOkruvqf/w+GV/TII2icZlkTtb4xZtXzl
         j8HQ==
X-Gm-Message-State: AOAM533bSMw/sO5+2gbpVKE8pcWlJ4+BtagsdX4CahyWbTFfwmb39cQH
        lqiEw1x3CTPVvMFr1kJWflCjuBLhLVESkA==
X-Google-Smtp-Source: ABdhPJxyTqp7PKos/oa9FV9/xF/SNi96EKvfarSqp5zeAFZ770xotO5KzuVYSUPj/z1iHi8D9gAFTA==
X-Received: by 2002:a1f:170c:: with SMTP id 12mr10232221vkx.0.1643726202988;
        Tue, 01 Feb 2022 06:36:42 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id t22sm746601uaj.8.2022.02.01.06.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 06:36:42 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id g23so16325665vsf.7;
        Tue, 01 Feb 2022 06:36:42 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr10322399vsj.5.1643726202094;
 Tue, 01 Feb 2022 06:36:42 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 15:36:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJz8BHXw=NdV0c9P3JZ0QH655njmA4cNx1j1mGJhDsHQ@mail.gmail.com>
Message-ID: <CAMuHMdXJz8BHXw=NdV0c9P3JZ0QH655njmA4cNx1j1mGJhDsHQ@mail.gmail.com>
Subject: Re: [RFC 04/28] clk: renesas: r9a07g044: Add M1 clock support
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

On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for M1 clock which is sourced from FOUTPOSTDIV.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c

The above looks correct to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> @@ -353,4 +362,7 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
>         /* Resets */
>         .resets = r9a07g044_resets,
>         .num_resets = ARRAY_SIZE(r9a07g044_resets),
> +
> +       /* lcdc mode for PLL5 settings*/
> +       .pll5_lcdc_dsi_mode = true,
>  };

This is the part I don't like, but I guess you could imagine ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
