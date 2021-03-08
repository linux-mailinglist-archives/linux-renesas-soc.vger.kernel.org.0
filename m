Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F04330D29
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 13:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhCHMOS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 07:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhCHMOQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 07:14:16 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1E9C06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 04:14:16 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id v2so7629135lft.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Mar 2021 04:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=s2Ld6lzt2Y3YOsEwIYBOszzNyElsFMRtBbJhCpBobro=;
        b=ghdJKH1rsFrI1AmUUIIHdA0GlLH+BTIgB6lkQQbqKrlRUSTe1AYqIBWCVgT2a8MB8X
         3a2iwOF5OdWJf8CnZd5DIHoWtFlwHbgTW1Aht8ABBYoMqb4LxiFuQZEUyzJ2KSaUtsnn
         M553iwMA4BrBzLNWSnvV+CS2z/5dSINCOXxhwB/ZTtdMfU/OIKrO+yscE/HNgbGwLMqv
         SNWA85mxkoJmnMW+a3cS6T+t9QuBd+ZdG2VBBhnhm/KLXWT8q9SGI/Lrv17IHNv+IZ+L
         cMLBHESW+A7uq2rjAM7y1TVEebjtyHQv9UIYxSLSMSkf07XFPRPFHK0lPambBE7gbgHq
         0fxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=s2Ld6lzt2Y3YOsEwIYBOszzNyElsFMRtBbJhCpBobro=;
        b=QvG97x/Wg5CCmLcxOat+a1h3sAB00TmGTUN2WGtGdAF6uDY36ZwuLT4svrzNXvmcEh
         2quLBIcY5/FDqJLJ8GwHM6PTcP1omR2w1a5cx/gglfJgGii5N4ujfnw3M8ICrcgUzCQB
         iwFOaE//2netUKnSV+ekbzEe2oOqiYwWrkjtYYGW+wGX8NpZJ0OTtkAvSAMfk20V/wc6
         OVRmj+RUTHR+gIULQ2uURoebASScZtombsW37OWGBpA4XzaFYMfdWBrFTREweJBIuMFE
         RnqZ+vAwZ96f6efkzpj4GAj7iZr21gTPq4XiMU10Mw2E0nEbwcI0SuQ6SiwWsktgN14+
         z25Q==
X-Gm-Message-State: AOAM533qcPR83q96UG/mN3mtfjH6VvXU2NwBBuxQXLRPMoq+YOPOFl70
        CTgF510GrVNV1gB2VV7GkWlfr5jmfW4HAA==
X-Google-Smtp-Source: ABdhPJxwCC3SWHq8sodaHV3nWQNwu/kAda27mIyTQoNJ3vTGKEABR/UmQ/BgD7nqoTPzXl0A8PCR9A==
X-Received: by 2002:a19:7fc3:: with SMTP id a186mr13494430lfd.626.1615205654682;
        Mon, 08 Mar 2021 04:14:14 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id y3sm1340190lfg.6.2021.03.08.04.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 04:14:14 -0800 (PST)
Date:   Mon, 8 Mar 2021 13:14:13 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a779a0: Add TMU support
Message-ID: <YEYVFXb8+u5u0x9V@oden.dyn.berto.se>
References: <20210305143259.12622-1-wsa+renesas@sang-engineering.com>
 <20210305143259.12622-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210305143259.12622-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phong and Wolfram,

Thanks for this patch.

On 2021-03-05 15:32:58 +0100, Wolfram Sang wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
> 
> This patch adds TMU{0|1|2|3|4} device nodes for R-Car V3U (r8a779a0) SoC.
> 
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> [wsa: rebased, double checked values]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 65 +++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index 2762c8b75c4e..5e4332d85380 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -330,6 +330,71 @@ sysc: system-controller@e6180000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		tmu0: timer@e61e0000 {
> +			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
> +			reg = <0 0xe61e0000 0 0x30>;
> +			interrupts = <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 713>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 713>;
> +			status = "disabled";
> +		};
> +
> +		tmu1: timer@e6fc0000 {
> +			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
> +			reg = <0 0xe6fc0000 0 0x30>;
> +			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 714>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 714>;
> +			status = "disabled";
> +		};
> +
> +		tmu2: timer@e6fd0000 {
> +			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
> +			reg = <0 0xe6fd0000 0 0x30>;
> +			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 715>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 715>;
> +			status = "disabled";
> +		};
> +
> +		tmu3: timer@e6fe0000 {
> +			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
> +			reg = <0 0xe6fe0000 0 0x30>;
> +			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 716>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 716>;
> +			status = "disabled";
> +		};
> +
> +		tmu4: timer@ffc00000 {
> +			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
> +			reg = <0 0xffc00000 0 0x30>;
> +			interrupts = <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 717>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 717>;
> +			status = "disabled";
> +		};
> +
>  		i2c0: i2c@e6500000 {
>  			compatible = "renesas,i2c-r8a779a0",
>  				     "renesas,rcar-gen3-i2c";
> -- 
> 2.29.2
> 

-- 
Regards,
Niklas Söderlund
