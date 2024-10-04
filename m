Return-Path: <linux-renesas-soc+bounces-9437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BB999076A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14FBD2865FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BAA1AA7A7;
	Fri,  4 Oct 2024 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fzxMpIPx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qPU1nXQ5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF6A148316;
	Fri,  4 Oct 2024 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728055566; cv=none; b=AZgh0BMDPc5+glmQ2OnS3w0ZF3cH1mr/Vh64nEbWWilMD3gvCQpM8YiNP2+bdlsZn+szzOJQ8h/zOEbcM1MWbKh0ZnJ07sfzKTIjCGsOW6h/IZ6ayUZJ0WsExVvJ2EMPIxMcwB1wMiRTnId2IE2M3P46XlLukuhaorEL22AHlFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728055566; c=relaxed/simple;
	bh=SvYDkSucSWSIMqg+3i47vPz9eD7ZH4hhE13XrLPgwxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k40ANhpwe+nXdaYwrwnFmWRF8tyYPfDS5q0bmB1wRxupvtoGB41SqtOpS7H28Q2Veex/Ne96yEedVU3rfOVunLwORZtdNUXPf85Fbwr946qaGfG9kXcc4/x7Jm8lWjlYL8kWB49IiebSdhLL4eQeD9hk6aUO0WXzDHF8McJlWTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fzxMpIPx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qPU1nXQ5; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 45CCC1140202;
	Fri,  4 Oct 2024 11:26:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 04 Oct 2024 11:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728055562;
	 x=1728141962; bh=i1PtJgZu54CTz3672qgokI314kIA1KRjnU+caIo37BQ=; b=
	fzxMpIPxhini/MXpLIcif1PViwzQ2IZH6ZQZNfW5B5DEifdTYgBN+bSbbm7ge7Ew
	idjFuZCCI1IuZpsaexQYPSLUBohjeRni43aASqaFBhLJjYL3U0pIbtltLm/9NCCr
	/iC+iGKySX2eMN5duJxi0QVgEcbKa59+ErJzLSSzH2EZ2Xv31TALAjxsok78nkJ+
	KCAJRbUQ38FfoMu6oE+1cwmSUrxywxgvAllrZ6mHva+9KJVt/Z2D5CHsafS4CMWf
	uMzej1eOF2IlsO4KX+bFxXtVJTwFlko+BZois+JhZ7xEweRxLL1Qaqdo5Hx4gsu9
	N6GjpHULFIg4Bg3jzk+5AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728055562; x=
	1728141962; bh=i1PtJgZu54CTz3672qgokI314kIA1KRjnU+caIo37BQ=; b=q
	PU1nXQ5NV26hiEnTik1IrCZsA7g4O0OmHh5EOP0dlTuhy6TwmBqJyjlnhWpJKhCh
	7mpxoaFhA6ERmpC0YGBZcsA8oBRdGRqdUZb84ou1WF4aglbaAsINSFidFNoTdjC0
	ToMhJP2jSyCml7byZIO0W75lCpn99/y23AiV8KTEIPIlUQ+kFuU+HtXNaUU899rL
	FO7H9TKhbM4QvyKtpSTFvrInds+gfmrYezXOzkjO74FCeGa+7vz0oHdLrFU2ZWIU
	xowDOXEULl7ZleIk1pwTSeZqxhOiz3TsN9A1tS1tnz7xXlHrk8KGIjgx6t1R3FSj
	1v74sSRpykTk7fmJBkl8Q==
X-ME-Sender: <xms:CQkAZ6aIuhvB8fsDPhdMs_fZzmSQgh4u72aBqI2zlOce3L-Dwt48fQ>
    <xme:CQkAZ9ZuL5pBtAaWgaA_9JpFWUODr7Ah91AmvJrv9WzrB3NY8WTC_wDCYa6Vtyvcp
    QJYYbXxgvNduP68BP4>
X-ME-Received: <xmr:CQkAZ0_Nbvw2JcUwV2osPXK5dkQb4m-lXI7lB10znnVlMffTEQcyp7COXSMhUzMYhy3UiwSBQOylssY604uF_UvjqbM6FoFwNA>
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
X-ME-Proxy: <xmx:CgkAZ8rQWRPS9F12HYyO08ZPK6hF9LWuFF2h9HHIxBI-_JNWJFN20w>
    <xmx:CgkAZ1omT9E3ABq4aglA450u7Fp5JSHd0XBxhD2-n0RXji_J6t8O2Q>
    <xmx:CgkAZ6TMBiOAvOFXCTuu5xL4J3aLcUtuX6SOS69ddyy-5hmtoLNm6g>
    <xmx:CgkAZ1oLjlcFqj7n4DcrGHVRhFaMerpy5oWPJVfOFp1Nl75-584KXw>
    <xmx:CgkAZ2djE1aOBRMgSrV4z4h2bJA5EFq9YM6p7xkd5Xb_cvxMvegIvl90>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 11:26:01 -0400 (EDT)
Date: Fri, 4 Oct 2024 17:25:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/20] ARM: dts: renesas: Use interrupts-extended for
 HDMI bridges
