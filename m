Return-Path: <linux-renesas-soc+bounces-9436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9520990712
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 047111C20B0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C77A481CE;
	Fri,  4 Oct 2024 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FM0zMwXx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ioj8xxLC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84AE1D9A47;
	Fri,  4 Oct 2024 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728054273; cv=none; b=NK1ReIEQt7BehvuxS9m/j4nkyUhkTyrv/Sh0swLCETNtR9EU/YJYmJhnjC4MCy1aPJsItApMMjTv63qELBxdMsRTP6gHkKw1s0Bp1pDTcIGl0g2b5tWXATea3ypXxWG+W7oJQxdmBNWsp9QdXWOjE2xMT/56yjjD+zKlpHM6C3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728054273; c=relaxed/simple;
	bh=ZFMSYUjuyS2Oy5hk2+z4kloBk5By/ujg2f3qRQ2q6C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cILaz8oy2qTqi4IE+0ArLAx4P/3Mg+hQfqERhi4GroGi0wOGrEKa+5u1zxPKwB5EGTmymRx3UGuCmpW0lomCok2J42vC7EPVKBCm6FBHhYAye8j0gwGeDENl6WSYQDMOgcSt7tGHZC0tsHlybaIbrIqQQSkqRlNutywrdC9JYME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FM0zMwXx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ioj8xxLC; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id EA3751380298;
	Fri,  4 Oct 2024 11:04:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 04 Oct 2024 11:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728054268;
	 x=1728140668; bh=dd6N/R856yCFLLDvfp2ocNlkl+9DamU2qSo0anLfsSI=; b=
	FM0zMwXx72vlaFdwcHjk7Fr5636JEWhyfJumiG6i7E4GhxiLNQozkbduFOrTwgvj
	X1g2bjWNSenX/CfAXZMtQQyz5lMFxNN+RgtW5q6hLs88WHpw8GOuay/2lbGU/rF8
	7Tkj5EGB0Pr8RvjFcp5eHTkpX9vJCHA4OqknYrUmcZFTpcdYZ3mHQspQx6FZBRcF
	XFT5ONK5XH9VgA7UhICyPGDkRsCQE1lxz1ljhf0kabon9p7BddV4dF0fYPjOkTkf
	iZs7mALPHtPcXX1t1uJ/OEsnBq3Fv4cvST8M/7H69GkoXok8DCeRNsoJ8aol1+AT
	bIxkJuWVaIyTPvDlqozh3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728054268; x=
	1728140668; bh=dd6N/R856yCFLLDvfp2ocNlkl+9DamU2qSo0anLfsSI=; b=I
	oj8xxLCB98ffObfw997BrNSbdX+uGEyyvruNaluMYswOGNAotVW8O9mIbK1ht/ke
	GOwD361m5rP/bzvemn4Dn1H6UqypEv9ryhSENHOQQG5a6AVTuh6PUusj9xQsPoiP
	vJW4ExQgBQ4AhpdZSNg5bJJLKoxKIu/uXGNgbhyt7gKyzc3k9hVbm9Pyf6Ck9Nz7
	cEvvajgKgw8G7egKLysVpkmHPYR3y+Nx9z4HXhV2ollWpQSZvXw/RVTKnYHFdtRw
	yCDbwArYI0mGWEnszoHJWPtPv1G62EHabZdy4+tM2m6ozEf1D+bQ7SwkTy3TXAJ8
	JLgtlZ6AXzaK9N4xlCy1Q==
X-ME-Sender: <xms:_AMAZ3zt7txavN92WfZtGZ449kzu1PMle__c-ag9ir0knmNgkyKYgQ>
    <xme:_AMAZ_ShXnl6lXzzhdpGGcdr8Rb5HKDTBeQuW9_xt1utN8pKfrO_8wLB7f9D9GZSK
    SbAyY-GCTsP5K0V2Qc>
