Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45D4414492
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 11:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234213AbhIVJML (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 05:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbhIVJMF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:05 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA80EC061574;
        Wed, 22 Sep 2021 02:10:35 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t10so9130783lfd.8;
        Wed, 22 Sep 2021 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S/YR+XRwyO3QADZhUdz5X4kkZ9xbXMRBTNajmncpK4U=;
        b=gc91weU0adqC0Nyv3tpavWWftPdxdadaWChvF7gt6iW+7Vn8fta0QuBHVaSopLl96g
         eoMUrx7AcPFh+mLGooymj/4u7TJwaQ1FPLVFNx9EBxOzym4tIxIMEgU6V51vQjPASdOZ
         zWRgBLYt4SVXu+RT5dsD5w8ghpm23bMYYux6JjDdaUz4cxQPpwAa9l5XXqJAQwO94w1t
         8xyxsjUb3hao5StjnjxD5GrO8hSnyR2no/pNyu5XEJvqYq2aGbILr37zuwAzKE9Jq615
         if0bSIYQI+A3MWpsiEJ181aw+4j8+dYAN8IrbfXTwZiMAhqHNiWJzUpBSnTWMPeMrerd
         DuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=S/YR+XRwyO3QADZhUdz5X4kkZ9xbXMRBTNajmncpK4U=;
        b=2n2eDXVyVaVR6mt+no4O1AixwWLr5A0jiVGgMAiMrMbr7rCmSGJaidXbDL1+NuCVqW
         0Gqn0TgbYPwYx0eJATqi/lEd/FTCnVUIwTYp36n+wykf4VFFnl08dG1q13s1fDv9G9//
         8GdJ/187Pzdutro6uLd8q7/vK9o2/1HyRM6zxhxdHj0TohFgNuPmFbiszXhOp7b0IMj9
         Qz5ZyNU1AIDGdUsj/TQyfJ6zNN/9m2vu0IOeufalU2r1D3GCFOUrB8a13nWJ2dTJqLnL
         wEn+bRv6vspskazXtje5qah/2vDjaZ2nTBbm+DH4mDUzZnzXo3/6tQAcP/8VPo/MgtLf
         57sw==
X-Gm-Message-State: AOAM533M4N/lKEoJXHLCY+ZQ125/kafI+hck61ljFNK14h/3yUQJRGb4
        i5BVOyBCJBpacGEZICC3QoI=
X-Google-Smtp-Source: ABdhPJwMnrv5n9XcAzOpivCCB78f95eIEm4/VdzFbHMXG95gkJ7v6iOl6s34lAAqqZ6XC7ZXksNJxw==
X-Received: by 2002:a2e:1659:: with SMTP id 25mr12832351ljw.217.1632301834206;
        Wed, 22 Sep 2021 02:10:34 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.79.80])
        by smtp.gmail.com with ESMTPSA id z8sm127224lfs.177.2021.09.22.02.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 02:10:33 -0700 (PDT)
Subject: Re: [PATCH 2/2] clk: renesas: rzg2l: Fix clk status function
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <20210922073834.21304-1-biju.das.jz@bp.renesas.com>
 <20210922073834.21304-2-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <38363f36-5da3-af67-c803-42b277a6f4ec@gmail.com>
Date:   Wed, 22 Sep 2021 12:10:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922073834.21304-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 22.09.2021 10:38, Biju Das wrote:

> As per RZ/G2L HW(Rev.0.50) manual, clock monitor register value
> 0 means clock is not supplied and 1 means clock is supplied.
> This patch fixes the issue by removing the inverted logic.
> 
> Fixing the above, triggered following 2 issues
> 
> 1) GIC interrupts don't work if we disable IA55_CLK and DMAC_ACLK.
>     Fixed this issue by adding these clocks as critical clocks.
> 
> 2) DMA is not working, since the DMA driver is not turning on DMAC_PCLK.
>     So will provide a fix in the DMA driver to turn on DMA_PCLK.
> 
> Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>   drivers/clk/renesas/rzg2l-cpg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 3b3b2c3347f3..3e32a858b852 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -391,7 +391,7 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
>   
>   	value = readl(priv->base + CLK_MON_R(clock->off));
>   
> -	return !(value & bitmask);
> +	return (value & bitmask);

    Parens not needed anymore...

[...]

MBR, Sergei
