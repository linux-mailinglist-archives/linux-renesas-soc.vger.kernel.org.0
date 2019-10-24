Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA55E3077
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2019 13:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391380AbfJXLfC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 07:35:02 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41511 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390184AbfJXLfB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 07:35:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id 94so416269oty.8;
        Thu, 24 Oct 2019 04:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J4PbOQfqm9akiqgjwMOPLZWIcMjV9yQd7nxa6MaNJhw=;
        b=ihyAPG0rMfnTB9Vdu/pONpu45Qq+AS3ePmk42gGqVS5BwAgQttfZ/2uIWaRgS3NZZC
         O2thCVzfkrnWEHJ3uO/d/R3nrYTb4tqioo+TQN48JENPRzw/eDpq35w7Gut9e1UYXfY1
         rw5iUA4Zn+/dtUKLO1ddWbigChkMm2p9+A0G76+kBxO8tucMikeHzCxsvSK+cgDDOY2X
         T6zytIhg3nFKRcewkkAC8ww3wLc84LrzXn2Muz/5v9yvdyF8QSYb9eDYnNACfPfohlA1
         5eKwyGHMtABNAZBegSvCnCDpNK4V+BUOsbgbvs0uRb+L6GAzOgFQPbX33doIUaLdXZwr
         TlgQ==
X-Gm-Message-State: APjAAAWq2C6Xe6VcjaB9C9jWINyDhHYoCZ8J+ILUFjstVYu+ahIftg5X
        0iOkaFAYRsnOlvMcl5zCPkFeU0jJBqXzm7qQdeI=
X-Google-Smtp-Source: APXvYqx2VCYaJ04ssYc62/0iTmPxcEDnkTjfMDN/WmE/qVFET5J3lGb2kaY7rRUjTSwtt6GQGuoBP77OFhxkM3SxTc0=
X-Received: by 2002:a9d:7d19:: with SMTP id v25mr1847064otn.250.1571916900501;
 Thu, 24 Oct 2019 04:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1571915821-1620-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Oct 2019 13:34:49 +0200
Message-ID: <CAMuHMdU=58w=4A0WcqytFfyV_Q11BgYaDNsMsA8Z15mnm--ang@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rcar-usb2-clock-sel: Add multiple
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

On Thu, Oct 24, 2019 at 1:17 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This hardware needs to enable clocks of both host and peripheral.
> So, this patch adds multiple clocks management.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
> @@ -53,14 +60,32 @@ static void usb2_clock_sel_disable_extal_only(struct usb2_clock_sel_priv *priv)
>
>  static int usb2_clock_sel_enable(struct clk_hw *hw)
>  {
> -       usb2_clock_sel_enable_extal_only(to_priv(hw));
> +       struct usb2_clock_sel_priv *priv = to_priv(hw);
> +       int i, ret;
> +
> +       for (i = 0; i < CLK_NUM; i++) {
> +               ret = clk_prepare_enable(priv->clks[i]);
> +               if (ret) {
> +                       while (--i >= 0)
> +                               clk_disable_unprepare(priv->clks[i]);
> +                       return ret;
> +               }
> +       }

You can use the clk_bulk_* APIs, instead of open-coding the same
operation.

> @@ -131,6 +156,14 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
>         pm_runtime_enable(dev);
>         pm_runtime_get_sync(dev);

pm_runtime_get_sync() will have already enabled the first module clock listed in
the DT "clocks" property.

If you want the driver to manage all clocks itself, perhaps the PM Runtime
calls should be dropped?

> +       priv->clks[CLK_INDEX_EHCI_OHCI] = devm_clk_get(dev, "ehci_ohci");
> +       if (IS_ERR(priv->clks[CLK_INDEX_EHCI_OHCI]))
> +               return PTR_ERR(priv->clks[CLK_INDEX_EHCI_OHCI]);
> +
> +       priv->clks[CLK_INDEX_HS_USB] = devm_clk_get(dev, "hs-usb-if");
> +       if (IS_ERR(priv->clks[CLK_INDEX_HS_USB]))
> +               return PTR_ERR(priv->clks[CLK_INDEX_HS_USB]);
> +
>         clk = devm_clk_get(dev, "usb_extal");
>         if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
>                 priv->extal = !!clk_get_rate(clk);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
