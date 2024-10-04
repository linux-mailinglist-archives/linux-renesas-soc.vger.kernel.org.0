Return-Path: <linux-renesas-soc+bounces-9448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5161C9909C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 18:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFEF81F218A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 16:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F091D9A40;
	Fri,  4 Oct 2024 16:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OFEMxacf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pKw07Wy0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C51C3037;
	Fri,  4 Oct 2024 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728060973; cv=none; b=SS9gRoksvQd/8g1ZiXA9xobAdVEG6PwdUCxdT/BWHJrqMYPc5HMQR6JInxQC+Ckzq6OqUl+FiY/co027JGv2nR4deDiOVWUP2+xORs4l94uABk0G/boj0LGFDqL9ecL5OHdtRn9GgffEp99SjHz1mXLBG32Qjw0D4Gqrqo0nAPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728060973; c=relaxed/simple;
	bh=6HA07Gx2xRFSZR8PTzUHmTM1ITNEbG0VAx7QDiB+z9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlZhFrLr40fPwywRtEvg7QZXxVEeDa1TRkRU4P1dzOvxcj76lxMe780VzXkwTm52OWAz2pQ5HhsdZmk9stuIzT04GKx55n6QUZLLfU0Pfs43hDb+hCgvLIJH6bDTy5i/IKXi/WLclSWx0reLODkREXLlar/2Kp6UO/9GXU6ihv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OFEMxacf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pKw07Wy0; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4F98B11401EF;
	Fri,  4 Oct 2024 12:56:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 04 Oct 2024 12:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728060967;
	 x=1728147367; bh=93aOgPM2ytbT8vNrf3c0HmbzabZJXkvjyLmcxXCTo7k=; b=
	OFEMxacfQETEZIvOR9hxn6V86Vl3rLQN90kBBCwoUVtDnO4V9iHsFYo7AqDEQvBV
	iu9FTTHka5ZQ+B6hf1wKfTgtjObNMcEDhlhFbOnGWa10BJNxidqBWI2V/hZc3roe
	Lp6ew4lOrE+xKK3ymQq9E187iPs5qeiqCd23LpZQ5+ReG51K8KGqie0Im1Gxjreq
	6szHk+GONZzP6XZy/TiJVadWgHkRy7Ua9w+jB6pmP1a7hs8uZgBYIXZq78AZwfZd
	zcEKIU7f2c9gE0BPuWU2nPp9qjMYIdYcY2+AJYM1enGKg+uPbEW8FnniXJDasMkW
	dA9O+Hlx1ZOa2XvfI7isUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728060967; x=
	1728147367; bh=93aOgPM2ytbT8vNrf3c0HmbzabZJXkvjyLmcxXCTo7k=; b=p
	Kw07Wy0uZpH4oaY7qhu0fk8+HoZ5u/MrQDofGbzQ7x7qExbEa3Tt/Sis37QydCeF
	hDKpI6k9W6T4CPwKfm6oy0TxnsVuJS1jkOKSNGMBYMVqg1wJjEhfytcRh5eokAn7
	ymhHM8oJLKmDbhr0DsDYhCtGwTBqgTSEyyuPFPPFLZ8GaUefCbBBYSlccvVem2wd
	+KJM618OpYmDqpD062qrY874IKtioR10Da6wYKk387U1UsNPXLePXNEEGsdtpfMX
	wFys9/vdkNutHxvko3uQKN9yTvVty9qUx4Zy8Pva+FKV7TukeEih35PzqQcfRoyd
	8cMZorQOMJNC7hX1GAl0w==
X-ME-Sender: <xms:Jh4AZ1_58kQa4aQ6ioSAPlfH1k69TfQ_G6Pr_qmMYxaD6t2qtpb9Gw>
    <xme:Jh4AZ5ujCTXV5DAARD3PLvSgS_WX8NAqOuNLzBzOBDPfRTdF0Q11WaVM4wGZnUr5W
    pEPZJVvjItQUsXSNXg>
X-ME-Received: <xmr:Jh4AZzBDXHKl78nYxT2CWU_tI5k4K9YbWdEZJKdyVk5qlz5-VZE4-wOotca5ykOrI66BIpIBpnsiGp7ghOarFMe9jXfCyo5urg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedguddtiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Jh4AZ5cnyWozT_ncB1qQbefxxv3UgrGFJX1dSXQdox0HZlkUbuvKSw>
    <xmx:Jh4AZ6NJr97-NCrAu0ZEYq3tNhBOn8m866BXpK7GI3-qiKmky-wnBA>
    <xmx:Jh4AZ7lo9Qki4U2IGulGqtxYy9_nm-JcC8ldrwbhHeiOF8ySdh5gvA>
    <xmx:Jh4AZ0tevSRvmyZMnPqApKa-2p4xF49MPbask9W4fCNLpREgDAjd4g>
    <xmx:Jx4AZ2B0HbIkhG4NrqVGmFfAlRklZi1P6ZMVnL6IzGktpLGgojRi36P7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 12:56:06 -0400 (EDT)
Date: Fri, 4 Oct 2024 18:56:04 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 13/20] arm64: dts: renesas: Use interrupts-extended for
 HDMI bridges
