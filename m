Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690C352100F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 10:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbiEJI4y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 May 2022 04:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbiEJI4x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 May 2022 04:56:53 -0400
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9632F20F9FE;
        Tue, 10 May 2022 01:52:54 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id js14so12174665qvb.12;
        Tue, 10 May 2022 01:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3aRSud9RaBfHsmVcVpAPA+KhZytVfJcesv8QWo45pcY=;
        b=o/w+90jUw4pRN0hKcDVxxTF6Z9R/zcd/wqAu8z1GkhGvgLtYGGcXu7aSn8zskUWEGh
         1AL8cdqBMXt7YgX5gINVMLn5wpwyMJCbtJ8VKTb97SYugTIbdI0jC9vvb4xtOD2ifrgX
         useE8yikC/ku72vHylP1LWJHrS+K6XtHKOS8M+4+RCrUql3nxPCjcf/6nJJX2M6y4P4J
         WjD8pqW5hPcTQRFL6bKqkHYrP309KX8gq4DOk+oSCDOGgl4/IYwaRtS9N4KDHQgGe/97
         hJz9waJ1JZXdSOtF80QSIVDcnwsekChR3cH9SfktvtQFAWxC75gg84dTiydjxB7chH0i
         /5ag==
X-Gm-Message-State: AOAM531jisKDMHU834YdGIL1ihTHCkt2tPJRpfHIeDSVqhXDG565p5JV
        n7T14JkBVXrbRPPHwjhmqn6O8pMEet/NNg==
X-Google-Smtp-Source: ABdhPJyv2Is4vitVHfh9elq7ZYzOb4a6qYJl/AWWbMaVSvzZFg85WGsZa4OtXxAvzCAhHkqNjN+sRw==
X-Received: by 2002:ad4:5504:0:b0:456:35e0:1968 with SMTP id az4-20020ad45504000000b0045635e01968mr16699365qvb.126.1652172773558;
        Tue, 10 May 2022 01:52:53 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id b200-20020a3767d1000000b0069fcabfdaebsm8258048qkc.70.2022.05.10.01.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 01:52:53 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2f7d7e3b5bfso171662817b3.5;
        Tue, 10 May 2022 01:52:52 -0700 (PDT)
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr18436143ywh.384.1652172772572; Tue, 10
 May 2022 01:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220509154943.25422-1-miquel.raynal@bootlin.com> <20220509154943.25422-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220509154943.25422-3-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 May 2022 10:52:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQafhSHA6vz2FP4=CLodEB3uK2p2W6fu_xK8kA+pMGFA@mail.gmail.com>
Message-ID: <CAMuHMdUQafhSHA6vz2FP4=CLodEB3uK2p2W6fu_xK8kA+pMGFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Mon, May 9, 2022 at 5:49 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> This NAND controller is part of a well defined power domain handled by
> the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
> and exclusively use the runtime PM API to enable/disable the clocks.
>
> We still need to retrieve the external clock rate in order to derive the
> NAND timings, but that is not a big deal, we can still do that in the
> probe and just save this value to reuse it later.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/mtd/nand/raw/renesas-nand-controller.c
> +++ b/drivers/mtd/nand/raw/renesas-nand-controller.c

> @@ -1335,29 +1336,10 @@ static int rnandc_probe(struct platform_device *pdev)
>         if (IS_ERR(rnandc->regs))
>                 return PTR_ERR(rnandc->regs);
>
> -       /* APB clock */
> -       rnandc->hclk = devm_clk_get(&pdev->dev, "hclk");
> -       if (IS_ERR(rnandc->hclk))
> -               return PTR_ERR(rnandc->hclk);
> -
> -       /* External NAND bus clock */
> -       rnandc->eclk = devm_clk_get(&pdev->dev, "eclk");
> -       if (IS_ERR(rnandc->eclk))
> -               return PTR_ERR(rnandc->eclk);
> -
> -       ret = clk_prepare_enable(rnandc->hclk);
> -       if (ret)
> -               return ret;
> -
> -       ret = clk_prepare_enable(rnandc->eclk);
> -       if (ret)
> -               goto disable_hclk;
> -
>         rnandc_dis_interrupts(rnandc);

This touches the hardware, so the device must be operational.
Hence please move the pm_runtime_*() calls up, to make sure the device
is accessible.
Sorry for missing that before.

>         irq = platform_get_irq_optional(pdev, 0);
>         if (irq == -EPROBE_DEFER) {
> -               ret = irq;
> -               goto disable_eclk;
> +               return irq;
>         } else if (irq < 0) {
>                 dev_info(&pdev->dev, "No IRQ found, fallback to polling\n");
>                 rnandc->use_polling = true;
> @@ -1365,12 +1347,27 @@ static int rnandc_probe(struct platform_device *pdev)
>                 ret = devm_request_irq(&pdev->dev, irq, rnandc_irq_handler, 0,
>                                        "renesas-nand-controller", rnandc);
>                 if (ret < 0)
> -                       goto disable_eclk;
> +                       return ret;
>         }
>
>         ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
>         if (ret)
> -               goto disable_eclk;
> +               return ret;
> +
> +       devm_pm_runtime_enable(&pdev->dev);
> +       ret = pm_runtime_get_sync(&pdev->dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* The external NAND bus clock rate is needed for computing timings */
> +       eclk = clk_get(&pdev->dev, "eclk");
> +       if (IS_ERR(eclk)) {
> +               ret = PTR_ERR(eclk);
> +               goto dis_runtime_pm;
> +       }
> +
> +       rnandc->ext_clk_rate = clk_get_rate(eclk);

Personally, I would do this before requesting the interrupt.
But I guess it's fine to do that here, too.

> +       clk_put(eclk);
>
>         rnandc_clear_fifo(rnandc);
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
