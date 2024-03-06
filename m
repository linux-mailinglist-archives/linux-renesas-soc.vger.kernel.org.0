Return-Path: <linux-renesas-soc+bounces-3517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D25873805
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 14:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C823B244FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 13:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E019130AC6;
	Wed,  6 Mar 2024 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fkxzLt3G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6B12FB0F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Mar 2024 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709732608; cv=none; b=J50ZAIn2qda1LyNetYEfENHljnRqzEG2B/t04vZagbDu7+m7DO1icQGAhbE/AFe2qkML6IWgpx7fP/KNZv6i9o9X2KfGwPsXe2gnHnZhZ9ddRKStJCbvkq65TSQdbFzd7BEQdf/Cg2AG4yAnusayLyjzLiJCplum7g4Oe1nIrBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709732608; c=relaxed/simple;
	bh=HWXf6sRV3ha+7LVBFfl+L+P26ZlBXInopsP+3bzrAFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP5We+mGuA0ssS+wnhlho/4WwvrIe6WCdTzOmhWwiDBtLAk+KmRKmxidEekQtZfNtsfyM/ntjTjlrTA5xZwGxpet/vteoyahsn4+o5BfhCvtQmxPuJ0XIHtw7XL1u9NF6LAcauwmthHW96Md9nIN6dOlRNTMoJljndUb+OhEWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fkxzLt3G; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d24a727f78so85656041fa.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Mar 2024 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709732604; x=1710337404; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6or8x2rxph29SFMBChS+UAHr5lXiApn2brSPwyfMAWY=;
        b=fkxzLt3GDWO9+d1uX2NQq3iQNk42Tl+ivCSt4BlqAtsX5IUhlFBYdbNrd2W5G8G6Sd
         mflGY+XJ4aBiwON5ji1WqwgmCQKXjuZ75BfnVsTszGq/Q/7Bb6y2MP2r8s3IK/NFl5iy
         liWTj+tVcW+3zp6PsIADV/8ojzO+lsGkxiLrIUhDQXz5Ubgh1q8ujA95DrYnjYUVtafU
         fmS5qMbK35O+GWJa5/a8CgZK/XRQIF5t8QmwlnLCf8rhw+YkaKfwqmMlt1gA2naC0bJW
         B9VDX/dlTNxh8WXafCguWb7Qfh1v8w4wmVL+3fQq+IlEyi+GkYNMZVQQFFAWVLd1zoc1
         N5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709732604; x=1710337404;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6or8x2rxph29SFMBChS+UAHr5lXiApn2brSPwyfMAWY=;
        b=Tuw9imf4EUbETwRUFenh6EPEXftN6IQcAMsQtFjEJqk60IaeF1iPzHE4tU27PtH1cG
         B8n9R1v0mVSyFdo3PvcK91sk70NKVKolP87Nh5nKmpHW1regcrqy0337g0vRd3EuixLn
         91yfWv96OM0z+uDhsXwCsddxzk+uS+np+aSu9RIEjMXNuuA+wWBFUnST+r4rY076BxIu
         mJvdYlrB865Kj2C6VLkXEfrjoNEd1r8CmvMrMUyF8lB1/errgGgRTDQ+yMy91fXtSp2B
         iy/rkhAJK8kDbGHW7nVyHCm14d7NmOzTm5zC8xke5CjTB4nFdrnZm0Duq4W7rSZ9ma6E
         Ectw==
X-Forwarded-Encrypted: i=1; AJvYcCWpgBdMvd+xi96cCzF42rg/6V6YKMt8YQp6uLRb2sQxtFx4PEFZ4TyjTpKaVwZPFKg4UvABLzrzcjcsvO7E+Wb+yg1xGN4z0pgkBPWfhNGUB58=
X-Gm-Message-State: AOJu0Ywfhdz6o/1XVUuJi/O7tZqIpbjL+N5mvPajuoZN4TtVRZbFikKW
	BVMuaC7waW9ftU+elXKry9Wr1oA/ZM9K7mP0kTpvfvLjAhdSSmxJ2T1NKELTck0=
X-Google-Smtp-Source: AGHT+IELmQLadNvSRBEe1FJVBs5sGcria6omCKHaU6SBGwc4L8+Bie6G6ES6hLUFrVgyXCaYmzz6Fw==
X-Received: by 2002:a2e:9214:0:b0:2d2:ba3c:5979 with SMTP id k20-20020a2e9214000000b002d2ba3c5979mr3768018ljg.7.1709732603786;
        Wed, 06 Mar 2024 05:43:23 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id d21-20020a2e9295000000b002d37d250ef3sm1785271ljh.26.2024.03.06.05.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 05:43:23 -0800 (PST)
Date: Wed, 6 Mar 2024 14:43:22 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Duy Nguyen <duy.nguyen.rh@renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add thermal nodes
Message-ID: <20240306134322.GD3396349@ragnatech.se>
References: <d1f07c77943912145583d8916ba3ca65d143b1b1.1709722573.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1f07c77943912145583d8916ba3ca65d143b1b1.1709722573.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-03-06 11:58:35 +0100, Geert Uytterhoeven wrote:
> From: Duy Nguyen <duy.nguyen.rh@renesas.com>
> 
> Add device nodes for the Thermal Sensor/Chip Internal Voltage
> Monitor/Core Voltage Monitor (THS/CIVM/CVM) and the various thermal
> zones on the Renesas R-Car V4M (R8A779H0) SoC.
> 
> Add support for 2 TSC nodes of thermal.
> 
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Tested on Renesas Gray Hawk Single with an R-Car V4M SoC that has
> unfortunately no calibration values fused.
> To be queued in renesas-devel for v6.10.
> 
> Changes compared to the BSP:
>   - Drop bogus interrupts property, as interrupts are routed to the ECM,
>   - Change polling-delay from <0> to <1000> as interrupts are not
>     supported.
> ---
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 40 +++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> index 11885729181bc903..a01929231e08fa30 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -318,6 +318,16 @@ sysc: system-controller@e6180000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		tsc: thermal@e6198000 {
> +			compatible = "renesas,r8a779h0-thermal";
> +			reg = <0 0xe6198000 0 0x200>,
> +			      <0 0xe61a0000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 919>;
> +			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
> +			resets = <&cpg 919>;
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		i2c0: i2c@e6500000 {
>  			compatible = "renesas,i2c-r8a779h0",
>  				     "renesas,rcar-gen4-i2c";
> @@ -653,6 +663,36 @@ prr: chipid@fff00044 {
>  		};
>  	};
>  
> +	thermal-zones {
> +		sensor_thermal_cr52: sensor1-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&tsc 0>;
> +
> +			trips {
> +				sensor1_crit: sensor1-crit {
> +					temperature = <120000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		sensor_thermal_ca76: sensor2-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&tsc 1>;
> +
> +			trips {
> +				sensor2_crit: sensor2-crit {
> +					temperature = <120000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

