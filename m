Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6299BE0BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 12:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbfD2KpM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 06:45:12 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:46046 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbfD2KpM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 06:45:12 -0400
Received: by mail-ua1-f66.google.com with SMTP id o33so3299366uae.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2019 03:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AGC6AGDjXIuIbU4z7HkoYZrn/cwawo87a4SSH9Abb78=;
        b=xLOrCcJzj91A+NOHvQa7ghsv8g2L0dEGj4h9o2jX8IjPIxEngGA5S4p/Yr0U5PU9wj
         D6NxOfHhNFGJRTSo2agXvVoazO7a7xW40y3wtx/TBG6tOSluz8MbziHNvDRsZJfNW3K2
         hOnk3TLIt50BW44jlTkwezvvHBQsTTB1p0uKwlY+K/fZGenGawemBM7kU0AUudA3RdSZ
         h58zRKKdJL7WfnrnPwE1NQ9Bxhaz9pziWuBMLUt49TOFwpCuy8CHcSzaKVOQ3+M+2oz9
         SazUc2YdvFA64I8pPQRKRHF8eEf/YduuYr+wk5lIpFXhE4rOpFRuURIDu8AkEWySOcl/
         +9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AGC6AGDjXIuIbU4z7HkoYZrn/cwawo87a4SSH9Abb78=;
        b=X5f+mS4pfzv7BLKO4N3Syy2x46w90oj9h2X4zKhekZxZS1xPMXhrY07ppwNoEx+4Nc
         0BGcu01ixouzA9Y8YaTEU9mhbHNBtsmGVsWHGcA8XAhI+7ht+DdsrO32ID5FOo24NUV5
         5WVFcd56OwSL6fktsFz2jKLBHeo4Q2NYdS0XJINEVB606xx12Kh8M1oFBUhNH1co2y0o
         uhfK1Zq3pd5dJeSQUpDdg/REW957l4NJxVaPoK0QjcBdS8rQqwsOznEdfVeVB77Op8iF
         AzwJNnvUM9SwDA0Yw0BcB4IJ6Yy5Br5An/K0hKWfsaLJ9crUXniqV2wSuyfi4i7TGbBJ
         g1dg==
X-Gm-Message-State: APjAAAVwKL+vH/tanYDDWQBh00wBbgKGl/10CMmIr5WnrgpHeCVsTb/W
        oPcQv5QZULGunBp1ibJjApUyUXyCotr6dpZitMbhO65c
X-Google-Smtp-Source: APXvYqzj7uB8StJJ3VuLJOvrvSF20zuJ2jBN0x3Qk7rpkBT0HH+gff/aM3QC6wsIcGYVMs2OeTC9eaooaRlLytpRTAA=
X-Received: by 2002:ab0:2399:: with SMTP id b25mr31014225uan.129.1556534711091;
 Mon, 29 Apr 2019 03:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <1554807906-9704-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1554807906-9704-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 29 Apr 2019 12:44:35 +0200
Message-ID: <CAPDyKFpKw84x6+gTrQoAavkF4uVURxsTZ6zK1S9r08+HF_HNkg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: core: retry CMD1 in mmc_send_op_cond() even if
 the ocr = 0
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 9 Apr 2019 at 13:09, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> According to eMMC specification v5.1 section 6.4.3, we should issue
> CMD1 repeatedly in the idle state until the eMMC is ready even if
> the mmc_attach_mmc() calls this function with ocr = 0. Otherwise
> some eMMC devices seems to enter the inactive mode after
> mmc_init_card() issued CMD0 when the eMMC device is busy.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Applied for next, thanks!

Let's get some test coverage of this before we decide if this a
material for stable.

Kind regards
Uffe


> ---
>  Changes from v1 (https://patchwork.kernel.org/patch/10874619/):
>  - Revise the comment on the source code.
>
>  We can reproduce this issue if:
>   - we add no-sd and no-sdio property into sdhi2 node of salvator-common.dtsi,
>   - the renesas_sdhi driver is kernel module,
>   - Using a Salvator-XS board that has Samsung eMMC device,
>   - enter suspend and exit it,
>   - and then insmod renesas_sdhi_{core,internal_dmac}.ko.
>
>  After that, the following error happened and any partitions are not detected.
>   mmc1: error -110 whilst initialising MMC card
>
>  I tested this patch on:
>   - M3-N Salvator-XS with a Samsung eMMC device,
>   - M3-W Salvator-X with SiliconMotion eMMC device,
>   - and M3-W Starter Kit with Micron eMMC device.
>
>  drivers/mmc/core/mmc_ops.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
> index c5208fb..a533cab 100644
> --- a/drivers/mmc/core/mmc_ops.c
> +++ b/drivers/mmc/core/mmc_ops.c
> @@ -184,11 +184,7 @@ int mmc_send_op_cond(struct mmc_host *host, u32 ocr, u32 *rocr)
>                 if (err)
>                         break;
>
> -               /* if we're just probing, do a single pass */
> -               if (ocr == 0)
> -                       break;
> -
> -               /* otherwise wait until reset completes */
> +               /* wait until reset completes */
>                 if (mmc_host_is_spi(host)) {
>                         if (!(cmd.resp[0] & R1_SPI_IDLE))
>                                 break;
> @@ -200,6 +196,16 @@ int mmc_send_op_cond(struct mmc_host *host, u32 ocr, u32 *rocr)
>                 err = -ETIMEDOUT;
>
>                 mmc_delay(10);
> +
> +               /*
> +                * According to eMMC specification v5.1 section 6.4.3, we
> +                * should issue CMD1 repeatedly in the idle state until
> +                * the eMMC is ready. Otherwise some eMMC devices seem to enter
> +                * the inactive mode after mmc_init_card() issued CMD0 when
> +                * the eMMC device is busy.
> +                */
> +               if (!ocr && !mmc_host_is_spi(host))
> +                       cmd.arg = cmd.resp[0] | BIT(30);
>         }
>
>         if (rocr && !mmc_host_is_spi(host))
> --
> 2.7.4
>
