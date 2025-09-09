Return-Path: <linux-renesas-soc+bounces-21603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E7CB4A419
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 09:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29BAB3B8B44
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 07:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752F021B9C0;
	Tue,  9 Sep 2025 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8vcC7H8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF111B21BD;
	Tue,  9 Sep 2025 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403969; cv=none; b=CGYl6UbPahMsZdY3+EuJRWhGqqJa1Wnt4c3HiMLc8ixNSO1BTd3K8YCOummBwVLvuE2XFnuGJVpgk1JR7d7u/SDoE056UqSM2jv4adC6KPH4WcRVBqNG/+cQn77hwkVzQnbZunL5zNHauN1UK3z/iyKNiTJsWTXImj5BOcXPKSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403969; c=relaxed/simple;
	bh=sYjruXB1Z0OgdaiX/n1NzVlvZm2l0vBzuw2CfvtjwEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ok5l2VuCrWoDmbvuv4Ys8fYB25onN3IG92boqaZNQtXEAGpgyjJD8Y1vgiZAp85Hj+l930QH2S7ym3njnVPSHZRiod6tDqB8W0SHRiWwW2MDS/7NtW1qD5Mf3s8O4QShQSIQypx4BcJeD5odNop173DFjPIpGEver+3VDnDykNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8vcC7H8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E742C4CEF4;
	Tue,  9 Sep 2025 07:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757403968;
	bh=sYjruXB1Z0OgdaiX/n1NzVlvZm2l0vBzuw2CfvtjwEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8vcC7H81nIm6YxciLTLOEDYMpecoFsj2iwgMoE/bhqXGq8wRMRtvp2lSxnJSPbaQ
	 vD25UZn8h7P6Moawk57etKrkE2fvkd5KOFfsIzvN7HNfvROUWUHVHzZmxcU61Id36f
	 40fhLuozUeZslDpjC473RAR1dJPO9mE/r6GR9kMt+EiQHsqtBAG9tQW546b92rzJnT
	 pzYmOD3KYufLnazna0OaknSKf1sF255lIy9Lx8RPzSShAikGM6kF3zU6tSeoKBamEq
	 3d4Nx0WU8zBP/2cDywMeMP7LxNndTPxWtzzkbmXrifn/zXv0l3EVD78Lvgd/LarPOD
	 W+B0XV37aG0Kg==
Date: Tue, 9 Sep 2025 09:46:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
Message-ID: <20250909-woodlouse-of-authentic-fertility-1cea2c@kuoka>
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
 <87plc09z6j.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87plc09z6j.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Sep 09, 2025 at 01:45:09AM +0000, Kuninori Morimoto wrote:
> +
> +		a720_0: cpu@0 {
> +			compatible = "arm,cortex-a720";
> +			reg = <0x0 0x0>;
> +			device_type = "cpu";
> +			next-level-cache = <&L1_CA720_0>;
> +			enable-method = "psci";
> +
> +			L1_CA720_0: l1-cache-controller-0 {


cache-controller-0

> +				compatible = "cache";

Missing several properties. I have doubts this passes checks.

> +				next-level-cache = <&L2_CA720_0>;
> +			};
> +
> +			L2_CA720_0: l2-cache-controller-0 {

cache-controller-1

> +				compatible = "cache";
> +				next-level-cache = <&L3_CA720_0>;
> +			};
> +		};
> +
> +		a720_1: cpu@100 {
> +			compatible = "arm,cortex-a720";
> +			reg = <0x0 0x100>;
> +			device_type = "cpu";
> +			next-level-cache = <&L1_CA720_1>;
> +			enable-method = "psci";
> +
> +			L1_CA720_1: l1-cache-controller-1 {


cache-controller-0

> +				compatible = "cache";
> +				next-level-cache = <&L2_CA720_1>;
> +			};
> +
> +			L2_CA720_1: l2-cache-controller-1 {


cache-controller-1

> +				compatible = "cache";
> +				next-level-cache = <&L3_CA720_0>;
> +			};
> +		};
> +
> +		a720_2: cpu@200 {
> +			compatible = "arm,cortex-a720";
> +			reg = <0x0 0x200>;
> +			device_type = "cpu";
> +			next-level-cache = <&L1_CA720_2>;
> +			enable-method = "psci";
> +
> +			L1_CA720_2: l1-cache-controller-2 {

Numbering does not start from 2

cache-controller-0

and so on. All of these nodes are incomplete.

> +				compatible = "cache";
> +				next-level-cache = <&L2_CA720_2>;
> +			};
> +
> +			L2_CA720_2: l2-cache-controller-2 {
> +				compatible = "cache";
> +				next-level-cache = <&L3_CA720_0>;
> +			};
> +		};

...