Message-ID: <20241004165604.GD3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <7aabc9085f9206a9824d52f306df870e7f3eed3c.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7aabc9085f9206a9824d52f306df870e7f3eed3c.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:55 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/condor-common.dtsi  | 3 +--
>  arch/arm64/boot/dts/renesas/draak.dtsi          | 3 +--
>  arch/arm64/boot/dts/renesas/ebisu.dtsi          | 3 +--
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts  | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts  | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  | 3 +--
>  arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi    | 3 +--
>  arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi   | 3 +--
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi        | 3 +--
>  10 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
> index b2d99dfaa0cdf19d..375a56b20f267bf0 100644
> --- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
> @@ -195,8 +195,7 @@ io_expander1: gpio@21 {
>  	hdmi@39 {
>  		compatible = "adi,adv7511w";
>  		reg = <0x39>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
>  		avdd-supply = <&d1_8v>;
>  		dvdd-supply = <&d1_8v>;
>  		pvdd-supply = <&d1_8v>;
> diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
> index 402112a37d75a8c5..05712cd96d28bbdf 100644
> --- a/arch/arm64/boot/dts/renesas/draak.dtsi
> +++ b/arch/arm64/boot/dts/renesas/draak.dtsi
> @@ -367,8 +367,7 @@ hdmi-encoder@39 {
>  		compatible = "adi,adv7511w";
>  		reg = <0x39>, <0x3f>, <0x3c>, <0x38>;
>  		reg-names = "main", "edid", "cec", "packet";
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 28 IRQ_TYPE_LEVEL_LOW>;
>  
>  		avdd-supply = <&reg_1p8v>;
>  		dvdd-supply = <&reg_1p8v>;
> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> index 1aedd093fb41bf44..4d16b8f0eae5474b 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -399,8 +399,7 @@ io_expander: gpio@20 {
>  	hdmi-encoder@39 {
>  		compatible = "adi,adv7511w";
>  		reg = <0x39>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 1 IRQ_TYPE_LEVEL_LOW>;
>  
>  		avdd-supply = <&reg_1p8v>;
>  		dvdd-supply = <&reg_1p8v>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index d42e24d9c09b9162..486688b789b8cd58 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -232,8 +232,7 @@ hd3ss3220_out_ep: endpoint {
>  	tda19988: tda19988@70 {
>  		compatible = "nxp,tda998x";
>  		reg = <0x70>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 1 IRQ_TYPE_LEVEL_LOW>;
>  
>  		video-ports = <0x234501>;
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index 7dd9e13cf0074442..32f07aa2731678a5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -171,8 +171,7 @@ io_expander: gpio@20 {
>  	hdmi@39 {
>  		compatible = "adi,adv7511w";
>  		reg = <0x39>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
>  
>  		avdd-supply = <&d1p8>;
>  		dvdd-supply = <&d1p8>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> index 0a103f93b14d71ad..118e77f4477e389c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> @@ -148,8 +148,7 @@ hdmi@39 {
>  		compatible = "adi,adv7511w";
>  		#sound-dai-cells = <0>;
>  		reg = <0x39>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
>  		avdd-supply = <&vcc_d1_8v>;
>  		dvdd-supply = <&vcc_d1_8v>;
>  		pvdd-supply = <&vcc_d1_8v>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> index a8a20c748ffcd1ed..b409a8d1737e629c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> @@ -140,8 +140,7 @@ hdmi@39 {
>  		compatible = "adi,adv7511w";
>  		#sound-dai-cells = <0>;
>  		reg = <0x39>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
>  		avdd-supply = <&vcc1v8_d4>;
>  		dvdd-supply = <&vcc1v8_d4>;
>  		pvdd-supply = <&vcc1v8_d4>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> index ee3d96fdb6168b56..789f7b0b5ebcadc7 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -64,8 +64,7 @@ adv7535: hdmi@3d {
>  		compatible = "adi,adv7535";
>  		reg = <0x3d>;
>  
> -		interrupt-parent = <&pinctrl>;
> -		interrupts = <RZG2L_GPIO(2, 1) IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&pinctrl RZG2L_GPIO(2, 1) IRQ_TYPE_EDGE_FALLING>;
>  		clocks = <&osc1>;
>  		clock-names = "cec";
>  		avdd-supply = <&reg_1p8v>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> index 377849cbb462eae9..345b779e4f6015da 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> @@ -86,8 +86,7 @@ adv7535: hdmi@3d {
>  		compatible = "adi,adv7535";
>  		reg = <0x3d>;
>  
> -		interrupt-parent = <&pinctrl>;
> -		interrupts = <RZG2L_GPIO(43, 1) IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&pinctrl RZG2L_GPIO(43, 1) IRQ_TYPE_EDGE_FALLING>;
>  		clocks = <&osc1>;
>  		clock-names = "cec";
>  		avdd-supply = <&reg_1p8v>;
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 431b37bf566192d2..5a5dd5ecb75e0e7c 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -150,8 +150,7 @@ hdmi@3d {
>  				pinctrl-0 = <&hdmi1_pins>;
>  				pinctrl-names = "default";
>  
> -				interrupt-parent = <&gpio2>;
> -				interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
> +				interrupts-extended = <&gpio2 14 IRQ_TYPE_LEVEL_LOW>;
>  
>  				clocks = <&cs2000>;
>  				clock-names = "cec";
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

