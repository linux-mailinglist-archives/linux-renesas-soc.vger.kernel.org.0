Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECE8BE3054
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2019 13:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438967AbfJXL0o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 07:26:44 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45134 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436501AbfJXL0n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 07:26:43 -0400
Received: by mail-oi1-f193.google.com with SMTP id o205so20253897oib.12;
        Thu, 24 Oct 2019 04:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wEN6e0/MxNO16kycUtNHeQbv7shcXHxQxFuBG9rhr9I=;
        b=D44xrebdsKSOaGG3wAh8d9j65t84NbRp+9hVGFTTm+f1EvvDCV9CpUE7EpIn1l9pXO
         Td+XCbNxI7HrzJ4u+SsXS5STcJq6f/vhEpfSpeJf70dP2N0vp/LtQeN+JegYhSgYqzSt
         XKybo45hPYqYNrjVC+ZhxAXgSSmx1b4vVojHi+8FWVTDt2V/4zOR/DcPpIhGT27uxPBd
         06oUBuQQehyqldr8AIuakPDaYLbadDpY/Ii5z1r+9SVElu3enqAC7embQWRx0RHbl8Zw
         W5cRzihpz+6jcybPaEXkJY3qmK7XvCIE9N3W7h3eqXTyGHkFSo2kxjPi3mjHJSU09IkL
         Xd6w==
X-Gm-Message-State: APjAAAVlJVBUnvIDPWdOYAH4dYSuMLHS9yHyw0QRcwcXCtsADKjsUr5o
        DbTJfXV/10ZdnlFHH/4t38XlcyNMNcVWYQYDZoM=
X-Google-Smtp-Source: APXvYqxLkFl0zXQzYvWYVhDFhuiPRuCrmThkK6TFDPojZvXWJSIWgVDfdBktFcE6vX8rQiOogr/MfJ38897B4Epe/zY=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr3975149oiy.148.1571916400959;
 Thu, 24 Oct 2019 04:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1571915821-1620-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Oct 2019 13:26:29 +0200
Message-ID: <CAMuHMdXuD4trBjqjgvZ3bimtDEHj4VNeG5-5NHFXkrOvYPd4=w@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: rcar-usb2-clock-sel: Add reset_control
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

Thanks for your patch!

On Thu, Oct 24, 2019 at 1:17 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This hardware needs to deassert resets of both host and peripheral.
> So, this patch adds reset control.

If the hardware needs it, probably you want to make CLK_RCAR_USB2_CLOCK_SEL
select RESET_CONTROLLER?

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c

> @@ -164,6 +172,10 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->clks[CLK_INDEX_HS_USB]))
>                 return PTR_ERR(priv->clks[CLK_INDEX_HS_USB]);
>
> +       priv->rsts = devm_reset_control_array_get_optional_shared(&pdev->dev);

If the reset is really needed, you should not use the optional API.

> +       if (IS_ERR(priv->rsts))
> +               return PTR_ERR(priv->rsts);
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
