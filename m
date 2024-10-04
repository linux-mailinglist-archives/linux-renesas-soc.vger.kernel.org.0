Return-Path: <linux-renesas-soc+bounces-9449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EC59909C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 18:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADD011F21DBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 16:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756701CACE2;
	Fri,  4 Oct 2024 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="a07iYV3Q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WgWDG5SB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E51C3037;
	Fri,  4 Oct 2024 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728061009; cv=none; b=OiD6sdLVOOpJN/JVcbFRI7nlKtBfSwo1qkEM7puPA/ZituuwMlIczB9HYOj2mdWyWZEtdp8A+Df6aMBqWYktLjIEK7A5aqI7rckAFHy/Jsy6QekbU1wEyJVUqZ7mFExyrMT853laDNe04ldBSw91NrjlxrRhHXNb9LaZg/2bz7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728061009; c=relaxed/simple;
	bh=MbVUxh0m0BSVAkzGFrpYyhz/iDYYeMBswlctV06m0aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlrxBjeDEPAqePaQm+xJedeeBCEaPjM6oaGSxE7fapWeigLBOgAPOwDtojk8rMWWosC/wLWd4RoXrrGLNh4gPcctGwVX1xwFFwd9YPaymOZenL7Cz5kR17nzWzgvPf9VhTt31mEqABapLI54Jwm1EgYilwYkEFmCvy6VQLKjytM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=a07iYV3Q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WgWDG5SB; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 598CB13802C5;
	Fri,  4 Oct 2024 12:56:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 04 Oct 2024 12:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728061006;
	 x=1728147406; bh=kMFZSJt24MRWF3x5Oty+CzhvJp3asHgtDbIURQNAjHE=; b=
	a07iYV3Q7H7UVOJtFN+JDOx5nQbnRzAK2g/IzSbPxDL2fF/noXkFTFjzobVK1NvD
	LPFYTJrxfbRY+yRpTFz1Fg1x1mGfgSO3KCg+s0eJhTSUc7a2FH6ogd93Retb+J1O
	xy/PFTpL7o4vkf9OkfTSQaOfKfnrsZCifwp0r8yT/0gEswp2cfYzjxRUnmEdbvZi
	7JzLTaw4GA+r52m1f+HjzA9IbLWPDa8IYER9ytAlzJaU/ey96jSbHAjwAI7LQXxt
	j04vrjQ5GpwtwcjdZYsOyctIfWzyytSqaoJu4KzZix13XIUS6EzQrGRUhqvfuGA/
	pAyPefx0rjpSKN6FlfrHHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728061006; x=
	1728147406; bh=kMFZSJt24MRWF3x5Oty+CzhvJp3asHgtDbIURQNAjHE=; b=W
	gWDG5SBuC8K7sMbNfj/rAKMcJJ4SuOVLzIOdMSZaCOgWUIS84Zgj/wDGLugP45fs
	3ZQTU/418wOXf+Y7KzkUiL7d8rkpfGsHzRXCvGSMls6SkxbHi+phaX+9+h5b7yQE
	LFtJwov+puxgkFWK/Ja7UunnqZvzYEOpffUXBgNGscBDG6wQ5O7y0MKlsJKGSWO+
	FFs2fEKOu3gRYwicIy0blu1iyzXWheKf4OsVXBFU/XjeUdfRgQerK6h+hCemsNCQ
	1JVTW+4zPBZzeLB7yYdCCNYqYCFylK4aNlUXOyBHv81al1RxeGj+urnhD+cWMQlw
	DnWXKIwZiYZkqavcz5XFg==
X-ME-Sender: <xms:Th4AZ4rZssvno8bH-lIkwlOy37RVg-e36LQ9MvBjTX3wJw-ZnAMWXA>
    <xme:Th4AZ-q3xumCndDt-a4qgc3dmrPoGUYBZTpXolA_mG2Mt1qG6sIDpQTGroUz4ycsi
    3oRlyyJT9W0AjjZ-yg>
