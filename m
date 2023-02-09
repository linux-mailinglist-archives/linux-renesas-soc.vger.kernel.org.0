Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE31690F88
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 18:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjBIRti (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 12:49:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjBIRth (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 12:49:37 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A234E55BA;
        Thu,  9 Feb 2023 09:49:36 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id ch10so1735923qtb.11;
        Thu, 09 Feb 2023 09:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1UOiRiXKpFUFG3joAn14r25qu/viqxeIuGM84d4gxs=;
        b=gnXwNfcFk3a358TuZ0YxQv4wmQHoqHHcqY2dXByvix6fgvcO6Khto4MrhBjbAe+TDw
         xBkwoMFAbnLp+ly9XbFsJPfGzWZyK9KE2FMwR8RugTeWE3BwNuE3bE6Eq4Y/8dTvREmc
         sq8GxYloO1CiZpkppAXjuQieJuHfVuAKGHr9cTcdyxAZyID7HKPg+2eusMP9zIfGbMYO
         FXkhZ+TMwv3crm8CrU2TqWYeZrN0i7DakqkyvcwOL5+ZFgz4medzb5ewUvv7f+5rg1zg
         GFowCl6LWTKYKDT49dUi26C3pVj5RQ2gq6deXWAbIXGMYuaR7W8USlEh44GodKwTgBQC
         n9wg==
X-Gm-Message-State: AO0yUKVTQzgW/WvrqLX52RrK4tOIWrEcp5b1kK0+Z51sbtyz+AsdA/CX
        3tMBzcjL+nS8DyOMYFt8caI5Asyt1y2WffT4
X-Google-Smtp-Source: AK7set9FgWSGxbwzM+5j9uA70UBEHJxY5xXhSbcnnxxoaZ+goMZfXCFWutaaO8InxfWN5My6syMiLQ==
X-Received: by 2002:a05:622a:199b:b0:3b9:bd1f:1de6 with SMTP id u27-20020a05622a199b00b003b9bd1f1de6mr20919935qtc.40.1675964974872;
        Thu, 09 Feb 2023 09:49:34 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id d4-20020ac86144000000b003b9bca1e093sm1669916qtm.27.2023.02.09.09.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 09:49:34 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id x4so3356677ybp.1;
        Thu, 09 Feb 2023 09:49:33 -0800 (PST)
X-Received: by 2002:a25:8e84:0:b0:8be:8c5f:9d58 with SMTP id
 q4-20020a258e84000000b008be8c5f9d58mr742872ybl.202.1675964973101; Thu, 09 Feb
 2023 09:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com> <20230209132630.194947-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230209132630.194947-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Feb 2023 18:49:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbR4612RAN3h16iHwPr-1vLERfoEa4-=K3iqvueYn-Lg@mail.gmail.com>
Message-ID: <CAMuHMdVbR4612RAN3h16iHwPr-1vLERfoEa4-=K3iqvueYn-Lg@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_em: Use dev_err_probe()
To:     biju.das.jz@bp.renesas.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Feb 9, 2023 at 2:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch simplify probe() function by using dev_err_probe()
> instead of dev_err in probe().
>
> While at it, remove the unused header file slab.h and added a
> local variable 'dev' to replace '&pdev->dev' in probe().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c
> @@ -13,7 +13,6 @@
>  #include <linux/serial_reg.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk.h>
> -#include <linux/slab.h>
>
>  #include "8250.h"
>
> @@ -79,6 +78,7 @@ static void serial8250_em_serial_dl_write(struct uart_8250_port *up, int value)
>  static int serial8250_em_probe(struct platform_device *pdev)
>  {
>         struct serial8250_em_priv *priv;
> +       struct device *dev = &pdev->dev;
>         struct uart_8250_port up;
>         struct resource *regs;
>         int irq, ret;
> @@ -88,27 +88,23 @@ static int serial8250_em_probe(struct platform_device *pdev)
>                 return irq;
>
>         regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!regs) {
> -               dev_err(&pdev->dev, "missing registers\n");
> -               return -EINVAL;
> -       }
> +       if (!regs)
> +               return dev_err_probe(dev, -EINVAL, "missing registers\n");
>
> -       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
>         priv->sclk = devm_clk_get(&pdev->dev, "sclk");

One missed opportunity to use "dev".
And to use the new devm_clk_get_enabled() ;-)

> -       if (IS_ERR(priv->sclk)) {
> -               dev_err(&pdev->dev, "unable to get clock\n");
> -               return PTR_ERR(priv->sclk);
> -       }
> +       if (IS_ERR(priv->sclk))
> +               return dev_err_probe(dev, PTR_ERR(priv->sclk), "unable to get clock\n");
>
>         memset(&up, 0, sizeof(up));
>         up.port.mapbase = regs->start;
>         up.port.irq = irq;
>         up.port.type = PORT_UNKNOWN;
>         up.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP;
> -       up.port.dev = &pdev->dev;
> +       up.port.dev = dev;
>         up.port.private_data = priv;
>
>         clk_prepare_enable(priv->sclk);
> @@ -122,9 +118,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
>
>         ret = serial8250_register_8250_port(&up);
>         if (ret < 0) {
> -               dev_err(&pdev->dev, "unable to register 8250 port\n");
>                 clk_disable_unprepare(priv->sclk);
> -               return ret;
> +               return dev_err_probe(dev, ret, "unable to register 8250 port\n");
>         }
>
>         priv->line = ret;

As the patch is correct:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
