Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7767F4F0500
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 18:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358271AbiDBQls (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 12:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358276AbiDBQlp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 12:41:45 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB690121096
        for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Apr 2022 09:39:52 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id r13so11806849ejd.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Apr 2022 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VktSJpQCczIwkpojaRryaaU92El3zYl8Kz/11dYekck=;
        b=iGESRGfcgyZObaPskCHp98HlLDuHmh5lqUTbPSwVM9N8VzqjPJOV1y0nz8SLyas0H+
         SSJaZM+SfPX4d0jTpuH6XeOUHjv3ObMvzS1/DrgEo7ejSKA4g9RxeDki1dcFeMnHfBKI
         ibkMDkfsUcgeHXJe2W7k5MvRgJtg4BWiBW5fVoE43F2yxcrcu+xyhs0kqkBVOZX0v9yY
         nYMX75B/ou8Da2zi7Pea6sPjao6EG5DrEdhVnJnJm8Zie7EhoO4OieFso4LXUvT2NOns
         SqcCke2/QcL7jHyV6NvutVsovuJzFTiZKICHF76j/3lc7Sc+W+cJeUzRKVUgUZ42EkyZ
         cpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VktSJpQCczIwkpojaRryaaU92El3zYl8Kz/11dYekck=;
        b=Y+Fa2rW4O/pCRtmA619HmqRjCqKK6rNyp3gtRhVLlX4/9hEI1KdxYMO/5uw8YxXN3s
         MEzUzClOl5dcQ/D1li22Xj+cuGZbc38+S3DjnsUNhlFywpnbinudJBlY7J6UttWQlteB
         v09mmFvcKTaYq9hYCb4+mSuGaetz3KdUXmnjqSe8aLPeeJkBLSH2GdKFeK04i/XBnwow
         m0YKeGDqLxJQ7Qpr7WSN+D0A5WiBNK8LIcjQDVx83IjZUEZdiz+EFwBHk/fgWv2RIQc3
         o2eUag9SBuNqeM2nF6Pwpy/AOJRL0rsYJ88/UhozdK39esdRA6ZqZsccv60xugJNHJUB
         7/VA==
X-Gm-Message-State: AOAM532Xx3xVeMIm8HPxuQVjggsi0GE6Fn5zHJmt6IKsBp8ui5gpHI2A
        TZRZARmPOBA4eoxPGADE/+rrPg==
X-Google-Smtp-Source: ABdhPJwaJqdLD/RZY2OK3CETEaudk4nEehjrKww+UwyRdkbQXdNDheTLbuuH2UP/7YgdOQrgwCJp3A==
X-Received: by 2002:a17:907:8a0c:b0:6df:8b04:1a65 with SMTP id sc12-20020a1709078a0c00b006df8b041a65mr4286646ejc.331.1648917591460;
        Sat, 02 Apr 2022 09:39:51 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id e6-20020a056402190600b00413d03ac4a2sm2684673edz.69.2022.04.02.09.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 09:39:51 -0700 (PDT)
Message-ID: <dba54e8f-b575-1835-fd30-44d9dcb09635@linaro.org>
Date:   Sat, 2 Apr 2022 18:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: Add initial DTSI for RZ/G2UL
 SoC
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220402073037.23947-1-biju.das.jz@bp.renesas.com>
 <20220402073037.23947-5-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402073037.23947-5-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/04/2022 09:30, Biju Das wrote:
> Add initial DTSI for RZ/G2UL SoC.
> 
> Both RZ/G2L and RZ/G2UL uses the same SMARC EVK. Therefore they share
> the common dtsi (rz-smarc.dtsi) file. Place holders are added in
> device nodes to avoid compilation errors for the devices which have
> not been enabled yet on RZ/G2UL SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
>  * Added Rb tag from Geert.
> v2->v3:
>  * Replaced clocks from R9A07G043U->R9A07G043
>  * Replaced compatible from r9a07g043u->r9a07g043
> v1->v2:
>  * Changed soc compatible from r9a07g043u->r9a07g043.
> ---
>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 413 +++++++++++++++++++++
>  1 file changed, 413 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> 

Thank you for your patch. There is something to discuss/improve.

> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> new file mode 100644
> index 000000000000..ad898cab64a6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> @@ -0,0 +1,413 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2UL SoC
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/r9a07g043-cpg.h>
> +
> +/ {
> +	compatible = "renesas,r9a07g043";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	audio_clk1: audio_clk1 {

No underscores in node names, only hyphens, please.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		/* This value must be overridden by boards that provide it */
> +		clock-frequency = <0>;
> +	};
> +
> +	audio_clk2: audio_clk2 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		/* This value must be overridden by boards that provide it */
> +		clock-frequency = <0>;
> +	};
> +
> +	/* External CAN clock - to be overridden by boards that provide it */
> +	can_clk: can {

can-clk

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +	};
> +
> +	/* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
> +	extal_clk: extal {

extal-clk

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency = <0>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a55";
> +			reg = <0>;
> +			device_type = "cpu";
> +			next-level-cache = <&L3_CA55>;
> +			enable-method = "psci";
> +			clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
> +		};
> +
> +		L3_CA55: cache-controller-0 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-size = <0x40000>;
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0", "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&gic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		ssi0: ssi@10049c00 {
> +			reg = <0 0x10049c00 0 0x400>;
> +			#sound-dai-cells = <0>;
> +			/* place holder */

Here and in other place holders - why there are no compatibles here?
What do you hold place for?

> +		};
> +
> +		spi1: spi@1004b000 {
> +			reg = <0 0x1004b000 0 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			/* place holder */
> +		};
> +
> +		scif0: serial@1004b800 {
> +			compatible = "renesas,scif-r9a07g043",
> +				     "renesas,scif-r9a07g044";
> +			reg = <0 0x1004b800 0 0x400>;
> +			interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "eri", "rxi", "txi",
> +					  "bri", "dri", "tei";
> +			clocks = <&cpg CPG_MOD R9A07G043_SCIF0_CLK_PCK>;
> +			clock-names = "fck";
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_SCIF0_RST_SYSTEM_N>;
> +			status = "disabled";
> +		};
> +
> +		scif1: serial@1004bc00 {
> +			compatible = "renesas,scif-r9a07g043",
> +				     "renesas,scif-r9a07g044";
> +			reg = <0 0x1004bc00 0 0x400>;
> +			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "eri", "rxi", "txi",
> +					  "bri", "dri", "tei";
> +			clocks = <&cpg CPG_MOD R9A07G043_SCIF1_CLK_PCK>;
> +			clock-names = "fck";
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_SCIF1_RST_SYSTEM_N>;
> +			status = "disabled";
> +		};
> +
> +		scif2: serial@1004c000 {
> +			compatible = "renesas,scif-r9a07g043",
> +				     "renesas,scif-r9a07g044";
> +			reg = <0 0x1004c000 0 0x400>;
> +			interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "eri", "rxi", "txi",
> +					  "bri", "dri", "tei";
> +			clocks = <&cpg CPG_MOD R9A07G043_SCIF2_CLK_PCK>;
> +			clock-names = "fck";
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_SCIF2_RST_SYSTEM_N>;
> +			status = "disabled";
> +		};
> +
> +		scif3: serial@1004c400 {
> +			compatible = "renesas,scif-r9a07g043",
> +				     "renesas,scif-r9a07g044";
> +			reg = <0 0x1004c400 0 0x400>;
> +			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "eri", "rxi", "txi",
> +					  "bri", "dri", "tei";
> +			clocks = <&cpg CPG_MOD R9A07G043_SCIF3_CLK_PCK>;
> +			clock-names = "fck";
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_SCIF3_RST_SYSTEM_N>;
> +			status = "disabled";
> +		};
> +
> +		scif4: serial@1004c800 {
> +			compatible = "renesas,scif-r9a07g043",
> +				     "renesas,scif-r9a07g044";
> +			reg = <0 0x1004c800 0 0x400>;
> +			interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "eri", "rxi", "txi",
> +					  "bri", "dri", "tei";
> +			clocks = <&cpg CPG_MOD R9A07G043_SCIF4_CLK_PCK>;
> +			clock-names = "fck";
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_SCIF4_RST_SYSTEM_N>;
> +			status = "disabled";
> +		};
> +
> +		sci0: serial@1004d000 {
> +			compatible = "renesas,r9a07g043-sci", "renesas,sci";
> +			reg = <0 0x1004d000 0 0x400>;
> +			interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "eri", "rxi", "txi", "tei";
> +			clocks = <&cpg CPG_MOD R9A07G043_SCI0_CLKP>;
> +			clock-names = "fck";
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_SCI0_RST>;
> +			status = "disabled";
> +		};
> +
> +		sci1: serial@1004d400 {
> +			compatible = "renesas,r9a07g043-sci", "renesas,sci";
> +			reg = <0 0x1004d400 0 0x400>;
> +			interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "eri", "rxi", "txi", "tei";
> +			clocks = <&cpg CPG_MOD R9A07G043_SCI1_CLKP>;
> +			clock-names = "fck";
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_SCI1_RST>;
> +			status = "disabled";
> +		};
> +
> +		canfd: can@10050000 {
> +			reg = <0 0x10050000 0 0x8000>;
> +			/* place holder */
> +		};
> +
> +		i2c0: i2c@10058000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x10058000 0 0x400>;
> +			/* place holder */
> +		};
> +
> +		i2c1: i2c@10058400 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x10058400 0 0x400>;
> +			/* place holder */
> +		};
> +
> +		i2c3: i2c@10058c00 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x10058c00 0 0x400>;
> +			/* place holder */
> +		};
> +
> +		adc: adc@10059000 {
> +			reg = <0 0x10059000 0 0x400>;
> +			/* place holder */
> +		};
> +
> +		sbc: spi@10060000 {
> +			reg = <0 0x10060000 0 0x10000>,
> +			      <0 0x20000000 0 0x10000000>,
> +			      <0 0x10070000 0 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			/* place holder */
> +		};
> +
> +		cpg: clock-controller@11010000 {
> +			compatible = "renesas,r9a07g043-cpg";
> +			reg = <0 0x11010000 0 0x10000>;
> +			clocks = <&extal_clk>;
> +			clock-names = "extal";
> +			#clock-cells = <2>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <0>;
> +		};
> +
> +		sysc: system-controller@11020000 {
> +			compatible = "renesas,r9a07g043-sysc";
> +			reg = <0 0x11020000 0 0x10000>;
> +			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "lpm_int", "ca55stbydone_int",
> +					  "cm33stbyr_int", "ca55_deny";
> +			status = "disabled";
> +		};
> +
> +		pinctrl: pinctrl@11030000 {
> +			reg = <0 0x11030000 0 0x10000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			/* place holder */
> +		};
> +
> +		dmac: dma-controller@11820000 {
> +			compatible = "renesas,r9a07g043-dmac",
> +				     "renesas,rz-dmac";
> +			reg = <0 0x11820000 0 0x10000>,
> +			      <0 0x11830000 0 0x10000>;
> +			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 135 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 137 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "error",
> +					  "ch0", "ch1", "ch2", "ch3",
> +					  "ch4", "ch5", "ch6", "ch7",
> +					  "ch8", "ch9", "ch10", "ch11",
> +					  "ch12", "ch13", "ch14", "ch15";
> +			clocks = <&cpg CPG_MOD R9A07G043_DMAC_ACLK>,
> +				 <&cpg CPG_MOD R9A07G043_DMAC_PCLK>;
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_DMAC_ARESETN>,
> +				 <&cpg R9A07G043_DMAC_RST_ASYNC>;
> +			#dma-cells = <1>;
> +			dma-channels = <16>;
> +		};
> +
> +		gic: interrupt-controller@11900000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			reg = <0x0 0x11900000 0 0x40000>,
> +			      <0x0 0x11940000 0 0x60000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +
> +		sdhi0: mmc@11c00000  {
> +			reg = <0x0 0x11c00000 0 0x10000>;
> +			/* place holder */
> +		};
> +
> +		sdhi1: mmc@11c10000 {
> +			reg = <0x0 0x11c10000 0 0x10000>;
> +			/* place holder */
> +		};
> +
> +		phyrst: usbphy-ctrl@11c40000 {

If this is phy, then preferrably just "phy" for node name.

> +			reg = <0 0x11c40000 0 0x10000>;
> +			/* place holder */
> +		};
> +


Best regards,
Krzysztof
