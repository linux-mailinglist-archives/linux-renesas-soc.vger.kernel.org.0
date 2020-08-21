Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA4424DF4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 20:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgHUSS4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 14:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgHUSSy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 14:18:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF81C061573
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 11:18:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w14so2863282ljj.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 11:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uoR5hrkaKmJOEz2cwXfhbkk2C+6UoQr5PoKVBFcmbBM=;
        b=w1OTzT9P6FoPxG9cemFiimAFfBf5pMW45wzp9VKwhyGi5aiTCUdkTMYBkOcB80/Glb
         N4r4Ed02J/kb1uORHJlOEt+zSzmc2LTXo6kMGeAl9drq2mtY8MeQwK7MHE8fW4+GuGs2
         iVTZkaQQXiwt+2Ghc6v3nHdZdsQN9FbUa8j9OzM0+ccFkUrpjPlrvCSNxM8G+QHJGCQV
         dThdQoSnRlEOnl00re7CWUxpz33qRVrF4t1iXuFDtEsfw/w+YXKq2NCvQ28jlvUjjyP4
         UMMFp9leOxO+2/WqGmG9zi0zkbNoyQZoutyuKBmcg8yRPMWst+xE7GeFxfgQAqAnu3M/
         +MCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uoR5hrkaKmJOEz2cwXfhbkk2C+6UoQr5PoKVBFcmbBM=;
        b=nDIkJZLQvs1WJdQ4lEqw5qYKryEil2/tofLsfLZGViCEFyS0TANlA4xGy1I6SJj04z
         oiJAtVX/hVcW6rbND4//lRQpl3tfrn1gFpagBgL+KQXoWUSVoHa0S2TTtHRzeELVAp3R
         jYfg157nOUHngMFe+nvqXr73qb981+7UpfrC/KgsItbh58lyBo+0/nfapNNswWAEOSok
         4pCC2ag86L77K4jYW6l9zsfMRGOmqdA3ufEAawkJ43P8HOaVJmLxyRlYPMXZ0hyFSNlw
         ESiTFxBiPg8Yxw1EIyT6Hd84qSBPVoLLlLg6/k4ZXf8NxjrO06ZKOIp4rHozW535YfZ9
         4Y/A==
X-Gm-Message-State: AOAM533s1gIa3MMqXhRsvmGRAZYv2DLjmIM9t5v4Lq/Fv5wqrErI30sw
        pN/Du/yVVtdEP1+15sWOch8zNH1SyjuW+g==
X-Google-Smtp-Source: ABdhPJx5I3c1dQsgVQ5tUVX9FY89OOeZNUNaHoH/rYCPXIPwIDV2mpRgGeKhjX+AvHwvrKEdZ3RLUQ==
X-Received: by 2002:a2e:b4f1:: with SMTP id s17mr2032614ljm.184.1598033932354;
        Fri, 21 Aug 2020 11:18:52 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id s3sm536631ljd.44.2020.08.21.11.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 11:18:51 -0700 (PDT)
