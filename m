Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17FC3AC90E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 12:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbhFRKpH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 06:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbhFRKpG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 06:45:06 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A200C06175F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 03:42:57 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id l25so4694165vsb.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 03:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PltpfVsWYSYb83wtwKTYBy+0tqaIthqE9CaZ4SiNDcw=;
        b=LzCYx9sJtWYCnQe39W4ypYY1HaZpTzOaNGgSjKgAbZbKHpoUjAYm1D6skpzrjnJ14d
         OzHwTNNllYpvbE4ompxKWXqhPphY9pd8RxoizDyXN2AQPNa09x4Xp/b0dK6sYbycSO1/
         3VfUf4oufQn6Ket+5XWDXKxMDStZDouBv1OA/T63b3e+8ZDQyZKd/lYwIcvvZWAOLGbn
         NIGdgXfVGt2Z07ztLjzmSPAMEAWCBAQatBfPKE5j7szbfLnJYBZvlEkeyWoxQ54Yl6c4
         DjTPo63DhC/6Avh291MgqF5QC0BC773trKQx+3hWdPje4D65v7GDu+N3U3hEGrKfHGqc
         nutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PltpfVsWYSYb83wtwKTYBy+0tqaIthqE9CaZ4SiNDcw=;
        b=NN0gvHr0kJeJ+ZyE0DdxrUNHN41kTp/gVfeTToAVuP/E0OlDTln3GWTvqNwq6Glb90
         xwi5VsgVE4stWyqpecbwt425JIgt2pqJEYo/1ibZxnCwWrPCG/rxW4SRR2SHAxvRg1Gt
         RMQ3qo+5sTie2B1n530d1ZRO/XMP6srSTHxIPBlQ/GEfZrLPLu9p/L+S3/Mo2qCuDpzm
         w73YZlrfTVwAV2u4Xabrxa/v6NoaipQ/qNZbzZTIGjApTCEV7tAb+tVE0VRqYIK7gJCy
         svAE+rXGJr9BECklWhHnVs2PHPjo67a6s+Ngb4BL3BGyqJ9MwZYIJKx9NwECuUIYqzzv
         ctOg==
X-Gm-Message-State: AOAM531buOrq3SF7VlCPbS4krfJv/4Bo9d5FpeYHv/PEhJyTfTQ1boz4
        4tntm9xSpJymRjQJmVklbRnfHs1OcRhp/JmZhcVEKg==
X-Google-Smtp-Source: ABdhPJwTo8gF8VInP0qhhqNy4ZFN8A/468CxnETPax0e+O/H/ER0VTWC7zyYFvMzggVTxrcAXIRdiyvbiSWHzvOaXHA=
X-Received: by 2002:a67:1087:: with SMTP id 129mr5933112vsq.42.1624012976464;
 Fri, 18 Jun 2021 03:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 18 Jun 2021 12:42:19 +0200
Message-ID: <CAPDyKFqkW9uwtJyWPFKggi2AJMtO4NJLW-6hviWgGSfoHyDm1A@mail.gmail.com>
Subject: Re: [PATCH] mmc: disable tuning when checking card presence
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+ Adrian

On Fri, 18 Jun 2021 at 10:23, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> When we use the alive callback, we expect a command to fail if the card
> is not present. We should not trigger a retune then which will confuse
> users with a failed retune on a removed card:
>
>  mmc2: tuning execution failed: -5
>  mmc2: card 0001 removed
>
> Disable retuning in this code path.
>
> Reported-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mmc/core/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 54f0814f110c..eb792dd845a3 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2088,6 +2088,9 @@ int _mmc_detect_card_removed(struct mmc_host *host)
>         if (!host->card || mmc_card_removed(host->card))
>                 return 1;
>
> +       /* we expect a failure if the card is removed */
> +       mmc_retune_disable(host);
> +

Some controllers require a retune after it has been runtime suspended.

In the above path, when called via the bus_ops->detect() callback, it
could be that the controller may have been runtime suspended and then
got resumed by the call to mmc_get_card().

I think we need something more clever here, to make sure we don't end
up in that situation. I have looped in Adrian, to see if has some
ideas for how this can be fixed.

>         ret = host->bus_ops->alive(host);
>
>         /*
> @@ -2107,6 +2110,8 @@ int _mmc_detect_card_removed(struct mmc_host *host)
>                 pr_debug("%s: card remove detected\n", mmc_hostname(host));
>         }
>
> +       mmc_retune_enable(host);
> +
>         return ret;
>  }
>
> --
> 2.30.2
>

Kind regards
Uffe
