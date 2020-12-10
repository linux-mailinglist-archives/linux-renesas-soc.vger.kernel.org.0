Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F55E2D5C5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 14:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389432AbgLJNwG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 08:52:06 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:40124 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388970AbgLJNv6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 08:51:58 -0500
Received: by mail-oi1-f170.google.com with SMTP id p126so5758764oif.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Dec 2020 05:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQPjUP08guN/Xac18MNxsDEyikXIfL+2A1nA0E8sr+s=;
        b=ExRzdfCfClbdJf79+ug8aeNDKKHVEp87RLTy3ncU/0k+Eg00h5FzlbzwKnrKG8Ez7L
         hVsWurJGbqxL1DTN+vJy9woYDc3p5j9JXjD8PlTYcAy4+F59xKxbvWf2FdgUY42u8Tjt
         W76Q2zid/P9LpML8KXE4aHVof9z7y43U+nGPXXNRaa1izQh7Sa/vqWv9s4QKRZyl2/aL
         9CwJF0Kd+mNioDi4PSO2LYkt0ocfH+nxfZzYAFMS89wU2wy2gMpKxYRdFWh4fdc/uyYM
         hLwzD7PRn2ckUUg7dIfYAD6cfbK8/VD2lSvtlybSNL0jG7OOUwyl4KcL+sPWqB9EQpBe
         LhTg==
X-Gm-Message-State: AOAM530Wb7VaPjO45idbuFU6M91DNuojoFAX5VVvMt6vBb6gpEgfgfoZ
        TLm1C7sT7UobDEJL+U4w4AOYJXD7xvAyW9q69vxXabbPXao=
X-Google-Smtp-Source: ABdhPJwpfWzgB+FjqBOdJK1xXuW0wsQgoog3Pm+xd6s8gw54tSvtY5ROJ2MtIMn6HZWQNDqFniAVGkhwFtMQmPhrOOY=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr5374614oia.148.1607608277772;
 Thu, 10 Dec 2020 05:51:17 -0800 (PST)
MIME-Version: 1.0
References: <c84c0d96-b768-600a-e412-f25d5ae299e5@iot.bzh>
In-Reply-To: <c84c0d96-b768-600a-e412-f25d5ae299e5@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 14:51:06 +0100
Message-ID: <CAMuHMdWQomuhL71F9c9n1M=rUaAAnV9oPvN_mRQBK8vrLG8-Hw@mail.gmail.com>
Subject: Re: Parent clock for MFIS module
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

On Thu, Dec 10, 2020 at 2:17 PM Julien Massot <julien.massot@iot.bzh> wrote:
> I did a linux driver which makes use of the MFIS module, and so my first
> step would be to send a patch to add the MFIS module clock, which will
> basically do that:
>
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -137,6 +137,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[]
> __initdata = {
>         DEF_MOD("msiof2",                209,   R8A7795_CLK_MSO),
>         DEF_MOD("msiof1",                210,   R8A7795_CLK_MSO),
>         DEF_MOD("msiof0",                211,   R8A7795_CLK_MSO),
> +       DEF_MOD("mfis",                  213,   R8A7795_CLK_MSO),
>         DEF_MOD("sys-dmac2",             217,   R8A7795_CLK_S3D1),
>
> But the third parameter of DEF_MOD is definitely wrong and despite
> having read the hardware manual I can't figure out where this
> information is. Does someone have any hint on where to find the parent
> clock for the mfis mod clock ?

Unfortunately this information isn't always properly documented in the
Hardware User's Manual.  Based on the MFIS Block Diagram, I would
say it must be one of the APB bus clocks.

The BSP uses R8A77970_CLK_S2D2 for R-Car V3M, which sounds
reasonable. Reading the PCIe chapter, it could also be S3D1 or S3D3.
However, in this case, the driver wouldn't care about the clock rate,
so the actual parent clock used doesn't matter much.
Hence S2D2 sounds acceptable to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
