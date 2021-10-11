Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB56429650
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 20:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234276AbhJKSFc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 14:05:32 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:41654 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJKSFb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 14:05:31 -0400
Received: by mail-ua1-f51.google.com with SMTP id r17so6130691uaf.8;
        Mon, 11 Oct 2021 11:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wsvJYdXlQZfoh+yebRXa2TOthgbSmmVjIdwtn+IUjj0=;
        b=BmzkzxanaZIl6wFaySfCAnvZMAenQXmOslZQCnvhuDhYODJsUar2XXONY+/ScXKWM/
         7Si/P9jEP43NBTBo3byVlu8R/3Q+fUNNt5qGtMCP0rwHUOkjVdTVb6fW0c/L6ZGbjd2h
         SStqbAWCYMb97v4ym1UJrIdntuv7cbzLF3RwI+iYyInOyP2Ki8wAephNFO2882IKbNld
         vHLa0E6dwO/zxruY3d0koU/LEv9F8ufVUrAZHFQS304cQzircsTr8fpJY72x3nTKsWJv
         BdHtsFA02J6fygr8wC8KMr2BXl2gpJ6vKKXpQdCCnKAoTx+NCL5fiRuy7TVsnFsBaRkJ
         o/wA==
X-Gm-Message-State: AOAM533aopmhVJdu8/P83sFhRvbcpOo/jIoVNqduqZlP7me15ynuvWzc
        uiHPGw6IE6418n896gsSHTBCh38WM5JFNmiPVbU=
X-Google-Smtp-Source: ABdhPJwpjA/Q90MlQKsdj0mGUSl3JNNL8l+MJGj+nP3D5t3MvaIDM4Mdy3W/97pZKGz6hGFb4YjiJg7s4R8iJf3gi0E=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr25312645vsl.9.1633975410989;
 Mon, 11 Oct 2021 11:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com> <20210928200804.50922-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210928200804.50922-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 20:03:19 +0200
Message-ID: <CAMuHMdV9K+cfx9-ORRR7AHnYv+XmN63yzOEP9_Pw1D_gQd7LhQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/9] clk: renesas: add SDnH clock to Gen3 SoCs
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

clk: renesas: rcar-gen3: ...

On Tue, Sep 28, 2021 at 10:08 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Currently a pass-through clock but we will make it a real divider clock
> in the next patches.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
> @@ -97,10 +97,14 @@ static const struct cpg_core_clk r8a774b1_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",       R8A774B1_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",       R8A774B1_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",      R8A774B1_CLK_SD0,   CLK_SDSRC,     0x074),
> -       DEF_GEN3_SD("sd1",      R8A774B1_CLK_SD1,   CLK_SDSRC,     0x078),
> -       DEF_GEN3_SD("sd2",      R8A774B1_CLK_SD2,   CLK_SDSRC,     0x268),
> -       DEF_GEN3_SD("sd3",      R8A774B1_CLK_SD3,   CLK_SDSRC,     0x26c),
> +       DEF_GEN3_SDH("sd0h",    R8A774B1_CLK_SD0H,  CLK_SDSRC,         0x074),
> +       DEF_GEN3_SD( "sd0",     R8A774B1_CLK_SD0,   R8A774B1_CLK_SD0H, 0x074),
> +       DEF_GEN3_SDH("sd1h",    R8A774B1_CLK_SD1H,  CLK_SDSRC,         0x078),
> +       DEF_GEN3_SD( "sd1",     R8A774B1_CLK_SD1,   R8A774B1_CLK_SD1H, 0x078),
> +       DEF_GEN3_SDH("sd2h",    R8A774B1_CLK_SD2H,  CLK_SDSRC,         0x268),
> +       DEF_GEN3_SD( "sd2",     R8A774B1_CLK_SD2,   R8A774B1_CLK_SD2H, 0x268),
> +       DEF_GEN3_SDH("sd3h",    R8A774B1_CLK_SD3H,  CLK_SDSRC,         0x26c),
> +       DEF_GEN3_SD( "sd3",     R8A774B1_CLK_SD3,   R8A774B1_CLK_SD3H, 0x26c),

checkpatch says (also for other source files):

    WARNING: please, no space before tabs

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
