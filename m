Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD01F480F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 13:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbfFQLfp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 07:35:45 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:33108 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfFQLfo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 07:35:44 -0400
Received: by mail-vk1-f193.google.com with SMTP id y130so1991917vkc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GDGc5FFUczINhyju9aeNMFDBr8xx+ddBhh70qtZuI8g=;
        b=D2xzriWH4znj+Bc5TrvyYj99Et2PQ8ufT6wQnNTFGoiwi6X3BwJnOJ71Hk5U3WzWfR
         S/Q4JOG9CBoclE0dtnkmIHgmERSz4hRUMXhMLU8uY3jlDis9J3hu/sLc2r8zrNEVnMEG
         MT2WR4pG0yKBNSSB7wZI34xLjJWlthOUckmOLGcI/zt8tEHexYVXQzHDdD+cdydbK1fk
         SCE3+MuOFM9xpd8td3esm3yzGDHDg9QiQww/6cN33lLsvfuYZaIFUS6NZequLb5tjIEa
         2XGSciZVQ6TkG8X40X6g9TewExCw3tEsw2vlOz2FUBfucjoqfjcT3sFvd5FY7OTRH2dc
         xosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GDGc5FFUczINhyju9aeNMFDBr8xx+ddBhh70qtZuI8g=;
        b=jYbIz1e6xbmHjjUoEE+JJzXRdhugw+pELPoRkrqv6ud9uK6RAu0ee/lbdt+rroHr8U
         p34dNETmepz0ZFPkmj36tvDv2HIfv4/wII2Fhz7bWszjKyf1Z4pJ/Wh9jEbsv6+P040P
         /bSg4QfQHh5MSbvdfk+HMCm0sQuK3TZ1n4rN0ryfDqbiGdARWv6ympULPT9pg8k35Aan
         X7EDp8BOqOnmDN845mDhhDc5g9TNnRxC18vdlmQ7KEenVG59Uxj8aXz3BTHWanJWXEug
         qbzgCvsuT9IZT4jsFY7IO9JhRwyvn1vXptI50zdcoKS0AE2N8MxvkRHcbFYpInR3mVAr
         Bn2A==
X-Gm-Message-State: APjAAAURuIhZPPUkgvnG+2fxy/k4j2PdK2MlbVj1RBnkEbJtfXtk7Inb
        ozXMDHTZc412wegjQUKZVnCcupqEdn2iERITCHm3Qw==
X-Google-Smtp-Source: APXvYqyKY8QGjt6cDUwQ5tSC0fAuLCA4hlQ4XgmlulQhB2qsjCF7pORDBJqkQaArVwPDuy4jy4jFYvjJZd00v9z4Mt8=
X-Received: by 2002:a1f:12d5:: with SMTP id 204mr11012410vks.4.1560771343625;
 Mon, 17 Jun 2019 04:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190611200343.12343-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190611200343.12343-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 17 Jun 2019 13:35:06 +0200
Message-ID: <CAPDyKFrpgyv60UzYKx2eLMNR1Se=JvyuDCptwAVEb4bPvbGvoQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: complete HS400 before checking status
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 11 Jun 2019 at 22:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> We don't have a reproducible error case, yet our BSP team suggested that
> the mmc_switch_status() command in mmc_select_hs400() should come after
> the callback into the driver completing HS400 setup. It makes sense to
> me because we want the status of a fully setup HS400, so it will
> increase the reliability of the mmc_switch_status() command.
>
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Fixes: ba6c7ac3a2f4 ("mmc: core: more fine-grained hooks for HS400 tuning")

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>
> Tested on a Renesas Salvator-XS (R-Car M3N).
>
> Simon, you implemented the callback. What do you think?
>
>  drivers/mmc/core/mmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 3e786ba204c3..671bfcceea6a 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1212,13 +1212,13 @@ static int mmc_select_hs400(struct mmc_card *card)
>         mmc_set_timing(host, MMC_TIMING_MMC_HS400);
>         mmc_set_bus_speed(card);
>
> +       if (host->ops->hs400_complete)
> +               host->ops->hs400_complete(host);
> +
>         err = mmc_switch_status(card);
>         if (err)
>                 goto out_err;
>
> -       if (host->ops->hs400_complete)
> -               host->ops->hs400_complete(host);
> -
>         return 0;
>
>  out_err:
> --
> 2.11.0
>
