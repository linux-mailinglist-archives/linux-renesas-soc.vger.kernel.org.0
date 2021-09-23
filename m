Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F527415D17
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 13:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240678AbhIWLxj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 07:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240682AbhIWLxj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 07:53:39 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7383C061757
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Sep 2021 04:52:07 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id e15so25475208lfr.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Sep 2021 04:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FEeqR6nlEEzkH0lbEI3rGr3m6Ssz2zpzX11icyz6UOE=;
        b=DSK19263adjhrRON9Qs07qk3E0g5EtWj+vwXbz/7SDj6SSCWGfiwRpa+izXVNaAnqG
         QHlr/Ff7/5+uC87doKW3MnzV6lW1/8YyzRAGaG0SJuzUIGenTueRxuy64vJfUueXvEaz
         bVTo1ykch/qyYUI5dZ9rGU15rL/+KbjLBoBKMJfuESXn5DhE/lFo+3gJxnkMgweE/6nA
         8cVb8XAT/SiRa5LPsQQP85zpKCtl/aBdfvilAFh1Xd1t7Uhjm/U83zerK/KB3eodJtfC
         93HnB8mArhTykcsB/Dcwe/UAjdIyyqv8pEpBoCI/yegKq/u6vExZEueG3MqKxrRd1I3L
         hrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FEeqR6nlEEzkH0lbEI3rGr3m6Ssz2zpzX11icyz6UOE=;
        b=ofp19F6eld0rqC8tPD77+xTtpmdBkjEorl9enJ6LQ6nurWA6JhchnFMwQsXGFIfsKX
         0UPWzh1MWRoz/NeNy+NJVhf5RAfV1enX0xw4sL3ronffLxGkTsEL9xSQWFW3Sd4IBTAA
         vCxWVUwVsRLoxrp4eemXj2ABzCwKy9KU2Kd9pw8Q4QLU9C+YnGwhuU26BocDZ6/kdgh6
         rkcW50UrZaOnuQqe7dQemByb6+BSJ0/IMmSLkWMVhALNh+NO3jP+L/U9/sZgbM9lSWw5
         pLf+0xuJ3TvghaRhaQ8Wg4sfKHN5OumpwVCoq0X655r+h17Cxohu7/GKYCiQWj2Rg2rJ
         Xevw==
X-Gm-Message-State: AOAM532/P/69oqNanNcKCHHPq6H3PFo+kbfljcPz8EqIr4U0TPn0WDew
        IqwwGW5xRuC2PbY21jAGvTreAcs6gV8ntMW1rdVRFw==
X-Google-Smtp-Source: ABdhPJxQIpe1vDMrGyQ8M1bAnK5oilq+qhNqZ0+s9xA1yJa7f25WKJ2fR0hz8XJiOCZZq/GDtCwUYAs5aFPBM+yi99E=
X-Received: by 2002:ac2:4157:: with SMTP id c23mr3718209lfi.184.1632397926016;
 Thu, 23 Sep 2021 04:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210914182023.8103-1-wsa+renesas@sang-engineering.com> <20210914182023.8103-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210914182023.8103-3-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 23 Sep 2021 13:51:30 +0200
