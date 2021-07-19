Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1305F3CD027
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 11:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234992AbhGSI3o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 04:29:44 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:43613 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbhGSI3o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 04:29:44 -0400
Received: by mail-ua1-f45.google.com with SMTP id 109so6539635uar.10;
        Mon, 19 Jul 2021 02:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=okZDt5izpXJNQv5Y4DDOChxLzV07ajEvC7VBXiOh8LY=;
        b=cWGHAQ8PE09glp6S2rRn1Q69PKDOfXc7dilXirlBC41DyJdtTQIPq28zaBkipYr4h4
         15x6eb4axcrcSjgpr5n1KXfqQ/oK90bIOJlqYsPvZByRJvS8MaRDyoeSRhDMv/q3zoGg
         yhoXp2mI7MMQKtl6hxmMbli9GmGu+XO57rG7/Ny+QMeiTHf7V284S3GZiW8yOYeNQN+e
         3sT9IFBCAwuf+B5agur1kHJMP1DKM77L1xu90uO7RQB1GDbvZ4fbByrXu+CBRLyFpp2m
         AhM2fSom/e0QhNEKH9rKDPb+GBEZEfJ9TYOViz95Wa03ElD+OtYjuruwRgi3qwDjYgVD
         Mv4A==
X-Gm-Message-State: AOAM531Mrm1j5YPwZWQLgvT2zZTVsyUroXEdxlqnKLbs8qo4/oxEggbf
        0C/K74WY0VfXKxPeLz6f1XDNzjz1cc9mq7MjfZA=
X-Google-Smtp-Source: ABdhPJyza0rPFLN5A/2Q2WHtSDUhBdeTHSClHJ20aCaqDmOuQrq62WvQ5lCixLrr/o2RJaTRBm2jNEZq6ndlDa0DlwI=
X-Received: by 2002:a9f:3649:: with SMTP id s9mr24642802uad.2.1626685823482;
 Mon, 19 Jul 2021 02:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210713214126.2278-1-alexander.helms.jy@renesas.com> <20210713214126.2278-3-alexander.helms.jy@renesas.com>
In-Reply-To: <20210713214126.2278-3-alexander.helms.jy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Jul 2021 11:10:12 +0200
Message-ID: <CAMuHMdW5cYfc39pHWavW84ftjBAvyaSVCeLPtMB4o_8L6msW2Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] clk: Add ccf driver for Renesas 8T49N241
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        david.cater.jc@renesas.com, Michal Simek <michal.simek@xilinx.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alex,

On Tue, Jul 13, 2021 at 11:41 PM Alex Helms
<alexander.helms.jy@renesas.com> wrote:
> This is a common clock framework driver that supports the 8T49N241 chip.
> No other chips in the family are currently supported. The driver
> supports setting the rate for all four outputs on the chip and
> automatically calculating/setting the appropriate VCO value.
>
> The driver can read a full register map from the device tree
> and will use that register map to initialize the attached device
> (via I2C) when the system boots. Any configuration not supported by
> the common clock framework must be done via the full register map,
> including optimized settings.
>
> All outputs are currently assumed to be LVDS unless overridden in
> the full register map in the DT.
>
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>

Thanks for your patch!

> Reported-by: kernel test robot <lkp@intel.com>

I don't think that line belongs here (lkp requesting 8T49N241
support? ;-)

> ---
>  MAINTAINERS                         |   1 +
>  drivers/clk/Kconfig                 |  21 +
>  drivers/clk/renesas/8t49n24x-core.c | 836 ++++++++++++++++++++++++++++
>  drivers/clk/renesas/8t49n24x-core.h | 250 +++++++++
>  drivers/clk/renesas/8t49n24x.c      | 572 +++++++++++++++++++
>  drivers/clk/renesas/Makefile        |   4 +
>  6 files changed, 1684 insertions(+)
>  create mode 100644 drivers/clk/renesas/8t49n24x-core.c
>  create mode 100644 drivers/clk/renesas/8t49n24x-core.h
>  create mode 100644 drivers/clk/renesas/8t49n24x.c

As this is a driver for a discrete part originally from IDT, not a
clock generator integrated on a Renesas SoC, I think it belongs under
drivers/clk/ instead of drivers/clk/renesas/.  That would align
nicely with the Kconfig symbol already residing in drivers/clk/Kconfig.

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15580,6 +15580,7 @@ M:      Alex Helms <alexander.helms.jy@renesas.com>
>  M:     David Cater <david.cater.jc@renesas.com>
>  S:     Odd Fixes
>  F:     Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> +F:     drivers/clk/renesas/8t49n24x*
>
>  RENESAS CLOCK DRIVERS
>  M:     Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
