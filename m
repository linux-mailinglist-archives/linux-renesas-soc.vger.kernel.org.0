Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999793ACF61
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 17:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbhFRPrt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 11:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhFRPrs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 11:47:48 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4A7C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 08:45:39 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p7so17326497lfg.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hI/AIoMYcsbWwQZzlxldm/7Wor5CVzpcwkOGpLBOXqU=;
        b=YY/DCc4m6+1gq+Hqf9irgXlg5qtJ8Yf8SsiZOCB0mj/I+L4qUUSf2tmy3TdV2bljtI
         02tfXLX+so0O5yT7sF94FBSDl3tu/Elkc+wqCZS86z+XFFoQKenuNMO/NH8c0Klrtbly
         18tZQQAeBF3MPA1HSYcWaU1HGfgMOgLphs2ISwYjt+yVawhDIA7mlt2X8hN7gr/XPpyN
         VZaNf41A16fEFiQLVEKY4wn67w0nNzS3do5F+BJTcSa7VXLMTj0Omsl5YJSYiXhggBs1
         xlBn7eycWIes/A+FLXkJNaV9MQ7V1v58Z2MKah70cqJaT3hGCCsSGLH5e9Q38Chrq/0P
         lKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hI/AIoMYcsbWwQZzlxldm/7Wor5CVzpcwkOGpLBOXqU=;
        b=qbFdfbqR2sCnB47HC4t5g66q9F0/MXmD16UM3hPj0/Sbek+xqMLjt8p0ZJMVlOL1cn
         AyliR6hLciwQOvMayEIjzVicxSnO0LFojaI+oeMOL3IvNWLZwiASUvHBDUwLy1aYL9by
         bB6eaB9z0VaE58l7oSxm1hgpJgRlfHIWe9TPDXwTbzY0gsBzj+SCSgAEHWMMdHKZRXHB
         fiviP7LG30XI0YNwKNSPKBMspy44gUdMn/NZlPjQYDARWvPiPRlnwJCT8tRc3oy0CvV7
         H2wgH5gxwAb5nJQ7M/dReAdtcZBOCSQxZr0sjDuDqi6E9fAHuLtD5oqjyyy/vmPyzgAD
         kjlQ==
X-Gm-Message-State: AOAM530VvoSTWpe7yKIPMl5LrdTeHNfkKfi2fNllvAzWG8pdvpSjnReZ
        wxfw58bhidk9/4abcILsDWjUcI8ZJ7q2Eg==
X-Google-Smtp-Source: ABdhPJwympTU/v9gIC9U5a9SwnuXEXhipI4asCeO727dmg/hkmtIwUjyi0O1M47iXn3dNMACuQaUNg==
X-Received: by 2002:ac2:4c0e:: with SMTP id t14mr3655362lfq.555.1624031137578;
        Fri, 18 Jun 2021 08:45:37 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id q17sm1093857ljp.3.2021.06.18.08.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 08:45:36 -0700 (PDT)
Date:   Fri, 18 Jun 2021 17:45:35 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rzg2: Rename i2c-dvfs to iic-pmic
Message-ID: <YMy/n4Vo5B/viefi@oden.dyn.berto.se>
References: <3e549b41989ff2797b998a1c749c9f607845f44a.1624016693.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e549b41989ff2797b998a1c749c9f607845f44a.1624016693.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-06-18 13:46:21 +0200, Geert Uytterhoeven wrote:
> As RZ/G2 SoCs do not support DVFS, the "iic-dvfs" module was renamed to
> "iic-pmic" in the RZ/G Series, 2nd Generation User’s Manual: Hardware
> Rev. 1.00.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-clk for v5.15.
> 
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a774b1-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a774e1-cpg-mssr.c | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> index 4a43ebec7d5e297e..39b185d8e95745f4 100644
> --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> @@ -210,7 +210,7 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
>  	DEF_MOD("rpc-if",		 917,	R8A774A1_CLK_RPCD2),
>  	DEF_MOD("i2c6",			 918,	R8A774A1_CLK_S0D6),
>  	DEF_MOD("i2c5",			 919,	R8A774A1_CLK_S0D6),
> -	DEF_MOD("i2c-dvfs",		 926,	R8A774A1_CLK_CP),
> +	DEF_MOD("iic-pmic",		 926,	R8A774A1_CLK_CP),
>  	DEF_MOD("i2c4",			 927,	R8A774A1_CLK_S0D6),
>  	DEF_MOD("i2c3",			 928,	R8A774A1_CLK_S0D6),
>  	DEF_MOD("i2c2",			 929,	R8A774A1_CLK_S3D2),
> diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
> index 6f04c40fe237a255..af602d83c8ceeb91 100644
> --- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
> @@ -206,7 +206,7 @@ static const struct mssr_mod_clk r8a774b1_mod_clks[] __initconst = {
>  	DEF_MOD("rpc-if",		 917,	R8A774B1_CLK_RPCD2),
>  	DEF_MOD("i2c6",			 918,	R8A774B1_CLK_S0D6),
>  	DEF_MOD("i2c5",			 919,	R8A774B1_CLK_S0D6),
> -	DEF_MOD("i2c-dvfs",		 926,	R8A774B1_CLK_CP),
> +	DEF_MOD("iic-pmic",		 926,	R8A774B1_CLK_CP),
>  	DEF_MOD("i2c4",			 927,	R8A774B1_CLK_S0D6),
>  	DEF_MOD("i2c3",			 928,	R8A774B1_CLK_S0D6),
>  	DEF_MOD("i2c2",			 929,	R8A774B1_CLK_S3D2),
> diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> index ed3a2cf0e0bb26d2..5b938eb2df255afb 100644
> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> @@ -210,7 +210,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
>  	DEF_MOD("rpc-if",		 917,	R8A774C0_CLK_RPCD2),
>  	DEF_MOD("i2c6",			 918,	R8A774C0_CLK_S3D2),
>  	DEF_MOD("i2c5",			 919,	R8A774C0_CLK_S3D2),
> -	DEF_MOD("i2c-dvfs",		 926,	R8A774C0_CLK_CP),
> +	DEF_MOD("iic-pmic",		 926,	R8A774C0_CLK_CP),
>  	DEF_MOD("i2c4",			 927,	R8A774C0_CLK_S3D2),
>  	DEF_MOD("i2c3",			 928,	R8A774C0_CLK_S3D2),
>  	DEF_MOD("i2c2",			 929,	R8A774C0_CLK_S3D2),
> diff --git a/drivers/clk/renesas/r8a774e1-cpg-mssr.c b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
> index b96c486abb448003..40c71466df37bd96 100644
> --- a/drivers/clk/renesas/r8a774e1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
> @@ -219,7 +219,7 @@ static const struct mssr_mod_clk r8a774e1_mod_clks[] __initconst = {
>  	DEF_MOD("i2c6",			 918,	R8A774E1_CLK_S0D6),
>  	DEF_MOD("i2c5",			 919,	R8A774E1_CLK_S0D6),
>  	DEF_MOD("adg",			 922,	R8A774E1_CLK_S0D1),
> -	DEF_MOD("i2c-dvfs",		 926,	R8A774E1_CLK_CP),
> +	DEF_MOD("iic-pmic",		 926,	R8A774E1_CLK_CP),
>  	DEF_MOD("i2c4",			 927,	R8A774E1_CLK_S0D6),
>  	DEF_MOD("i2c3",			 928,	R8A774E1_CLK_S0D6),
>  	DEF_MOD("i2c2",			 929,	R8A774E1_CLK_S3D2),
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
