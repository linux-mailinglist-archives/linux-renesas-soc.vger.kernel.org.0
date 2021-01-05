Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B982EA904
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 11:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbhAEKl1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 05:41:27 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:36779 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729193AbhAEKl1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 05:41:27 -0500
Received: by mail-oi1-f169.google.com with SMTP id 9so35523518oiq.3;
        Tue, 05 Jan 2021 02:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BhNvTa8G3ACpSXzNTr2YPqZ77khq1SLnQS1+ZvTkWb4=;
        b=BtX1VM99o9XrYAIvGglxQAyxb39XUr1aE+Nev0MMUMpeR5EpQM0mtMUimGE84AX8Q7
         kD/6KxG8zNDi3pEeHaYiOv6A3TfkyRb53fErK+sww2kWJ26kVhCoXyi6BtuogC9Ywiv+
         hKqhh3XZfUw+MoGBPrMzbc/iqzMJvgOcPQD92JAhhs/d8z3IXN/D4beU+f12wtuKjC4h
         Ml74AddofYmKTOhJYe0nenPeC8uoabe5ofJ0a9aImjqmm5Y9Bezf3Id4PewjVOwgn9T/
         AjaR42ogrAEzOIcYWNG7nhJeyHgxF4OX56sPH19P69NfqT4x1MDRoLRO4iYFLIDAabRt
         J4mg==
X-Gm-Message-State: AOAM531Gr69IFK8FgWCFXd7bveD9Ggs7gnnw5C/vJ/Hopo2C4FiYH6eP
        tK8oZkbr/LYPsNQs92a18edHd81vlT+RVPA5thI=
X-Google-Smtp-Source: ABdhPJy8Upntzome+hHCzHzvupD1kjZGJllVBhKX3LHK5qrxPAZyZK23MdohxEU+SzXTcGO4EDSsgs+XEqxRl4mKu1o=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr2176737oia.54.1609843246147;
 Tue, 05 Jan 2021 02:40:46 -0800 (PST)
MIME-Version: 1.0
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com> <20201223172505.34736-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201223172505.34736-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 11:40:35 +0100
Message-ID: <CAMuHMdUkWoFzK6vdNSW2c21P01ee_HOtsmHG9sv7g9ogZrsm9g@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r8a779a0: add clocks for I2C
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Dec 23, 2020 at 6:25 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -152,6 +152,13 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
>         DEF_MOD("csi41",        400,    R8A779A0_CLK_CSI0),
>         DEF_MOD("csi42",        401,    R8A779A0_CLK_CSI0),
>         DEF_MOD("csi43",        402,    R8A779A0_CLK_CSI0),
> +       DEF_MOD("i2c0",         518,    R8A779A0_CLK_S3D2),
> +       DEF_MOD("i2c1",         519,    R8A779A0_CLK_S3D2),
> +       DEF_MOD("i2c2",         520,    R8A779A0_CLK_S3D2),
> +       DEF_MOD("i2c3",         521,    R8A779A0_CLK_S3D2),
> +       DEF_MOD("i2c4",         522,    R8A779A0_CLK_S3D2),
> +       DEF_MOD("i2c5",         523,    R8A779A0_CLK_S3D2),
> +       DEF_MOD("i2c6",         524,    R8A779A0_CLK_S3D2),

The R-Car V3U Series User’s Manual Rev.0.5 says the parent clock is S1D4
for all instances?

>         DEF_MOD("scif0",        702,    R8A779A0_CLK_S1D8),
>         DEF_MOD("scif1",        703,    R8A779A0_CLK_S1D8),
>         DEF_MOD("scif3",        704,    R8A779A0_CLK_S1D8),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
