Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA69100253
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 11:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfKRKY6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 05:24:58 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35129 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRKY6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 05:24:58 -0500
Received: by mail-ot1-f68.google.com with SMTP id c14so7050309oth.2;
        Mon, 18 Nov 2019 02:24:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lSUdSVYuJKim7BJOKxqh9PqTmgCM0HaD4hNfq1HAsZs=;
        b=McpdHEeqU0RhN5qBIuTVoRjsuXu3WVcs0ugO+4RcJkzDja2GTKwASaR/mhto5HKX6f
         Q0hIo/k5SDEphBDoCFxoLUvpRgQ7gEZRAXRJbb4UHhFynx2P+5aI/mFiitTubSzLW7yh
         t8SEZAfmNpbe9c7RdvPepxSBn0H3H8Ctmd/Uo8UJurlV6Ok9lZ2CW7YnKYKzV+0N8DTZ
         gH2oVmoblEBeZyNnyeyo/zwuDEB/9QeKADrAmt0kQrxI15kTECcR/+bSzHIceGKkbdWT
         wilJ8lnDjeRm2SOCZZRkojiSvKi4Ue2PkwlyogvEH61Sjbd0iQ9c8IYK//XkCfIuNWDE
         p6FA==
X-Gm-Message-State: APjAAAWaziPtm4IEOBPwwrQ3NEV5SyQSpN+IcnXD/UNEF2BJbfzQ0j7e
        2JDgZbAz4LRj7uOlNUCRA14Te6Gj6jZMFR3ihSQ=
X-Google-Smtp-Source: APXvYqwdOBGSvcAu8S7jdrRPoQ2pHKQyqhtdcV2LzhOwSEg2TYOMxFV0aQ1nBj3xq7ArWYd4Imm4uowxgNQBwfFR0xU=
X-Received: by 2002:a9d:5511:: with SMTP id l17mr898686oth.145.1574072695978;
 Mon, 18 Nov 2019 02:24:55 -0800 (PST)
MIME-Version: 1.0
References: <1572591791-11280-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1572591791-11280-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1572591791-11280-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Nov 2019 11:24:45 +0100
Message-ID: <CAMuHMdXpkTH9bqAahMpUB6quCXpgFi8Uw1RPYdXFkeaFh0js4w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clk: renesas: rcar-usb2-clock-sel: Add multiple
 clocks management
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Nov 1, 2019 at 8:03 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This hardware needs to enable clocks of both host and peripheral.
> So, this patch adds multiple clocks management.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c

> @@ -128,6 +146,14 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->base))
>                 return PTR_ERR(priv->base);
>
> +       priv->clks[CLK_INDEX_EHCI_OHCI].clk = devm_clk_get(dev, "ehci_ohci");
> +       if (IS_ERR(priv->clks[CLK_INDEX_EHCI_OHCI].clk))
> +               return PTR_ERR(priv->clks[CLK_INDEX_EHCI_OHCI].clk);
> +
> +       priv->clks[CLK_INDEX_HS_USB].clk = devm_clk_get(dev, "hs-usb-if");
> +       if (IS_ERR(priv->clks[CLK_INDEX_HS_USB].clk))
> +               return PTR_ERR(priv->clks[CLK_INDEX_HS_USB].clk);
> +

Is these any specific reason you're not just filling in the .id fields first,
and calling devm_clk_bulk_get()?

    static const struct clk_bulk_data rcar_usb2_clocks[] = {
            { .id = "ehci_ohci", },
            { .id = "hs-usb-if", },
    };

    memcpy(priv->clks, rcar_usb2_clocks, sizeof(priv->clks));
    ... = devm_clk_bulk_get(dev, ARRAY_SIZE(priv->clks), priv->clks);
    ...

That way you can drop the enums, and use ARRAY_SIZE(rcar_usb2_clocks)
instead of CLK_NUM.

>         pm_runtime_enable(dev);
>         pm_runtime_get_sync(dev);
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
