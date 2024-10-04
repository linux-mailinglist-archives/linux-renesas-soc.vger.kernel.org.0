Return-Path: <linux-renesas-soc+bounces-9447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFCA99099E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 18:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A552887C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 16:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6062C1CACEF;
	Fri,  4 Oct 2024 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GDHeVknn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A24wWJRf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CC71AA781;
	Fri,  4 Oct 2024 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728060303; cv=none; b=gwTQvkOaTSBjZD/X4vRRcu1bG8nVbEi1LS5qe/BmFkkBG8H1xs36CE9cvBPjucZH5Wy0TOMcNADqI5PZq7f/+2l6B0ughJM8CWFmWXPyYl/7QphQLzJTzlpLwTfUg48yr8HnPcte3DYYoXhe89sfqr0+tNI4aDGaIWZIXHiOjrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728060303; c=relaxed/simple;
	bh=ncYdC+CjYIk/UkWb0hhRq12HWFVz0E+IqFvajv+zjT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqhUJPAvHI9o25CS4ivM68lVpjmNQX66bAVLhH8LwamFIN992hv4ZV9jaFlh/6vHzs3Fo7yzxKEPhoLX4ckWdVa2k/XQQWJTqUlK0qdkvNxgCeMOlr6NDgRVbyke3/q3LvVAjcTMYMAwz7/50NbWJGiAbDYz3vdFDk1VcOWmUNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GDHeVknn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A24wWJRf; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2C10C1140100;
	Fri,  4 Oct 2024 12:44:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 04 Oct 2024 12:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728060299;
	 x=1728146699; bh=eBWgWIubCj6gwhcXy3VxuOxw0lCdzX7j55cGuk1zsUA=; b=
	GDHeVknnBXlJwDuC0jte8IDsM//ljQjWA8EKToz/GYSSaN1o02oO4djZF3uJk4p1
	50UlmSzaALGI5ZWQZ7zS/03e9e+vK17sj2IKin84sCXJSqsABpPs08RAvruo0TOX
	ZP8mmmO3LkDtejKk4YvGVRaJvKlhsjm42doMU4+CI04KhH/h6cNZnpOBdTBrXMD5
	jBNx1KVdw42Saglpl3I1P3ucHH1u+1lQ7n4QHIE2/09MSe/JpsUEPslmH3D+Baou
	sVXPhzz6HZ3lbdRFM/myC+yVuriSGoZG/QjLxefHyzu8EghJWC7cKwFXBk6LN1JN
	WLGCS8JYPKDY61B4kdp9yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728060299; x=
	1728146699; bh=eBWgWIubCj6gwhcXy3VxuOxw0lCdzX7j55cGuk1zsUA=; b=A
	24wWJRfLHTbAJURFdHBpK0IUnaN+KslY2MCGvlEdj8AZ6XnRadlR4CbmfmRKL7eY
	aHg40lN9N/MDppF+/GeQOinP4+MhQiBgDFToP6BzpZN0yThs6YnDLEGWLCSC1KE6
	u3mCbypoZQ/vINO1u9fkEUql17YiY02kjLtcgHXqxIhE71k3kYuPWdGKG20qX7m/
	ilr/sACssSw8wjXkSuu/6L4NQt7OCK9cyYWeZ1FYdU9/sUP/LlmDICJIe9mkz0UG
	izgeRijfEleDdXOs3JNCt6im7l9EUQD7bywDpjMai6C8po0Hf2+gU9X3zEUEkPJU
	SbdT+qTYf4YVfJu3ZZMbg==
X-ME-Sender: <xms:ihsAZ-mOWftRNbMGOobTf34ntrw9kYypSOVyzZRWFKYZyHBSbpiUWw>
    <xme:ihsAZ11LSZAL3fvpfgssRUOscpixmwvz9FmbGSYizWPmBAoyX36slfd_8arAFEah-
    oes0wqLLuNkIWApO7Q>
