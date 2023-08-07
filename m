Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 370CE7729CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Aug 2023 17:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbjHGPvs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Aug 2023 11:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjHGPvr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Aug 2023 11:51:47 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86757C4
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Aug 2023 08:51:46 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d414540af6bso3314770276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Aug 2023 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691423506; x=1692028306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RkBRjVZCqFgvAbLaDmaBxY61C+T+3M7Fd6P/Lq9pG50=;
        b=hZxUl9nSHk1aC0VX9d+tDJE3AXzD69+9MZU+m6Wyojqx0MHq2dRho3iTQdAUP2gSV/
         GkUAgvBvYrZAx1d3eH0sCv4N4g/0hDbXAQkdXrFOAXYNgArsA7l/QLuNP7Y7dx+be6l4
         7JGJjnj2tnJsGqSjFTEilz5LGyxdmA5QZOgDsK33EIsZPYlvJsdoQSYRKLqlLSPYOWxo
         vwYCzoS/qSqdFck7OwJzqspty1w79tkq48oXOhmV4l8eHsMTeNTdQHzeL3SmMGdgpUd8
         ClfHiBATKa33s5f9IoieCZGj0VQDMfQSpNi76RtJXyLbe9HxdsX259AfPaEGGBQqmdG1
         jFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691423506; x=1692028306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkBRjVZCqFgvAbLaDmaBxY61C+T+3M7Fd6P/Lq9pG50=;
        b=TqFyEb+kgNMtPEUYgPA95yxN2scyfmw3MdrkcoBXQZws+t0ObjZkwqrEdCPZir+Ov3
         Wxxai0UsIZ6LSS4qQMvT3eIr6huzHurMsxDd0Fx4+XcGqa3ElQ20fnXC0FDUVeHDB9/o
         +Tdhi6bH/Yupg5p5yzS1hRrYfVc/s5spXkN7IZ9WmJ21k/F8h7lG23E7Nap/UK7psXIa
         R0Vn0fVKf86NXvXutbqGh9e5DPKPCKLQFgIdrpoTcSLcxyA8l8fsoxqBnq885oNUd8kH
         15wp7jEU+7wcfs2nN9vSd3o8hINkDbxB09fgttoaHkjgWt9Rp/orxR0iEdEDTmLVLtP7
         EbUQ==
X-Gm-Message-State: AOJu0YwwsU+AcOmZUEpBu8+W3A5l1daceyHr9o0xpUH/E3CI3NfgbMqv
        nB4qy4i3P9WNWo+/+FScjAK/3YMG46NMuCYZN8eKPBLFRj9Ptpja
X-Google-Smtp-Source: AGHT+IGhR45z1dNZPveQ2WonXo5BGnDfH5Crrb/JTqQ9e17hDmV5SO9tQyyquByWR1EEPjh/HEzHXg+pP97pUYx4AnA=
X-Received: by 2002:a25:d70a:0:b0:d4c:a288:ef4 with SMTP id
 o10-20020a25d70a000000b00d4ca2880ef4mr4413994ybg.44.1691423505739; Mon, 07
 Aug 2023 08:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230712141327.20827-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230712141327.20827-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 7 Aug 2023 17:51:09 +0200
Message-ID: <CAPDyKFpmvYP_CLL3njBATjRE-zYjixN_cbQt_1MK0pvQCSwGig@mail.gmail.com>
Subject: Re: [PATCH RFT] mmc: uniphier-sd: register irqs before registering controller
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 12 Jul 2023 at 16:13, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> IRQs should be ready to serve when we call mmc_add_host() via
> tmio_mmc_host_probe(). To achieve that, ensure that all irqs are masked
> before registering the handlers.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next so we can get it tested in linux-next, thanks!

Kind regards
Uffe


> ---
>
> So, I converted this other TMIO core user as well. But I don't have HW
> to test, so it would be great if someone could step up and test it.
>
>  drivers/mmc/host/uniphier-sd.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
> index 61acd69fac0e..4dc079f74c1b 100644
> --- a/drivers/mmc/host/uniphier-sd.c
> +++ b/drivers/mmc/host/uniphier-sd.c
> @@ -706,19 +706,19 @@ static int uniphier_sd_probe(struct platform_device *pdev)
>         tmio_data->max_segs = 1;
>         tmio_data->max_blk_count = U16_MAX;
>
> -       ret = tmio_mmc_host_probe(host);
> -       if (ret)
> -               goto disable_clk;
> +       sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_ALL);
>
>         ret = devm_request_irq(dev, irq, tmio_mmc_irq, IRQF_SHARED,
>                                dev_name(dev), host);
>         if (ret)
> -               goto remove_host;
> +               goto disable_clk;
> +
> +       ret = tmio_mmc_host_probe(host);
> +       if (ret)
> +               goto disable_clk;
>
>         return 0;
>
> -remove_host:
> -       tmio_mmc_host_remove(host);
>  disable_clk:
>         uniphier_sd_clk_disable(host);
>  free_host:
> --
> 2.30.2
>
