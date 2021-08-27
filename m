Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046A63F95D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Aug 2021 10:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbhH0IQ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Aug 2021 04:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbhH0IQ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Aug 2021 04:16:28 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB903C061757
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Aug 2021 01:15:39 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s3so10002267ljp.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Aug 2021 01:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yE/6cHrz2GsIrcoII5x86dNAFXCySSia1GYGzvhwKB4=;
        b=Yz/QN2fZpQXDG30u9GlatafGXiX1eA/O37cUwovm6gIHimEwazYluv/TUo7OXjK6Co
         n01qah9jeZwor03hg6ZuCFxJ/zzq25pQUis9e5b45403D/9P6Y8owFJOVKVM4VjxmSWs
         fKMUaRnBu31iqKpLvzlRiKYlYtDDPA5AXSrulRnH2Q//9N/W6mvTl5d3Aw5Cpwh4t4Yr
         rfpUhnNvWH1PqibBcCMScYz5nWu1AuR/l6k4Ab/2r8zhZuK4hbByPDiuCTS7mtz8FTmE
         UcjbVpIAwPPCcYsQxUGmMLJdvE1Fa/OuVHlO/i4cUwi0hbVJGjYqUfOylnEOptcjEd/N
         ij0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yE/6cHrz2GsIrcoII5x86dNAFXCySSia1GYGzvhwKB4=;
        b=Zx+RAIyxpfmhD2xyAwd6Ms9EndmPS4Bk3VtwnMB87WrhpSuYrczay6gCy2HYXTRaUK
         xvYiLEEDPNZub6X4DiUxUA9A1vaeUgg5AadJPlsWPYOjpsh1TV+CU5w5Wn665NErU0q2
         lVPLKpOzKOKFYfM8/QNuUQvb+LIkgM2XKRaiK61pIQPhpNuxb8M7aTfR7tKX7kCEzQy4
         dalYx03oL88hTdpCjMYghj+NKtvixwDijwnDPVm9DGnrEojRzE9EzF/yOg98dO3vCUFG
         GxnE2UWbmHNHS215/svnmb2S4FD9k5D0ycohuXFbBSUSjem71uqSSlgQCal2xlceyOEn
         Eksw==
X-Gm-Message-State: AOAM531ap9/62aDiwE7Civ4mBZ+CAmzWUjtyLbY9/8apybiEUzehY6Pq
        JwOWVYeF1pK5ENuOtZR4J7uXMRMsDnN/qg==
X-Google-Smtp-Source: ABdhPJzTHXSSqfe+NTDY0LxW2MDXjXsLFiDR82X1aCyBaaLOPm0E1fHI/ZZ6RHvj4L69ITV4oVY4IQ==
X-Received: by 2002:a2e:9953:: with SMTP id r19mr6710975ljj.270.1630052138275;
        Fri, 27 Aug 2021 01:15:38 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id p18sm530220lfr.12.2021.08.27.01.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 01:15:37 -0700 (PDT)
Date:   Fri, 27 Aug 2021 10:15:37 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77961: Add TPU device node
Message-ID: <YSifKeymLvYCcbyv@oden.dyn.berto.se>
References: <20210827073819.29992-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210827073819.29992-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2021-08-27 09:38:19 +0200, Wolfram Sang wrote:
> Add the missing TPU node for the R-Car M3-W+ SoC.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> When I wanted to enable TPU on M3-N for some testing, building M3-W+
> DTBs failed due to this missing.
> 
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index 91b501e0121e..22da1c0436be 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -1367,6 +1367,17 @@ scif5: serial@e6f30000 {
>  			status = "disabled";
>  		};
>  
> +		tpu: pwm@e6e80000 {
> +			compatible = "renesas,tpu-r8a77961", "renesas,tpu";
> +			reg = <0 0xe6e80000 0 0x148>;
> +			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 304>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 304>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		msiof0: spi@e6e90000 {
>  			compatible = "renesas,msiof-r8a77961",
>  				     "renesas,rcar-gen3-msiof";
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund
