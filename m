Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDA82C6165
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 10:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgK0JNR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 04:13:17 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45075 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgK0JNQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 04:13:16 -0500
Received: by mail-ot1-f68.google.com with SMTP id k3so4090303otp.12;
        Fri, 27 Nov 2020 01:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EFMRDHK8b4cBosOGmmoEpo6+nuyXHFjHpiMakCNjazg=;
        b=fY/tji03Dq/bgYoCxUX0iIDZ0mKTWI0+kvISlevuod8TkKtFNJCQZEN0QIG0KDT0j8
         RUFg+D2BVElReeT6PTsRH1ednOE+Tdt5Xyy65qj1B2dZ2QT5gfVvZCrFWf+nmC9r4zg5
         mLgfZG98QMxzyKos/rcfCOwOgEhgBkk3K/wckm7soQWO+x8GkyooZA6cevYGDMWqjYzR
         YgyVUYYKMaf2jC3sfy81GqWAXNbeuLVHrEUueyuoiM/kQ+A42jl6oLmpDeKr1jSW92bE
         GiFn3k6UnstSo1NR5lCwfz5OOTcR60QJ+kIZFsY0eeQQNVeEEm4My5s3Eh5ELOKtyEXT
         DmpQ==
X-Gm-Message-State: AOAM530yZ77w9YOOoWnoFQQ6bWgjIHXTEk6+ZJ+05+lf3c329MczscIK
        uqDEkMPG0mjEeWUX8DdLFgr0DuwsUe8+OTuaek3nLEaK
X-Google-Smtp-Source: ABdhPJzyt5CbZnD46moUfhogjkoN1NcWMCOqTdC9ciCNUITy5c0HGt3IRNNBYMtvtlGWdyn0/Im6/Iu754LLP/GXEmQ=
X-Received: by 2002:a9d:686:: with SMTP id 6mr4786847otx.107.1606468394323;
 Fri, 27 Nov 2020 01:13:14 -0800 (PST)
MIME-Version: 1.0
References: <20201126221416.3110341-1-niklas.soderlund+renesas@ragnatech.se> <20201126221416.3110341-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201126221416.3110341-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Nov 2020 10:13:03 +0100
Message-ID: <CAMuHMdW34yrcbJ=pTXRTRoQyXXJ6_8_TPBjS-vHo6pxiuOqKCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r8a779a0: Add THS/TSC clock
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Thu, Nov 26, 2020 at 11:14 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Implement support for the THS/TSC clock on V3U
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -190,6 +190,7 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
>         DEF_MOD("vin35",        827,    R8A779A0_CLK_S1D1),
>         DEF_MOD("vin36",        828,    R8A779A0_CLK_S1D1),
>         DEF_MOD("vin37",        829,    R8A779A0_CLK_S1D1),
> +       DEF_MOD("thermal",      919,    R8A779A0_CLK_CP),
>  };

The R-Car V3U Series User's Manual calls this clock "tsc", and states its
parent is "cl16m".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
