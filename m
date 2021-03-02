Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A0532A63F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Mar 2021 17:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448165AbhCBORX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Mar 2021 09:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239337AbhCBKkN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Mar 2021 05:40:13 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D5DC0617AB
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Mar 2021 02:39:26 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id j188so4291077vke.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Mar 2021 02:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Fn9cvqu3TWLlgd40wMpRR7rJKUFWNQl/gN+inkFY3Iw=;
        b=plixZWctOODXy5NxmIV8w/uWlqbdvGEZOFPFB6yMYYdBZhVcqTScZA+f11NXp/0NS7
         1p+suo5ak7KdNsexbGMzdFXPu2l1ltNxLsMBayWkHV1klbohzj+xNOL+kKRqktnNggDU
         eDsCJjeKqJHk/GrC9RKrjki2WtuTopGX7d4X8FbMYBB8Fy7SztgWatp5pHwZRDLcR1Vo
         lhT/C3yiben/8gsqKQHviCdCipFwQAPONgblK+YTbiMrQNaJuiENcToOQoIeIAe6SXjm
         JgHPGnIqxN85iaV2jLLqYwQeDs6Krrc+u3+z3oTErFNAo8+hv+BqIgVQaQsOtrVytAxc
         NtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fn9cvqu3TWLlgd40wMpRR7rJKUFWNQl/gN+inkFY3Iw=;
        b=H5SxMk7hRv4UTJ1lQKHu6bCn9tylCTFA7ZhWd1VhOaPZeHvgaFTfL31qARpJLZ9kQ0
         nz9BUytf3QUst1WaEguVms8sBKsoaOkHQertuZbGIO5hSqFpeDL7uytTYrmWRsPQ57vR
         EX+69HEc+JSpbpGuJBD3bA1vUpbZvB3gJuz8m0EZp90Rnm16b7Fj/KQp2ZyUg5aACp6q
         /+rjfhbRAQhIpibSl8mpOF1Vl/ZHZ4trwU56XB0cXZJtDD4kuUlAGCbJeTXHJ/uVlQnY
         LcYquVVOb0/mZ+3NTNqFRPDeRtE1ZSRd4+9e0i1xgI213b/DtTXjSoQcVYCll7sVkX9D
         jxxA==
X-Gm-Message-State: AOAM533H/fPY1u5guoZvrWcbcUFjK2fw7NMpLj2kmeWMlSoVV1OjyaGI
        L/BFwuQ3OhcFJJ9vEjLyI3K8zZCzHE8OnDIeAqFB9w==
X-Google-Smtp-Source: ABdhPJzuuI5yNZxyuV1AkZ/hXSTAnfd0WV4twuwbtnzSFXrTkZhCtXu268SmaM3/RvC8GbUqxkFtDPr6tUF9CP1xqlc=
X-Received: by 2002:a1f:93d2:: with SMTP id v201mr1362089vkd.7.1614681565250;
 Tue, 02 Mar 2021 02:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20210218110224.6910-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210218110224.6910-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 2 Mar 2021 11:38:48 +0100
Message-ID: <CAPDyKFo0ArQ43kAxkZ1ueU8sYu=8fdYq6ZKTyPgEA3uQiPanXg@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 18 Feb 2021 at 13:01, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> RPM handling has been improved twice since this comment, and also SCC
> handling has been improved a lot. All the testing we did (Geert's and
> Niklas' and Wolfram's board farms) with the workaround removed did not
> lead to problems, so it is time to get rid of it to the best of our
> knowledge.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/tmio_mmc_core.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 49c2d406c48e..2478a91e84b2 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1160,15 +1160,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_hos=
t)
>                                   mmc->caps & MMC_CAP_NEEDS_POLL ||
>                                   !mmc_card_is_removable(mmc));
>
> -       /*
> -        * On Gen2+, eMMC with NONREMOVABLE currently fails because nativ=
e
> -        * hotplug gets disabled. It seems RuntimePM related yet we need =
further
> -        * research. Since we are planning a PM overhaul anyway, let's en=
force
> -        * for now the device being active by enabling native hotplug alw=
ays.
> -        */
> -       if (pdata->flags & TMIO_MMC_MIN_RCAR2)
> -               _host->native_hotplug =3D true;
> -
>         /*
>          * While using internal tmio hardware logic for card detection, w=
e need
>          * to ensure it stays powered for it to work.
> --
> 2.30.0
>
