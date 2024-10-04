Return-Path: <linux-renesas-soc+bounces-9455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B97990A4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 19:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A68D1C21160
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C461DAC96;
	Fri,  4 Oct 2024 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JiUL8bq9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RwsuthlH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA591DAC95;
	Fri,  4 Oct 2024 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728063674; cv=none; b=oKp+bS6yDu3AKmMIs+9eEtf7I/Ewe5wbENwBGqDJz7JYWWhF9Poeu0uwc4oICTT7eWEQAw4oeye0PHFnwEJ4C9MNOguNDwktytEdBEFeB1+6U0mL+3kWuuwjvjOxFctFLWabUxPwlHntILH187bYES+KQV+xlywR24sCx8SB2PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728063674; c=relaxed/simple;
	bh=t2fJN5jQeaviZP4zVPNp6V/nIaaC0jQ4jqBrytCxyBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9ItwvtLM22XAD1Qem7eM/m7T+yrOowOCB/gaJHUBkx99q96OP6ZVtEpVxgA6QFvyrMCVtJo8NDltNB4qqEwzbGU8H6c7g3wGEhxIzqTAgP6kfup2DTQvM0RiWPOVGeDQ+qfykdpDamz5fFfFe7zjDqMwXK9AmgRfJqgMg7UTaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JiUL8bq9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RwsuthlH; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CFE87114021E;
	Fri,  4 Oct 2024 13:41:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 04 Oct 2024 13:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728063671;
	 x=1728150071; bh=pW6rmCW0V+Jvce2b9GrYj7VEQ3QOuOnRhxfVGhk65lI=; b=
	JiUL8bq9tGFS8+I9dmBmDvsMmAZLOobPk8ochxWDdK5StMypYB2ed0Lc99K2W35H
	7Nq5kslK3CcmYy4aYwXfbErcW2YbiO42UxRFx1reDv6d3qXLwV8th/NjmFpKwtL+
	aqImeXYk5ZN1YJzF5mcRKKfDRTDFCMrqq29kjXk5i6r/KdDz45L+ZbupTZQeM40A
	qJc3QMmZyEz99H0TKH6dnjH8FROzeeSScfpqflQ/vQiMJ2/vrW8Au4rDDwt+0PNe
	nzxEJXQ0eYFm+axtoLdbSi1D9HoS9/Buq1brwDJQ2VX24OL0DlZzRMD6s48Gbi9S
	rzvjOUg2o4iIJHblb1VEMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728063671; x=
	1728150071; bh=pW6rmCW0V+Jvce2b9GrYj7VEQ3QOuOnRhxfVGhk65lI=; b=R
	wsuthlH/qns9UhsPcd8AdIxwbaB3Ihiig2MzeK7pxC2DEA2DbdJiUECHo05qK+MB
	jC/YVnyEYywJCNt2B2mOC07qVnaYgSFtWaQCWe+Pz8EiWDaZCTFH8dvQ6tiqre6V
	JKY1CN0hqvdO85/LJgsTr6dms5YYI+eMySG5FDQgsLWsCmjPonuMLmKXy9slZ+hp
	2M2+Vx0zCCO6O8hdy0PdGCmpzMUyg14SfMwjTbEy7tU2Aa9Ojw918MRcdFxNEqqK
	RbammLrxqNE2FrbwfYcNfzOM0ZpzsePFecKuUPXdMUWfA2xdNQ3x1+pHpiKr8z9b
	ZKiGiiDtFFafJZ/071Pxw==
X-ME-Sender: <xms:tygAZ5CwNpV3k_K9qnpY_zsEHzgAf7_EtMCEOhzFyZZv1P7fxULM0Q>
    <xme:tygAZ3ipoJflS0GXFpFlCpXPb_sMJTh6rx-bkmQLCwBuOmZNXMnmqSO3TgdNcv1YM
    HChYf_8gmSEkqzYCeU>
X-ME-Received: <xmr:tygAZ0lQqikOSZunq-zBWXIp4HCcXceh9LzrQmTIkz-M-w9aiolhskSm5LIqnfb6eUbLL23SrQKBH6ObaKwMTznONLCNP_uuog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhl
    ihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhi
    nhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvg
    htrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:tygAZzwx1VfAW5gRE5xeFShkxBE42WN9DhHRsXSYjq7L0LN-PMCYXQ>
    <xmx:tygAZ-SilZdXzt9A_wyA0_hdtxGrlOmxvsdvxxHbEVp0opLetARy1Q>
    <xmx:tygAZ2bPJV7NAOKff9m4VAZ_uI7bn44cIYzXoM9iQ3UdavZcYGFVHg>
    <xmx:tygAZ_SDFCdPbmfe_2gSdYxxvaS36K_Jom75Xj0s11xwl3QaD85_cw>
    <xmx:tygAZ9FZ8fzNXYj9VaTE1kHSCWGE6Ulofg9NYy-vXspp1JA3uHI7M7-u>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 13:41:11 -0400 (EDT)
Date: Fri, 4 Oct 2024 19:41:08 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 17/20] arm64: dts: renesas: Use interrupts-extended for
 video decoders
Message-ID: <20241004174108.GH3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <4ee2e3e1e0e174782bd4d2af44bb6150d24af551.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ee2e3e1e0e174782bd4d2af44bb6150d24af551.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:59 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/ebisu.dtsi                     | 5 ++---
>  .../dts/renesas/r8a77970-eagle-function-expansion.dtso     | 7 +++----
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi           | 5 ++---
>  3 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> index b4e0347d3617a83e..ab8283656660059a 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -434,10 +434,9 @@ video-receiver@70 {
>  		compatible = "adi,adv7482";
>  		reg = <0x70>;
>  
> -		interrupt-parent = <&gpio0>;
> +		interrupts-extended = <&gpio0 7 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gpio0 17 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-names = "intrq1", "intrq2";
> -		interrupts = <7 IRQ_TYPE_LEVEL_LOW>,
> -			     <17 IRQ_TYPE_LEVEL_LOW>;
>  
>  		ports {
>  			#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
> index 3aa243c5f04c8022..9450d8ac94cbe977 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
> @@ -82,8 +82,7 @@ hdmi-decoder@4c {
>  		compatible = "adi,adv7612";
>  		reg = <0x4c>, <0x50>, <0x52>, <0x54>, <0x56>, <0x58>;
>  		reg-names = "main", "afe", "rep", "edid", "hdmi", "cp";
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
>  		default-input = <0>;
>  
>  		ports {
> @@ -114,8 +113,8 @@ video-receiver@70 {
>  		       0x60 0x61 0x62 0x63 0x64 0x65>;
>  		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
>  			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <03 IRQ_TYPE_LEVEL_LOW>, <04 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio3 3 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gpio3 4 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-names = "intrq1", "intrq2";
>  
>  		ports {
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index 08f4e35c414ebbcf..269cda6fae21de70 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -544,10 +544,9 @@ video-receiver@70 {
>  		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
>  			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
>  
> -		interrupt-parent = <&gpio6>;
> +		interrupts-extended = <&gpio6 30 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gpio6 31 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-names = "intrq1", "intrq2";
> -		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
> -			     <31 IRQ_TYPE_LEVEL_LOW>;
>  
>  		ports {
>  			#address-cells = <1>;
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

