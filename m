Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273964F141E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 13:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiDDLzN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 07:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbiDDLzL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 07:55:11 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1A33DA52
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 04:53:14 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so16867212lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Apr 2022 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lqg0JG2bYMOlD6F3+AHo1Qsj61f1ApR+ao40cjbbIVI=;
        b=lzYDOAj3hgO3n6rtww73HeOYSeHxdj0u+oYgtLKMWGTstT9aPEtIPRsPSFvtYMEm0Q
         eg2sheiYil9u1Zt3GtsePYCFPstXmCjQrgqbOx+mBZAbC5ewfPssr8Ii6ph3PhGHmD71
         1Fsg05cEqzqnNE/WKKBlx8D4z9JRiK0HwU4JWJi8ZZ4oj82MMkJed2m7x9wm1LHVbDZZ
         nmi8vLnGBqAK2a3KFID6Qpmdk/q1kL6Hjtv8FLVck0AZDbdgJgy2IzwFrIlSYk4rIdPb
         fSLb+mccXXUbdsC/OZGbqbKAmyVaq/SjlJlWj415mxGzl3YcyKk1gC/6ae0YlQKAGLgi
         VysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lqg0JG2bYMOlD6F3+AHo1Qsj61f1ApR+ao40cjbbIVI=;
        b=o/RVQXi2WEEENKe9eG/i3lOjlu9IXdfZgjK+DztJf7rWPiM2yCgu1QYKQVArNHbf4a
         WwrJDUIqLJcBI2sHHoOEVPJyod1BCwZLNEVQdHP459Ax62OAyvAWveQM/KfaowYM3ixH
         46kOEKgszwQHQpAuGlkq3kmYvah9hQgL+2nEbZBR1zSteSG/m13XaJM9vbBE6sx76OSL
         b1UHzTGKCs5/i69tMGGj6mrBNuaPAmKwRJb8VlWffUfh6V45NqVlrZmnIydf9A52buT7
         r5Al0tILHZAR/M/h7xJY6s2SB7BMS+0acGx83/0xBtxmECQLYMEwjchhl/0uo6Sor3dV
         RNtg==
X-Gm-Message-State: AOAM533t5m1V0jL8dKpLWxyCB3ddjqTEe054qSwA8ZwTaDf7F3UAjBxu
        22ub4VOsK6t55usT2MONIwLlVeXDQM3UYaIz7fpv6UCGEKY=
X-Google-Smtp-Source: ABdhPJwoUF8BRiRIT5vjDQ5OByUaXROoJfEbVkEjoIjq+z5nOG2IHwFJWAdY05shxB+DEwdorbi5llik2IIbz51LdHg=
X-Received: by 2002:a05:6512:108b:b0:44a:6dc2:ffeb with SMTP id
 j11-20020a056512108b00b0044a6dc2ffebmr22844986lfg.184.1649073193182; Mon, 04
 Apr 2022 04:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <cc3178c2ff60f640f4d5a071d51f6b0b1db37656.1648822020.git.geert+renesas@glider.be>
In-Reply-To: <cc3178c2ff60f640f4d5a071d51f6b0b1db37656.1648822020.git.geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 4 Apr 2022 13:52:37 +0200
Message-ID: <CAPDyKFp9gq8-4V26Ujz82CRwZ=T1T9L13atmSjnGTspRLsSLyw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add missing checks for the presence of quirks
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 1 Apr 2022 at 16:09, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> When running on an system without any quirks (e.g. R-Car V3U), the
> kernel crashes with a NULL pointer dereference:
>
>     Unable to handle kernel NULL pointer dereference at virtual address 0000000000000002
>     ...
>     Hardware name: Renesas Falcon CPU and Breakout boards based on r8a779a0 (DT)
>     Workqueue: events_freezable mmc_rescan
>     ...
>     Call trace:
>      renesas_sdhi_internal_dmac_start_dma+0x54/0x12c
>      tmio_process_mrq+0x124/0x274
>
> Fix this by adding the missing checks for the validatity of the
> priv->quirks pointer.
>
> Fixes: dce2ba8b2ee8cef6 ("mmc: renesas_sdhi: make 'dmac_only_one_rx' a quirk")
> Fixes: d4bfa17a655c6de2 ("mmc: renesas_sdhi: make 'fixed_addr_mode' a quirk")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 6dd5ade3851b2ba8..90048f74e6221add 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -374,7 +374,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
>         struct scatterlist *sg = host->sg_ptr;
>         u32 dtran_mode = DTRAN_MODE_BUS_WIDTH;
>
> -       if (!priv->quirks->fixed_addr_mode)
> +       if (!(priv->quirks && priv->quirks->fixed_addr_mode))
>                 dtran_mode |= DTRAN_MODE_ADDR_MODE;
>
>         if (!renesas_sdhi_internal_dmac_map(host, data, COOKIE_MAPPED))
> @@ -382,7 +382,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
>
>         if (data->flags & MMC_DATA_READ) {
>                 dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
> -               if (priv->quirks->dma_one_rx_only &&
> +               if (priv->quirks && priv->quirks->dma_one_rx_only &&
>                     test_and_set_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags))
>                         goto force_pio_with_unmap;
>         } else {
> --
> 2.25.1
>
