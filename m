Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45AFE39BCCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 18:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhFDQPu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 12:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhFDQPu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 12:15:50 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EBEC061767
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jun 2021 09:14:03 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i10so14924375lfj.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jun 2021 09:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LvA0Er8AskDavuezV8RiKUwzdr6yicLLRj9IkJ+LjuY=;
        b=t09snEHxZfS0dvM4kwlDaIMrXgVcoYhGT6KvyuPjHpYlwB4OzhqbQOwOdsNVtz1IbB
         468+uOAoZZqCg3QOBf2krkDM+09v5DFNx9jc9m7c5cTBkvdQ1y8Ww51wC75jyhQMbNjy
         eLSbpREsKT4UhVnDbZkItDZNZObwFsPE/ec4LAMt9ivkV+odqMoLn18Y8P1FxYzQK5m+
         U1Nfag5qLBYVmMQhPWfKGCgsUrWtN8dUf1AZqzKMftTOVWse0nh9bIxvNEFOkOUjFOBq
         7M3npJumkxNrHQDrwu3wD00MofxHFOULsiy5dcitYonncL5wW6Qgejly5BoxOQDDSxsv
         muiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LvA0Er8AskDavuezV8RiKUwzdr6yicLLRj9IkJ+LjuY=;
        b=gfOS9B7/R/IaP9aYwQZlMCF6eZuijAKyianXT7QeOBYrEfuKPKMDig7nERLCMqIbrD
         lCeL/1/ufAIQ/dWXTkzEj9QU3W1+CgRrJZ1KAGVxhSYlB5xInWaDLzGt174qYliEQMIC
         iqlykgf8VgdcBA5E5aM5NjVxID8cxHpIghAfT5/ZPjLY9+1SPSUgf2zPi7p8pKmvBHGK
         NIeGV+WXAtZPXg+P6hs8t3z0nxxjBx7XGhguRJ1oBVJeXlMz7AOTbDScXrFz6ZlkAxrx
         FRTWHNzObowff3lgxBvJUCjk+xg+43SoFDgl/KH8m3zXIhJiHeHcjx2UfL25F9lczBD9
         RzzA==
X-Gm-Message-State: AOAM533wKxM0/gQxWJJanFbt8ekKkYfSA+suafe9fR+RxdnLwCcZbGzp
        JpfeG0GH67CvHnkxwFLtCqxTkg==
X-Google-Smtp-Source: ABdhPJwylHQ8+iVbW/SeT4vHq++HTlmIOEXyZLUdhZb+SKK07ZvBq9l9qfeVUU2bkJ8LNmhOI91HEQ==
X-Received: by 2002:ac2:515d:: with SMTP id q29mr3338076lfd.535.1622823241964;
        Fri, 04 Jun 2021 09:14:01 -0700 (PDT)
Received: from localhost (h-62-63-236-217.A463.priv.bahnhof.se. [62.63.236.217])
        by smtp.gmail.com with ESMTPSA id l22sm519659ljh.64.2021.06.04.09.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:14:00 -0700 (PDT)
Date:   Fri, 4 Jun 2021 18:13:59 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix HS400 on R-Car M3-W+
Message-ID: <YLpRR7f/T88G8VRv@oden.dyn.berto.se>
References: <ee8af5d631f5331139ffea714539030d97352e93.1622811525.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee8af5d631f5331139ffea714539030d97352e93.1622811525.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-06-04 14:59:43 +0200, Geert Uytterhoeven wrote:
> R-Car M3-W ES3.0 is marketed as R-Car M3-W+ (R8A77961), and has its own
> compatible value "renesas,r8a77961".
> 
> Hence using soc_device_match() with soc_id = "r8a7796" and revision =
> "ES3.*" does not actually match running on an R-Car M3-W+ SoC.
> 
> Fix this by matching with soc_id = "r8a77961" instead.
> 
> Fixes: a38c078fea0b1393 ("mmc: renesas_sdhi: Avoid bad TAP in HS400")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Boot-tested on Salvator-XS with R-Car M3-W+ ES3.0.
> No difference seen in eMMC/SHHC detection:
> 
>     mmc0: new HS400 MMC card at address 0001
>     mmcblk0: mmc0:0001 BGSD4R 29.1 GiB
>     mmcblk0boot0: mmc0:0001 BGSD4R 31.9 MiB
>     mmcblk0boot1: mmc0:0001 BGSD4R 31.9 MiB
>     mmcblk0rpmb: mmc0:0001 BGSD4R 4.00 MiB, chardev (247:0)
>      mmcblk0: p1
>     mmc1: new ultra high speed SDR104 SDHC card at address aaaa
>     mmcblk1: mmc1:aaaa SL16G 14.8 GiB
>      mmcblk1: p1
>     mmc2: new ultra high speed SDR104 SDHC card at address aaaa
>     mmcblk2: mmc2:aaaa SL32G 29.7 GiB
>      mmcblk2: p1
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 635bf31a67359f10..b719eda6b8619453 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -939,7 +939,7 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
>  	{ .soc_id = "r8a7795", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps2367 },
>  	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
>  	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
> -	{ .soc_id = "r8a7796", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps1357 },
> +	{ .soc_id = "r8a77961", .data = &sdhi_quirks_bad_taps1357 },
>  	{ .soc_id = "r8a77965", .data = &sdhi_quirks_r8a77965 },
>  	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
>  	{ .soc_id = "r8a77990", .data = &sdhi_quirks_r8a77990 },
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