Date:   Fri, 21 Aug 2020 20:18:50 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: Fix pin controller node names
Message-ID: <20200821181850.GA69748@oden.dyn.berto.se>
References: <20200821112351.5518-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200821112351.5518-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-08-21 13:23:51 +0200, Geert Uytterhoeven wrote:
> According to Devicetree Specification v0.2 and later, Section "Generic
> Names Recommendation", the node name for a pin controller device node
> should be "pinctrl".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.10.
> 
>  arch/arm/boot/dts/emev2.dtsi     | 2 +-
>  arch/arm/boot/dts/r7s72100.dtsi  | 2 +-
>  arch/arm/boot/dts/r7s9210.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a73a4.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7740.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7742.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7743.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7744.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7745.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a77470.dtsi  | 2 +-
>  arch/arm/boot/dts/r8a7778.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7779.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7790.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7791.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7792.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7793.dtsi   | 2 +-
>  arch/arm/boot/dts/r8a7794.dtsi   | 2 +-
>  arch/arm/boot/dts/r9a06g032.dtsi | 2 +-
>  arch/arm/boot/dts/sh73a0.dtsi    | 2 +-
>  19 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/emev2.dtsi b/arch/arm/boot/dts/emev2.dtsi
> index 96678ddbb4e6a2a9..ecfaa0b7523e83b2 100644
> --- a/arch/arm/boot/dts/emev2.dtsi
> +++ b/arch/arm/boot/dts/emev2.dtsi
> @@ -195,7 +195,7 @@
>  		clock-names = "sclk";
>  	};
>  
> -	pfc: pin-controller@e0140200 {
> +	pfc: pinctrl@e0140200 {
>  		compatible = "renesas,pfc-emev2";
>  		reg = <0xe0140200 0x100>;
>  	};
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index b9b1388880488059..45cf75b5824cbe7f 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -499,7 +499,7 @@
>  			clock-output-names = "sdhi00", "sdhi01", "sdhi10", "sdhi11";
>  		};
>  
> -		pinctrl: pin-controller@fcfe3000 {
> +		pinctrl: pinctrl@fcfe3000 {
>  			compatible = "renesas,r7s72100-ports";
>  
>  			reg = <0xfcfe3000 0x4230>;
> diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
> index 838920aef9925c2f..85c0399b1339585b 100644
> --- a/arch/arm/boot/dts/r7s9210.dtsi
> +++ b/arch/arm/boot/dts/r7s9210.dtsi
> @@ -489,7 +489,7 @@
>  			interrupt-map-mask = <7 0>;
>  		};
>  
> -		pinctrl: pin-controller@fcffe000 {
> +		pinctrl: pinctrl@fcffe000 {
>  			compatible = "renesas,r7s9210-pinctrl";
>  			reg = <0xfcffe000 0x1000>;
>  
> diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
> index b92e7257983611b1..e5fb1ce261f72f2d 100644
> --- a/arch/arm/boot/dts/r8a73a4.dtsi
> +++ b/arch/arm/boot/dts/r8a73a4.dtsi
> @@ -221,7 +221,7 @@
>  		power-domains = <&pd_c4>;
>  	};
>  
> -	pfc: pin-controller@e6050000 {
> +	pfc: pinctrl@e6050000 {
>  		compatible = "renesas,pfc-r8a73a4";
>  		reg = <0 0xe6050000 0 0x9000>;
>  		gpio-controller;
> diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
> index 8048303037ee970f..1b2cf5fa322b2985 100644
> --- a/arch/arm/boot/dts/r8a7740.dtsi
> +++ b/arch/arm/boot/dts/r8a7740.dtsi
> @@ -311,7 +311,7 @@
>  		status = "disabled";
>  	};
>  
> -	pfc: pin-controller@e6050000 {
> +	pfc: pinctrl@e6050000 {
>  		compatible = "renesas,pfc-r8a7740";
>  		reg = <0xe6050000 0x8000>,
>  		      <0xe605800c 0x20>;
> diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
> index 009827708bf44ba0..aab640da17ea942a 100644
> --- a/arch/arm/boot/dts/r8a7742.dtsi
> +++ b/arch/arm/boot/dts/r8a7742.dtsi
> @@ -330,7 +330,7 @@
>  			resets = <&cpg 907>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7742";
>  			reg = <0 0xe6060000 0 0x250>;
>  		};
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> index 896916a00b8429a6..f444e418f4085a26 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -265,7 +265,7 @@
>  			resets = <&cpg 904>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7743";
>  			reg = <0 0xe6060000 0 0x250>;
>  		};
> diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
> index 6b56aa2863377e00..0442aad4f9dba024 100644
> --- a/arch/arm/boot/dts/r8a7744.dtsi
> +++ b/arch/arm/boot/dts/r8a7744.dtsi
> @@ -265,7 +265,7 @@
>  			resets = <&cpg 904>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7744";
>  			reg = <0 0xe6060000 0 0x250>;
>  		};
> diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
> index 636248f370e02be4..0f14ac22921de7d4 100644
> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -230,7 +230,7 @@
>  			resets = <&cpg 905>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7745";
>  			reg = <0 0xe6060000 0 0x11c>;
>  		};
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 6baa126b6590f51a..691b1a131c870df3 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -187,7 +187,7 @@
>  			resets = <&cpg 907>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a77470";
>  			reg = <0 0xe6060000 0 0x118>;
>  		};
> diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
> index 1612b003fb55ed5b..c9f8735860bf824c 100644
> --- a/arch/arm/boot/dts/r8a7778.dtsi
> +++ b/arch/arm/boot/dts/r8a7778.dtsi
> @@ -142,7 +142,7 @@
>  		interrupt-controller;
>  	};
>  
> -	pfc: pin-controller@fffc0000 {
> +	pfc: pinctrl@fffc0000 {
>  		compatible = "renesas,pfc-r8a7778";
>  		reg = <0xfffc0000 0x118>;
>  	};
> diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
> index c5634daef96f49f5..74d7e9084eabe173 100644
> --- a/arch/arm/boot/dts/r8a7779.dtsi
> +++ b/arch/arm/boot/dts/r8a7779.dtsi
> @@ -321,7 +321,7 @@
>  		status = "disabled";
>  	};
>  
> -	pfc: pin-controller@fffc0000 {
> +	pfc: pinctrl@fffc0000 {
>  		compatible = "renesas,pfc-r8a7779";
>  		reg = <0xfffc0000 0x23c>;
>  	};
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
> index 769ba2a33d39e885..b0569b4ea5c8ae96 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -363,7 +363,7 @@
>  			resets = <&cpg 907>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7790";
>  			reg = <0 0xe6060000 0 0x250>;
>  		};
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index cdc67a476d02f795..6590b91cbcc70dc3 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -287,7 +287,7 @@
>  			resets = <&cpg 904>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7791";
>  			reg = <0 0xe6060000 0 0x250>;
>  		};
> diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
> index 597848ad4dfa109d..f5b299bfcb23796c 100644
> --- a/arch/arm/boot/dts/r8a7792.dtsi
> +++ b/arch/arm/boot/dts/r8a7792.dtsi
> @@ -296,7 +296,7 @@
>  			resets = <&cpg 913>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7792";
>  			reg = <0 0xe6060000 0 0x144>;
>  		};
> diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
> index 6d507091b163bd86..f930f69f7bcce43a 100644
> --- a/arch/arm/boot/dts/r8a7793.dtsi
> +++ b/arch/arm/boot/dts/r8a7793.dtsi
> @@ -271,7 +271,7 @@
>  			resets = <&cpg 904>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7793";
>  			reg = <0 0xe6060000 0 0x250>;
>  		};
> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
> index 5f340397ab64ca47..cd5e2904068abd69 100644
> --- a/arch/arm/boot/dts/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> @@ -238,7 +238,7 @@
>  			resets = <&cpg 905>;
>  		};
>  
> -		pfc: pin-controller@e6060000 {
> +		pfc: pinctrl@e6060000 {
>  			compatible = "renesas,pfc-r8a7794";
>  			reg = <0 0xe6060000 0 0x11c>;
>  		};
> diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
> index ee59cc84f2121488..c47896e4ab5877dd 100644
> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -165,7 +165,7 @@
>  			status = "disabled";
>  		};
>  
> -		pinctrl: pin-controller@40067000 {
> +		pinctrl: pinctrl@40067000 {
>  			compatible = "renesas,r9a06g032-pinctrl", "renesas,rzn1-pinctrl";
>  			reg = <0x40067000 0x1000>, <0x51000000 0x480>;
>  			clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
> diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
> index a9bb46e007f366f4..a20134f9dc25209a 100644
> --- a/arch/arm/boot/dts/sh73a0.dtsi
> +++ b/arch/arm/boot/dts/sh73a0.dtsi
> @@ -453,7 +453,7 @@
>  		status = "disabled";
>  	};
>  
> -	pfc: pin-controller@e6050000 {
> +	pfc: pinctrl@e6050000 {
>  		compatible = "renesas,pfc-sh73a0";
>  		reg = <0xe6050000 0x8000>,
>  		      <0xe605801c 0x1c>;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