X-ME-Received: <xmr:Th4AZ9Pi8IGa1RybVCxB02Vy4OqPW93gL0sCa0KPlJJkzWDNTa5ds-ip5MtVVPzIclCvZ-UmHaaK_1EaTzG7qgiytHHnZa6Ezw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedguddthecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Th4AZ_6RwRj1rI88iUyJabVWd5DEdHAX0_2S7zUt_lmzkwgpCBHWUw>
    <xmx:Th4AZ34hAYpXSgCp0Xt46r4fxDd2N-E-HDn8brhZt7rNUlxjchuMSg>
    <xmx:Th4AZ_gSoWun3Vv3YwnHCBDc7YwSZ7-ODFlLL101q6laiG5s6nimkg>
    <xmx:Th4AZx513Yll73aJyK3YvseoEkBTgJuN1ShTw8yGTNBdjXMaLlP5PQ>
    <xmx:Th4AZ0u1ERyh6RYhE_AdlexcwOw3-1OeCrcuDkr73HCF1Gowl9HxgmRd>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 12:56:45 -0400 (EDT)
Date: Fri, 4 Oct 2024 18:56:44 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 14/20] arm64: dts: renesas: Use interrupts-extended for
 I/O expanders
Message-ID: <20241004165644.GE3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <8409a184db92b8d03d95beffde2cc9a9752366a9.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8409a184db92b8d03d95beffde2cc9a9752366a9.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:56 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi  |  3 +--
>  arch/arm64/boot/dts/renesas/ebisu.dtsi               |  3 +--
>  .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts   |  3 +--
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi             | 12 ++++--------
>  .../boot/dts/renesas/white-hawk-cpu-common.dtsi      |  3 +--
>  5 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> index 5a15a956702a6be8..4a9d20249eaa9bc0 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -130,8 +130,7 @@ pca9654: gpio@20 {
>  	pca9654_lte: gpio@21 {
>  		compatible = "onnn,pca9654";
>  		reg = <0x21>;
> -		interrupt-parent = <&gpio5>;
> -		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&gpio5 25 IRQ_TYPE_EDGE_FALLING>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  		gpio-controller;
> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> index 4d16b8f0eae5474b..54ebffcd82d4337b 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -392,8 +392,7 @@ io_expander: gpio@20 {
>  		reg = <0x20>;
>  		gpio-controller;
>  		#gpio-cells = <2>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio2 22 IRQ_TYPE_LEVEL_LOW>;
>  	};
>  
>  	hdmi-encoder@39 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> index b1d035ca4d97a51a..58eabcc7e0e07f49 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -248,8 +248,7 @@ &i2c0 {
>  	io_expander_a: gpio@20 {
>  		compatible = "onnn,pca9654";
>  		reg = <0x20>;
> -		interrupt-parent = <&gpio0>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio0 0 IRQ_TYPE_LEVEL_LOW>;
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  		interrupt-controller;
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 5a5dd5ecb75e0e7c..f7330b2262b8af0c 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -235,8 +235,7 @@ gpio_exp_74: gpio@74 {
>  		#gpio-cells = <2>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
> -		interrupt-parent = <&gpio6>;
> -		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&gpio6 8 IRQ_TYPE_EDGE_FALLING>;
>  
>  		audio-out-off-hog {
>  			gpio-hog;
> @@ -296,8 +295,7 @@ gpio_exp_75: gpio@75 {
>  		#gpio-cells = <2>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
> -		interrupt-parent = <&gpio6>;
> -		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&gpio6 4 IRQ_TYPE_EDGE_FALLING>;
>  	};
>  };
>  
> @@ -317,8 +315,7 @@ gpio_exp_76: gpio@76 {
>  		#gpio-cells = <2>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
> -		interrupt-parent = <&gpio7>;
> -		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&gpio7 3 IRQ_TYPE_EDGE_FALLING>;
>  	};
>  
>  	gpio_exp_77: gpio@77 {
> @@ -328,8 +325,7 @@ gpio_exp_77: gpio@77 {
>  		#gpio-cells = <2>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
> -		interrupt-parent = <&gpio5>;
> -		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&gpio5 9 IRQ_TYPE_EDGE_FALLING>;
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> index 209cba75adec6d6c..337ba68342c475b5 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> @@ -215,8 +215,7 @@ &i2c0 {
>  	io_expander_a: gpio@20 {
>  		compatible = "onnn,pca9654";
>  		reg = <0x20>;
> -		interrupt-parent = <&gpio0>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio0 0 IRQ_TYPE_LEVEL_LOW>;
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  		interrupt-controller;
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

