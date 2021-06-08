Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C89A3A06E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 00:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhFHWeI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 18:34:08 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:34393 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234433AbhFHWeG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 18:34:06 -0400
Received: by mail-lf1-f51.google.com with SMTP id f30so34659439lfj.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Jun 2021 15:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UYRw3owNGZ7yXIufrsTco2qMHJSkJeiSebs7Ed1fCIY=;
        b=jVS5iUC4TwnxwtycdLPxsupy7lrrqSdZ8dl/2LRXmw0Qm5Lc+ZuB1sgopQxzwm2n2V
         4+iGGBktdILEjc0Y2gI01igztUonUu5IhgcAieXkBvZlfQtL+unQlloZSvWF1QMYTL0V
         Su60ygja0LiHCrcmmHwUdpzYjyPknFbHSBbdN+ScpWhd/CGtcSYoBvpdL+QI3+G5V42p
         gLrXfSYAli8xMJX6spr2tJ2zFTroVGY2px2aNYGgkZMIlyqM2A3yIwdzJur9dwxBEUX6
         KZwqAff3liwzonsrmW6eh90un9KdnPI7GPQko6z9pEJ6EtpgaK5VfDNqAJ/01hMeKbkV
         ul7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UYRw3owNGZ7yXIufrsTco2qMHJSkJeiSebs7Ed1fCIY=;
        b=nB9qe/mCqW3caKwQF9K5MoFova5AKooSkkx+mAUXIHhxzJhteXysEA3xeG1ZvCLmoQ
         ZaKM9gDf52d5AGqipg5lB6wp9IeIn9T1SciS0rAzpEdN0R+j9VInJDFYKBuPbNPK7sK0
         iGoCoKzy9WMaMD034JdGpO8ikgcw4SKw3U38vL4cCMB17i2+LbrOezFBlNCr9pv1RHxw
         owc/CtqVwPo21NqBlZyziKRuaaLmUJ7XDSz2cNGDv5AaVrlKpXafNElpvTJV1sd2HH/1
         Yrtc22RjtBUpRGMtTihwDon1WlejGjf+6NYofqAHZLLqw6XYSxbe6yHPB6BK8vOaYBsY
         NILw==
X-Gm-Message-State: AOAM531/sHiL9cTMH8Z1UHNbvATblib+CrPajaIhmthTUDD5MmEa6Ggp
        UW+UYKeBiQ5yO2ULs+9EDAMgVB6p2Pu7+A==
X-Google-Smtp-Source: ABdhPJwnjYrZU4zfpthrOOBL/dWDjYvFcPiNA8tgx7ry+4S4FVrNeJFEDIdXGMFC85gjVzi0kzrq7Q==
X-Received: by 2002:a05:6512:2148:: with SMTP id s8mr17040559lfr.117.1623191457555;
        Tue, 08 Jun 2021 15:30:57 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id y21sm113145lfk.191.2021.06.08.15.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:30:56 -0700 (PDT)
Date:   Wed, 9 Jun 2021 00:30:56 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] mmc: improve function name when aborting a tuning cmd
Message-ID: <YL/voNtxiqvoQYOS@oden.dyn.berto.se>
References: <20210608180620.40059-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210608180620.40059-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hallo Wolfram,

Thanks for your work.

On 2021-06-08 20:06:20 +0200, Wolfram Sang wrote:
> 'mmc_abort_tuning()' made me think tuning gets completely aborted.
> However, it sends only a STOP cmd to cancel the current tuning cmd.
> Tuning process may still continue after that. So, rename the function to
> 'mmc_send_abort_tuning()' to better reflect all this.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Ulf, here is the patch we discussed earlier today. Based on mmc/next.
> 
>  drivers/mmc/core/mmc_ops.c           | 4 ++--
>  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
>  drivers/mmc/host/sdhci.c             | 2 +-
>  include/linux/mmc/host.h             | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
> index 3c58f6d0f482..973756ed4016 100644
> --- a/drivers/mmc/core/mmc_ops.c
> +++ b/drivers/mmc/core/mmc_ops.c
> @@ -700,7 +700,7 @@ int mmc_send_tuning(struct mmc_host *host, u32 opcode, int *cmd_error)
>  }
>  EXPORT_SYMBOL_GPL(mmc_send_tuning);
>  
> -int mmc_abort_tuning(struct mmc_host *host, u32 opcode)
> +int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode)
>  {
>  	struct mmc_command cmd = {};
>  
> @@ -723,7 +723,7 @@ int mmc_abort_tuning(struct mmc_host *host, u32 opcode)
>  
>  	return mmc_wait_for_cmd(host, &cmd, 0);
>  }
> -EXPORT_SYMBOL_GPL(mmc_abort_tuning);
> +EXPORT_SYMBOL_GPL(mmc_send_abort_tuning);
>  
>  static int
>  mmc_send_bus_test(struct mmc_card *card, struct mmc_host *host, u8 opcode,
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index baab4c2e1b53..e49ca0f7fe9a 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -704,7 +704,7 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  			set_bit(i, priv->smpcmp);
>  
>  		if (cmd_error)
> -			mmc_abort_tuning(mmc, opcode);
> +			mmc_send_abort_tuning(mmc, opcode);
>  	}
>  
>  	ret = renesas_sdhi_select_tuning(host);
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index bf238ade1602..6aaf5c3ce34c 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -2680,7 +2680,7 @@ void sdhci_abort_tuning(struct sdhci_host *host, u32 opcode)
>  
>  	sdhci_end_tuning(host);
>  
> -	mmc_abort_tuning(host->mmc, opcode);
> +	mmc_send_abort_tuning(host->mmc, opcode);
>  }
>  EXPORT_SYMBOL_GPL(sdhci_abort_tuning);
>  
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index c7e7b43600e9..0abd47e9ef9b 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -632,6 +632,6 @@ static inline enum dma_data_direction mmc_get_dma_dir(struct mmc_data *data)
>  }
>  
>  int mmc_send_tuning(struct mmc_host *host, u32 opcode, int *cmd_error);
> -int mmc_abort_tuning(struct mmc_host *host, u32 opcode);
> +int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode);
>  
>  #endif /* LINUX_MMC_HOST_H */
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund
