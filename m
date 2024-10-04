Return-Path: <linux-renesas-soc+bounces-9435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EACE99070D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7C931F21726
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427131AA7BB;
	Fri,  4 Oct 2024 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XuHnM9jw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Tt/4inet"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05331D9A43;
	Fri,  4 Oct 2024 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728054193; cv=none; b=NQuKnGJsq0FgQzl3VV34j+/Yqlx0ZJkM7+mrOYieneZoOEj34yyjy/2hfhVDq94JiirmQpuRWFGrnYXVZ1CRX1r16psxCqtdOAP/NnVfqWL1pnDV8IMzwQA/Z6J5eYkwzHBboKvwwtCN7skFSVYz9lyPcsUNp8FWQ8iulJgAq5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728054193; c=relaxed/simple;
	bh=wntJ1TpHnBnMq1ItrsdmltCfvN4xWs5lGkhGuRRycKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/tlQQ8kApXD1vWdMq76mAxm+ap5fCk/so/oUypw2101DS3Cvahm1Bo1f5U9jc4Y/RAHQSLaFnnobg7VlGokIIEel0WWuMN3YVTpZrvi6WDqx465OQYOE4k5YE22UzEcSKx2exKaSwD5QyOi8QkG+7q0AlZsXOqU7R75Fsj6SHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XuHnM9jw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Tt/4inet; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 7B1781380142;
	Fri,  4 Oct 2024 11:03:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Fri, 04 Oct 2024 11:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728054186;
	 x=1728140586; bh=wieA7dN8yTavyw8Wu/8p6/7/at68i6/zGdUFISGUbKg=; b=
	XuHnM9jwkn0TZg4LT6iBMJwre3YQgLhanq3mqyn+JFO6UPKsBAItennB9TBG82Ax
	79RGsSjzkK548JwrsYQz1iKKlLXZ6flMCxHPOhMVQzE2m2Jlyv+K+xZr+yKjKxS6
	U5r3hai9jGyg//0d14xTYYv94hYN+pXiTisngihXNrgyAy4bLNRR/thzU3zNWGD6
	TNoQJVmI8edc4CLX2pPnfe1yqQBpLW4TzFa6hbI7FAjEq6qjZt4lLErWBZC58556
	IduBXZ3f55SWqtXWHI0+PhhN6vAApC0r2Vuvuf82sm4XYaUz6cvn7B8ENydjqtb9
	+pJrs4YrnFvZ3/l7gukdSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728054186; x=
	1728140586; bh=wieA7dN8yTavyw8Wu/8p6/7/at68i6/zGdUFISGUbKg=; b=T
	t/4inetYO2LDdeVeXSndPanp6CQBoYyamRQybf/XCiYn8hMjncs5xzULNgCijTRD
	TsWZGcxtv97iz3AqCY7Z/vpjRcL1aULPUc3r9TkyPEXvQ/JMyQL3gIbGXLZ71kwF
	3GvqPvL1KNZo4B/jmisixV9D7zK+xXzgHetkVbwaCXi/Ef2yC3KEEdUTVD6Ekw7M
	o0wiEzqcMydYgzQCgGMTDWzmzXBaOE/R5Hks+MYqv3ItHi4bNv/zoLJfaEBN2Mb1
	VrpJKjqmsInIf4Sjtj5gmgRyxxJGweHp78SY1LmaSX9d5/i9eoaX7hqotpcKdgBT
	A1fsF+hOKPSx4mbcNi7eA==
X-ME-Sender: <xms:qgMAZww7HAK1nYV5BaeBDrVq8SRHEIGBddGK43gnIrey2NblY7tYSQ>
    <xme:qgMAZ0QIGGLWY5L5t2VUsZpUjia-UG_rnHxWuRJJqH4aY-xDitF65KdMLCd0yQKCI
    Y7n7v_1OZeDOk-Xvmo>
X-ME-Received: <xmr:qgMAZyX1uOkwbCQ5oLH0JYIg2w6QC3piqO4wsUQ0QdERJ05R3h0hTmBPib0Gt4NI3R90D22hp95y2me140eh8mt3d-pX1UEjWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgkeefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:qgMAZ-gK_wgkLWSnzfimsbBhkCJ4Y98gfUUc1glxuTvsFATNUnGbag>
    <xmx:qgMAZyDZh3KyxJrenPmGJ_UiBmSp9ptB13rJInhXmkSLLjPC5BVblA>
    <xmx:qgMAZ_LOUDsDwMbEWO3i7QWapFknSCaWoGCypfIRa9cCE1JLrZT6og>
    <xmx:qgMAZ5AaC_HsNRCvnhQ-birEiHPheWQeQJlkVs9ekUz3m0R9UOkYdg>
    <xmx:qgMAZ017fq5XlQbuiCaNk7FGdM_d_2iosrgTwBuYM-KlH1_2VeUfEjIx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 11:03:05 -0400 (EDT)
Date: Fri, 4 Oct 2024 17:03:02 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/20] ARM: dts: renesas: Use interrupts-extended for
 Ethernet MACs
Message-ID: <20241004150302.GH2071111@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <f51de53cb003f850751e13fdbddea64ad942ee7b.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f51de53cb003f850751e13fdbddea64ad942ee7b.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:43 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/emev2-kzm9d.dts     | 3 +--
>  arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7778-bockw.dts   | 3 +--
>  arch/arm/boot/dts/renesas/r8a7779-marzen.dts  | 3 +--
>  arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7792-wheat.dts   | 3 +--
>  arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts    | 3 +--
>  7 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/renesas/emev2-kzm9d.dts b/arch/arm/boot/dts/renesas/emev2-kzm9d.dts
> index 89495dd373585e94..c624fd61578b3b72 100644
> --- a/arch/arm/boot/dts/renesas/emev2-kzm9d.dts
> +++ b/arch/arm/boot/dts/renesas/emev2-kzm9d.dts
> @@ -83,8 +83,7 @@ ethernet@20000000 {
>  		compatible = "smsc,lan9221", "smsc,lan9115";
>  		reg = <0x20000000 0x10000>;
>  		phy-mode = "mii";
> -		interrupt-parent = <&gpio0>;
> -		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
> +		interrupts-extended = <&gpio0 1 IRQ_TYPE_EDGE_RISING>;
>  		reg-io-width = <4>;
>  		smsc,irq-active-high;
>  		smsc,irq-push-pull;
> diff --git a/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
> index ae656ee27124c745..94a39ffc4297b788 100644
> --- a/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
> +++ b/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
> @@ -207,8 +207,7 @@ partition@80000 {
>  	ethernet@8000000 {
>  		compatible = "smsc,lan9220", "smsc,lan9115";
>  		reg = <0x08000000 0x1000>;
> -		interrupt-parent = <&irqc1>;
> -		interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts-extended = <&irqc1 8 IRQ_TYPE_LEVEL_HIGH>;
>  		phy-mode = "mii";
>  		reg-io-width = <4>;
>  		smsc,irq-active-high;
> diff --git a/arch/arm/boot/dts/renesas/r8a7778-bockw.dts b/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
> index a3f9d74e8877b72b..e27d7dd8c869bb2d 100644
> --- a/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
> @@ -96,8 +96,7 @@ ethernet@18300000 {
>  		reg = <0x18300000 0x1000>;
>  
>  		phy-mode = "mii";
> -		interrupt-parent = <&irqpin>;
> -		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&irqpin 0 IRQ_TYPE_EDGE_FALLING>;
>  		reg-io-width = <4>;
>  		vddvario-supply = <&fixedregulator3v3>;
>  		vdd33a-supply = <&fixedregulator3v3>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
> index fec08562d12c1813..9793d8781d6e9425 100644
> --- a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
> @@ -261,8 +261,7 @@ ethernet@18000000 {
>  		pinctrl-names = "default";
>  
>  		phy-mode = "mii";
> -		interrupt-parent = <&irqpin0>;
> -		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&irqpin0 1 IRQ_TYPE_EDGE_FALLING>;
>  		smsc,irq-push-pull;
>  		reg-io-width = <4>;
>  		vddvario-supply = <&fixedregulator3v3>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> index 540a9ad28f28ac1a..7eefa227d65514a9 100644
> --- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> @@ -224,8 +224,7 @@ ethernet@18000000 {
>  		compatible = "smsc,lan89218", "smsc,lan9115";
>  		reg = <0x18000000 0x100>;
>  		phy-mode = "mii";
> -		interrupt-parent = <&irqc>;
> -		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&irqc 0 IRQ_TYPE_EDGE_FALLING>;
>  		smsc,irq-push-pull;
>  		reg-io-width = <4>;
>  		vddvario-supply = <&d3_3v>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
> index 000f21a2a8630a8e..bfc780f7e396b408 100644
> --- a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
> @@ -115,8 +115,7 @@ ethernet@18000000 {
>  		compatible = "smsc,lan89218", "smsc,lan9115";
>  		reg = <0x18000000 0x100>;
>  		phy-mode = "mii";
> -		interrupt-parent = <&irqc>;
> -		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&irqc 0 IRQ_TYPE_EDGE_FALLING>;
>  		smsc,irq-push-pull;
>  		smsc,save-mac-address;
>  		reg-io-width = <4>;
> diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> index 98897f710063a91b..15d89c20618a16b7 100644
> --- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> +++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> @@ -172,8 +172,7 @@ ethernet@10000000 {
>  		compatible = "smsc,lan9221", "smsc,lan9115";
>  		reg = <0x10000000 0x100>;
>  		phy-mode = "mii";
> -		interrupt-parent = <&irqpin0>;
> -		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&irqpin0 3 IRQ_TYPE_EDGE_FALLING>;
>  		reg-io-width = <4>;
>  		smsc,irq-push-pull;
>  		smsc,save-mac-address;
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

