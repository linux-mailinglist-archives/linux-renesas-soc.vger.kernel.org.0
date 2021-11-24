Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CA045CA36
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 17:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241579AbhKXQnB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 11:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242161AbhKXQnA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 11:43:00 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3B6C061714
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Nov 2021 08:39:50 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id r26so8795356lfn.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Nov 2021 08:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AYNjfOVUGsecrjIi5xsDtARh3TxzgOfLgCF2yRehYa0=;
        b=scq2QI0qZdrjxzMtvMR2HvxTkFaPgthQ0jd2I8GKE8avszQjUEA+F1DJuhaWCVyD6c
         Bcp5G702RkvnFcmm8YocM9X3DU1H09hGsRF6371mrFVF76Hog8YealFBZqZlD1I78Puq
         7SOPSj2Nq0aN89oEPlh3jwhkOpp5OM6gfb+2HUAvLzF1Tjhy0dOArzNxUs8SHva/gmUf
         DMHsPBq2oF0T508CcTNErnCLnPBdl1wLAoBvm6u8lmmFqNlSIbgdZ0DLeqWrQ+YBgFQu
         33oSnsuAqJt2JS4IKrJrM/q8KRek/CWUQlNTcGAbjnl0X/NXSD0gCAiO7ZHW06UgMn/e
         y8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AYNjfOVUGsecrjIi5xsDtARh3TxzgOfLgCF2yRehYa0=;
        b=vlh9DuFnmxmSLjml+eLCfSlZkWde2XfaBZshQhopQgPU7xE1tWHuSst3PLDSqcziVZ
         lXtiM86L4p+rbfB/b3PAbWmCMQq523BcOWD0YPYIU10QZojY33f/d6YcHubujkYhryVC
         ct2ngC33wzdA1lP67/XA1ImWd/0kjK+nzWAMQmnwBn2Holc6w+nx5Ezgayp++OWuOgmg
         ZK5SNmMQNJg2usTgNqM6ZOUo/ln7xlNbivaMxdCdQQy7POnkSAS+GXzB9z5cyWClYkxQ
         JoZ0yKIQwAsc7K1jZfN78awjfGvdNbMO1ym86uKfSGjFb1ekvxgKpkgsrsAPXls6iwzr
         SiPA==
X-Gm-Message-State: AOAM531YQCFctXEBL8HRJVrMAwJ/MrAWupUJ4Zve69D8XqiiXsHxFZUM
        crIkqx+z5QE4Vt1jBGJ5wR4k+A==
X-Google-Smtp-Source: ABdhPJwU46I0hQ1JUXUQPx8S6bBVYSb5u7VN1bgldcCMrl/6AhaOV0Ja4hHkwX+VGfLajYF4qEt2mg==
X-Received: by 2002:ac2:532f:: with SMTP id f15mr15598398lfh.185.1637771988593;
        Wed, 24 Nov 2021 08:39:48 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id b25sm28144lff.185.2021.11.24.08.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 08:39:48 -0800 (PST)
Date:   Wed, 24 Nov 2021 17:39:46 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: Fix operating point table node names
Message-ID: <YZ5q0sX3LixD2gx4@oden.dyn.berto.se>
References: <ac885456ffb00fa4cc4069b9967761df2c98c3d8.1637764588.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac885456ffb00fa4cc4069b9967761df2c98c3d8.1637764588.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-11-24 15:39:40 +0100, Geert Uytterhoeven wrote:
> Align the node names of device nodes representing operating point v2
> tables with the expectations of the DT bindings in
> Documentation/devicetree/bindings/opp/opp-v2.yaml.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.17.
> ---
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 4 ++--
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 4 ++--
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi | 4 ++--
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 4 ++--
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 4 ++--
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
>  9 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index 98963bb96a2ceb56..eda6a840371a8c15 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -58,7 +58,7 @@ can_clk: can {
>  		clock-frequency = <0>;
>  	};
>  
> -	cluster0_opp: opp_table0 {
> +	cluster0_opp: opp-table-0 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> @@ -80,7 +80,7 @@ opp-1500000000 {
>  		};
>  	};
>  
> -	cluster1_opp: opp_table1 {
> +	cluster1_opp: opp-table-1 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> index dcd65b1e15ab6a07..44f79fbd75dc9e48 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -47,7 +47,7 @@ can_clk: can {
>  		clock-frequency = <0>;
>  	};
>  
> -	cluster0_opp: opp_table0 {
> +	cluster0_opp: opp-table-0 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 5e16f6b1771e5c44..b8dcbbbf3db5397f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -44,7 +44,7 @@ can_clk: can {
>  		clock-frequency = <0>;
>  	};
>  
> -	cluster1_opp: opp_table10 {
> +	cluster1_opp: opp-table-1 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  		opp-800000000 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> index 4b1019a0a6cecc0c..e6d8610730a84ab8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -47,7 +47,7 @@ can_clk: can {
>  		clock-frequency = <0>;
>  	};
>  
> -	cluster0_opp: opp_table0 {
> +	cluster0_opp: opp-table-0 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> @@ -69,7 +69,7 @@ opp-1500000000 {
>  		};
>  	};
>  
> -	cluster1_opp: opp_table1 {
> +	cluster1_opp: opp-table-1 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> index 3be403ca4cd94fc2..9265a5702792c3f2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> @@ -62,7 +62,7 @@ can_clk: can {
>  		clock-frequency = <0>;
>  	};
>  
> -	cluster0_opp: opp_table0 {
> +	cluster0_opp: opp-table-0 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> @@ -96,7 +96,7 @@ opp-1700000000 {
>  		};
>  	};
>  
> -	cluster1_opp: opp_table1 {
> +	cluster1_opp: opp-table-1 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> index 616f44aaa55b0bec..26f7103d11da5985 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -57,7 +57,7 @@ can_clk: can {
>  		clock-frequency = <0>;
>  	};
>  
> -	cluster0_opp: opp_table0 {
> +	cluster0_opp: opp-table-0 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> @@ -97,7 +97,7 @@ opp-1800000000 {
>  		};
>  	};
>  
> -	cluster1_opp: opp_table1 {
> +	cluster1_opp: opp-table-1 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index 724a6a09f4579bf7..ac9b587f6fc513c1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -46,7 +46,7 @@ can_clk: can {
>  		clock-frequency = <0>;
>  	};
>  
> -	cluster0_opp: opp_table0 {
> +	cluster0_opp: opp-table-0 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> @@ -86,7 +86,7 @@ opp-1800000000 {
>  		};
>  	};
>  
> -	cluster1_opp: opp_table1 {
> +	cluster1_opp: opp-table-1 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index b625cdd16a92ecc8..f898aad72b9d263c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -62,7 +62,7 @@ can_clk: can {
>  		clock-frequency = <0>;
>  	};
>  
> -	cluster0_opp: opp_table0 {
> +	cluster0_opp: opp-table-0 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 29b2a94d5ab6566d..bc0a4f8f20c337e1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -55,7 +55,7 @@ can_clk: can {
>  		clock-frequency = <0>;
>  	};
>  
> -	cluster1_opp: opp_table10 {
> +	cluster1_opp: opp-table-1 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  		opp-800000000 {
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund
