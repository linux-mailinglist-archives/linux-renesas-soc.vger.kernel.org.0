Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103CB6912AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 22:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjBIVhl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 16:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBIVhk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 16:37:40 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3635F5A91F
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Feb 2023 13:37:39 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id c26so5784749ejz.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Feb 2023 13:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xHrC5/duld9OaIO58sf+v0SP9ik6zc9fVPTnvoG8/BQ=;
        b=ILng//bo02h0D1w8s04Ik48RUB8rnPv832ThZbJrlmhKNn4TZev5KmhNV7dBQpuK7w
         rKf9GhiTMxj38vOWRTDBh57geaic+ebroE1GcJ62DssUtUzVyEJWfXZ4iIGN9Io+bA/q
         GIWqduBSpqt3uzXEpxHy6+2atPl2wmxddUGtzovaycQPjWp67E9rKwgV3Lrp3x67dlBG
         W5VGp3yT8Tgz7C6x9v9B7h+YE1hmuH/gDR4gK7x8H/idyK7vT1BzyGJ7hr9rrRr7fi/W
         ThxEKSfBr++2bqIMjJ7t4gnYHXiydzDPlu5gCWsO/uy63yHZ+ax+JsejGdFeL1lHFJKb
         HXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHrC5/duld9OaIO58sf+v0SP9ik6zc9fVPTnvoG8/BQ=;
        b=KbZUG4xvIArVDGTvaBp7QldHev1vY2s02swWINjccfgZ/n5Nt6KLtztuiAyPs07bhZ
         3iR7cyIoBQiemT/jtNQZMmx+9wfsFYakFPiEOgmLnv5bLwzTKqKTvwM9V2BajGRxYeim
         /C+fo6782ZDHxj9KK/y0uBABpVqKJ8c0xs+w8TPowsDEEyuNCOwKktkV2TIVjtLyeswU
         oa59YAf63MoQuwdhyDeFlrbhRQa774VJIDrl2ueQTLMXzli08e4F1x4Ox29d9txbxUqm
         AUYtj58a0vXaa1fsY3kO8MYmLJB5WGZbKgvZfCQMmR8MpAf2jNWHlwKgTZ6G3gYT9FIX
         Vreg==
X-Gm-Message-State: AO0yUKW2stX78+hEL7f8Pf7aEBNWkzsiGvW4BxksH5BAaIZ+UGgQTyFG
        eHohXnLKycz/bu9JzF1FaoPTsA==
X-Google-Smtp-Source: AK7set93fvAxqVevMzEOzhUgg99UjsJqVkcPIPIkLoIUEoQ3Ml5IOo8TaS/uWlL9uwYBFwGvkUiAUw==
X-Received: by 2002:a17:906:9b96:b0:8af:370a:c1f8 with SMTP id dd22-20020a1709069b9600b008af370ac1f8mr6037219ejc.23.1675978657788;
        Thu, 09 Feb 2023 13:37:37 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id v7-20020a170906858700b00883ec4c63ddsm1405472ejx.146.2023.02.09.13.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 13:37:37 -0800 (PST)
Date:   Thu, 9 Feb 2023 22:37:36 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Add thermal nodes
Message-ID: <Y+VnoFzPx5/9XpV1@oden.dyn.berto.se>
References: <b92a1a28afb9f75f24f0137af9f77e95d7ebaec3.1675959327.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b92a1a28afb9f75f24f0137af9f77e95d7ebaec3.1675959327.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Geert,

Thanks for your work.

On 2023-02-09 17:23:30 +0100, Geert Uytterhoeven wrote:
> Add device nodes for the Thermal Sensor/Chip Internal Voltage
> Monitor/Core Voltage Monitor (THS/CIVM/CVM) and the various thermal
> zones on the Renesas R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v6.4.
> 
> For testing, this patch and its dependencies can be found at
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/r8a779g0-thermal-v1
> 
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 70 +++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index 70eaf79569258357..6d5ccc6f02a1173c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -438,6 +438,18 @@ sysc: system-controller@e6180000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		tsc: thermal@e6198000 {
> +			compatible = "renesas,r8a779g0-thermal";
> +			reg = <0 0xe6198000 0 0x200>,
> +			      <0 0xe61a0000 0 0x200>,
> +			      <0 0xe61a8000 0 0x200>,
> +			      <0 0xe61b0000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 919>;
> +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets = <&cpg 919>;
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		intc_ex: interrupt-controller@e61c0000 {
>  			compatible = "renesas,intc-ex-r8a779g0", "renesas,irqc";
>  			#interrupt-cells = <2>;
> @@ -1402,6 +1414,64 @@ prr: chipid@fff00044 {
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
> +		sensor_thermal_cnn: sensor2-thermal {
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
> +
> +		sensor_thermal_ca76: sensor3-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&tsc 2>;
> +
> +			trips {
> +				sensor3_crit: sensor3-crit {
> +					temperature = <120000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		sensor_thermal_ddr1: sensor4-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&tsc 3>;
> +
> +			trips {
> +				sensor4_crit: sensor4-crit {
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
>  		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund
