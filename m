Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88FB6517203
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 16:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238648AbiEBO4n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 10:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238491AbiEBO4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 10:56:43 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309D8DF3C;
        Mon,  2 May 2022 07:53:14 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id k2so4798017qtp.1;
        Mon, 02 May 2022 07:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XwFwDnsF3xtqeaJMjwj9Ym8eT8poLMp81Qmp6tqQGNs=;
        b=f9svMc5kh4x+3sZH3AJm5o05veckRDTVRN7lWHAwdP8vTMkK7xW24+zIK+2alH1oun
         e3ZF3RH76vO7ppp75yZ+BNbteZFZqHwe7m4Kz5zPAER7G4iozv5zniepO7FQ13QxL0Su
         CNRkLQMvpKqP8iLVm5cxYesfLMuUPBjM73JXfFfd89PGVGEhvv6vzn9stp69r+zghPlA
         AIHMxAhXUXCcXVVrfVrgUVvpwLoaKKkNe25k/zdIYJMiJ3XJS3+GuOC+eux6oaw5o4+h
         fqhVbu911KJ/exQ/1bG1xBgwvYj9ttPgHQ6d8DBxwGNSwHFljv11nOpHZ9sN7JL1UC86
         2jVw==
X-Gm-Message-State: AOAM531An9ermZ+BarBZ+yIcL1fcKS5AxOlkfJOhvPUqab4/NLdhXLJJ
        HE6aKRWEbqxWiywgjfo5sZzkYbGRORX2KA==
X-Google-Smtp-Source: ABdhPJyh9p8/zbO6L/yleExi3ekUvNrAmrFKVwYRKBsEoNradYf1TBXlH8wcvXwnQgBwYrIA1xe4sA==
X-Received: by 2002:ac8:5f09:0:b0:2f3:7005:6f58 with SMTP id x9-20020ac85f09000000b002f370056f58mr10515297qta.439.1651503193029;
        Mon, 02 May 2022 07:53:13 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 194-20020a3706cb000000b0069fc13ce1d5sm4511697qkg.6.2022.05.02.07.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 07:53:12 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id i38so26382078ybj.13;
        Mon, 02 May 2022 07:53:11 -0700 (PDT)
X-Received: by 2002:a25:6157:0:b0:645:8d0e:f782 with SMTP id
 v84-20020a256157000000b006458d0ef782mr11231735ybb.36.1651503191604; Mon, 02
 May 2022 07:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220429105229.368728-1-miquel.raynal@bootlin.com> <20220429105229.368728-4-miquel.raynal@bootlin.com>
In-Reply-To: <20220429105229.368728-4-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 16:53:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnx3O15aQw4Oxw-hfPZFUidMGQ_5HfQun9m_fKkAnm3w@mail.gmail.com>
Message-ID: <CAMuHMdVnx3O15aQw4Oxw-hfPZFUidMGQ_5HfQun9m_fKkAnm3w@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: rawnand: renesas: Use runtime PM instead of the
 raw clock API
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
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Fri, Apr 29, 2022 at 12:52 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
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
> @@ -1319,6 +1319,7 @@ static int rnandc_chips_init(struct rnandc *rnandc)
>  static int rnandc_probe(struct platform_device *pdev)
>  {
>         struct rnandc *rnandc;
> +       struct clk *eclk;
>         int irq, ret;
>
>         rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
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
>         irq = platform_get_irq_optional(pdev, 0);
>         if (irq == -EPROBE_DEFER) {
> -               ret = irq;
> -               goto disable_eclk;
> +               return irq;
>         } else if (irq < 0) {
>                 dev_info(&pdev->dev, "No IRQ found, fallback to polling\n");
>                 rnandc->use_polling = true;
> @@ -1365,12 +1347,25 @@ static int rnandc_probe(struct platform_device *pdev)
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
> +       pm_runtime_enable(&pdev->dev);
> +       pm_runtime_get_sync(&pdev->dev);

ret = pm_runtime_resume_and_get)...);
if (ret < 0) ...

> +
> +       /* The external NAND bus clock rate is needed for computing timings */
> +       eclk = clk_get(&pdev->dev, "eclk");
> +       if (IS_ERR(eclk)) {
> +               ret = PTR_ERR(eclk);
> +               goto dis_runtime_pm;
> +       }
> +
> +       rnandc->ext_clk_rate = clk_get_rate(eclk);
> +       clk_put(eclk);
>
>         rnandc_clear_fifo(rnandc);
>
> @@ -1378,14 +1373,13 @@ static int rnandc_probe(struct platform_device *pdev)
>
>         ret = rnandc_chips_init(rnandc);
>         if (ret)
> -               goto disable_eclk;
> +               goto dis_runtime_pm;
>
>         return 0;
>
> -disable_eclk:
> -       clk_disable_unprepare(rnandc->eclk);
> -disable_hclk:
> -       clk_disable_unprepare(rnandc->hclk);
> +dis_runtime_pm:
> +       pm_runtime_put_sync(&pdev->dev);

pm_runtime_put()

> +       pm_runtime_disable(&pdev->dev);
>
>         return ret;
>  }
> @@ -1396,8 +1390,8 @@ static int rnandc_remove(struct platform_device *pdev)
>
>         rnandc_chips_cleanup(rnandc);
>
> -       clk_disable_unprepare(rnandc->eclk);
> -       clk_disable_unprepare(rnandc->hclk);
> +       pm_runtime_put_sync(&pdev->dev);

pm_runtime_put()

> +       pm_runtime_disable(&pdev->dev);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
