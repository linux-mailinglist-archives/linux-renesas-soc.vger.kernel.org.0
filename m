Return-Path: <linux-renesas-soc+bounces-9438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2BB99076C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6952FB2116F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9AC481CE;
	Fri,  4 Oct 2024 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fwg+AOSi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p+Gt+bJy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4EC1D9A43;
	Fri,  4 Oct 2024 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728055629; cv=none; b=kD2g9vb7GM7FSHqdU/9MzeOR5UUFFUxZJFCgNW0aFyooiUpCExxKTNjiykKexl9Gtc4eqIe+74ma1tXaictSwfIp/OB9LXAOGXMRoduDFcI//+rjOlZQObCmeMjVzW70StmvRx29EtmrBNHOr14xIqJdi2zTf0mfXBMVeYJjoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728055629; c=relaxed/simple;
	bh=nnezLlzRSKZI5ecZ+KHGLC+anXhicF8xvBnRHkpI+d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouSki3tfdouMo1UAdH4ZQlWGnjpYEFocM90WObwvJeieyi/abeGNHIp+Bs+wULNGy7+CDXVD7BcTBnHlF4+lIz+5xNmHlgRy6TZbhXklgaUTGVw0I8Dr2qjDKsxFPhMQB36mkVQZRU2KdcxMoGL/6VWa8PFilHNAMS7TYrbaYyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fwg+AOSi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p+Gt+bJy; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3053611401C5;
	Fri,  4 Oct 2024 11:27:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 04 Oct 2024 11:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728055626;
	 x=1728142026; bh=GG4QI1g3TF4ytuP94yH1yIRt0/O0ibCdehL7DA06G1I=; b=
	fwg+AOSi4cs2f5z8b9ZSPVzEhEW9jwiMT+K9Yg5AdmlAvjXLtXM2bmtyQjOW7A/e
	TG+sCYGjJuZ9Tk0G5wTVWzXmqR7HrIFTr0My/jl2avwzFbqtb/P6o7GZmRiI4gpo
	LMJFmt1jBzNFkQtsuR8OJGDf/klfPR6y4WcHMqiEhaJ1n/3dekC6ZPSza2hCutrw
	w3fIVmCgsIXx4E7pFhxuGNhn/uDZw3x7cumb0+703bbJ/G2AQ5l7yLjWgVIuOLNS
	r9nq0uktbtf/7HpnpfUjNg80i5u3/bqM0IYMDe8pmlV19WxaJ3dMJdYeYLaYFY7y
	q58Q4gVYdv4Iv4Pta0lQRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728055626; x=
	1728142026; bh=GG4QI1g3TF4ytuP94yH1yIRt0/O0ibCdehL7DA06G1I=; b=p
	+Gt+bJyyJRewUEjS0c1Jl7eWwTZVIMUYGFAJ1ry1uQqVJuDv4F1/09jwfeAo1mgw
	JWrz75ISjS4mUfltc6X4u7kNQ5QUJeQ800Ba7IXOvafVBv5NDmRtobB1NtrPmPkW
	/Fj5edW1WyQfhQ3FwkuFtz5/662rX56VnN62HYIqEqgP0WJVaWpl51AThfcvD1V8
	PJq9iGFsOT8kwnkN7ZB79/iNksq9L6e+BmYRpEiZQI0rO85FMCcW/3sB8b6+WScV
	lT2INB4THcTs/ZpDvIYBa27Gp+CMEL6hjLv562uuT51jUJ7VgcqzmmscJjvooxRN
	PDZvt0eW7m8mpSn2kHPfg==
X-ME-Sender: <xms:SQkAZ6zplT5ZeBdWHL3jPl8EY4-t5u78qdLsB8zZUNvHSyFAKN23VA>
    <xme:SQkAZ2QiSzC2rGbyfOfhUiLqsY52istdk-ij_Aa_TSrKgS4s-YKMhQtrzFs2Cd4g2
    YsfRoNAmhKyFK3ZIhU>
X-ME-Received: <xmr:SQkAZ8XUc3SGkYCiIEMB_33lKlGjrgYtA6uZuX221vO70IBiDx23GHwQN0daXiJSsNRRwDAB59xE1tBL5j16ILzK8ZCqwgYlVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhi
    uggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomh
    dprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhn
    ghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:SQkAZwgC-ua5HUgj8ILKRxWACXjojbib_dOSOHSVkhVl26vLtGBkDg>
    <xmx:SgkAZ8DR6QEHSzM5mS5ZZ8m2ImTZushfeTZ40t1GIvxCBqXOsbrkQQ>
    <xmx:SgkAZxJr50BepeJoTGjCMaZ8e5nJZHZZIdZlaO0P0VEFPS9gthPf4g>
    <xmx:SgkAZzBU8E_dCDevkkmhU4uHZgvNgYsC-sXvGWbx1wkdk4IDYalKkA>
    <xmx:SgkAZ-0RQR3Wuy_LK8Ho5-6zbH8CC6uOkZugbiaPILG7c7ohicY_ic2W>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 11:27:05 -0400 (EDT)
