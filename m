Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340AA2B7CBA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 12:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgKRLcK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 06:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbgKRLcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 06:32:10 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBCBC0613D6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 03:32:10 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id 142so1939765ljj.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 03:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ROaaptIlFxoZPMh3eKEr9Wb/hsxjEjQvBKY/Z69few8=;
        b=zOqStgubbQ3/8E2vL1xD/qXQpcrzaF8nB2WPdVr3OzCwzEZpHetRrcTOGlsTL+7N+0
         b3TmGgSSooh4L74hOLtcdLPaANx7cCXLEqRAE7iZv6BT16ia3xbkf4ThjXnXuChFjtlX
         SVOqvokV6Mg/LeLD2atnxJHeOdjmap5omPu8BG8wZCr6xi7dAz8aRNQhoqnUizyt7RP8
         bD3YVDHrr1jyhfMHjwZKa4jiSN4QBvoWvheOjLvHNkhSR5/7nmZyoWAQa8WABvjmBfKf
         xoJGj4nkfwdt2QlSmL62KQQgZI/JisXsdwOmGO328pzJRPkYQjTFlm4xxEP4cbVZkSTw
         8lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ROaaptIlFxoZPMh3eKEr9Wb/hsxjEjQvBKY/Z69few8=;
        b=TCITBaBQ1NE3/RYEfIWEVlOXPfvvHVJLWyEPmy93nucnYejRy4YWoMkHgTsKABiCgB
         fGmva7WesM3fYM3fGbfLgnBTEc5AH6t77KeEQYKujMipnAYfypjUnXCbpCW6eCVpqeTK
         AF4ZqtVO6wcCun+e48HGnNNdWc2Txze8+Vf+zBRsOfyMXl6H7ugzgFLNreRh5y165jRo
         cd3pPAu4wtC4kGqCfgYUkDCQi7W6Fp1vuBnONm/bQopUjyJ+tjvqJFdWwhm6NaHCUVom
         RVwXRzBxVII3B3dhUTIuJj+Y4DUmiweA14265FyvWbnqU6IeHvVh7MfwDASWXn5+j0GH
         eYtw==
X-Gm-Message-State: AOAM533Czr2vwZAnKPeIoDnwMuXJnXlBmhQa6cKKfXyolY/8kevCPYy5
        pIj7IoBteoAHsONOR9v4qW7JUT0671lz9A==
X-Google-Smtp-Source: ABdhPJxJ9Q0RTB4m+hFWfIFhNjC99Bgbkj0I4lz1SLIe8idmirlmZuz2AmjpUJL0BNQj7tuPTPRYtQ==
X-Received: by 2002:a2e:8641:: with SMTP id i1mr3876075ljj.134.1605699128567;
        Wed, 18 Nov 2020 03:32:08 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id d12sm3231618lfa.22.2020.11.18.03.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 03:32:07 -0800 (PST)
Date:   Wed, 18 Nov 2020 12:32:07 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH] mmc: tmio: Fix command error processing
Message-ID: <20201118113207.GC3118893@oden.dyn.berto.se>
References: <20201117131337.35307-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201117131337.35307-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-11-17 14:13:37 +0100, Wolfram Sang wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> 
> If some errors are detected at the same time as the access end
> interrupt, the access end interrupt was not cleared. Especially with
> DMA, because then the access end interrupt was never enabled and, thus,
> never cleared. Clear the interrupt register always when a command error
> occurs.
> 
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [saito: rebase to v5.4]
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: rebase and extension of the commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Because the test case is hard to reproduce (lots of radio noise and
> temperature changes), I trust the BSP team here. But the reasoning makes
> a lot of sense to me. I verified that there are no regressions with the
> test cases I usually do. The patch is based on mmc/next as of today,
> i.e. with all previous series included.

I agree the reasoning make sens and the patch looks good,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
>  drivers/mmc/host/tmio_mmc_core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index cb4149fd12e0..7f4a28125010 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -796,8 +796,10 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
>  
>  	spin_unlock_irqrestore(&host->lock, flags);
>  
> -	if (mrq->cmd->error || (mrq->data && mrq->data->error))
> +	if (mrq->cmd->error || (mrq->data && mrq->data->error)) {
> +		tmio_mmc_ack_mmc_irqs(host, TMIO_MASK_IRQ); /* Clear all */
>  		tmio_mmc_abort_dma(host);
> +	}
>  
>  	/* Error means retune, but executed command was still successful */
>  	if (host->check_retune && host->check_retune(host))
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas Söderlund
