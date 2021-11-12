Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F5544E6FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234899AbhKLNIF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:08:05 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:43743 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbhKLNIC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:08:02 -0500
Received: by mail-ua1-f45.google.com with SMTP id v3so18546734uam.10;
        Fri, 12 Nov 2021 05:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cpWPWQ5V5jSlJkNgA2Bco8aLW+Cp4lV6fRTZaCU0dKY=;
        b=GBEQc+QYuqmNX3jOJb9rU3MDtQZfH3gpyN5u226LRal8YkHrtgZYmgPJP8hSluFKj9
         gYK+PDe8rJXc3WGzepGyeXbHzmjuP5weUCeMZnFKUKlYUeurc6Kj3PQuAmnydLfqC8sw
         GiKYZiMUsc2yjtMplHt/0TG/TmOh8WZMEU18Upd2FJINMCP6PBDdr8rP0VQdVS0fhhBO
         B1zkhumCuA9n10/mHc1O35BbuAf6CqTN2mzwPnwnOPheEkDpHzSD/7U5nm55996FRNzv
         BfSxr/FaLTyDDnbMd52tn0DIzYDBVvCIqzrsgQ/p+eoalbCHn4UC1raSuVuzcEvPeDTr
         rmsA==
X-Gm-Message-State: AOAM531ckA840GYshX9wUTXxo5Q7dV+pa8s3NC+Q7hASSkX2VtwWy6zg
        DGumZfWgaGX35jGxjEiBd7JFwWLi34N+3w==
X-Google-Smtp-Source: ABdhPJyIcW8iZmylvMj5kHMTjcG+ppcPV4airBPDM0GxK6sBk6opPyv5MsQehqZ+Orl8ob7DdMnCYQ==
X-Received: by 2002:a67:3310:: with SMTP id z16mr9701544vsz.5.1636722311295;
        Fri, 12 Nov 2021 05:05:11 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 23sm3766735vkk.17.2021.11.12.05.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:05:11 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id l43so18647398uad.4;
        Fri, 12 Nov 2021 05:05:10 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr9951410vsl.35.1636722310600;
 Fri, 12 Nov 2021 05:05:10 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:04:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXLNB3ycxFkXH6UHAbAHWk0qr4UnSq5VNnYTXsEqTBzHQ@mail.gmail.com>
Message-ID: <CAMuHMdXLNB3ycxFkXH6UHAbAHWk0qr4UnSq5VNnYTXsEqTBzHQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/21] clk: renesas: rcar-gen3: add SDnH clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Currently a pass-through clock but we will make it a real divider clock
> in the next patches.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since RFC v1:
> * fixed subject prefix
> * fixed whitespace issues
> * added tag from Geert

Thanks for the update!

> --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> @@ -100,10 +100,14 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",       R8A774A1_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",       R8A774A1_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",      R8A774A1_CLK_SD0,   CLK_SDSRC,     0x074),
> -       DEF_GEN3_SD("sd1",      R8A774A1_CLK_SD1,   CLK_SDSRC,     0x078),
> -       DEF_GEN3_SD("sd2",      R8A774A1_CLK_SD2,   CLK_SDSRC,     0x268),
> -       DEF_GEN3_SD("sd3",      R8A774A1_CLK_SD3,   CLK_SDSRC,     0x26c),
> +       DEF_GEN3_SDH("sd0h",    R8A774A1_CLK_SD0H,  CLK_SDSRC,        0x074),
> +       DEF_GEN3_SD( "sd0",     R8A774A1_CLK_SD0,   R8A774A1_CLK_SD0H, 0x074),
> +       DEF_GEN3_SDH("sd1h",    R8A774A1_CLK_SD1H,  CLK_SDSRC,        0x078),
> +       DEF_GEN3_SD( "sd1",     R8A774A1_CLK_SD1,   R8A774A1_CLK_SD1H, 0x078),
> +       DEF_GEN3_SDH("sd2h",    R8A774A1_CLK_SD2H,  CLK_SDSRC,        0x268),
> +       DEF_GEN3_SD( "sd2",     R8A774A1_CLK_SD2,   R8A774A1_CLK_SD2H, 0x268),
> +       DEF_GEN3_SDH("sd3h",    R8A774A1_CLK_SD3H,  CLK_SDSRC,        0x26c),
> +       DEF_GEN3_SD( "sd3",     R8A774A1_CLK_SD3,   R8A774A1_CLK_SD3H, 0x26c),

The last column is no longer aligned.
I don't like the extra space before the "sdN" names. I understand
why you added it, but it can easily be made looking good by listing
all sdNh clocks first ;-)

No need to resend, consider it done while queuing in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
