Return-Path: <linux-renesas-soc+bounces-9446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 582AE990936
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 18:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50A0B1C215D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 16:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A181CACCC;
	Fri,  4 Oct 2024 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="W38mhcOM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nZPCzdCd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7521D1E379F;
	Fri,  4 Oct 2024 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728059487; cv=none; b=cuVVmeohwh/CK8jh+SVpDyV4CXnjvbne9hMOo8RFoE2xJK5ICKuZHpo53XnZRNDqxqF4pBkOmFJy2tUpYQwQ0guULpq2BnpH7SCr9VgebFgFFoQUg3PlmMp6rWtkEqdyh7UrCBp9guUZqv5CD5/Yasq5Mz3olx2tpyr+mV1PMNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728059487; c=relaxed/simple;
	bh=zigsK6WMkgNauDnS+RJ2q8aWx0Ovy3AgMVqbg6Vk3t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgjAvfUoMrHy0XSJMMERDpCUaJC5/QbNwBMzeZRtVWzKQoh7UeaJuE/E+ZaKR4wX+AUP9/UbsK71hfjhLgrEoQBgBKYFMWpXFF8yO2wNV18Hu4aV7m4CEskZgWuOigntPnUa/erWVxO2DeWWw5djcrmugdIrwVkQRC4OVujW+MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=W38mhcOM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nZPCzdCd; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A46FE11400E2;
	Fri,  4 Oct 2024 12:31:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 04 Oct 2024 12:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728059484;
	 x=1728145884; bh=ybNFOvCcidYzO3PFvuu9g54ePppL64QE8bp9bWasTtM=; b=
	W38mhcOMZauELn/TgeLpweH3KrIwiUYmBcWdwGIKx8AFHWhg+Pp2jSoMBcOxFwSG
	0EqVa6nr0KVQDONNcSDE8kZGW9zo/xk0dawaNoAH7366QGaTpGGvKtViJKZJw5Cj
	qGCZmDgIIGT0jv/MPuWUKjNAH7FzICEp2xwvXt/sNAnvHsjzESNOoH0TwrEqlsV6
	lX8Tg5gx1fD98BQI87A/UD1PTPUTAzXuHhBv873ZO6CDvHzhf+R9/ij9y51eARKg
	11q5oxQnzwnMJoG4epYecw9P8x9wrhhHEOuB/BPT+RESnBoHsmG6QnGQDtUVmL/6
	E6mPqO0SuYiFIHR4be7BJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728059484; x=
	1728145884; bh=ybNFOvCcidYzO3PFvuu9g54ePppL64QE8bp9bWasTtM=; b=n
	ZPCzdCd+OwHDc9b1sLnxYiKFWOLti+R/AvJJKwkX/mRLW7TaJqSJOfzhWijlsovI
	0v1bPX0QdX8/pmoHJBO49HN++uhQJ1ybuEmUA4C44MCIZamdfows46juriB+u4EY
	LNy/fdPKK4hPMLHAqoWS/jXqjTdNOI3lJJB0kiGppekfuZHWBe2rzepQzF239AD8
	5doUMzCHj651mYhEK7qPksUVudOkr9kkEXe6mbb8xsCv6ldPCqgR5F2GQxgg55YJ
	lph1PFQVEp5qcKLDb+Cj8mnv01Oqn+Jh/7yzMXRB7Z2nUbMj82zQoFoWC5N/U7NJ
	uJJlYMRpNupmKz2ytlWJQ==
X-ME-Sender: <xms:XBgAZ7F0Va3Y-CyjHflLgPR_vTdyAyfRls5fNkKCL-_aZSf02oTRew>
    <xme:XBgAZ4XRW-12oo2VjDXDQfmCFCn3dcvQ3XeKts14fHUR15BKeWcFdlMAIplIfdKi2
    5Ty_9VIPuXNocR5hxs>
X-ME-Received: <xmr:XBgAZ9ILUgLEqHfOss6Zou4bJm8WswFgPAgU90zhgJonv6aCYlKpBdJ_GMWeXMWlV9mpE1Wcb1FKxyovB58XFasznRPe2SlI1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedguddttdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:XBgAZ5EgCfpQ6hw0MyLdMy_4zALinRDo7tFSm_wj8bFs09UZIzMdnw>
    <xmx:XBgAZxXoFKlKo4wQc5nZF_ZcsD2sC_unrKg1HAChUWoDejO5PSsWTg>
    <xmx:XBgAZ0NLrHDBJOL2xZ_oTyyMdtCXavR_S_8GzTe1kCUrVBttNw1UQA>
    <xmx:XBgAZw3PW7M40OriL17xwsvSER-SvuoYuFC6y1LXVaaWmL4ze8THtw>
    <xmx:XBgAZwHHoL4AJDu4x8Je8S2HM8io5ZLJYGIXuREaF2Kz3Gxoi0Y16lYO>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 12:31:23 -0400 (EDT)
Date: Fri, 4 Oct 2024 18:31:22 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 11/20] arm64: dts: renesas: Use interrupts-extended for
 DisplayPort bridges
Message-ID: <20241004163122.GB3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <2b217486221d90eb3c127f5e44f9c886161ab8c6.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b217486221d90eb3c127f5e44f9c886161ab8c6.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:53 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi   | 3 +--
>  arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> index 99b73e21c82c2b18..e8c8fca48b6963c9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> @@ -208,8 +208,7 @@ bridge@2c {
>  		clocks = <&sn65dsi86_refclk>;
>  		clock-names = "refclk";
>  
> -		interrupt-parent = <&intc_ex>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_HIGH>;
>  
>  		vccio-supply = <&reg_1p8v>;
>  		vpll-supply = <&reg_1p8v>;
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> index 6dc968352c046129..36f5deb7f24afc2e 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> @@ -246,8 +246,7 @@ bridge@2c {
>  		clocks = <&sn65dsi86_refclk>;
>  		clock-names = "refclk";
>  
> -		interrupt-parent = <&intc_ex>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_HIGH>;
>  
>  		enable-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
>  
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

