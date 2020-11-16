Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454642B41C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 11:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgKPK45 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 05:56:57 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38493 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbgKPK45 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 05:56:57 -0500
Received: by mail-ot1-f67.google.com with SMTP id a15so15569784otf.5;
        Mon, 16 Nov 2020 02:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGXqmgXtciTjV7D0ePkbH42iUymxNwF90ITK3kJj9jg=;
        b=EUZ6DqwhdaNVKSwf4mj4OHDEQ9lh7OMw2D6NCMYLeDSnTwTSv3fzlkvkoNmPA4qjRE
         o23rN6y2m+upzadq7jZoLaMEjQFtAQzYseDoT5QMSmw4N4YGj29BiupFoYj+RUO9IRDI
         snckz4vJKLE5JHbesQ7JNVJplaiq/IysXnnjJaferqXnGonI9uLdy8ugs93Wpw1y1u0n
         bDnpF9KTh4CQximFQbMm7VkiZZ2/oCtRlVLgvtUldT9qBmTui2uBBUh6qeO8IPz0EaHT
         UGLnHlMfjSDB/h16vybusNHvYvy3iKwDmyhiC3vrZRYt/Fvs9ZHn9EAw9e/j2PiY8HG0
         DJvA==
X-Gm-Message-State: AOAM5310us6/P08qHXhuXAKGMT9wtaDss8e/zU0+PRWalUyetT/evPkv
        zp9KqMbINleEkbZvNmZhWojiI1P6nP6/a0jkvZg=
X-Google-Smtp-Source: ABdhPJzjSu7dkkX0Ri9/g0lKAJfefdLTh683954I10Sq7qKQ+09oLFfxd3wTn1fc3GoIgIp66Xessm50DTVdQd6fip8=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr10435533oth.250.1605524216315;
 Mon, 16 Nov 2020 02:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20201116101002.5986-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201116101002.5986-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Nov 2020 11:56:45 +0100
Message-ID: <CAMuHMdWtoUCzJr43HcvtQ9c9OEoP1Ngk_=PyopQCXZPeic0RVg@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: r8a774c0: Add RPC clocks
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

On Mon, Nov 16, 2020 at 11:10 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
> driver.
>
> Add new clk type CLK_TYPE_GEN3_E3_RPCSRC to register rpcsrc as a fixed
> clock on R-Car Gen3 E3 (and also RZ/G2E which is identical to E3 SoC),
> parent and the divider is set based on the register value CPG_RPCCKCR[4:3]
> which has been set prior to booting the kernel.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4
> * Dropped cross verification of clock source
> * Changed DEF_FIXED_RPCSRC_E3 macro so that SoC specific div can be passed
>   which would make addition of D3 SoC easier
> * Renamed CLK_TYPE_GEN3E3_RPCSRC to CLK_TYPE_GEN3_E3_RPCSRC
> * Updated the commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
