Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0002CEFD8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 15:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbgLDOj5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 09:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgLDOj5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 09:39:57 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8E9C061A56
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Dec 2020 06:38:46 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id j140so3357901vsd.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Dec 2020 06:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ld4dnKet0Aan3wmVGmDEhQALDjT+lE0nQJqWzbzD/MU=;
        b=WGi2/QVB6Oc9twB4+3YrCN1dvhzPGACKxJQDwiWbWnuxVZS/YBx0Xu9ZGpa1aROHis
         ACv1JU6LKXb4c1ioBtMatYMuZVUAMqwGdq2kvLf2lQOtp15G0ofgcTLCMusmUFs38U5S
         PO2yuL3Uk5rZjzjhi19dZfhV6CPA9Pgxy5RnvN80UUK5815AFbrEMRyAQAiU+AM8BWre
         GHIyzIMZLbf7TwE+jU2MX5ZSIIz+NpCe5/HqUyWcIyV/pEMOoI5E66tR8QTC2ISnSSlz
         fxsC54LSXJTOMli8IOh38i88xhyQ5vyBXDdcLhpji4OGJLHGt6cM7jgudLPftdlqY+8r
         6UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ld4dnKet0Aan3wmVGmDEhQALDjT+lE0nQJqWzbzD/MU=;
        b=C+sFwSJfrKELWD5PmGLMEcrAf+O9n8DcYYn9F5LSjANqTEfuNLb4Fr8LfNDTqqgRr/
         TynCCzhRpy8b3+y5R1E8Vk82fYJEd1fzjfMpGi6mr0wysTK+AF89cwFU6wnVnF/Qsz3F
         bEWFgsrTfww3etH5PBNnVS4N7nHUtdl8lGpBxBtXIvGzhBsWFEEK4MkhTn2CP0Sv6dtG
         E9EjOu3Tap6iLflwycR8FFKdP/lyRM05EIXxJk+BBe/vMoQYs3kqyVkVM5rwfPcXdvmH
         tGwmHrC4Dbic5e1v26XwUeV1vhbfzc4sjCUesYU0mGVCrnVW8z5ToGfY9vhWeg1EETVT
         o4kg==
X-Gm-Message-State: AOAM530OdVLtFrtTxNKQe6UTOkDkMEbhoaBlxn6pdDHSPCix/PYpruRn
        on69zftSI8elap0v/IBUvY92tcO9Wr6X1jy5GHAqEb9OE/LCSQ==
X-Google-Smtp-Source: ABdhPJwnvZhvZ0ukN6hOxsx1tx/Kh8k9pUNeBGVL+JSvwrWUS+Wh6nHS35cqQnwEo0d/eQvVWwcIyBZNIcuskbt/+C8=
X-Received: by 2002:a67:e286:: with SMTP id g6mr3935119vsf.42.1607092726109;
 Fri, 04 Dec 2020 06:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20201125204953.3344-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201125204953.3344-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 4 Dec 2020 15:38:08 +0100
Message-ID: <CAPDyKFrEAVNukL=EUN=QO3h-RC-wAY=b+vQooEqQ54EXhGwtjQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: improve bringing HW to a sane state with MMC_POWER_OFF
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 25 Nov 2020 at 21:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Further testing of error cases revealed that downgrade is not enough, so
> we need to reset the SCC which is done by calling the custom reset
> function. This reset function can distinguish between the various SDHI
> variants, so protecting the call with MIN_RCAR2 is enough here.
>
> Fixes: 24ce2d7b8bea ("mmc: tmio: bring tuning HW to a sane state with MMC_POWER_OFF")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>
> I was also evaluating if tmio_mmc_reset() would be better than
> host->reset. I finally decided against it. This is the minimal change
> that we need and which fixes an actual issue. I can't see why we would
> want to terminate DMA because either everything went smooth and DMA
> completed or the DMA error has already been handled. I think. Please
> speak up if you disagree.
>
>  drivers/mmc/host/tmio_mmc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 7f4a28125010..a89547f5d733 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -929,9 +929,9 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>         switch (ios->power_mode) {
>         case MMC_POWER_OFF:
>                 tmio_mmc_power_off(host);
> -               /* Downgrade ensures a sane state for tuning HW (e.g. SCC) */
> -               if (host->mmc->ops->hs400_downgrade)
> -                       host->mmc->ops->hs400_downgrade(host->mmc);
> +               /* For R-Car Gen2+, we need to reset SDHI specific SCC */
> +               if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
> +                       host->reset(host);
>                 host->set_clock(host, 0);
>                 break;
>         case MMC_POWER_UP:
> --
> 2.28.0
>
