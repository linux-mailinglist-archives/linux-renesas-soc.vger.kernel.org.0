Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B84300C5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 20:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbhAVTTp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 14:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730693AbhAVTEg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 14:04:36 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9565FC061794
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 11:04:21 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 3so7757769ljc.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 11:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=08Tn5lCUJ6Iz2tMbehBtMPt+99RTMVsRIA35ECAgydo=;
        b=VdBSh+Iqudf+ukewNuc/FInQbMko7m67WGT/MwLJ9OHWRzDagNAtqa8CCYyyu4a56Q
         QKdfaWl2L2pbjX5NkwL6irssYG1gcoF6S76AY0W2YwkmbUK1K2ph19zX7fGGYRa141Xs
         iGON8mbDlHzvGGhhGo/JS8vUMyayj8JFuUUMvr9f9VAwbgZSXvuihHZgI4ZJ/O8ax1Rk
         IqSXVBjJ2FFHCOzK63y+766BodZDWbT/RvSmnDEmhG4Xf9FM8HwXuzlaOjbew2MU/kRj
         aLMvFaXwTzdtUOdSCg3KREI/egRYDygjiI4NPo1ud7+GuRM0r2tHNHk2CkoY82FHqQ5g
         cBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=08Tn5lCUJ6Iz2tMbehBtMPt+99RTMVsRIA35ECAgydo=;
        b=ghVZVMIRHJWl/hSJDwim07zNIfE55jxd7CYJuPjs5nwFqJY1ui2BOKX5zB2V5HYccA
         e6U9g6YXl4Hhq/8DHTYTe+UdWvjVE1CSUAxT1FINwqjHm9h2qXzElCBAERRZwZk5wQaZ
         O++NgtbSG/9JMmJnTkPxPcurGVkAl9uFMiBDJRCmmagujRB0YrhnzAR9mFCFl77PLwfb
         YlojApQFCXkshCl/nMRLeYJIhOCsdbeeZMPiKeIbjW8cRnhkyZryvefCs+ADF5OnkPHz
         oUKM+u0Rs013ieDJcK6DOluX5iaq61CqrVKqEaR2GSdJKixMkBUtlOX+KehWTEp7Slu1
         1r3w==
X-Gm-Message-State: AOAM530Rhx7PeVDd+e2ZGE0uKRLlAdNjredz8E8si78uyLLBZOmfJ3rV
        Uq6xr1okG69djRnlNv0HB/hf3A==
X-Google-Smtp-Source: ABdhPJxPBPyE7cb3HggAbIywHvYQb0WG5M6V4K+x8T6SwxrOqeM2Wvnei6Nem9seSgO44yXf6izKAQ==
X-Received: by 2002:a2e:b538:: with SMTP id z24mr1008446ljm.478.1611342260158;
        Fri, 22 Jan 2021 11:04:20 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id l28sm980551lfk.25.2021.01.22.11.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 11:04:18 -0800 (PST)
Date:   Fri, 22 Jan 2021 20:04:17 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Use readl_poll_timeout_atomic()
Message-ID: <YAshsZKxlmjjKJTH@oden.dyn.berto.se>
References: <20210122113637.2833489-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210122113637.2833489-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2021-01-22 12:36:37 +0100, Geert Uytterhoeven wrote:
> Replace the open-coded polling loops by calls to the
> readl_poll_timeout_atomic() helper macro.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/soc/renesas/rcar-sysc.c | 33 ++++++++++++++-------------------
>  1 file changed, 14 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
> index a00bb098e1fe7488..4ff2671a699a4a3b 100644
> --- a/drivers/soc/renesas/rcar-sysc.c
> +++ b/drivers/soc/renesas/rcar-sysc.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/soc/renesas/rcar-sysc.h>
>  
>  #include "rcar-sysc.h"
> @@ -44,13 +45,13 @@
>  #define PWRER_OFFS		0x14	/* Power Shutoff/Resume Error */
>  
>  
> -#define SYSCSR_RETRIES		100
> +#define SYSCSR_TIMEOUT		100
>  #define SYSCSR_DELAY_US		1
>  
>  #define PWRER_RETRIES		100
>  #define PWRER_DELAY_US		1
>  
> -#define SYSCISR_RETRIES		1000
> +#define SYSCISR_TIMEOUT		1000
>  #define SYSCISR_DELAY_US	1
>  
>  #define RCAR_PD_ALWAYS_ON	32	/* Always-on power area */
> @@ -68,7 +69,8 @@ static u32 rcar_sysc_extmask_offs, rcar_sysc_extmask_val;
>  static int rcar_sysc_pwr_on_off(const struct rcar_sysc_ch *sysc_ch, bool on)
>  {
>  	unsigned int sr_bit, reg_offs;
> -	int k;
> +	u32 val;
> +	int ret;
>  
>  	if (on) {
>  		sr_bit = SYSCSR_PONENB;
> @@ -79,13 +81,10 @@ static int rcar_sysc_pwr_on_off(const struct rcar_sysc_ch *sysc_ch, bool on)
>  	}
>  
>  	/* Wait until SYSC is ready to accept a power request */
> -	for (k = 0; k < SYSCSR_RETRIES; k++) {
> -		if (ioread32(rcar_sysc_base + SYSCSR) & BIT(sr_bit))
> -			break;
> -		udelay(SYSCSR_DELAY_US);
> -	}
> -
> -	if (k == SYSCSR_RETRIES)
> +	ret = readl_poll_timeout_atomic(rcar_sysc_base + SYSCSR, val,
> +					val & BIT(sr_bit), SYSCSR_DELAY_US,
> +					SYSCSR_TIMEOUT);
> +	if (ret)
>  		return -EAGAIN;
>  
>  	/* Submit power shutoff or power resume request */
> @@ -101,8 +100,7 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
>  	unsigned int chan_mask = BIT(sysc_ch->chan_bit);
>  	unsigned int status;
>  	unsigned long flags;
> -	int ret = 0;
> -	int k;
> +	int k, ret;

nit: I would make k an unsigned as it's now only used in incremental 
loops starting at 0.

With or without this unrelated nit,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>  
>  	spin_lock_irqsave(&rcar_sysc_lock, flags);
>  
> @@ -145,13 +143,10 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
>  	}
>  
>  	/* Wait until the power shutoff or resume request has completed * */
> -	for (k = 0; k < SYSCISR_RETRIES; k++) {
> -		if (ioread32(rcar_sysc_base + SYSCISR) & isr_mask)
> -			break;
> -		udelay(SYSCISR_DELAY_US);
> -	}
> -
> -	if (k == SYSCISR_RETRIES)
> +	ret = readl_poll_timeout_atomic(rcar_sysc_base + SYSCISR, status,
> +					status & isr_mask, SYSCISR_DELAY_US,
> +					SYSCISR_TIMEOUT);
> +	if (ret)
>  		ret = -EIO;
>  
>  	iowrite32(isr_mask, rcar_sysc_base + SYSCISCR);
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
