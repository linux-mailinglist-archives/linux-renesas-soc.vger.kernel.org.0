Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A91600771
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Oct 2022 09:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiJQHNZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Oct 2022 03:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbiJQHNY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2022 03:13:24 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B9A2C134;
        Mon, 17 Oct 2022 00:13:23 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id z8so7190330qtv.5;
        Mon, 17 Oct 2022 00:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0WYKvrhUFoKU+5fvL/Dmd8fbPcmVJhwegNBT3s8dvg=;
        b=67FoBPEqtAkxK6X+jSPNx9MjI1c5usR1Q19S4JCXR2P5Quf4m+TS8+ih0xHBdYnzFL
         2zF2Dv1S9P7+M8iJqbUHkI9lS9ip6rFZntBRfSHvpu6nUGE0w/ExmzFNllqVLVemdyYE
         p/Kbg1mc4FDhAw7ehIolieem/rmlOCqnCVQFoUlg9Uga1rKgRbBaPzyhHCFE8neUFYia
         bNxopFUcBWA2ZJHSV0az/Q7HmRA1SPJYXJs6d6E7x2bct3QYFwk+kcoWP7HG3pU8UQGh
         wmU96Pw1JdQZJKb+M0wMTuufku2sweY64DRjJ1rsfLBQqUwayirDmVyRFEfIo+QmKIbB
         698A==
X-Gm-Message-State: ACrzQf3hKdF/kB72U+IcSvBbZGZUsPvQOIUBtKZbiDF3bEqst7kke31P
        ItitHvKhkthBi3vQ7hAKxDfm1F0Avf6pEQ==
X-Google-Smtp-Source: AMsMyM6nkoAlUBzlpocyQc/mDq09PNyLLE2AzztT6PsoYTIU7izjnmQcPGfsjB3UGMMwxegWkpiEhA==
X-Received: by 2002:a05:622a:170f:b0:39c:e3dd:62f3 with SMTP id h15-20020a05622a170f00b0039ce3dd62f3mr6475035qtk.480.1665990801984;
        Mon, 17 Oct 2022 00:13:21 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id t6-20020a05620a450600b006b8e8c657ccsm8935465qkp.117.2022.10.17.00.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 00:13:21 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-354c7abf786so99659287b3.0;
        Mon, 17 Oct 2022 00:13:20 -0700 (PDT)
X-Received: by 2002:a81:1b09:0:b0:35d:cf91:aadc with SMTP id
 b9-20020a811b09000000b0035dcf91aadcmr7998342ywb.47.1665990800612; Mon, 17 Oct
 2022 00:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com> <20221017032205.2210188-3-damien.lemoal@opensource.wdc.com>
In-Reply-To: <20221017032205.2210188-3-damien.lemoal@opensource.wdc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Oct 2022 09:13:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZEOQ+z98zvK-_tEZibnO38Qan7z5u6fH1Yc0patsT7w@mail.gmail.com>
Message-ID: <CAMuHMdXZEOQ+z98zvK-_tEZibnO38Qan7z5u6fH1Yc0patsT7w@mail.gmail.com>
Subject: Re: [PATCH 2/6] ata: sata_rcar: Fix compilation warning
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     linux-ide@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-renesas-soc@vger.kernel.org,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
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

Hi Damien,

On Mon, Oct 17, 2022 at 5:22 AM Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
> When compiling with clang and W=1, the following warning is generated:
>
> drivers/ata/sata_rcar.c:878:15: error: cast to smaller integer type
> 'enum sata_rcar_type' from 'const void *'
> [-Werror,-Wvoid-pointer-to-enum-cast]
>         priv->type = (enum sata_rcar_type)of_device_get_match_data(dev);
>                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fix this by using a cast to unsigned long to match the "void *" type
> size returned by of_device_get_match_data().
>
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo bike-shedding about "uintptr_t" vs. "unsigned long".
I'd prefer the former (the road to Zettalinux?), but Linus prefers the latter.

> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
> @@ -875,7 +875,7 @@ static int sata_rcar_probe(struct platform_device *pdev)
>         if (!priv)
>                 return -ENOMEM;
>
> -       priv->type = (enum sata_rcar_type)of_device_get_match_data(dev);
> +       priv->type = (unsigned long)of_device_get_match_data(dev);
>
>         pm_runtime_enable(dev);
>         ret = pm_runtime_get_sync(dev);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
