Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3356D15C894
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2020 17:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgBMQuf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Feb 2020 11:50:35 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38398 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727752AbgBMQuf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 11:50:35 -0500
Received: by mail-lf1-f65.google.com with SMTP id r14so4745717lfm.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Feb 2020 08:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=26IuXblNUPUMTuLYVittiS6yYr2/ijrythYez9MUgNo=;
        b=W+N1DTMBKrfmnXYTYJYFqlI8HmI7RIV5z9oR5f4ocrUX/eMdhWJCR7o/Isu91WDtrR
         y0Ue3lXE9/ugpqTtEVG5CqIoFr9hYUQlY6wDjEaU10t96agZRAhKe9JPZjUggaKrONu4
         p+STLE3y6MojG6drkSCNncjlVBmI02onHG70BHUDW1jVUaXzesdVw94yI/c1FdgpDHBm
         EiyvmhpYj9ucClQS29Zd80w5bIZIbRPYH7SXu0Mo9GYkmRsQ5Z5co0t3BDrQ04ZfLxmN
         bvNC9Hy8VPJINe9aCRtzo9Uj3docEO0Hfj8+e1pDdSokjRSd6xvFZfcoZE2ZpHu0TyAf
         JCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=26IuXblNUPUMTuLYVittiS6yYr2/ijrythYez9MUgNo=;
        b=VHDouoGz4UgPFKSRLHSvYO9c11oAa5ovYE5f9ywAzvifosvxzUIrmto9KPVgRAjHFn
         XRC7PDLJSGjbQ9KKP6KIYiEz1ZS1csW8vXsE5qIFCctiAOy9xjAe8i6nrR90XwBhPDis
         avtZOBgfoIGHVAxnWf/q/72o/ocpNh5tvfQ4CEZyh0i7LtZ6d1lVxV2naC1Ol2zXU9//
         mGqzbdF8UwncFrmTJ8o6OaC+Mbjhu82sPCbARGPpWzv8B2IiKGFeA5MUIRD5aiSF+fXr
         2rsPM9ngH4cUPSYyKWnKrHO9vS0lXOjKji07AEfz9bcEt5UvW0E/2OwEVlSmwc9eZ6L4
         UIeg==
X-Gm-Message-State: APjAAAVfxlCsAheVWxRMZxhAW78kysY4ASscpn+AM2+EF5zUUqAaoTP1
        E9B8fDP4qAhWXce1Y3zx/fxDUQ==
X-Google-Smtp-Source: APXvYqwOq6Bnde+Xr5/BS4w11mEMnbLDmGxAnaF9W1wbDck+NAhmykMeZEvS4Y8pZcnja40Kqqsf4Q==
X-Received: by 2002:a19:5e1d:: with SMTP id s29mr8101967lfb.21.1581612633139;
        Thu, 13 Feb 2020 08:50:33 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id r9sm1944288lfc.72.2020.02.13.08.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 08:50:32 -0800 (PST)
Date:   Thu, 13 Feb 2020 17:50:31 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: simplify execute_tuning
Message-ID: <20200213165031.GI3013231@oden.dyn.berto.se>
References: <20200213163715.8212-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200213163715.8212-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-02-13 17:37:15 +0100, Wolfram Sang wrote:
> After refactoring, 'ret' variable is superfluous. Remove it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

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
>  	struct renesas_sdhi *priv = host_to_priv(host);
> -	int i, ret;
> +	int i;
>  
>  	priv->tap_num = renesas_sdhi_init_tuning(host);
>  	if (!priv->tap_num)
> @@ -517,8 +517,7 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
>  		/* Set sampling clock position */
>  		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % priv->tap_num);
>  
> -		ret = mmc_send_tuning(host->mmc, opcode, NULL);
> -		if (ret == 0)
> +		if (mmc_send_tuning(host->mmc, opcode, NULL) == 0)
>  			set_bit(i, priv->taps);
>  	}
>  
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