X-ME-Received: <xmr:_AMAZxWFHI_PmT-hz3X-ZOJiKE9Uf5PgGDlkuWFgvob_8K04Ataj1rJtoJfiCs4SphyrIrkDAFADfu0VcV-DaeXTj9G4VAaBzQ>
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
X-ME-Proxy: <xmx:_AMAZxj09LiFEdwAlDXWJJPzTpDqAA0zqbDV2jYyWxIbQHY7bF2v6Q>
    <xmx:_AMAZ5BC_eVqB66nRM2hrZvQhoZwILfdKktJeH97jApvlkTaUoPMDw>
    <xmx:_AMAZ6JTSTTd7zuGzVtbTlUNvVXgNV1EQigkkHYbRhRQk8suvzdUGQ>
    <xmx:_AMAZ4C5USxUAbyMrujeL5taJFXsqNEgxcRFDotuMwNr2vW_yaPACw>
    <xmx:_AMAZ72pIr6xCdJplClYAxdzo7PHFFlXlsHmSgW2Zr3pXcF_sbcAB67Q>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 11:04:28 -0400 (EDT)
Date: Fri, 4 Oct 2024 17:04:26 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 02/20] ARM: dts: renesas: Use interrupts-extended for
 Ethernet PHYs
Message-ID: <20241004150426.GI2071111@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <623645456e7636f43150a70f8603114b26304818.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <623645456e7636f43150a70f8603114b26304818.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:44 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts    | 3 +--
>  arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts    | 3 +--
>  arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7790-lager.dts       | 3 +--
>  arch/arm/boot/dts/renesas/r8a7790-stout.dts       | 3 +--
>  arch/arm/boot/dts/renesas/r8a7791-koelsch.dts     | 3 +--
>  arch/arm/boot/dts/renesas/r8a7791-porter.dts      | 3 +--
>  arch/arm/boot/dts/renesas/r8a7793-gose.dts        | 3 +--
>  arch/arm/boot/dts/renesas/r8a7794-alt.dts         | 3 +--
>  arch/arm/boot/dts/renesas/r8a7794-silk.dts        | 3 +--
>  10 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
> index ff274bfcb6646ea7..9b16fe7ce713c903 100644
> --- a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
> @@ -73,8 +73,7 @@ phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id0022.1537",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> -		interrupt-parent = <&irqc>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc 0 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
>  		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
>  	};
> diff --git a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
> index 0a75e8c79acc0e58..571615a506207169 100644
> --- a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
> @@ -68,8 +68,7 @@ phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id0022.1537",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> -		interrupt-parent = <&irqc>;
> -		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc 8 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
>  		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
>  	};
> diff --git a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> index 6448022852491661..7c7a9f257567d4f8 100644
> --- a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> @@ -82,8 +82,7 @@ phy3: ethernet-phy@3 {
>  		compatible = "ethernet-phy-id0022.1622",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <3>;
> -		interrupt-parent = <&gpio5>;
> -		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio5 16 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
>  	};
>  };
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> index 826a29064d27f663..97c13b31f476505c 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> @@ -692,8 +692,7 @@ phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id0022.1537",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
>  		reset-gpios = <&gpio5 31 GPIO_ACTIVE_LOW>;
>  	};
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> index 683f7395fab0b696..1593609064104ae4 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> @@ -211,8 +211,7 @@ phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id0022.1537",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 1 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
>  		reset-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
>  	};
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> index 0a8eac57135f2e81..758d8331e7af66c4 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> @@ -659,8 +659,7 @@ phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id0022.1537",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
>  		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
>  	};
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> index 93c86e9216455577..267b3623655fbc38 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> @@ -329,8 +329,7 @@ phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id0022.1537",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
>  		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
>  	};
> diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> index 1ea6c757893bc0bf..f3f62206088348c6 100644
> --- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> @@ -622,8 +622,7 @@ phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id0022.1537",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
>  		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
>  	};
> diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
> index b5ecafbb2e4de582..1e04b8630ef3f3ca 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
> @@ -381,8 +381,7 @@ phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id0022.1537",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
>  		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
>  	};
> diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> index 595e074085eb4cd3..8857bb4a9b91d969 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> @@ -415,8 +415,7 @@ phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id0022.1537",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> -		interrupt-parent = <&irqc0>;
> -		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
>  		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
>  	};
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