> +
> +		L3_CA720_2: cache-controller-2 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-level = <3>;
> +		};
> +
> +		L3_CA720_3: cache-controller-3 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-level = <3>;
> +		};
> +
> +		L3_CA720_4: cache-controller-4 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-level = <3>;
> +		};
> +
> +		L3_CA720_5: cache-controller-5 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-level = <3>;
> +		};
> +
> +		L3_CA720_6: cache-controller-6 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-level = <3>;
> +		};
> +
> +		L3_CA720_7: cache-controller-7 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-level = <3>;
> +		};
> +	};
> +
> +	extal_clk: extal {

Use some sane prefix.

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency = <0>;

Drop instead

> +	};
> +
> +	extalr_clk: extalr {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency = <0>;

Drop instead

> +	};
> +
> +	/* In the early phase, there is no clock control support,

Don't use netdev style here.

/*
 *


> +	 * so assume that the clocks are enabled by default.
> +	 * Therefore, dummy clocks are used.
> +	 */
> +	dummy_clk_sgasyncd4: dummy_clk_sgasyncd4 {

See dts coding style. No underscores.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <266660000>;
> +	};
> +
> +	/* External SCIF clock - to be overridden by boards that provide it */
> +	scif_clk: scif {

Also name without prefix (or suffix, or anything)

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;

Drop


> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&gic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		prr: chipid@189e0044 {
> +			compatible = "renesas,prr";
> +			reg = <0 0x189e0044 0 4>;
> +		};
> +
> +		/* The Arm GIC-700AE - View 1 */
> +		gic: interrupt-controller@39000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			redistributor-stride = <0x0 0x40000>;
> +			#redistributor-regions = <32>;
> +			reg = <0x0 0x39000000 0x0 0x20000>, // GICD

Please use DTS coding style order of properties.

> +			      <0x0 0x39080000 0x0 0x40000>, // GICR Core0
> +			      <0x0 0x390C0000 0x0 0x40000>, // GICR Core1
> +			      <0x0 0x39100000 0x0 0x40000>, // GICR Core2
> +			      <0x0 0x39140000 0x0 0x40000>, // GICR Core3
> +			      <0x0 0x39180000 0x0 0x40000>, // GICR Core4
> +			      <0x0 0x391C0000 0x0 0x40000>, // GICR Core5
> +			      <0x0 0x39200000 0x0 0x40000>, // GICR Core6
> +			      <0x0 0x39240000 0x0 0x40000>, // GICR Core7
> +			      <0x0 0x39280000 0x0 0x40000>, // GICR Core8
> +			      <0x0 0x392C0000 0x0 0x40000>, // GICR Core9
> +			      <0x0 0x39300000 0x0 0x40000>, // GICR Core10
> +			      <0x0 0x39340000 0x0 0x40000>, // GICR Core11
> +			      <0x0 0x39380000 0x0 0x40000>, // GICR Core12
> +			      <0x0 0x393C0000 0x0 0x40000>, // GICR Core13
> +			      <0x0 0x39400000 0x0 0x40000>, // GICR Core14
> +			      <0x0 0x39440000 0x0 0x40000>, // GICR Core15
> +			      <0x0 0x39480000 0x0 0x40000>, // GICR Core16
> +			      <0x0 0x394C0000 0x0 0x40000>, // GICR Core17
> +			      <0x0 0x39500000 0x0 0x40000>, // GICR Core18
> +			      <0x0 0x39540000 0x0 0x40000>, // GICR Core19
> +			      <0x0 0x39580000 0x0 0x40000>, // GICR Core20
> +			      <0x0 0x395C0000 0x0 0x40000>, // GICR Core21
> +			      <0x0 0x39600000 0x0 0x40000>, // GICR Core22
> +			      <0x0 0x39640000 0x0 0x40000>, // GICR Core23
> +			      <0x0 0x39680000 0x0 0x40000>, // GICR Core24
> +			      <0x0 0x396C0000 0x0 0x40000>, // GICR Core25
> +			      <0x0 0x39700000 0x0 0x40000>, // GICR Core26
> +			      <0x0 0x39740000 0x0 0x40000>, // GICR Core27
> +			      <0x0 0x39780000 0x0 0x40000>, // GICR Core28
> +			      <0x0 0x397C0000 0x0 0x40000>, // GICR Core29
> +			      <0x0 0x39800000 0x0 0x40000>, // GICR Core30
> +			      <0x0 0x39840000 0x0 0x40000>; // GICR Core31

Here 0x0...

> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		scif0: serial@c0700000 {
> +			compatible = "renesas,rcar-gen5-scif", "renesas,scif";
> +			reg = <0 0xc0700000 0 0x40>;

but here just '0' decimal. Just keep your code consistent, whichever you
choose.


