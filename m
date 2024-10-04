Return-Path: <linux-renesas-soc+bounces-9445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D1990929
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 18:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24C48B25D37
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 16:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F691C728F;
	Fri,  4 Oct 2024 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CskBVnAN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fy5xf1yr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2C26286;
	Fri,  4 Oct 2024 16:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728059016; cv=none; b=l1yQzUWB6KY/vIvfjBgfMD51nG1Qn9DDu5GhuEaOcPn3G7Idg/t4+a0LOmgbEW7mY17JmEUTAlmKYU/b7r2wTOiluS36rX2QM5TOvCQxenZEg0bkJ/RJDbe+ot51+6Y2eGgXYrJe0MOiiNi9wqH9VRDAcXlyvKinXEe/ihcas3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728059016; c=relaxed/simple;
	bh=D/W9ok3aL3BJiKAQK040jklSur5fynRfyF0fdW2SNEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ismw8NAKkTh9k+XDmsBiTurFove549Z9/cmOXMXa8gLxZkXF5pevAKI48xTg2jUMFKA4/qo/hg2rCxmDsGWOdvlwncqUYbqRFjg+hBVJNlo18OYRhqPDULcds/GupntkYMMWheI4uwJsTR+GKKqnYKCg3rftd6JRaBNvSF//3zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CskBVnAN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fy5xf1yr; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 503F81140139;
	Fri,  4 Oct 2024 12:23:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 04 Oct 2024 12:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728059011;
	 x=1728145411; bh=0iXkxgUDX/DUq4WmlndYBUVDIqfVDdAWzQov9P68Wq0=; b=
	CskBVnAN0DCMVE5t7AbhqfPzbi90sZ64fn814Khxxh+jOV7txF+64nXFUstN3pDm
	l25eolUJdRX5mYp+I7PIUOzLyz+gD7r1N+LGSYU7wIncghH7hjhBOfapMrcXFpdJ
	eQpGHAVNVXBDMe6vXOZHSkxieSvuXufB+j05OxPsGTTd3Rgo3V3kGE8nCtmVF2Of
	sQEwCp9ZevbvdEKNMxMhACH6zITEEZPvv4HAAzk0GMCQOgsHBD14Ko/XlFVyFTWU
	Iw7/vlGP4aM/kCsjobQ0X2HLe1JnkuQJyrtu+0Rdi5b3005oc9Kau9gTQqSMnepx
	oo7HkC7+49JRjdIwTx7G+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728059011; x=
	1728145411; bh=0iXkxgUDX/DUq4WmlndYBUVDIqfVDdAWzQov9P68Wq0=; b=f
	y5xf1yr+enpRXTRxzg/JQZMYJn3SkccqCrqxBWSlM1qF/n0CmjdE9UojO4urzK9k
	DpUBEWjVVV7mJbl5LNxSAW4niReF7vK3OfyTmxsYEhWnCZcRTqCk0ZVYA5v+hFbN
	Uf42kI0mxG2Su0Wh77pVXWWH+zwkeSi9r4mnaQ5PMSaNkkkccLtoaaLJkI6JiJqC
	TlSvIqqygT+oMlsSgozt8/UXSVH2K491AOd6Jbw7uekjiy2ERjeo7Bxc1GGwqzqY
	OEnHrhviBmPckhaMA3iTFVdcl/WH9uWc60OJwakRiNjb7gjc+3G8fBSIvTO9d/4K
	rREDlh1i53KkWtEoPMESw==
X-ME-Sender: <xms:ghYAZyHbU4lI-qlgMk2W-Prda1X37lNYplEcY-MrZCPsw3xI7G-f8A>
    <xme:ghYAZzUP9rc6LddWeDBxOyCCBfjBZaGPnAmBJkvVwdX5Tr7SRk_Y2Q-hVoPtgbEDk
    MI3_5I1KSN50Yo4IiU>
X-ME-Received: <xmr:ghYAZ8Jvqlcs7-tEtIrxbu8yCoFqR1DQrBWtLRuECih35oFYShaEja02260tiwfYDe06JdL4P8QQT1cBBrhX8u5FS1UbdrV1mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgleelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:ghYAZ8FNtfulikhRwJPmq_GtRa6fk0Riw6RUN6KYVy9g2Cak3jyVHQ>
    <xmx:ghYAZ4VFPVj2fHDh8QPv3zWBagDdUh2zk8YDkVTYnFj1TV0vLSnQ6Q>
    <xmx:ghYAZ_OzDoxvL_cKt2ecQ2MB4f86bdn41G-aeM9uj_ns0Sc5ywEtKg>
    <xmx:ghYAZ_2BkOhkF0pQ9Syaj-ZgjHuJmUGdnd0U306YHE1y4Kp67wABsA>
    <xmx:gxYAZ6JKYtxGvIMf0i9ZVM-Jw6ybgtjvRW8820qFHmFV1cA4dLrbbBiz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 12:23:30 -0400 (EDT)
Date: Fri, 4 Oct 2024 18:23:28 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 10/20] ARM: dts: renesas: kzm9g: Use interrupts-extended
 for sensors
Message-ID: <20241004162328.GA3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <e04fff0e6d7d9ffebf5e3d3fe7682f0d411b60d9.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e04fff0e6d7d9ffebf5e3d3fe7682f0d411b60d9.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:52 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> index ae7e68a44f493e1b..1ce07d0878dc635a 100644
> --- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> +++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> @@ -195,8 +195,7 @@ &i2c0 {
>  	compass@c {
>  		compatible = "asahi-kasei,ak8975";
>  		reg = <0x0c>;
> -		interrupt-parent = <&irqpin3>;
> -		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&irqpin3 4 IRQ_TYPE_EDGE_FALLING>;
>  	};
>  
>  	ak4648: codec@12 {
> @@ -208,9 +207,8 @@ ak4648: codec@12 {
>  	accelerometer@1d {
>  		compatible = "adi,adxl345";
>  		reg = <0x1d>;
> -		interrupt-parent = <&irqpin3>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>,
> -			     <3 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts-extended = <&irqpin3 2 IRQ_TYPE_LEVEL_HIGH>,
> +				      <&irqpin3 3 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
>  	rtc@32 {
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

