Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1893B2016
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 20:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhFWSPm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 14:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhFWSPk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 14:15:40 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F64C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 11:13:20 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d16so5644028lfn.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=k8E1Fr/EM4P8t67pWJ2YJoceBuEkUervJepgl5lzQJE=;
        b=VedmF+I4EKTsdfDOAbnMn8o/Vw4czFvcrglYrf5UbtT6wsCiuzLtLtz4CgsM70dKFk
         E/MD20LlCKDXWjqucMhPw5/WWWypONtXZZnd74d574Ol/cPKbp0k9FNmXLz+BfS18oSS
         JMyHfKR8Hrpo+THsmbYYIm2ztwKUorieCdiLCmGp8uCcZDcYDgelcLOuS/OLsedLHup2
         XAqbdtmnlVu7e3wdz8RXStpULvsZd+DuE7qWm1aI5HtwiZaC3hp3E4aJuJGBJKkN359O
         8OaGmcS6YigKYpHXTNhEOlVEtA/QnBBAYoQxAcXYOnrIGQ1S9j0tmy/jONioUC2Dc1dM
         74jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=k8E1Fr/EM4P8t67pWJ2YJoceBuEkUervJepgl5lzQJE=;
        b=cC3RvplXTvbUgeJBA0BQMiLnHD17eLIzf5nJSTTgJdKktbZiD9SG7nh5WTQLX2gQTi
         P+Fseixee2WBcO2XZDR4SFfKWlZlpz1mYYm9TpUyQ8L6oMsGm0ROBhiRJ5LtNAmqnROi
         gzbGdiRXrysCK9ZFjticZrLsk+s8f3d1kN7AezQq2QfKBo4gvbmZuwTFBYcYiWHjvG9i
         ZbWTPLk3S9ciUOsjNnj9ssmr7W4TKwGL7/Jycg7WmsJSTQwVvrZ87FD5CPgMNbb7+NDc
         +noaj7nVxcUCfASYz5Bq8LyIpnmJEdtiCEJBp2VraYxAdXRYDXA/hfRR4IiD6SqzAwl7
         zTrw==
X-Gm-Message-State: AOAM531UtsqVnZj0xfaKINSNbZ6MZfPWEikC6Y2s68c5+b9OfZWDVQAu
        qxhUUGSomOa4gAmpNmcktdybSw==
X-Google-Smtp-Source: ABdhPJx2l4sZ4X01etZCjE6RzBMpr8r/KIe2kR2h1Zp2CZRfSCCAmHEyeVA7DMBXSa53YpelVpGzug==
X-Received: by 2002:a05:6512:ea1:: with SMTP id bi33mr656066lfb.281.1624471999150;
        Wed, 23 Jun 2021 11:13:19 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id c5sm65439lfp.212.2021.06.23.11.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 11:13:18 -0700 (PDT)
Date:   Wed, 23 Jun 2021 20:13:17 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779a0: Restore sort order
Message-ID: <YNN5vXDKBTurLmQK@oden.dyn.berto.se>
References: <8d68a7ce449aaf90a88e69397dbe0e9c467d5726.1624460175.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d68a7ce449aaf90a88e69397dbe0e9c467d5726.1624460175.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On 2021-06-23 16:59:25 +0200, Geert Uytterhoeven wrote:
> The thermal node was inserted at the wrong place, breaking sort order
> (sort by unit address, but group nodes of the same type).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Probably it was my fault, not Niklas' ;-)

Most likely my fault, happy order is restored.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> To be queued in renesas-devel for v5.15.
> 
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 26 +++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index a7dfade1801a87db..3676b2bd3d646cdb 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -327,6 +327,19 @@ sysc: system-controller@e6180000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		tsc: thermal@e6190000 {
> +			compatible = "renesas,r8a779a0-thermal";
> +			reg = <0 0xe6190000 0 0x200>,
> +			      <0 0xe6198000 0 0x200>,
> +			      <0 0xe61a0000 0 0x200>,
> +			      <0 0xe61a8000 0 0x200>,
> +			      <0 0xe61b0000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 919>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 919>;
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		tmu0: timer@e61e0000 {
>  			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
>  			reg = <0 0xe61e0000 0 0x30>;
> @@ -392,19 +405,6 @@ tmu4: timer@ffc00000 {
>  			status = "disabled";
>  		};
>  
> -		tsc: thermal@e6190000 {
> -			compatible = "renesas,r8a779a0-thermal";
> -			reg = <0 0xe6190000 0 0x200>,
> -			      <0 0xe6198000 0 0x200>,
> -			      <0 0xe61a0000 0 0x200>,
> -			      <0 0xe61a8000 0 0x200>,
> -			      <0 0xe61b0000 0 0x200>;
> -			clocks = <&cpg CPG_MOD 919>;
> -			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> -			resets = <&cpg 919>;
> -			#thermal-sensor-cells = <1>;
> -		};
> -
>  		i2c0: i2c@e6500000 {
>  			compatible = "renesas,i2c-r8a779a0",
>  				     "renesas,rcar-gen3-i2c";
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
