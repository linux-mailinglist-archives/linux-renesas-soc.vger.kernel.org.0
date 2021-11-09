Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5D444AE3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 13:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236530AbhKINAy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 08:00:54 -0500
Received: from mail-vk1-f181.google.com ([209.85.221.181]:34459 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233652AbhKINAy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 08:00:54 -0500
Received: by mail-vk1-f181.google.com with SMTP id bc10so9959305vkb.1;
        Tue, 09 Nov 2021 04:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cRhU37PoRaba/rxkyvwHWVAe+e/4Dajbo/Sqj3K8gi4=;
        b=M0qjW1rmqC9w3spcLwZyaXgUMmbS6kqtNV2tZCAkUSBqk1CMqPyVa60An2KYMPuifL
         Bt6b+V6I3h9EAnOanlxk6k+PJ6QHmiRJUzPQoVK/Jl1ttT3PhMe7hIIYRaXk1zmXGnlo
         W/iNiO9y+gkLv9OrseIbxc9fYnLLCMXWasHCo3P4cJ8jK0uvRCH3Vbl1DmycA7pemjVi
         iH/jzgbf7x52MBMSwcDVNjN0N1yaIxfVpwjE3fu2iM+YxCTNWTCaeg+5vQvfJ2YIEDgU
         INs8AI28CywsSiDfEbaMOCSJXC0r15vrhXdWUvShwIMKhUVsqMIGovMUHofHkV/4cAEk
         eYeA==
X-Gm-Message-State: AOAM532KPsYPLHBFkZk7AdT1Ra9OABooEA7sB4p4C6dUn0DFNKGiCZ0U
        7DW2wyCbzG01ykrBglJh1ni2UXf4jb6Gyw==
X-Google-Smtp-Source: ABdhPJzz4gskZjF8rk0mQ4cTTx0AV9gh9PNrxnbKjQRwjZbHF0kv5O/4kOXUYFZn4n67FxR2YcJzXQ==
X-Received: by 2002:a05:6122:98d:: with SMTP id g13mr10639350vkd.15.1636462687424;
        Tue, 09 Nov 2021 04:58:07 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id q8sm3260531uae.10.2021.11.09.04.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 04:58:07 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id e2so38266110uax.7;
        Tue, 09 Nov 2021 04:58:06 -0800 (PST)
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr9873133uaj.89.1636462686361;
 Tue, 09 Nov 2021 04:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20211109121631.26687-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211109121631.26687-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211109121631.26687-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 13:57:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAhQMOzbQHyymJrq0So11-uLC5nPT0gU7qj+MH8GmApw@mail.gmail.com>
Message-ID: <CAMuHMdXAhQMOzbQHyymJrq0So11-uLC5nPT0gU7qj+MH8GmApw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] serial: sh-sci: Add support to deassert/assert
 reset line
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Nov 9, 2021 at 1:17 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> On RZ/G2L SoC we need to explicitly deassert the reset line
> for the device to work, use this opportunity to deassert/assert
> reset line in sh-sci driver.
>
> This patch adds support to read the "resets" property (if available)
> from DT and perform deassert/assert when required.
>
> Also, propagate the error to the caller of sci_parse_dt() instead of
> returning NULL in case of failure.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2
> * deassert/assert reset line if available on all SoC's
> * Updated commit message

Thanks for the update!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -37,6 +37,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/scatterlist.h>
>  #include <linux/serial.h>
>  #include <linux/serial_sci.h>
> @@ -3203,23 +3204,53 @@ static const struct of_device_id of_sci_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, of_sci_match);
>
> +static void sci_reset_control_assert(void *data)
> +{
> +       reset_control_assert(data);
> +}
> +
>  static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
>                                           unsigned int *dev_id)
>  {
>         struct device_node *np = pdev->dev.of_node;
> +       const struct of_device_id *of_id;

Not needed.

> +       struct reset_control *rstc;
>         struct plat_sci_port *p;
>         struct sci_port *sp;
>         const void *data;
> -       int id;
> +       int id, ret;
>
>         if (!IS_ENABLED(CONFIG_OF) || !np)
> -               return NULL;
> +               return ERR_PTR(-EINVAL);
> +
> +       of_id = of_match_device(of_sci_match, &pdev->dev);
> +       if (!of_id)
> +               return ERR_PTR(-EINVAL);
>
> -       data = of_device_get_match_data(&pdev->dev);

Please keep the old construct using of_device_get_match_data().

> +       rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +       if (IS_ERR(rstc)) {
> +               dev_err(&pdev->dev, "failed to get reset ctrl %ld\n", PTR_ERR(rstc));
> +               return ERR_PTR(PTR_ERR(rstc));

The error might be -EPROBE_DEFER, so please use
"return ERR_PTR(dev_err_probe(...))", to avoid printing the message
in case of probe deferral.

BTW, ERR_CAST() is a shorthand for ERR_PTR(PTR_ERR()).

> +       }
> +
> +       ret = reset_control_deassert(rstc);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to deassert reset %d\n", ret);
> +               return ERR_PTR(ret);
> +       }
> +
> +       ret = devm_add_action_or_reset(&pdev->dev, sci_reset_control_assert, rstc);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to register assert devm action, %d\n",
> +                       ret);
> +               return ERR_PTR(ret);
> +       }
> +
> +       data = of_id->data;
>
>         p = devm_kzalloc(&pdev->dev, sizeof(struct plat_sci_port), GFP_KERNEL);
>         if (!p)
> -               return NULL;
> +               return ERR_PTR(-ENOMEM);
>
>         /* Get the line number from the aliases node. */
>         id = of_alias_get_id(np, "serial");

I gave this a try on Salvator-XS, and noticed no regressions.
I will test this on more SCIF variants later.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
