Return-Path: <linux-renesas-soc+bounces-3917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D52880756
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 23:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B8E21F22F1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 22:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1135F860;
	Tue, 19 Mar 2024 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="RWN/Wkfy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j/h4wyDD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from flow1-smtp.messagingengine.com (flow1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E305F87C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 22:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710888149; cv=none; b=KRynZHmvSZtoZfnTs3KzQSkfgvPU+hdLdSyMeGjly3jraaSJBOtp/aYWmKsWXI0yssXDuBe5MApvvii636ahZjlpT3cBg/3z4vT1VmMBc8WIfCxOLJMmPDMHoEpxdFL1EFxE8TBE8kQDmp5XP70g5iGXNtrievzpDMVmUD3bL1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710888149; c=relaxed/simple;
	bh=CVgYu78sni01jpJN286L6px7SuGhi3FNmnuCPJpAMog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdFATvi5bjKDlDrZe9AShIsSlSKc80Nnn5ccfo/9ySCbFCZtUOYpafrbPYdNzbTyoMrAasR72W4qFNJ6VVJo+GDutRqXPU625Sl4jypUNFkh1I56d4ShuXgdHFY7fp3R0AzQvaa6HeD8yVrnBZR2oH6XWoTvKhVpy14QtRe8SeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RWN/Wkfy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j/h4wyDD; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailflow.nyi.internal (Postfix) with ESMTP id 967D820026D;
	Tue, 19 Mar 2024 18:42:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 19 Mar 2024 18:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710888145;
	 x=1710891745; bh=ARXDBYa7HSzScjnpES02G7AYg+3IsZksOYGPV7XhRyY=; b=
	RWN/Wkfyqn1AribIWGodbIskAcLPfKngc1LEo7i2y/mWULFjpV9pLjC8RhEMujRb
	MPdeOryQ9coAUkFPFKSjbnJu8bJ2p6Ym1ohb9M7g9uQsvCE1lNdRW4YDvmPv2lxg
	qQxwNAnTRle9vbMHO6/9TlpeJlqQEyktqbM4luPZdBYjQhwbLQrAYQ0VgSJiCvaw
	UkHnRvXbVll5ulDGUgSTwX8gU3xH6hu5hSLESSTvSGRVB/d5V0asT7oq/Xf7r1dj
	YO45ad13iiRncbukX2nvud6srQ7KVbP1yisNDXrWdLjnjiRKO1uRO9jQsFAdE7LQ
	9P9OnXlXD9drklsQ2uZi0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=i80c9496c.fm2; t=
	1710888145; x=1710891745; bh=ARXDBYa7HSzScjnpES02G7AYg+3IsZksOYG
	PV7XhRyY=; b=j/h4wyDDV2eQd62CUt3HGU5qjnoWa1Ea8t5D9r6AdczM0VgG5rU
	ARINd7bwXjO1l3ZTuHF+PAGBzDHQaBGDQh9QKI0oZCleGZ+bONz9MI+ZXRZrd2Ip
	Wajmg/Q/WzHabi79eSvhNy0U2fZnvYtu+bOj6yt30EBb3osVD69dFMaL3cURYeEX
	2iIA1FoQPYxWnJMDZsY7c6xnnNIK4mODe53yEAGiEQf5rQTaac/+HPoBIDgpFikA
	+wHKH9bqXmT2FhBrsZC1ancI+JGegWflbkoGHH1E69gFaOPbBOS7ZivyD0dv5z3z
	SbivOrNU+q//SylvsDEp7d3WfS6BL/AGuvQ==
X-ME-Sender: <xms:0BT6ZS9FJSK8FiVa4DN2tfFwvvR-qWIsbCyyxdfsk2qjjTLl7yv8OA>
    <xme:0BT6ZSvLUNfom3r-U6ttaDtW4yRPNPWHRirNCMX0OJwgLu3jteTEOM4rxWqOeFeCO
    mhSqcZdrF-JdrP2Yrg>
X-ME-Received: <xmr:0BT6ZYB789CYGmOd9v9vgPggRRztp-N_uZ3d-jeYY2PDEkNgLIjxb9dTILvRLE1ulTHXDZn83tbjQvShCvuGburYf7SUaFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrledugddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfff
    jefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:0BT6ZacBhNd5slFbcaurmxXiELMgZFsw0Y-TQovs48byvd2RvMhgmg>
    <xmx:0BT6ZXOC6PCZvGS0R23Z_G1Ly8CLux8gRY0N1DXvZROHLOGliypQBQ>
    <xmx:0BT6ZUl5HfU_Qa5jM0tCPYKFfWYndW8dVYIEUBacu28FGNs-5PcMYA>
    <xmx:0BT6ZZvLbWiOK_By0Hc1JiXnhs0l_JpBsOtRho-xo5SJW7URQYPbPg>
    <xmx:0RT6ZcoS9a7nfliSbExn183kVhLg9bA1jOLvUIUp75_3Jkyt5_weEm179k0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Mar 2024 18:42:24 -0400 (EDT)
