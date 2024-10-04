Return-Path: <linux-renesas-soc+bounces-9443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB96990847
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DCF11C21AA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAC61C75E7;
	Fri,  4 Oct 2024 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dtkiD4pk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OiH1WHTy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716921C761A;
	Fri,  4 Oct 2024 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728057080; cv=none; b=d8/UzCkqJS1fF4+XHgG/B0d4kET2jSr4ktRudBAxyW2xN2JvYuTFRxFiVJpidKwWorPlNX2lQKE2CHGVYTMFM3Y75f97SeWXXlDt/RJeiepnkoKDFJF7Gbh+5a2T9m298W0/YAKvTGqgT6YCyC56Sg1vHp5wIWEKRKTI7eXrRIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728057080; c=relaxed/simple;
	bh=SQ6bw1tuyDFusgKFKaYKfpyAh/NYFOEjl4xOaVow7Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFjPBMfoG36VQ2HnmV0d2gVN8SKiLL1gh6QvKNDAhZZk61ksIznUDhs1ydj51YgS7beFfAjYw604UrdihucS6NahykwFwDPRYfBp7tntN66d3m2ar+ewMDUTOthLhlUyNKx7/O+xGWXeG7+d4xN2CvNTnws5DhaSqJivWeDplbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dtkiD4pk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OiH1WHTy; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id A07C913800F0;
	Fri,  4 Oct 2024 11:51:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 04 Oct 2024 11:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728057078;
	 x=1728143478; bh=c5bco3/qi1b3m8fMS3tsrQVouVfla7uIWBWy3ARO8ao=; b=
	dtkiD4pke5bDuFl7urQhYO0DZ8tN1bMwIz78w9+RVxDI8NzM6Glbfle4AxaiccMF
	NmJ6Y6R/OW61GplECig4A0hJxLwnq6FAqz9f7tuIJe+Kn9xQHw28ZE7/PJTF58F+
	DGMBWCTMuIH357PaZknrZfDpyfRsfeA/gH/jpjLZFUr9MWv4PKPY55+FvAPimBpr
	wp5AKszRlFQ73VCevn3+kvlpqzUsGRpbTamvRXIMCwhbGFXzAjaKI9Ktqbd46TLV
	7idiyQ8/JFvL/0nRFvtioMWsb5Z2Ved40Ks6pbrNTkp/eR8+/5YG51+KokHRbHx3
	sS6V/QNUXBuVFV+IR1lgfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728057078; x=
	1728143478; bh=c5bco3/qi1b3m8fMS3tsrQVouVfla7uIWBWy3ARO8ao=; b=O
	iH1WHTya2LZzLadFRPDy/Z2bRVZ1s2GEsz1OJjBHAuckgSTqoBb5EZmSTGiCjwxj
	DwNuH3ifppGCydqbQ8ouB9KL+XVtrbOzjfxOe/T9iAt3TAN5Itg1629TiGIjcASQ
	6zKbzsQodqkKUy8TjiUV61JwhyDDi1koLyWxx49EfP86rymNSozcbnYhoVrN5gup
	IASe3WXo7o+n3x1T859aB5FKTMwd98Sw0wZDnJQ6C8Le5JOlmURn1Wc88STRduGD
	Uhdo48FMOu0+wJz5hjGlWP3JvOclKTFXAsB2GIhqlA27RGOeQ+yAk3icUAFj7ZkM
	IeVgdDQW0H/Dc1HjbfavQ==
X-ME-Sender: <xms:9g4AZ7QNIYk1ZietiSNUlIUtOs9YUGwqdHu0NcVZzKF1kUpiRx7kjQ>
    <xme:9g4AZ8ypSBeQ1nyyd9mgeG179Oa8yYKeC-wEqbCZsdvfemNGkJLsQo9kudOGy-K4j
    8EVtRxAZbILY2E1eRI>
X-ME-Received: <xmr:9g4AZw3s7ZkjadTnWccoCJoS5ZrHqeAUstt24l4OGFMGTVR1rx-T4_udht7U5ROeF7G21d_kSsYfu7QRGXtJfuP_WrXroQ0NbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgleefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:9g4AZ7CbQHN0ac_Z0oeiCM73zrSY-C3PQYiODXHmMWtuabV0EUqO6g>
    <xmx:9g4AZ0gu5oBgAAND6QStkH0EWM3Yb4HBO7ykjdUDlbBaz_gEOKXRRQ>
    <xmx:9g4AZ_oA3UoWloZpl1gIrzYciq57QAYO46oxFYLE0uN-ygpygM9p3g>
    <xmx:9g4AZ_iXD5QoJiDrpV3ld4bmoEOIOvtOF-r8OmCrPHTShKzoPAu4tQ>
    <xmx:9g4AZ_VHfXTmF2sDLddhpYS2KTDZGZq8AaYZ-VrXUQkSIv8VCAlCTKzM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 11:51:17 -0400 (EDT)
Date: Fri, 4 Oct 2024 17:51:16 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 09/20] ARM: dts: renesas: kzm9g: Use interrupts-extended
 for I/O expander
Message-ID: <20241004155116.GP2071111@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <c77ffcd01d6e9e90cd1e5578c2af98c9ec6030c9.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c77ffcd01d6e9e90cd1e5578c2af98c9ec6030c9.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:51 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupt.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> index fe96ea07628779c6..ae7e68a44f493e1b 100644
> --- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> +++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> @@ -308,8 +308,7 @@ &i2c3 {
>  	pcf8575: gpio@20 {
>  		compatible = "nxp,pcf8575";
>  		reg = <0x20>;
> -		interrupt-parent = <&irqpin2>;
> -		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&irqpin2 3 IRQ_TYPE_EDGE_FALLING>;
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

