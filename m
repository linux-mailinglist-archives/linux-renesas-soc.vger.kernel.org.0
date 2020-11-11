Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676A42AFD28
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Nov 2020 02:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbgKLBcK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 20:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbgKKWpf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 17:45:35 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E207C061A4C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2020 14:45:31 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id v20so3895845ljk.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2020 14:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9qtMsgKiVIFryrruwz2wXWM8Ya/YcSkqnLASynZmkWg=;
        b=WgB49Zx+TEOouEUA8Srdham4PkuH9g5OoWTXT0mH1OXhi9buel8NRoPb0Qwy/ct2NF
         DUa/8eijWxUsTW6AkKnLo/Edj5GvEBaxxxNKTO4MK+1AicXautKYt8Nxj1b52M0BW1oe
         oijwUeltf7WG+rB922JIv0NBkmyFuvx3/3RnE0bZIBGaE1aAclNgW0xJSRXqYakwwh88
         UEMFuMX+FyPRDV/CcBnDWbaHLRTft+qJrp/UQ7tweWESFPnFHkvBYP1Nh5/tu5ZNocbO
         1NqGmiPC9ejOIwPlqXYLGVhWorWGHYGpZrZV5IWf7QJRyIsunWb1GTLPT2Plfdl6ssa3
         hSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9qtMsgKiVIFryrruwz2wXWM8Ya/YcSkqnLASynZmkWg=;
        b=MUOlvpdi7iGYzaIbpyiwLB0X1Na1W2IR9zDeQo1pi+DX78wuuZ8cgv+MQ0cjcMytSo
         oBQZ1bXqvQfV9z1iYQP0MoAgO//YRltSOrf/8HkMeAwNbtqkeoqm6fnNwCaSfR+X3b8q
         iQd7mBRPhS7nf2bLqAWMS9mJqi50ZSXm0bBNIq1YvU28+nYEfJBlJpX2A/giQvgQ5y9F
         tFNof8gklNG+I+uNiqDKfSDaMQFCw2xAwWDyxTK4/zbAouR1eibnIz4Kg86PMu/pyaZp
         9RF1jrbkF9YfPJa3quqYwRbowbvyyCJQwU+37Ufgc6qNXfmzL9lgSY9G6j8ufCbRwkud
         BIrw==
X-Gm-Message-State: AOAM5320+1jZZla19ZiS63/WMSu4BWPTsmrkNnJsGysd/jwlZjaHGarf
        lvL9wKAGCjU/ZZOHygDV9x/LhA==
X-Google-Smtp-Source: ABdhPJzGiIzAeCeHMmS1cDfSLB1dJNwrQqbkrZY8BzPeAAbVIzxLAkeSln8xuECElQdQbCR7iKFELQ==
X-Received: by 2002:a2e:a375:: with SMTP id i21mr9000678ljn.421.1605134729941;
        Wed, 11 Nov 2020 14:45:29 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j2sm353275lfe.23.2020.11.11.14.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 14:45:29 -0800 (PST)
Date:   Wed, 11 Nov 2020 23:45:28 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 3/4] mmc: renesas_sdhi: populate SCC pointer at the
 proper place
Message-ID: <20201111224528.GB1263071@oden.dyn.berto.se>
References: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
 <20201110142058.36393-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110142058.36393-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2020-11-10 15:20:57 +0100, Wolfram Sang wrote:
> The SCC pointer is currently filled whenever the SoC is Gen2+. This is
> wrong because there is a Gen2-variant without SCC (SDHI_VER_GEN2_SDR50).
> We have been lucky because the writes to unintended registers have not
> caused problems so far. But further refactoring work exposed the
> problem. So, move the pointer initialization to the place where we know
> that the SDHI instance supports tuning. And also populate the 'reset'
> pointer unconditionally to make sure the interrupt enable register is
> always properly set for Gen2+.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 17ebaa324ca1..4a1ed5bf216c 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1007,11 +1007,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  		host->ops.start_signal_voltage_switch =
>  			renesas_sdhi_start_signal_voltage_switch;
>  		host->sdcard_irq_setbit_mask = TMIO_STAT_ALWAYS_SET_27;
> -
> -		if (of_data && of_data->scc_offset) {
> -			priv->scc_ctl = host->ctl + of_data->scc_offset;
> -			host->reset = renesas_sdhi_reset;
> -		}
> +		host->reset = renesas_sdhi_reset;
>  	}
>  
>  	/* Orginally registers were 16 bit apart, could be 32 or 64 nowadays */
> @@ -1091,6 +1087,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  		if (!hit)
>  			dev_warn(&host->pdev->dev, "Unknown clock rate for tuning\n");
>  
> +		priv->scc_ctl = host->ctl + of_data->scc_offset;
>  		host->check_retune = renesas_sdhi_check_scc_error;
>  		host->ops.execute_tuning = renesas_sdhi_execute_tuning;
>  		host->ops.prepare_hs400_tuning = renesas_sdhi_prepare_hs400_tuning;
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas Söderlund