Date: Fri, 4 Oct 2024 17:27:03 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/20] ARM: dts: renesas: Use interrupts-extended for
 PMICs
Message-ID: <20241004152703.GK2071111@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <934b9b9992dacd72dbad0f5433728aac292a3cfc.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <934b9b9992dacd72dbad0f5433728aac292a3cfc.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:46 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 6 ++----
>  arch/arm/boot/dts/renesas/r8a7790-stout.dts   | 9 +++------
>  arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 6 ++----
>  arch/arm/boot/dts/renesas/r8a7791-porter.dts  | 6 ++----
>  arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 6 ++----
>  arch/arm/boot/dts/renesas/r8a7794-alt.dts     | 3 +--
>  arch/arm/boot/dts/renesas/r8a7794-silk.dts    | 3 +--
>  8 files changed, 14 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> index 5ef87f8088c4c81c..47ffa278a0dfd79e 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> @@ -443,8 +443,7 @@ i2cpwr: i2c-mux4 {
>  		pmic@58 {
>  			compatible = "dlg,da9063";
>  			reg = <0x58>;
> -			interrupt-parent = <&irqc0>;
> -			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  
> @@ -460,8 +459,7 @@ watchdog {
>  		vdd_dvfs: regulator@68 {
>  			compatible = "dlg,da9210";
>  			reg = <0x68>;
> -			interrupt-parent = <&irqc0>;
> -			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  
>  			regulator-min-microvolt = <1000000>;
>  			regulator-max-microvolt = <1000000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> index 9287724187ef3b69..d7c0a9574ce83144 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> @@ -342,8 +342,7 @@ &iic3 {
>  	pmic@58 {
>  		compatible = "dlg,da9063";
>  		reg = <0x58>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  
> @@ -363,8 +362,7 @@ watchdog {
>  	vdd_dvfs: regulator@68 {
>  		compatible = "dlg,da9210";
>  		reg = <0x68>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  
>  		regulator-min-microvolt = <1000000>;
>  		regulator-max-microvolt = <1000000>;
> @@ -375,8 +373,7 @@ vdd_dvfs: regulator@68 {
>  	vdd: regulator@70 {
>  		compatible = "dlg,da9210";
>  		reg = <0x70>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  
>  		regulator-min-microvolt = <1000000>;
>  		regulator-max-microvolt = <1000000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> index bce93db4c9df5e18..1a0d2c6ed0e83ce7 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> @@ -814,8 +814,7 @@ &i2c6 {
>  	pmic@58 {
>  		compatible = "dlg,da9063";
>  		reg = <0x58>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  
> @@ -831,8 +830,7 @@ watchdog {
>  	vdd_dvfs: regulator@68 {
>  		compatible = "dlg,da9210";
>  		reg = <0x68>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  
>  		regulator-min-microvolt = <1000000>;
>  		regulator-max-microvolt = <1000000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> index 92b54e043795ba08..08381498350aacde 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> @@ -408,8 +408,7 @@ &i2c6 {
>  	pmic@5a {
>  		compatible = "dlg,da9063l";
>  		reg = <0x5a>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  
> @@ -421,8 +420,7 @@ watchdog {
>  	vdd_dvfs: regulator@68 {
>  		compatible = "dlg,da9210";
>  		reg = <0x68>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  
>  		regulator-min-microvolt = <1000000>;
>  		regulator-max-microvolt = <1000000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> index 69009535814406fe..a3986076d8e3e993 100644
> --- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> @@ -376,8 +376,7 @@ pmic@58 {
>  		reg = <0x58>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pmic_irq_pins>;
> -		interrupt-parent = <&irqc>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc 2 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  
> diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> index 45ef1d1900245a11..5334af25c10111c8 100644
> --- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> @@ -754,8 +754,7 @@ &i2c6 {
>  	pmic@58 {
>  		compatible = "dlg,da9063";
>  		reg = <0x58>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  
> @@ -771,8 +770,7 @@ watchdog {
>  	vdd_dvfs: regulator@68 {
>  		compatible = "dlg,da9210";
>  		reg = <0x68>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>  
>  		regulator-min-microvolt = <1000000>;
>  		regulator-max-microvolt = <1000000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
> index 1e04b8630ef3f3ca..882644cd7c1875c1 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
> @@ -449,8 +449,7 @@ &i2c7 {
>  	pmic@58 {
>  		compatible = "dlg,da9063";
>  		reg = <0x58>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio3 31 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  
> diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> index 5ed5b426f9639775..2a0819311a3c4ef3 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> @@ -434,8 +434,7 @@ &i2c7 {
>  	pmic@58 {
>  		compatible = "dlg,da9063";
>  		reg = <0x58>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio3 31 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