Message-ID: <CAPDyKFp0AgAqbJnvpUb4gxP_7wGszEZxVXU1=0UCMB3c+ruLzA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: core: also abort tuning with CMD12 for SD
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 14 Sept 2021 at 20:21, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> We have various SanDisk cards which fail tuning to SDR104 unless we
> allow a CMD12 also to be sent to abort a broken tuning. It is true that
> the SD specs do not mention that CMD12 is allowed, but they also don't
> say it is forbidden. And now reality tells that it is needed to make
> some cards work. Other cards I tried did not regress.
>
> So, add a new callback to the bus_ops which allows us to send STOP for
> MMC and SD cards but not SDIO which does not support CMD12.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Tested with a Renesas Salvator-XS board (R-Car H3 ES2.0) and a SanDisk
> Ultra 64GB card.
>
>  drivers/mmc/core/core.h    |  1 +
>  drivers/mmc/core/mmc.c     |  6 ++++++
>  drivers/mmc/core/mmc_ops.c | 21 +++------------------
>  drivers/mmc/core/sd.c      |  6 ++++++
>  4 files changed, 16 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index 7931a4f0137d..660873ba13ed 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h
> @@ -31,6 +31,7 @@ struct mmc_bus_ops {
>         int (*sw_reset)(struct mmc_host *);
>         bool (*cache_enabled)(struct mmc_host *);
>         int (*flush_cache)(struct mmc_host *);
> +       int (*send_abort_tuning)(struct mmc_host *);
>  };
>
>  void mmc_attach_bus(struct mmc_host *host, const struct mmc_bus_ops *ops);
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 29e58ffae379..d638477e0a49 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -2227,6 +2227,11 @@ static int _mmc_hw_reset(struct mmc_host *host)
>         return mmc_init_card(host, card->ocr, card);
>  }
>
> +static int _mmc_send_abort_tuning(struct mmc_host *host)
> +{
> +       return mmc_send_stop(host, 150, 0);

Perhaps also add/copy the comment about why we use 150 ms as timeout here.

> +}
> +
>  static const struct mmc_bus_ops mmc_ops = {
>         .remove = mmc_remove,
>         .detect = mmc_detect,
> @@ -2239,6 +2244,7 @@ static const struct mmc_bus_ops mmc_ops = {
>         .hw_reset = _mmc_hw_reset,
>         .cache_enabled = _mmc_cache_enabled,
>         .flush_cache = _mmc_flush_cache,
> +       .send_abort_tuning = _mmc_send_abort_tuning,
>  };
>
>  /*
> diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
> index 0c54858e89c0..bc794419d443 100644
> --- a/drivers/mmc/core/mmc_ops.c
> +++ b/drivers/mmc/core/mmc_ops.c
> @@ -705,26 +705,11 @@ EXPORT_SYMBOL_GPL(mmc_send_tuning);
>
>  int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode)
>  {
> -       struct mmc_command cmd = {};
> -
> -       /*
> -        * eMMC specification specifies that CMD12 can be used to stop a tuning
> -        * command, but SD specification does not, so do nothing unless it is
> -        * eMMC.
> -        */
> -       if (opcode != MMC_SEND_TUNING_BLOCK_HS200)
> -               return 0;
> +       if (host->bus_ops->send_abort_tuning)
> +               return host->bus_ops->send_abort_tuning(host);
>
> -       cmd.opcode = MMC_STOP_TRANSMISSION;
> -       cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_AC;
> -
> -       /*
> -        * For drivers that override R1 to R1b, set an arbitrary timeout based
> -        * on the tuning timeout i.e. 150ms.
> -        */
> -       cmd.busy_timeout = 150;
> +       return 0;
>
> -       return mmc_wait_for_cmd(host, &cmd, 0);
>  }
>  EXPORT_SYMBOL_GPL(mmc_send_abort_tuning);
>
> diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
> index 4646b7a03db6..19c85e6088f4 100644
> --- a/drivers/mmc/core/sd.c
> +++ b/drivers/mmc/core/sd.c
> @@ -1784,6 +1784,11 @@ static int mmc_sd_hw_reset(struct mmc_host *host)
>         return mmc_sd_init_card(host, host->card->ocr, host->card);
>  }
>
> +static int sd_send_abort_tuning(struct mmc_host *host)
> +{
> +       return mmc_send_stop(host, 150, 0);

Perhaps also add/copy the comment about why we use 150 ms as timeout here.

> +}
> +
>  static const struct mmc_bus_ops mmc_sd_ops = {
>         .remove = mmc_sd_remove,
>         .detect = mmc_sd_detect,
> @@ -1796,6 +1801,7 @@ static const struct mmc_bus_ops mmc_sd_ops = {
>         .hw_reset = mmc_sd_hw_reset,
>         .cache_enabled = sd_cache_enabled,
>         .flush_cache = sd_flush_cache,
> +       .send_abort_tuning = sd_send_abort_tuning,
>  };
>
>  /*
> --
> 2.30.2
>

Besides the minor nitpicks, this looks good to me!

Kind regards
Uffe