Date: Tue, 19 Mar 2024 23:42:23 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] ARM: dts: renesas: r8a73a4: Add TMU nodes
Message-ID: <20240319224223.GC3438308@ragnatech.se>
References: <cover.1710864964.git.geert+renesas@glider.be>
 <1a60832f3ba37afb4a5791f4e5db4610ab31beb3.1710864964.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a60832f3ba37afb4a5791f4e5db4610ab31beb3.1710864964.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your patch.

On 2024-03-19 17:29:05 +0100, Geert Uytterhoeven wrote:
> Add device nodes for the Timer Units (TMU) on the R-Mobile APE6 SoC,
> and the clocks serving them.
> 
> Note that TMU channels 1 and 2 are not added, as their interrupts are
> not wired to the interrupt controller for the AP-System Core (INTC-SYS),
> only to the interrupt controller for the AP-Realtime Core (INTC-RT).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/r8a73a4.dtsi    | 37 +++++++++++++++++++++++
>  include/dt-bindings/clock/r8a73a4-clock.h |  4 +++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/renesas/r8a73a4.dtsi b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
> index ac654ff45d0e9a9c..9a2ae282a46ba4b1 100644
> --- a/arch/arm/boot/dts/renesas/r8a73a4.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
> @@ -60,6 +60,32 @@ timer {
>  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
> +	tmu0: timer@e61e0000 {
> +		compatible = "renesas,tmu-r8a73a4", "renesas,tmu";
> +		reg = <0 0xe61e0000 0 0x30>;
> +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "tuni0", "tuni1", "tuni2";
> +		clocks = <&mstp1_clks R8A73A4_CLK_TMU0>;
> +		clock-names = "fck";
> +		power-domains = <&pd_c5>;
> +		status = "disabled";
> +	};
> +
> +	tmu3: timer@fff80000 {
> +		compatible = "renesas,tmu-r8a73a4", "renesas,tmu";
> +		reg = <0 0xfff80000 0 0x30>;
> +		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "tuni0", "tuni1", "tuni2";
> +		clocks = <&mstp1_clks R8A73A4_CLK_TMU3>;
> +		clock-names = "fck";
> +		power-domains = <&pd_a3r>;
> +		status = "disabled";
> +	};
> +
>  	dbsc1: memory-controller@e6790000 {
>  		compatible = "renesas,dbsc-r8a73a4";
>  		reg = <0 0xe6790000 0 0x10000>;
> @@ -654,6 +680,17 @@ extal1_div2_clk: extal1_div2 {
>  		};
>  
>  		/* Gate clocks */
> +		mstp1_clks: mstp1_clks@e6150134 {
> +			compatible = "renesas,r8a73a4-mstp-clocks", "renesas,cpg-mstp-clocks";
> +			reg = <0 0xe6150134 0 4>, <0 0xe6150038 0 4>;
> +			clocks = <&cp_clk>, <&mp_clk>;
> +			#clock-cells = <1>;
> +			clock-indices = <
> +				R8A73A4_CLK_TMU0 R8A73A4_CLK_TMU3
> +			>;
> +			clock-output-names =
> +				"tmu0", "tmu3";
> +		};
>  		mstp2_clks: mstp2_clks@e6150138 {
>  			compatible = "renesas,r8a73a4-mstp-clocks", "renesas,cpg-mstp-clocks";
>  			reg = <0 0xe6150138 0 4>, <0 0xe6150040 0 4>;
> diff --git a/include/dt-bindings/clock/r8a73a4-clock.h b/include/dt-bindings/clock/r8a73a4-clock.h
> index 1ec4827b80916054..655440a3e7c6868a 100644
> --- a/include/dt-bindings/clock/r8a73a4-clock.h
> +++ b/include/dt-bindings/clock/r8a73a4-clock.h
> @@ -24,6 +24,10 @@
>  #define R8A73A4_CLK_ZS		14
>  #define R8A73A4_CLK_HP		15
>  
> +/* MSTP1 */
> +#define R8A73A4_CLK_TMU0	25
> +#define R8A73A4_CLK_TMU3	21
> +
>  /* MSTP2 */
>  #define R8A73A4_CLK_DMAC	18
>  #define R8A73A4_CLK_SCIFB3	17
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

