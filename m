Return-Path: <linux-renesas-soc+bounces-9439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC0E99083D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2DC1F21B77
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F9D1AA79D;
	Fri,  4 Oct 2024 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="P4VlcWYe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z72qB0SF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D88E1AA7A8;
	Fri,  4 Oct 2024 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728056903; cv=none; b=q+VjkQboCPb5DcJdNDMFOXug58x0+KPB2ijgpPWoXcZ+HVQE4c2MCyZveaoQ1KxOXo+rzNE2AHiGv0yaCgghDXmgRDMT837VqEY/Wje36EoXLTp9k1FYSRMphRz7bk4Whfv6qEjoFmdT4nxw+Ii98N0/y3G4WwLB6dx5f2hyy6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728056903; c=relaxed/simple;
	bh=okiV53eG82hwh+Wew17LJ1WQ3tkp/S9FQYOzjigy92Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G29NQB0x4HWDIUF2Kvs6QHc9ELDJj/JpatAkY7fTffdz1uT/OC24AlLQhgqOMSgqmpvoUACOis9OoI4YxAZ0ULnlLKk5qk8Nms75M6CsRhhj0ENttHqJouLRaut2FgAwTEhwrkfU8znsvWfGj+9P1g55a2LA//Lvqezky5XW7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=P4VlcWYe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z72qB0SF; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 713D011401FB;
	Fri,  4 Oct 2024 11:48:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 04 Oct 2024 11:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728056897;
	 x=1728143297; bh=NsREHNbg94+3hVvHu1wOLZYEPrkiXOty18h0tytUiss=; b=
	P4VlcWYe/B82seS83dRNLQbDlz8TMLKDJ6LbOZTt1jPG4HhU6d3DdCJZeExLE6Io
	TMvDeV/92tyEXrMUVNu3h5oUTym4v8uC32tIB80utyWRx7U2ikQui5Ei91cD7u1/
	rKFSpKa3G7BXK+om+9te+GBotT/uajxfmxW3NSX/IyzVuR7XbflQs3PRyTvVN7TX
	8bVp+T72LWKnGU76J6cKxtcqE+OF/nF6fWt2mIsPbJnURqt7mBm2YTdNoNwsbfHC
	Ymcy5DoUDPM6uQLcvkyStGXelm2Bt29Ja+uDl7z4q4x1QskHefefgIBcwwXsODlw
	0jPDrNrAeGMZx48pt9AekQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728056897; x=
	1728143297; bh=NsREHNbg94+3hVvHu1wOLZYEPrkiXOty18h0tytUiss=; b=Z
	72qB0SFcfTsesZryLMYDkSaFitl6gScD6PIb0XgTGo+g7SOPbU2fe/pVIGsDpSbn
	bKqizpIe6cKIZE1SNcT+QXSGW0opJ6wZpqqrzOFSjKpWzLs0FMou4NWAhzFCC60X
	vgXyswhXTDOZ6SYp4JdSWdCzzwFb2CF9tPvl6l6cwuMaKZNoaQGpSQhCrcdIB1nL
	FKnbzmpSGCvoB4uijxqdBgR9Ra7yx0zJ3A7A1wWEdtmYB73dBkn8ZiCvqMcGUJND
	u/NzdUUxlF/KunCr8LdJ4wDw5f83pPI0WzEGM43jg23YAjdBHl2FFDS1ivk3TYPN
	bspNB/oqw+nLmABCwwXIA==
X-ME-Sender: <xms:QA4AZ8x8sk8ASZkm_uhuSYwyF4yhA9JX9ZQ_cGEv5ZfvN6HRwe1qMA>
    <xme:QA4AZwSHJIcxzo7mobeKL6ztekUuwW2UkbZA99w51znZlWB0aBY-z3-M_KLd17Yzn
    dd_THXLEoGpI-Ury7g>
X-ME-Received: <xmr:QA4AZ-Vs60IRMqB33W6Rk2Qc8QNY5-bITagtWnaw9d7BfwYkVqfdBAIKb7iBKdbUzO_J7JgePs2YlbBClo7d1rgE4jSxUp2omw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgledvucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:QA4AZ6iHEkDbDrbLO5UnAMDuDvzjk56_aEFKb0zlm14qlEbAO7g1Ow>
    <xmx:QA4AZ-B26OhYt7SBrGNUREO3PNEyJt4qdOCSCpPeiiDHENG6lH1YOw>
    <xmx:QA4AZ7J5Ll1umR2uelIjIg2OqwQzI0Hmnjl0MFYUyRWL-uLzMsJhUg>
    <xmx:QA4AZ1BO1WxpN60YyhB6JYIVyiFra6vTuX0Stefx6uTI70SjD2myAQ>
    <xmx:QQ4AZw2tKFmgStytXVTKUKAJ4O8m1yeeGRCa6t-iKHvxKSx0fmWtnaL6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 11:48:15 -0400 (EDT)
Date: Fri, 4 Oct 2024 17:48:13 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 05/20] ARM: dts: renesas: Use interrupts-extended for
 touchpanels
Message-ID: <20241004154813.GL2071111@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <d081d986e3a2b695bc27dbe00aa0fb244a22ffdf.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d081d986e3a2b695bc27dbe00aa0fb244a22ffdf.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:47 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi       | 3 +--
>  arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts       | 3 +--
>  arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts            | 3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
> index 4351c5a02fa596de..2cc2908b48ca1b9f 100644
> --- a/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
> +++ b/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
> @@ -219,8 +219,7 @@ sgtl5000: codec@a {
>  	touch: touchpanel@38 {
>  		compatible = "edt,edt-ft5406";
>  		reg = <0x38>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&gpio2 12 IRQ_TYPE_EDGE_FALLING>;
>  		vcc-supply = <&vcc_3v3_tft1>;
>  	};
>  };
> diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
> index 9ec0f098bf6eb5d7..3d32cf068abc20f1 100644
> --- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
> @@ -238,8 +238,7 @@ eeprom@50 {
>  	touchscreen@55 {
>  		compatible = "sitronix,st1232";
>  		reg = <0x55>;
> -		interrupt-parent = <&irqpin1>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&irqpin1 2 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-0 = <&st1232_pins>;
>  		pinctrl-names = "default";
>  		gpios = <&pfc 166 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
> index 64102b664055b475..6a8a0d2113b020c7 100644
> --- a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
> @@ -202,8 +202,7 @@ sgtl5000: codec@a {
>  	touch: touchpanel@38 {
>  		compatible = "edt,edt-ft5406";
>  		reg = <0x38>;
> -		interrupt-parent = <&gpio0>;
> -		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&gpio0 24 IRQ_TYPE_EDGE_FALLING>;
>  		/* GP1_29 is also shared with audio codec reset pin */
>  		reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
>  		vcc-supply = <&vcc_3v3_tft1>;
> diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> index 15d89c20618a16b7..fe96ea07628779c6 100644
> --- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> +++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> @@ -296,8 +296,7 @@ &i2c1 {
>  	touchscreen@55 {
>  		compatible = "sitronix,st1232";
>  		reg = <0x55>;
> -		interrupt-parent = <&irqpin1>;
> -		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&irqpin1 0 IRQ_TYPE_EDGE_FALLING>;
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

