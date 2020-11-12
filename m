Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B06D2B063D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Nov 2020 14:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgKLNUs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Nov 2020 08:20:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgKLNUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 08:20:48 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6849C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2020 05:20:47 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id u18so8355800lfd.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2020 05:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QAurATarbDhhrK/t8zhJgHxBpS93im7qzjAMKWbGKhg=;
        b=oWmB4NwblazRKgaKp82GZHW5Qksya91nlZn1mNiP88ulqVQWylK9/RXczzkk9HcURZ
         NxcjFzN8y0EnuXL8aVKknpYv9Os2HbasedtZF9Ya/uCBCfLhEuLUCIAk2Jhom/D0mqLn
         SMwH/sZqBoSbcuYYeK2Y1V6NJOIzWGGJzM0b11J9rWV5VXA8mDedq5hOLuAFv6CN/BOd
         BpuLF/UyfQM9xplEFt0VXcOZr2RBIdp9CxuFySh8JKPCDS+Zj7JNToqq4s/UFhZYAeCx
         1EoKn6DPMY1aRt+NGQOg6TSX74MHHpapNt7knKKWtuYj158Om5fGyKsrf8fzuvt7pGNy
         Z5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QAurATarbDhhrK/t8zhJgHxBpS93im7qzjAMKWbGKhg=;
        b=B4Jdjx55cKL/QMA25dCCglEHOMErS7SWneALFHGqQZBCJqGTzclwnZzTc1F5tAgobg
         NtuHF/JLq7nyYfLizm4GTYvdtkJVoL3H7TwBzgEKfvj5/zD7bvwrAPrrC26JkcqIOt1K
         YETQXhRbB/Nc8VzH0gIgKf0cbPvA/MA3/vo70RiM6sw2IZ3YavEl3zbWqhlRfSqnkFKA
         yb/LPydfKD77t+11+XEfy2Ir6Fa6hrBC1X8SBkEm18o5beaISjnfKn+tG7RgK/daY9Ce
         VGhghwTWC0W/rLwSV4czg7vatWxPYCBzANfJr/o/YsOdeIxCT8DBirRVBARXmPfud5q+
         xRwA==
X-Gm-Message-State: AOAM530FgCCEXitnddlu4ZGnwKkT6W8jXrxlArDpJW7J7TXgBIChmCiV
        MXNA6H3mFhs1HNHtOdjOouDwpdT2qxEpHw==
X-Google-Smtp-Source: ABdhPJwl7uYbCAkpKWzLoBgVs7/ZGGrT5pnOjmyBQOn5rdF98wSReYf0newD35nZzRJ21ZOGPXHMbQ==
X-Received: by 2002:a19:8c7:: with SMTP id 190mr10827847lfi.74.1605187246438;
        Thu, 12 Nov 2020 05:20:46 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id v20sm541631ljh.19.2020.11.12.05.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 05:20:45 -0800 (PST)
Date:   Thu, 12 Nov 2020 14:20:44 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/3] mmc: renesas_sdhi: improve HOST_MODE usage
Message-ID: <20201112132044.GB1491229@oden.dyn.berto.se>
References: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
 <20201111100244.15823-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201111100244.15823-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2020-11-11 11:02:42 +0100, Wolfram Sang wrote:
> HOST_MODE should have a CTL_ prefix, too. This makes the code more
> readable because we immediately know what it is. Also, remove the
> hardcoded values with something readable, too.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 25c6a1993f8e..b3eb0182c4af 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -39,7 +39,15 @@
>  #include "renesas_sdhi.h"
>  #include "tmio_mmc.h"
>  
> -#define HOST_MODE		0xe4
> +#define CTL_HOST_MODE	0xe4
> +#define HOST_MODE_GEN2_SDR50_WMODE	BIT(0)
> +#define HOST_MODE_GEN2_SDR104_WMODE	BIT(0)
> +#define HOST_MODE_GEN3_WMODE		BIT(0)
> +#define HOST_MODE_GEN3_BUSWIDTH		BIT(8)
> +
> +#define HOST_MODE_GEN3_16BIT	HOST_MODE_GEN3_WMODE
> +#define HOST_MODE_GEN3_32BIT	(HOST_MODE_GEN3_WMODE | HOST_MODE_GEN3_BUSWIDTH)
> +#define HOST_MODE_GEN3_64BIT	0
>  
>  #define SDHI_VER_GEN2_SDR50	0x490c
>  #define SDHI_VER_RZ_A1		0x820b
> @@ -60,26 +68,26 @@ static void renesas_sdhi_sdbuf_width(struct tmio_mmc_host *host, int width)
>  	 */
>  	switch (sd_ctrl_read16(host, CTL_VERSION)) {
>  	case SDHI_VER_GEN2_SDR50:
> -		val = (width == 32) ? 0x0001 : 0x0000;
> +		val = (width == 32) ? HOST_MODE_GEN2_SDR50_WMODE : 0;
>  		break;
>  	case SDHI_VER_GEN2_SDR104:
> -		val = (width == 32) ? 0x0000 : 0x0001;
> +		val = (width == 32) ? 0 : HOST_MODE_GEN2_SDR104_WMODE;
>  		break;
>  	case SDHI_VER_GEN3_SD:
>  	case SDHI_VER_GEN3_SDMMC:
>  		if (width == 64)
> -			val = 0x0000;
> +			val = HOST_MODE_GEN3_64BIT;
>  		else if (width == 32)
> -			val = 0x0101;
> +			val = HOST_MODE_GEN3_32BIT;
>  		else
> -			val = 0x0001;
> +			val = HOST_MODE_GEN3_16BIT;
>  		break;
>  	default:
>  		/* nothing to do */
>  		return;
>  	}
>  
> -	sd_ctrl_write16(host, HOST_MODE, val);
> +	sd_ctrl_write16(host, CTL_HOST_MODE, val);
>  }
>  
>  static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
> @@ -795,7 +803,7 @@ static int renesas_sdhi_write16_hook(struct tmio_mmc_host *host, int addr)
>  	case CTL_SD_MEM_CARD_OPT:
>  	case CTL_TRANSACTION_CTL:
>  	case CTL_DMA_ENABLE:
> -	case HOST_MODE:
> +	case CTL_HOST_MODE:
>  		if (host->pdata->flags & TMIO_MMC_HAVE_CBSY)
>  			bit = TMIO_STAT_CMD_BUSY;
>  		fallthrough;
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas Söderlund
