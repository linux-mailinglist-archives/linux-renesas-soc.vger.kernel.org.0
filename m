Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1720A46D328
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 13:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbhLHMX5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 07:23:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233232AbhLHMX5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 07:23:57 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4B8C0617A1
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Dec 2021 04:20:25 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id a37so2501236ljq.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Dec 2021 04:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cxIhJxLH45f3paJwvO3rHF1VnfiXGcMj12zNmLMco38=;
        b=2vhabGUZOYSFdB90pMpxcPPCsyWSf05R+wNg9Is0AzhRA7xlZWr1sFZT5C9wZkSQO0
         dIUY4HATKEXat9kbLW3ZlaoJ4DL0vbul0zmDgjgHTLzM/nvzhwKEc+RJYR7VILcRZYjo
         g7AvLgH2798JqiCVcQjLAsYSqy8Tl8d7AnGN8SZ6NrqVQJBYRyrjCAPipYW40T7PCpow
         /jBevIE1ZT1NjnuCNqRcWTxU+nLa7Kfi05myozS/A1WyegZwKj0jdzGwB6bNTb3SephP
         jsCQIZ99IwZ+MU5s+jBg3RVQVlutWF6TUXsi29EPl0jREOabafq3ZSpLKHd49JfmKNRl
         4zPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cxIhJxLH45f3paJwvO3rHF1VnfiXGcMj12zNmLMco38=;
        b=xKHMXgSQtwhq0TKKDYdfLZthU5uAgidTXVhNDPMne4fJOKyqE+5zekb2bit1NhD60P
         JW4guAjUp7WenBvfCvai/XKVt/d5zdfbZC/dGwCqDNOfhOavtf/XIkgab/yNA0Q1fwJm
         dDLrHk+Szdx71t2Nr4k80okwk6DUQK6nhH/hKuGDJO1MHmd9GzOi9zhyeOP8m5IIcKqz
         Ki5LR026C8DWSJYbixpsxFowF7kOAPjFH4/Y+e+aU+RLUk7/YPvz7WJLiqq3tI44oAjW
         Fd5XhNdAJRQEEnuVrMG206urLr15oGmRU2WBCA0eC0E5Y6VwhRwJUEBiZHRVl3vJr3Zs
         srZA==
X-Gm-Message-State: AOAM533UNVj5suqiKLNb0jHY4I9Nl4CO2fLmKUSS8CHrFax+OvpTiVkk
        YMRDkFi9p/dU21S7gE0QUCpesA==
X-Google-Smtp-Source: ABdhPJzVPn2LMqqZTY7tri4yJxfa+HUF9BmoHhAPU9CirLglXWr/b0lKQtT/FKueM7/ZdE3CHiyU2w==
X-Received: by 2002:a2e:a28e:: with SMTP id k14mr4404242lja.488.1638966023694;
        Wed, 08 Dec 2021 04:20:23 -0800 (PST)
Received: from localhost (h-46-59-90-226.A463.priv.bahnhof.se. [46.59.90.226])
        by smtp.gmail.com with ESMTPSA id p10sm299115lja.0.2021.12.08.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 04:20:23 -0800 (PST)
Date:   Wed, 8 Dec 2021 13:20:22 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] sh_eth: Use dev_err_probe() helper
Message-ID: <YbCjBk0ibN1ga3Qm@oden.dyn.berto.se>
References: <2576cc15bdbb5be636640f491bcc087a334e2c02.1638959463.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2576cc15bdbb5be636640f491bcc087a334e2c02.1638959463.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work, I learnt something new.

On 2021-12-08 11:32:07 +0100, Geert Uytterhoeven wrote:

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> Use the dev_err_probe() helper, instead of open-coding the same
> operation.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/net/ethernet/renesas/sh_eth.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index 223626290ce0e278..d947a628e1663009 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -3368,8 +3368,7 @@ static int sh_eth_drv_probe(struct platform_device *pdev)
>  	/* MDIO bus init */
>  	ret = sh_mdio_init(mdp, pd);
>  	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "MDIO init failed: %d\n", ret);
> +		dev_err_probe(&pdev->dev, ret, "MDIO init failed\n");
>  		goto out_release;
>  	}
>  
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund
