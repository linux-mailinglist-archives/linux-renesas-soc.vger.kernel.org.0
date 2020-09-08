Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1664D261CBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 21:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbgIHTZo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 15:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731076AbgIHQAj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 12:00:39 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD2AC0612F6
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2020 08:24:20 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id r24so1661616ljm.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2020 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0slGM3+BtCMgZjKNZb6MUZdPEoVjx0bEKge0FUahQT8=;
        b=Vi3MWJGf/a6vH7y1d5TtuyTnAHQbusiEhwf7I0wIl2k42GFwDJx5VTdrWvhsll5hfd
         s6LDJGZIUwwZgWOb3vs6Z1G4Fp3VZEY5NiMEvtOpgxDAn/4QtCKzsC7Rei8wu4DwvZ5A
         MzYKYBuFDF9mRkG1r4GbrMwI4JxU+N2AkMPYyK+Ep0RQJ5cUB0ydVe1meHAsb0F0eBpn
         MT+r7Ld5SC2VyEYvgUy00asetcsZedJ55Jf0btn0GFRrZ1mrGATxd+jgVjKERb0hCtrF
         EDPhoBbgzwYS2MvyEgXpyXAw6uiyOCYIuWCFd+ojpdtiLvdLgusGL4gT5H8uRp4qazp2
         OJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0slGM3+BtCMgZjKNZb6MUZdPEoVjx0bEKge0FUahQT8=;
        b=KDRBODq9R21wnslQ2Xj7qUokdM2xf3f/64WBtjfGNqpo816xVrMjwmtRWy6gIWWgVr
         pcBqcyluYeyQ4o1n25a/WkRkmdCnS43j0JlDGVv9yYVYXWMPPUukBOsDwMIwDaJ8eSkD
         y1yp2mrmfSWvL+Zng/09RPr6Of338qzutM0aHY9twK7x2LTHfv1oVhzr8fyhGRg+7oP+
         AhezQqckBMlFgbim7NxOrWagvyMC7+NJwrlGbaWF8bDB84CjWn71OH1JOjimLEle+Rwb
         fvl6XJdocKp0Ed1KPhQOj1qeBDpyFV46NTUjm1Skfer6H1v9QnqP4u7rYbjPgOfGS+oB
         nOgQ==
X-Gm-Message-State: AOAM532auMN4TiHFoRA4rMiWXrMI6D570HXYCNpeB7w6RctbPNOdGMSA
        fnuDgGgnIgis1Z6Ym85xnmY3TQ==
X-Google-Smtp-Source: ABdhPJy2o7S+OqLyzWdKvjsBTPrqHMSajqGGhg9IKe0/sfT3U0z/qCTkw+G2zqDyw6DoW1CWMW3XFw==
X-Received: by 2002:a2e:8541:: with SMTP id u1mr14118617ljj.101.1599578659137;
        Tue, 08 Sep 2020 08:24:19 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id e17sm10462605ljg.85.2020.09.08.08.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 08:24:18 -0700 (PDT)
Date:   Tue, 8 Sep 2020 17:24:18 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Make
 rcar_gen2_{timer_init,reserve}() static
Message-ID: <20200908152418.GB2984648@oden.dyn.berto.se>
References: <20200908074403.4379-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200908074403.4379-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2020-09-08 09:44:03 +0200, Geert Uytterhoeven wrote:
> As of commit 1e90fea35b80cfe1 ("ARM: shmobile: r8a7791: Use common R-Car
> Gen2 machine definition"), there are no more users of
> rcar_gen2_timer_init() and rcar_gen2_reserve() outside
> arch/arm/mach-shmobile/setup-rcar-gen2.c.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.10.
> 
>  arch/arm/mach-shmobile/rcar-gen2.h       | 2 --
>  arch/arm/mach-shmobile/setup-rcar-gen2.c | 4 ++--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-shmobile/rcar-gen2.h b/arch/arm/mach-shmobile/rcar-gen2.h
> index 4777fff2de413b7e..af9dbd6aa49e4d30 100644
> --- a/arch/arm/mach-shmobile/rcar-gen2.h
> +++ b/arch/arm/mach-shmobile/rcar-gen2.h
> @@ -2,8 +2,6 @@
>  #ifndef __ASM_RCAR_GEN2_H__
>  #define __ASM_RCAR_GEN2_H__
>  
> -void rcar_gen2_timer_init(void);
> -void rcar_gen2_reserve(void);
>  void rcar_gen2_pm_init(void);
>  
>  #endif /* __ASM_RCAR_GEN2_H__ */
> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> index fa1b00547d164b42..287dcbdb20de493a 100644
> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> @@ -61,7 +61,7 @@ static unsigned int __init get_extal_freq(void)
>  #define CNTCR 0
>  #define CNTFID0 0x20
>  
> -void __init rcar_gen2_timer_init(void)
> +static void __init rcar_gen2_timer_init(void)
>  {
>  	bool need_update = true;
>  	void __iomem *base;
> @@ -193,7 +193,7 @@ static int __init rcar_gen2_scan_mem(unsigned long node, const char *uname,
>  	return 0;
>  }
>  
> -void __init rcar_gen2_reserve(void)
> +static void __init rcar_gen2_reserve(void)
>  {
>  	struct memory_reserve_config mrc;
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