X-ME-Received: <xmr:ihsAZ8r8BmCHL38FvPJhawNaLnnFoMoAozMJ8tSYlre6yJJOK3uyXnFx_8aEhqF1HoEF33NtwI--HYgUoO1_lwqhO422TFmpyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedguddtgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:ihsAZymKMqW7pYv7FmFhlGozX_kQB98t0kz3U1JvwPvxL0NGph3XrQ>
    <xmx:ihsAZ81tteYOuBanYGYetsYtjtIujAkr6EGAFGJNSdtw3f8074u3fA>
    <xmx:ihsAZ5uKyLuY9Tn3iihi-_sL2PbX90JDJfSocscQVgjlmhOAX_l1gg>
    <xmx:ihsAZ4XXa8Q1g4U53S4x7cOM5N5rvkVclEzvGCjmMhY5bR2OYWh99Q>
    <xmx:ixsAZ2qA3FGxR0PjeuAc1QFuB-T4fqnPkMihHlCHz6MFxcE23r63bOtU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 12:44:58 -0400 (EDT)
Date: Fri, 4 Oct 2024 18:44:56 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 12/20] arm64: dts: renesas: Use interrupts-extended for
 Ethernet PHYs
Message-ID: <20241004164456.GC3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <e9db8758d275ec63b0d6ce086ac3d0ea62966865.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9db8758d275ec63b0d6ce086ac3d0ea62966865.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:54 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi      | 3 +--
>  arch/arm64/boot/dts/renesas/cat875.dtsi                  | 3 +--
>  arch/arm64/boot/dts/renesas/condor-common.dtsi           | 3 +--
>  arch/arm64/boot/dts/renesas/draak.dtsi                   | 3 +--
>  arch/arm64/boot/dts/renesas/ebisu.dtsi                   | 3 +--
>  arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi          | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts           | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts           | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts           | 3 +--
>  arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts          | 3 +--
>  .../arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi | 9 +++------
>  arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts            | 6 ++----
>  .../boot/dts/renesas/r8a779g2-white-hawk-single.dts      | 3 +--
>  .../arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 3 +--
>  arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi         | 6 ++----
>  arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi        | 3 +--
>  arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi        | 6 ++----
>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi         | 6 ++----
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi         | 3 +--
>  arch/arm64/boot/dts/renesas/ulcb.dtsi                    | 3 +--
>  arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi   | 3 +--
>  arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi     | 6 ++----
>  22 files changed, 29 insertions(+), 58 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> index 68b04e56ae56232e..5a15a956702a6be8 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -62,8 +62,7 @@ phy0: ethernet-phy@0 {
>  		compatible = "ethernet-phy-id0022.1640",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <0>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
> index 8c9da8b4bd60bf32..191b051ecfd458ef 100644
> --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
> +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
> @@ -25,8 +25,7 @@ phy0: ethernet-phy@0 {
>  		compatible = "ethernet-phy-id001c.c915",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <0>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
> index 8b7c0c34eadce5cb..b2d99dfaa0cdf19d 100644
> --- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
> @@ -166,8 +166,7 @@ phy0: ethernet-phy@0 {
>  			     "ethernet-phy-ieee802.3-c22";
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> -		interrupt-parent = <&gpio4>;
> -		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
> index 6f133f54ded54efb..402112a37d75a8c5 100644
> --- a/arch/arm64/boot/dts/renesas/draak.dtsi
> +++ b/arch/arm64/boot/dts/renesas/draak.dtsi
> @@ -247,8 +247,7 @@ phy0: ethernet-phy@0 {
>  			     "ethernet-phy-ieee802.3-c22";
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> -		interrupt-parent = <&gpio5>;
> -		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio5 19 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio5 18 GPIO_ACTIVE_LOW>;
>  		/*
>  		 * TX clock internal delay mode is required for reliable
> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> index cba2fde9dd3688b3..1aedd093fb41bf44 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -314,8 +314,7 @@ phy0: ethernet-phy@0 {
>  			     "ethernet-phy-ieee802.3-c22";
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
>  		/*
>  		 * TX clock internal delay mode is required for reliable
> diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> index ad898c6db4e62df6..4113710d55226d6d 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> @@ -27,8 +27,7 @@ phy0: ethernet-phy@0 {
>  		compatible = "ethernet-phy-id001c.c915",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <0>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index 0608dce92e405935..7dd9e13cf0074442 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -111,8 +111,7 @@ phy0: ethernet-phy@0 {
>  			     "ethernet-phy-ieee802.3-c22";
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> index e36999e91af53326..0a103f93b14d71ad 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> @@ -117,8 +117,7 @@ phy0: ethernet-phy@0 {
>  			     "ethernet-phy-ieee802.3-c22";
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> index 77d22df25fffac6d..a8a20c748ffcd1ed 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> @@ -124,8 +124,7 @@ phy0: ethernet-phy@0 {
>  			     "ethernet-phy-ieee802.3-c22";
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> -		interrupt-parent = <&gpio4>;
> -		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> index 63db822e5f4662b6..6bd580737f25d3cc 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -31,8 +31,7 @@ phy0: ethernet-phy@0 {
>  			     "ethernet-phy-ieee802.3-c22";
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> -		interrupt-parent = <&gpio4>;
> -		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio4 16 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> index 33c1015e9ab38e97..5d38669ed1ec3440 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> @@ -60,8 +60,7 @@ mdio {
>  				u101: ethernet-phy@1 {
>  					reg = <1>;
>  					compatible = "ethernet-phy-ieee802.3-c45";
> -					interrupt-parent = <&gpio3>;
> -					interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> +					interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
>  				};
>  			};
>  		};
> @@ -78,8 +77,7 @@ mdio {
>  				u201: ethernet-phy@2 {
>  					reg = <2>;
>  					compatible = "ethernet-phy-ieee802.3-c45";
> -					interrupt-parent = <&gpio3>;
> -					interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +					interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
>  				};
>  			};
>  		};
> @@ -96,8 +94,7 @@ mdio {
>  				u301: ethernet-phy@3 {
>  					reg = <3>;
>  					compatible = "ethernet-phy-ieee802.3-c45";
> -					interrupt-parent = <&gpio3>;
> -					interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +					interrupts-extended = <&gpio3 9 IRQ_TYPE_LEVEL_LOW>;
>  				};
>  			};
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
> index fa910b85859e99df..5d71d52f9c654783 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
> @@ -197,8 +197,7 @@ mdio {
>  				ic99: ethernet-phy@1 {
>  					reg = <1>;
>  					compatible = "ethernet-phy-ieee802.3-c45";
> -					interrupt-parent = <&gpio3>;
> -					interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> +					interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
>  				};
>  			};
>  		};
> @@ -216,8 +215,7 @@ mdio {
>  				ic102: ethernet-phy@2 {
>  					reg = <2>;
>  					compatible = "ethernet-phy-ieee802.3-c45";
> -					interrupt-parent = <&gpio3>;
> -					interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +					interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
>  				};
>  			};
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
> index 50a428572d9bd933..0062362b0ba06885 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
> @@ -70,8 +70,7 @@ phy3: ethernet-phy@0 {
>  			compatible = "ethernet-phy-id002b.0980",
>  				     "ethernet-phy-ieee802.3-c22";
>  			reg = <0>;
> -			interrupt-parent = <&gpio4>;
> -			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio4 3 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> index 72e1ffe98585447f..b1d035ca4d97a51a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -181,8 +181,7 @@ phy0: ethernet-phy@0 {
>  			     "ethernet-phy-ieee802.3-c22";
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> -		interrupt-parent = <&gpio7>;
> -		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> index 83f5642d0d35c244..502d9f17bf16d017 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> @@ -102,8 +102,7 @@ phy0: ethernet-phy@7 {
>  		compatible = "ethernet-phy-id0022.1640",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <7>;
> -		interrupt-parent = <&irqc>;
> -		interrupts = <RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
>  		rxc-skew-psec = <2400>;
>  		txc-skew-psec = <2400>;
>  		rxdv-skew-psec = <0>;
> @@ -130,8 +129,7 @@ phy1: ethernet-phy@7 {
>  		compatible = "ethernet-phy-id0022.1640",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <7>;
> -		interrupt-parent = <&irqc>;
> -		interrupts = <RZG2L_IRQ3 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc RZG2L_IRQ3 IRQ_TYPE_LEVEL_LOW>;
>  		rxc-skew-psec = <2400>;
>  		txc-skew-psec = <2400>;
>  		rxdv-skew-psec = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
> index b4ef5ea8a9e3457a..de39311a77dc2a5a 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
> @@ -82,8 +82,7 @@ phy0: ethernet-phy@7 {
>  		compatible = "ethernet-phy-id0022.1640",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <7>;
> -		interrupt-parent = <&irqc>;
> -		interrupts = <RZG2L_IRQ0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc RZG2L_IRQ0 IRQ_TYPE_LEVEL_LOW>;
>  		rxc-skew-psec = <2400>;
>  		txc-skew-psec = <2400>;
>  		rxdv-skew-psec = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> index 79443fb3f5810304..1a6fd58bd3682a56 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> @@ -78,8 +78,7 @@ phy0: ethernet-phy@7 {
>  		compatible = "ethernet-phy-id0022.1640",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <7>;
> -		interrupt-parent = <&irqc>;
> -		interrupts = <RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
>  		rxc-skew-psec = <2400>;
>  		txc-skew-psec = <2400>;
>  		rxdv-skew-psec = <0>;
> @@ -107,8 +106,7 @@ phy1: ethernet-phy@7 {
>  		compatible = "ethernet-phy-id0022.1640",
>  			     "ethernet-phy-ieee802.3-c22";
>  		reg = <7>;
> -		interrupt-parent = <&irqc>;
> -		interrupts = <RZG2L_IRQ7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqc RZG2L_IRQ7 IRQ_TYPE_LEVEL_LOW>;
>  		rxc-skew-psec = <2400>;
>  		txc-skew-psec = <2400>;
>  		rxdv-skew-psec = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> index 21bfa4e03972ffe2..71424e69939ee56b 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -103,8 +103,7 @@ &eth0 {
>  
>  	phy0: ethernet-phy@7 {
>  		reg = <7>;
> -		interrupt-parent = <&pinctrl>;
> -		interrupts = <RZG2L_GPIO(12, 0) IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&pinctrl RZG2L_GPIO(12, 0) IRQ_TYPE_EDGE_FALLING>;
>  		rxc-skew-psec = <0>;
>  		txc-skew-psec = <0>;
>  		rxdv-skew-psec = <0>;
> @@ -129,8 +128,7 @@ &eth1 {
>  
>  	phy1: ethernet-phy@7 {
>  		reg = <7>;
> -		interrupt-parent = <&pinctrl>;
> -		interrupts = <RZG2L_GPIO(12, 1) IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&pinctrl RZG2L_GPIO(12, 1) IRQ_TYPE_EDGE_FALLING>;
>  		rxc-skew-psec = <0>;
>  		txc-skew-psec = <0>;
>  		rxdv-skew-psec = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index 3f8ce62488213bbe..ca0b5c070ae57dce 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -367,8 +367,7 @@ phy0: ethernet-phy@0 {
>  			     "ethernet-phy-ieee802.3-c22";
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> index a2f66f916048496e..4cf141a701c0625a 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -150,8 +150,7 @@ phy0: ethernet-phy@0 {
>  			     "ethernet-phy-ieee802.3-c22";
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> index 36f5deb7f24afc2e..209cba75adec6d6c 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> @@ -167,8 +167,7 @@ avb0_phy: ethernet-phy@0 {
>  				     "ethernet-phy-ieee802.3-c22";
>  			rxc-skew-ps = <1500>;
>  			reg = <0>;
> -			interrupt-parent = <&gpio7>;
> -			interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
>  			reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
> index 595ec4ff4cdd0190..ad94bf3f5e6c426f 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
> @@ -29,8 +29,7 @@ mdio {
>  		avb1_phy: ethernet-phy@0 {
>  			compatible = "ethernet-phy-ieee802.3-c45";
>  			reg = <0>;
> -			interrupt-parent = <&gpio6>;
> -			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio6 3 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
>  };
> @@ -51,8 +50,7 @@ mdio {
>  		avb2_phy: ethernet-phy@0 {
>  			compatible = "ethernet-phy-ieee802.3-c45";
>  			reg = <0>;
> -			interrupt-parent = <&gpio5>;
> -			interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio5 4 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
>  };
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

