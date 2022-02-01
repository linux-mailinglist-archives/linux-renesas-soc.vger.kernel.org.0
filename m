Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3DC4A5912
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 10:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235901AbiBAJTf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 04:19:35 -0500
Received: from mail-vs1-f43.google.com ([209.85.217.43]:42676 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbiBAJTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 04:19:33 -0500
Received: by mail-vs1-f43.google.com with SMTP id b2so15207291vso.9;
        Tue, 01 Feb 2022 01:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Eg+BB1QyAAVqVyvFlkQBYib3dinTLoiwd6ISiamO1s=;
        b=DPvBDeZ5RGp/ihrheAMrQ8lXqOSwzcgaeYN6y0Nxpj3rKVnv5FL3S8yWcWoPpaxHTN
         8a1VHjNVGMk9vJA0PuvSIFSn8X4XJeRq3fiA884LLWx68ahrKFkPzVVhg5K670vyNgsD
         CjQbsPAghGpKOfhsXIgtoE3j0l8cIKw6r7RLaAkiIZ+TasgEw0xkhgycD7Aak34gaKYs
         0wF6kjQmK8dI+i2Cen7xr2IGymZT3UoxcrNT3wewTvyWVMS7QsISO4PSsi/jac3Iwldf
         33IDXGtSt635y8i9NeJk+/xAmxAAgS8lLdPPmOwhHfs6XDoWqFhG7N6+vzKkSeYQA9NH
         FreA==
X-Gm-Message-State: AOAM5309CPYeT/X3rqcI1Pzfl7uJdGl9VPyYw7zCwBhqM97YFZhgfyo7
        xVgBXufogvomb8uAwKdKhgRsjwk854f4pQ==
X-Google-Smtp-Source: ABdhPJwEpXQywxl88bTpC3erUP3ndkz+iUDpc8NkYBKkdLooiwaYfeCIzSIHflIxOS/M3QcQ73+S4g==
X-Received: by 2002:a67:d98e:: with SMTP id u14mr10106133vsj.2.1643707172398;
        Tue, 01 Feb 2022 01:19:32 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id h22sm797097vsj.0.2022.02.01.01.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 01:19:31 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id t20so15230197vsq.12;
        Tue, 01 Feb 2022 01:19:31 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr9037927vsb.68.1643707171072;
 Tue, 01 Feb 2022 01:19:31 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 10:19:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUMj8oDXiT9AD8xyPeVu-8Ye+5j-nhO624o9kEG4o56ag@mail.gmail.com>
Message-ID: <CAMuHMdUMj8oDXiT9AD8xyPeVu-8Ye+5j-nhO624o9kEG4o56ag@mail.gmail.com>
Subject: Re: [RFC 05/28] clk: renesas: r9a07g044: Add {M2, M2_DIV2} Clocks support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Vinod <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for {M2, M2_DIV2} clocks which is sourced from pll3_533.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -54,6 +54,7 @@ enum clk_ids {
>         CLK_SD1_DIV4,
>         CLK_SEL_GPU2,
>         CLK_SEL_PLL5_4,
> +       CLK_M2_DIV2,

Shouldn't this be inserted closer to its parent?

>
>         /* Module Clocks */
>         MOD_CLK_BASE,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
