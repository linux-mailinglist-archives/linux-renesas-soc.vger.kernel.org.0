Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 748302B0664
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Nov 2020 14:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgKLNZB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Nov 2020 08:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbgKLNZB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 08:25:01 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096B4C0613D4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2020 05:25:00 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id y16so6143268ljk.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2020 05:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nKUou+uG+uNSWzIJKtZPppeQ0wVvm4JaNlwgSgYxeLQ=;
        b=IAPe+SxZsTdCfHIwxUrBBAvhFj/okyjg+fxB9yzmYiXjm6FfkywzQVvLw8sh1GrMlP
         CcNCC+H71b2BQxwtcpVzRkjgDx/PkL/GUI+Bd4dAXxiSeyL5IxAKEEd26nj09ZuqsXJw
         2Z0SuMRu3dxtV3gFQ7e2LQ4xF8VRjdLVR1cYh3MxErlC/3xXBs7WEMGZuxY15dON/yBF
         1vKK4HaA3ZSJMawXH8OpR2d/2QtCchc01HI2kSQK26SPNs/Fjv138GvWppwHE6+7jcHn
         jyRpDNRVp2csdnB5M0lX+G4Qo8SwjAfSSaCiKFMDLNNlBOX04SrHTqzcjBmXe9cg0V51
         BKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nKUou+uG+uNSWzIJKtZPppeQ0wVvm4JaNlwgSgYxeLQ=;
        b=DtUuak3V9lXdknsnTVGmMkJoIUUxmUp1Nytsm3J2LKHhujgROpd8DPQEp2V9PbfPCr
         9yUGqAWt5Bq+uDmCebIDhnXAce8T1HpIX1dzg86AOOQiMbSE3fRksCtBGiPcvdnTnYZ4
         zWnpkrOcJFNffNS4TAGMFl1Y1x5ehhTNFsr6usawVmcZl5d8RXD0E+ppwp25gCFzm7SW
         fxwYLL4Ljn3rSqxOXOVAH/V4g+0NRNi0+cqOgdjk63Tumq+W85CATmKbZT5tge3zVXuX
         luVypa+wYxqGMFRlZDOoKKZacKI6+1ps+fiX/tFlBMV94ns903aPnYfuBoKoreYY4iXi
         nACA==
X-Gm-Message-State: AOAM532Jrt5sR3YNpbXegZABkGOyWpd6zis1y66I48Ya3/uE6SuzunVp
        dplARO25AVKz3CrOpPK1ai+H5g==
X-Google-Smtp-Source: ABdhPJy/GVGOabsGsorsQRu/TrNeqs7g/8D1tlLuufxqkQw8wrt2sUVPE8+A6RJbMhMwTymbCwxAVA==
X-Received: by 2002:a2e:9109:: with SMTP id m9mr4582490ljg.123.1605187498412;
        Thu, 12 Nov 2020 05:24:58 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id l26sm562335lfp.26.2020.11.12.05.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 05:24:57 -0800 (PST)
Date:   Thu, 12 Nov 2020 14:24:56 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 3/3] mmc: renesas_sdhi: sort includes
Message-ID: <20201112132456.GD1491229@oden.dyn.berto.se>
References: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
 <20201111100244.15823-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201111100244.15823-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2020-11-11 11:02:44 +0100, Wolfram Sang wrote:
> Better prevent double includes.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 55633826d38c..bb937411c2ec 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -18,22 +18,22 @@
>   *
>   */
>  
> -#include <linux/kernel.h>
>  #include <linux/clk.h>
> -#include <linux/slab.h>
> -#include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/platform_device.h>
> -#include <linux/pm_domain.h>
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/tmio.h>
>  #include <linux/mmc/host.h>
>  #include <linux/mmc/mmc.h>
>  #include <linux/mmc/slot-gpio.h>
> -#include <linux/mfd/tmio.h>
> -#include <linux/sh_dma.h>
> -#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pinctrl/pinctrl-state.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/sh_dma.h>
> +#include <linux/slab.h>
>  #include <linux/sys_soc.h>
>  
>  #include "renesas_sdhi.h"
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas Söderlund