Message-ID: <20241004152559.GJ2071111@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <850317c7818b100f9afe026e80b6d685affe81a0.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <850317c7818b100f9afe026e80b6d685affe81a0.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:45 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi            | 3 +--
>  arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts           | 3 +--
>  arch/arm/boot/dts/renesas/r8a7790-lager.dts                 | 3 +--
>  arch/arm/boot/dts/renesas/r8a7790-stout.dts                 | 3 +--
>  arch/arm/boot/dts/renesas/r8a7791-koelsch.dts               | 3 +--
>  arch/arm/boot/dts/renesas/r8a7791-porter.dts                | 3 +--
>  arch/arm/boot/dts/renesas/r8a7792-blanche.dts               | 3 +--
>  arch/arm/boot/dts/renesas/r8a7793-gose.dts                  | 3 +--
>  arch/arm/boot/dts/renesas/r8a7794-silk.dts                  | 3 +--
>  10 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi b/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
> index de52218ceaa4c0e0..ca58ea93f58fbbb1 100644
> --- a/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
> +++ b/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
> @@ -73,8 +73,7 @@ &i2c5 {
>  	hdmi@39 {
>  		compatible = "adi,adv7511w";
>  		reg = <0x39>;
> -		interrupt-parent = <&gpio0>;
> -		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio0 13 IRQ_TYPE_LEVEL_LOW>;
>  		clocks = <&cec_clock>;
>  		clock-names = "cec";
>  
> diff --git a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> index a0b574398055ad2d..5903c1f1356f26c6 100644
> --- a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> @@ -84,8 +84,7 @@ &i2c1 {
>  	hdmi@39 {
>  		compatible = "adi,adv7511w";
>  		reg = <0x39>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 0 IRQ_TYPE_LEVEL_LOW>;
>  		clocks = <&cec_clock>;
>  		clock-names = "cec";
>  		pd-gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> index 7c7a9f257567d4f8..e511eb425bc550e9 100644
> --- a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> @@ -150,8 +150,7 @@ &i2c4 {
>  	hdmi@39 {
>  		compatible = "sil,sii9022";
>  		reg = <0x39>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio2 29 IRQ_TYPE_LEVEL_LOW>;
>  
>  		ports {
>  			#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> index 97c13b31f476505c..5ef87f8088c4c81c 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> @@ -365,8 +365,7 @@ adv7180: endpoint {
>  		hdmi@39 {
>  			compatible = "adi,adv7511w";
>  			reg = <0x39>;
> -			interrupt-parent = <&gpio1>;
> -			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio1 15 IRQ_TYPE_LEVEL_LOW>;
>  			clocks = <&cec_clock>;
>  			clock-names = "cec";
>  
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> index 1593609064104ae4..9287724187ef3b69 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> @@ -299,8 +299,7 @@ &iic2	{
>  	hdmi@39 {
>  		compatible = "adi,adv7511w";
>  		reg = <0x39>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 15 IRQ_TYPE_LEVEL_LOW>;
>  		clocks = <&osc4_clk>;
>  		clock-names = "cec";
>  
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> index 758d8331e7af66c4..bce93db4c9df5e18 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> @@ -397,8 +397,7 @@ adv7180: endpoint {
>  		hdmi@39 {
>  			compatible = "adi,adv7511w";
>  			reg = <0x39>;
> -			interrupt-parent = <&gpio3>;
> -			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio3 29 IRQ_TYPE_LEVEL_LOW>;
>  			clocks = <&cec_clock>;
>  			clock-names = "cec";
>  
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> index 267b3623655fbc38..92b54e043795ba08 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> @@ -194,8 +194,7 @@ adv7180: endpoint {
>  		hdmi@39 {
>  			compatible = "adi,adv7511w";
>  			reg = <0x39>;
> -			interrupt-parent = <&gpio3>;
> -			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio3 29 IRQ_TYPE_LEVEL_LOW>;
>  
>  			avdd-supply = <&reg_1p8v>;
>  			dvdd-supply = <&reg_1p8v>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> index 7eefa227d65514a9..69009535814406fe 100644
> --- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> @@ -335,8 +335,7 @@ &i2c1 {
>  	hdmi@39 {
>  		compatible = "adi,adv7511w";
>  		reg = <0x39>;
> -		interrupt-parent = <&irqc>;
> -		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&irqc 3 IRQ_TYPE_EDGE_FALLING>;
>  
>  		avdd-supply = <&d1_8v>;
>  		dvdd-supply = <&d1_8v>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> index f3f62206088348c6..45ef1d1900245a11 100644
> --- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> @@ -383,8 +383,7 @@ adv7180_out: endpoint {
>  		hdmi@39 {
>  			compatible = "adi,adv7511w";
>  			reg = <0x39>;
> -			interrupt-parent = <&gpio3>;
> -			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio3 29 IRQ_TYPE_LEVEL_LOW>;
>  
>  			avdd-supply = <&reg_1p8v>;
>  			dvdd-supply = <&reg_1p8v>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> index 8857bb4a9b91d969..5ed5b426f9639775 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> @@ -262,8 +262,7 @@ adv7180: endpoint {
>  		hdmi@39 {
>  			compatible = "adi,adv7511w";
>  			reg = <0x39>;
> -			interrupt-parent = <&gpio5>;
> -			interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio5 23 IRQ_TYPE_LEVEL_LOW>;
>  
>  			avdd-supply = <&d1_8v>;
>  			dvdd-supply = <&d1_8v>;
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

