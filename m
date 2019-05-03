Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 807DA12DBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 14:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfECMhI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 08:37:08 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:33829 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfECMhI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 08:37:08 -0400
Received: by mail-vs1-f65.google.com with SMTP id b23so3480773vso.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 May 2019 05:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jDCEaUKwzXmAEfj30fOgoVtiP8zX20N3JlYslFBSUKs=;
        b=hFfEZpoVFf06W8MCGo41VhLSmNVaGunt2vC4/Dtk4YN8Aoynvd/z5UrQ4oLX8SKvTW
         OrBhbQ8v5fGELOk/UcGvwYyceDnyBmTmzn2kJ4DyWFU3qmCKh1KUdhF3rK8mVgGKmzPr
         XsJRxxeeRlhXUxrY3qb1DT4ZY5mYKA19BBBSWwHMp82pQunMYPppBCwnRqQrEFTTmKbw
         pL/plRXm4OJX0iPPCOuwXoQc6fuCI+5eYF4P2FguPESiD7jZOYcsiRr6Iplbf3Sm7zbg
         jSlZc6Bi7bLNYtyc5zgJ5UiuOnnu8ai9l41kRfaOcO4zSMUMLZu0ehY4kcrk4pBlNERh
         E4HA==
X-Gm-Message-State: APjAAAXfwy7qt5veC2vdNoWPwlyUknPvn4eQcpfVRfLgMzRTm6St4n72
        4f0yeVRYmQnG1SVkv1v3Y3ZC+7tWM6feeGx2NzE=
X-Google-Smtp-Source: APXvYqxZ8ehBgdn2BB6Bd6C/MNFHr+UaTZDJZf7alyfEwt7exeQ8PhOBcwpgZYVJqiE6wI0Vtja3AjgibQWul/g0lKU=
X-Received: by 2002:a67:ba07:: with SMTP id l7mr5107913vsn.11.1556887027407;
 Fri, 03 May 2019 05:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190502140634.4529-1-marek.vasut@gmail.com>
In-Reply-To: <20190502140634.4529-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 May 2019 14:36:55 +0200
Message-ID: <CAMuHMdVGAq1XgSohBjc8i4c_o-N-yWGedS_LLS_Apr4Bx10xGQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a779x: Configure PMIC IRQ pinmux
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Thu, May 2, 2019 at 4:06 PM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> The PMIC IRQ line pin multiplexing configuration is missing from the DTs.
> Since the line is configured correctly by default, the system works fine.
> However, add the IRQ line pin multiplexing configuration for completeness.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/r8a7790-lager.dts
> @@ -423,6 +423,8 @@
>          */
>         i2cpwr: i2c-13 {
>                 compatible = "i2c-demux-pinctrl";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pmic_irq_pins>;
>                 i2c-parent = <&iic3>, <&i2c3>;
>                 i2c-bus-name = "i2c-pwr";
>                 #address-cells = <1>;
> @@ -615,6 +617,11 @@
>                 function = "iic3";
>         };
>
> +       pmic_irq_pins: pmicirq {
> +               groups = "intc_irq2";
> +               function = "intc";
> +       };

Please insert according to alphabetical sort order.
Oh, we don't have the R-Car Gen2 entries sorted yet. Nevermind...

> --- a/arch/arm/boot/dts/r8a7792-blanche.dts
> +++ b/arch/arm/boot/dts/r8a7792-blanche.dts
> @@ -234,6 +234,11 @@
>                 groups = "du1_rgb666", "du1_sync", "du1_disp";
>                 function = "du1";
>         };
> +
> +       pmic_irq_pins: pmicirq {
> +               groups = "intc_irq2";
> +               function = "intc";
> +       };
>  };
>
>  &rwdt {
> @@ -309,6 +314,8 @@
>  };
>
>  &iic3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pmic_irq_pins>;

Given Blanche has a single device connected to irq2, I think it makes
sense to move the pinctrl properties to the pmic node below.

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
