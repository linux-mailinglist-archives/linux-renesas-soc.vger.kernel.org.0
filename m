Return-Path: <linux-renesas-soc+bounces-9456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDFE990A4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 19:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F0431C20BEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F931DAC9C;
	Fri,  4 Oct 2024 17:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ABiJhIxS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iigAsd+u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B6A1DAC95;
	Fri,  4 Oct 2024 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728063697; cv=none; b=ZAguZVTEw8+AtdasnVO1kj/FdbuTh/3CDr/RNg4wI91WQBFPnWLgfMPXP2av4b2oBzBiuUS5DvgLJO0ytNGTeT16CYkFyk+905kJGPgn6c7RZxD3T8ZY/nV19FDOIcelYDE53VgOxbS8zI3YOn59W5zsZV7W2MDelWixDT7Cs1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728063697; c=relaxed/simple;
	bh=8sfnLyXEk3UOTPT6sgUUsSa6CHl6HNqURBCd4JmT47c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXbyR3FdaPv85N5Ps64Z0sYvKodW/PgdGuJeuWo00yhBBp8rLla8VYOlpObQobeW75E5r/QuPecAwjzJP8REz/LsfKFIdq2irWFQKQlokBSLSS0QPbSKTgPk4T+3JU0lUrw9eJhRHOlzqaN/VgErDyIkdA2crGQOhJQZRVGQvaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ABiJhIxS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iigAsd+u; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E7CB81140085;
	Fri,  4 Oct 2024 13:41:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 04 Oct 2024 13:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728063694;
	 x=1728150094; bh=A6bA9FdUGYwTM/l/wZwGlP7DGcyUu+jUwWf6umShJ3U=; b=
	ABiJhIxS3jHGpwpho6ouUiMaBsw8kHZilCjioCFApEUYKuDzvBPydA5+uG9JVbNZ
	2vcAthqRM80gSD1hTfi+ggeqnOgJgjpTdekNcayOelud5peKXEaLKLBb1QcCmdAC
	lu9cHrEIOTSBtVJz9Q8EN/5wB8GSd/TthjhIh0FLD8CBLcdoJebuN+P4zkNiC8W/
	uaynmUERam7AbcO6cMeznE65GVgquH2RsXd1qF7TyoxkxYfKGDscdDt7ScMRjrsz
	zPdeF0K+xp8GpJaBlXDIpHdSaPZH5WRk7id7rBP415Rs0iibZHHnz9vGZj2A/vPW
	Zulb65+alX2rK23PrlIGGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728063694; x=
	1728150094; bh=A6bA9FdUGYwTM/l/wZwGlP7DGcyUu+jUwWf6umShJ3U=; b=i
	igAsd+ukRZU3QIRpXZCIkxYmceSgGdPJ+nnGo8J+VYENY0wH718bBBnfN9OGU2Hk
	KPrcakWR4jNhanO7lY5C0WT4+M+8ldD2oJNvyOOAS7N4p25BH15h6/+KVgZ+Vws8
	Li6IYUa55Fzbl/haqK5kvxqQ5k9l38j0BLf/cKLUq2pxvKOVOkVT182gR92s0X+W
	N1ArBigEmn76xsANjIa5csxmRPDcqdU74Ujyqmh1gPbNhb0DsKJDzrcNcGjtrf01
	iKoB5MGJQbxLmzEkWqFEqWmTa9Xa1+TfEXbj7LOr5pDnq/UqL8pGFR0Mx6drWdEG
	n9AIpm5HibYKp4fmjgcvQ==
X-ME-Sender: <xms:zigAZ5VlOgsPKQ3XyeCaM2Zc3WR_XoC3lz1LiKGlI2a_dnr-KUE3zA>
    <xme:zigAZ5k6c2Lae6nTlVlnqmzbs-9KHJlQCTQSYJb7GMwVGG7Nx-vMKJ7m5STOX39tE
    lYv3NRPjf0psIH9FWc>
X-ME-Received: <xmr:zigAZ1bBIRyCuR4jn1NmOOnfAWJpDVQK5M4wL0JU8ZsZ-42BbcglXwiKGY3PJVA04Uj_Dh4MGhTkv0yjOMriggVnOJeyhu3Tyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhl
    ihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhi
    nhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvg
    htrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zigAZ8UBPmL2FhzX0TD3feMSL83Sawqr196bl00LCqJPWGKVR_jEpg>
    <xmx:zigAZzmD3T1_CcwEIssL-sp0G8tsQB_vwrxWo3dZHomm43yodbbpEA>
    <xmx:zigAZ5exqEJ1AV6RAGGM_BoJ44cyowJslJDMoMVvbMcGkBDZy3p76Q>
    <xmx:zigAZ9HYMg3ePMdREXaJX3RHS4SUXeSE5XT1FkXawXrwN4wzMEje3A>
    <xmx:zigAZxZakOGvKaTgUTeqRgFzVXziP2FKirldmNJCGm-M0HA6M7dplHsK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 13:41:34 -0400 (EDT)
Date: Fri, 4 Oct 2024 19:41:32 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 18/20] arm64: dts: renesas: Use interrupts-extended for
 WLAN
Message-ID: <20241004174132.GI3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <0866811fd11b683cacfd5dc3ea75d4c0ca161acb.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0866811fd11b683cacfd5dc3ea75d4c0ca161acb.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:53:00 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 3 +--
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi      | 3 +--
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts     | 3 +--
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi            | 3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> index 4a9d20249eaa9bc0..b543739390a5d94c 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -300,8 +300,7 @@ &sdhi2 {
>  	brcmf: bcrmf@1 {
>  		reg = <1>;
>  		compatible = "brcm,bcm4329-fmac";
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio1 27 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-names = "host-wake";
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> index 83104af2813eb4a0..2aa9f528ace16e7b 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -325,8 +325,7 @@ &sdhi2 {
>  	wlcore: wlcore@2 {
>  		compatible = "ti,wl1837";
>  		reg = <2>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts-extended = <&gpio2 5 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index 94d85273064e9bc8..c861f75b1f1b70cd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -411,8 +411,7 @@ &sdhi3 {
>  	wlcore: wlcore@2 {
>  		compatible = "ti,wl1837";
>  		reg = <2>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts-extended = <&gpio1 0 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index f7330b2262b8af0c..5c211ed83049d5a4 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -444,8 +444,7 @@ &sdhi3 {
>  	wlcore: wlcore@2 {
>  		compatible = "ti,wl1837";
>  		reg = <2>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&gpio1 25 IRQ_TYPE_EDGE_FALLING>;
>  	};
>  };
>  
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

