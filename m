Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96262FABDB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 21:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388241AbhARUvV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 15:51:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394482AbhARUuw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 15:50:52 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA47C061575
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jan 2021 12:50:12 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id o13so25994352lfr.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jan 2021 12:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PBJOvjAiOhmMWsZCYIdfqOTw6TCWRMDqPYu2m3TOPyA=;
        b=ean573HMotYRkhpmfuWcuDU9xxWJXixSAnZTqXu+lzblvz5PPhlHX2pG1XMiWf9gj3
         mBUGsa4kUt2npW6Z4XPzvnHSMZYHpQgb5wcgp4Yg5JjOAGZxHpTEvLJvpDeIOS8NqdeR
         eFpMC0k5M26afcDq8GRIAe8bupmbEu4A6QEPJqqkwiOLCODzkh/kqjujK9wX6RWhiZX2
         01i+p7pl5juQwhpyh6JHgz79hTRQnB3AjfprNPJWjMUKpp/1tU1GwPHpVKlzdFZ7Xvau
         pRCXkkkz8c43spsSvOmaiTJ3IWDb6rZJFbJgDX9JihQviOn/TSY31zD9X+vS2gY53h6x
         dC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PBJOvjAiOhmMWsZCYIdfqOTw6TCWRMDqPYu2m3TOPyA=;
        b=htd25UNcPLfml73BQT2bvdH8LE+P4YA2KuwpauANQv0Le9fIRduhfgzmrSqad8b9bs
         hKe+FJV8xMURmXijP757Sxr1x1CM4Dt6bOP98lGGHsaN75Yx7BONxlc05coYJ8K/73/3
         NyZsl54qKQwaKSlwXiYjcIhyoplT57l99VsoJnoIar4Wc05XYm408095aVjbkAsMf5uz
         xP0vK1PoHF7cKC+8PGoUEUOTnBzB1hvA0cIrMKlKGF1FGjoagXY75j9n88yp2bMdC9kK
         R/CgKRmKt5jRvryhoL5z0BSRY5wzpkqcri9SSOyYmV5GTqjkRZhhZVcLvZUcO/bfKrbR
         CSIw==
X-Gm-Message-State: AOAM532YQF2Yotf5XXv3064f3/OAKQ6x+snGmko0THSVEoSY4a2/UKGl
        aDkqbjCgXi8Sg/+vdwsfuyT9pg==
X-Google-Smtp-Source: ABdhPJyRdBzbTcJLLjUIbNdqXAdPYYwTNEavwmm4K5yZC4JkSGTHPIGL1GSU4vGZxVQVmLM95ztrBQ==
X-Received: by 2002:a05:6512:3493:: with SMTP id v19mr374356lfr.569.1611003011132;
        Mon, 18 Jan 2021 12:50:11 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id k18sm1788227ljb.80.2021.01.18.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 12:50:10 -0800 (PST)
Date:   Mon, 18 Jan 2021 21:50:09 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh_eth: Fix power down vs. is_opened flag ordering
Message-ID: <YAX0gRahdHyZ8GwA@oden.dyn.berto.se>
References: <20210118150812.796791-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118150812.796791-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-01-18 16:08:12 +0100, Geert Uytterhoeven wrote:
> sh_eth_close() does a synchronous power down of the device before
> marking it closed.  Revert the order, to make sure the device is never
> marked opened while suspended.
> 
> While at it, use pm_runtime_put() instead of pm_runtime_put_sync(), as
> there is no reason to do a synchronous power down.
> 
> Fixes: 7fa2955ff70ce453 ("sh_eth: Fix sleeping function called from invalid context")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/sh_eth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index 9b52d350e21a9f2b..590b088bc4c7f3e2 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -2606,10 +2606,10 @@ static int sh_eth_close(struct net_device *ndev)
>  	/* Free all the skbuffs in the Rx queue and the DMA buffer. */
>  	sh_eth_ring_free(ndev);
>  
> -	pm_runtime_put_sync(&mdp->pdev->dev);
> -
>  	mdp->is_opened = 0;
>  
> +	pm_runtime_put(&mdp->pdev->dev);
> +
>  	return 0;
>  }
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
