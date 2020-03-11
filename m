Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B141181C6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2020 16:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730022AbgCKPfQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Mar 2020 11:35:16 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:34472 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730020AbgCKPfQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Mar 2020 11:35:16 -0400
Received: by mail-vs1-f66.google.com with SMTP id t10so1617737vsp.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2020 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7P2TnAozvRUUITxwbv7loMPCIx00QfzH+LiOq7Ku7zk=;
        b=iWFCV2zcx2BPsAXZhH5ZIIiRUa49aY8/7cj4wiB7qgUyvhk7A7L9gPKV6aSNc6mBtR
         0AHIBCu6L0stt9RwHa7Wci2rgVw8LTnVGCPvn9bE9us9Z3CtYX9+rColeIZk5MUfePh0
         Q7qbV0DyqOU7q5eM8LONLriR2d/g/p36nRWCQCp6sCT5HD67oRpYK57KlhKA4koRtXIj
         SW8rar6XExNsU6aN6uXQrBYxcc2sqAb8Ili8DeHQEk0yyE0fkd5b2KLQppxzLad/vzQf
         ekalCWvsHrD6l92hsZ8ZwzAiE+pU0c9UwvuLavNqhGptrF6NSjFhWrwag8vTsKxfPOu6
         U3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7P2TnAozvRUUITxwbv7loMPCIx00QfzH+LiOq7Ku7zk=;
        b=njtyvCOSSOtvKq6UNk+vYHGXDCePIYjUnKP7Ti4gzTg84muFsuGCOdkYpZ1N+W/+1N
         oXpgKS2Ho6GVVF5AvAHB5N3kjrDzSxIP6GNPATDsRIARMZV43wYCATilx2najurv8d3X
         pBId8MhA1S3B8Taot+OSithAnxvsilCjBIpkjNcFLhcfKuNKg4cYTvf4tnVm5V6NHgBP
         VDg1/C9cmn3UM2NbZfbXrNz3m3UFTTYwTjGW2pzVDM+dYs1gYxHyeAfuIx1qyRF4nmsS
         qLMRATzB4OEtBkj6ZFj02CXBUR4wyOvZ1wbeGzzTBqq4O+d/akexZUHS28B7RarleZ2J
         uF/A==
X-Gm-Message-State: ANhLgQ0GqBlF9jHdodel160qOuQRPyiTpfYWptKtcwp0j0L7k9ckp9Do
        A+wO2/18nzKoqTlZ/+HGzVqYuCfqRpvv3U2+VQeU7g==
X-Google-Smtp-Source: ADFU+vvYx4lizAB/KxZ/Kx/MUG/Y0X6ILzdCx6DVipqraTwb0PouxhDDT3cdnuGQgyfq71WpTC05cxRhZec+Qgc+bbE=
X-Received: by 2002:a67:646:: with SMTP id 67mr2310247vsg.34.1583940913839;
 Wed, 11 Mar 2020 08:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200213163715.8212-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200213163715.8212-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 11 Mar 2020 16:34:37 +0100
Message-ID: <CAPDyKFoFSaNnuMThV9RfUn3-3wzESPQfvZZMOhmC9SH-u5Zy4w@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: simplify execute_tuning
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 13 Feb 2020 at 17:37, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> After refactoring, 'ret' variable is superfluous. Remove it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Tested on a Salvator-XS (R-Car M3-N). Tuning to HS400 works,
> checksumming a large file works with no performance regression.
>
>  drivers/mmc/host/renesas_sdhi_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 0f07cc1aee34..df826661366f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -497,7 +497,7 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
>  static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
>  {
>         struct renesas_sdhi *priv = host_to_priv(host);
> -       int i, ret;
> +       int i;
>
>         priv->tap_num = renesas_sdhi_init_tuning(host);
>         if (!priv->tap_num)
> @@ -517,8 +517,7 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
>                 /* Set sampling clock position */
>                 sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % priv->tap_num);
>
> -               ret = mmc_send_tuning(host->mmc, opcode, NULL);
> -               if (ret == 0)
> +               if (mmc_send_tuning(host->mmc, opcode, NULL) == 0)
>                         set_bit(i, priv->taps);
>         }
>
> --
> 2.20.1
>
