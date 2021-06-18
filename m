Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1C43ACF68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 17:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbhFRPtn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 11:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhFRPtn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 11:49:43 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF089C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 08:47:33 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u11so3679127ljh.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 08:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=13DJ8fhEiZ3BNrF8xGNRpWYfpi9Ezg8GVC8DodJiIt8=;
        b=Xw8uBc9djEjQ9d9rrB1W5Rf8RxYqhATS2/XDWa5TPTUmQzPwQSAuNnpziKRaNg0E7M
         OHXblHxF3DEY2a0f33yZaa2wSeaUo9jqpeDcWkpUl1AwC1vCGco8z4wwU59b/9hq5leI
         ZvMR0vJiPIFS3yltcGfmBdmH7fK4wjUE87dNLsiBs6ysF7ALEzN3J7hI/451Btv/Fox6
         iqNxkF7AEooEE2x9GIqcci29gG4jBnI4pVR0Z0v8ONC55EMPC7BNVONSnB+msHDcOSXY
         2IKLd5TUw0BwH+WsDGxVggnV3uVsuUa5OrLCvpTTpjmhlMP/bDhW+e+eKX2JcVupblIt
         XrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=13DJ8fhEiZ3BNrF8xGNRpWYfpi9Ezg8GVC8DodJiIt8=;
        b=pcghA1p9iKdfG5lzOlsTTxD4tTYPTYfMDA1nDZWVYHscRD+h/hYs+DVOJwEQacZ0vH
         ogfKki0su92TV/1wIJFQ4unhmPCtu2kK4Ljs79GOsKAkKW3We4N60GGJawsEiix0zQU7
         rNRvhE31AMR4rYbmA3Cj/NPPl9RmQ09mx6okmT5N0oIZiXDXP0IVT8bdK4ruMRbb/1rM
         oaUddUdIGXozhovSI7L4jupdYTtLW4oa1ySPRiVRoGEedtWyrqfC27RAv8zpHAoukkVV
         S/YuSqyRvhWKwA6IIAbcPy5XSHc8CLmiVTbUQUKrQZBd3BRRAVqIozWbWk7/Nw8UsHWp
         yMLA==
X-Gm-Message-State: AOAM532pXdgpKONTWZqeNkwJ0bcZzsePKqVQdsF7PdnTbh2ggXLYCApx
        wiw1L6LU5kEXAlQmUO32uGzCoozEDyjvqw==
X-Google-Smtp-Source: ABdhPJxwRSPQNyHPePyxpwR0NH5s1jzdSDblG7lWTvVudHikPiPhtfniKw6nlSbhY0waV7aW94SORA==
X-Received: by 2002:a2e:9a0d:: with SMTP id o13mr9949461lji.440.1624031252188;
        Fri, 18 Jun 2021 08:47:32 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id m18sm1078832ljg.105.2021.06.18.08.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 08:47:31 -0700 (PDT)
Date:   Fri, 18 Jun 2021 17:47:31 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: rzg2: Rename i2c_dvfs to iic_pmic
Message-ID: <YMzAE+57s/UUHi9A@oden.dyn.berto.se>
References: <3fee803a7464a3243e62a943a6a5dce8f1c65a2d.1624016811.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fee803a7464a3243e62a943a6a5dce8f1c65a2d.1624016811.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-06-18 13:47:59 +0200, Geert Uytterhoeven wrote:
> As RZ/G2 SoCs do not support DVFS, the "iic-dvfs" module was renamed to
> "iic-pmic" in the RZ/G Series, 2nd Generation User’s Manual: Hardware
> Rev. 1.00.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.15.
> 
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 4 ++--
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index 78c121a89f11b8ae..6f4fffacfca21b7f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -25,7 +25,7 @@ aliases {
>  		i2c4 = &i2c4;
>  		i2c5 = &i2c5;
>  		i2c6 = &i2c6;
> -		i2c7 = &i2c_dvfs;
> +		i2c7 = &iic_pmic;
>  	};
>  
>  	/*
> @@ -715,7 +715,7 @@ i2c6: i2c@e66e8000 {
>  			status = "disabled";
>  		};
>  
> -		i2c_dvfs: i2c@e60b0000 {
> +		iic_pmic: i2c@e60b0000 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			compatible = "renesas,iic-r8a774a1",
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> index 28c612ce49c0ffba..0f7bdfc90a0dc325 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -588,7 +588,7 @@ i2c6: i2c@e66e8000 {
>  			status = "disabled";
>  		};
>  
> -		i2c_dvfs: i2c@e60b0000 {
> +		iic_pmic: i2c@e60b0000 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			compatible = "renesas,iic-r8a774b1",
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 0b0f871bac1cb116..d597772c4c37e970 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -574,7 +574,7 @@ i2c7: i2c@e6690000 {
>  			status = "disabled";
>  		};
>  
> -		i2c_dvfs: i2c@e60b0000 {
> +		iic_pmic: i2c@e60b0000 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			compatible = "renesas,iic-r8a774c0",
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
