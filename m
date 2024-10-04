Return-Path: <linux-renesas-soc+bounces-9440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1225B99083F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 327381C214C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD60C1AA7B6;
	Fri,  4 Oct 2024 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fJAV2p5J";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QfkV5qY+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44181AA7A8;
	Fri,  4 Oct 2024 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728056924; cv=none; b=X5Z+3+6SRb4M7DdHwjPSqaOT3KzAXR0bKbuZPYl7GJ5PJNo4yQCaeYkFV/T/XwxSGt102LsY4bl+cPQv6yv1ctBVYbVVjUrYR9Q2oo7rwX02vQGNGXrXOOQKnfZoTHoMNTf9TKZUdexMcH02CTGaEQMxlYZ2FJh85TOt+D7+CoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728056924; c=relaxed/simple;
	bh=k83A/KPsI9Qdok2DYpRIncQ7Bltk1R/IypJtgSx0bDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhmF/0Q97gdqT+j4OTM6tfFCddzglhKeylvG12mwNChBRgkNQbqSSRDtup6v4EUmtNbead3pnGlhqr3ETTxZLOt28dNZoxhw7t7VurTuwagan0TJgD9S2w+NQQtt4Wsm72D0sEozJ9md/zaRqBfFR1F0atX6WLXrPKEl3+umbS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fJAV2p5J; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QfkV5qY+; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C7CE411401CC;
	Fri,  4 Oct 2024 11:48:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 04 Oct 2024 11:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728056921;
	 x=1728143321; bh=jhm3caeauM6QiXEVUu45TFCLugJMC7dEt+sPkdECCYo=; b=
	fJAV2p5JWl7TO4Ci5AMVcvRQMeJXkwRY0KY9pgTwQ5VxDCIyG9Mcx6Vp4+ctnB48
	9z0ylrtN8XqHTKCTvIIpXGqvoqNG+hetnEohMHy6cZH2xLb/sDuInvepSNlIFXzw
	Oi4dBxO60SSfe0Pk/SjNLdGRIrBxUCv5B7W+wR4MpObTkMmWa8eoLbWPnNmfsPXE
	VbLN+IluQcR8LlovnYsw8fVJ5hEhWOF8o2PLVUP+P4oSTbbPhx+O43fpGa7uwJPA
	x3ejA39WmAHuZzfLONOzIG/htZCt1/0S3nQQA9GuOTH53eeYmrQcS0/NlAWknvdz
	iJMVYCU3iQXPG/9FkGbISQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728056921; x=
	1728143321; bh=jhm3caeauM6QiXEVUu45TFCLugJMC7dEt+sPkdECCYo=; b=Q
	fkV5qY+6Eso/z4ZJGgmWIibeTVnbCzKRHjhpAGkik1nM2wPabREeYuOrWIVKi+Yt
	6yd+/9NsZXwpmoCFwE8sJqG46KY59B467DBtLCapy8kl9LDKi0KHLTKfNVItxBJS
	S5b+27tEa7QnMPmKPii5Q5p0Nwcs7uOZBXM28V2heTRDnaNKBQkEV68SjVseyQUT
	UQ3ungcqEtK8eHfTvtxT3n6xdXYiTdbj2i30eDy+RMBB1zBWulaF7zoZkh2ybVei
	+xlgwZqY6il/IbORYRcG0t+4a6OjGDmq2xQseTmQYDODyOHJEoxKcnhJKAd8ojtF
	q2oOpW10seEsGro6Q5q9g==
X-ME-Sender: <xms:WQ4AZ61rJCimO5sXEDuq8LmKB9M0r5RbOMNXZYijEx4eIQxz60RI-Q>
    <xme:WQ4AZ9FisWFXdxgwDWwXqOHP2nbA93c3m3ZU_tG3otvZffqwcooObNP1J_6zsjQjk
    yJqP1e8LP4tKnfvuos>
X-ME-Received: <xmr:WQ4AZy4xW0VBO6hz_M-QZ6SkjWWdnQBfcRajOd3_hpMjCX4wb4nwKbdyOyF7Bh0qTg_Tru_gGbNdm05wShZ6diYzr8LXk3b-Xg>
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
X-ME-Proxy: <xmx:WQ4AZ72wTvX4InL7IN_ir02zZ4tgVFxBplMHAt1lUBF7EHXzW0UrXg>
    <xmx:WQ4AZ9HSyjUvoH_oyhTj0Nv_Cn-nxCh_5N_HhFGxniRaWCdpNVlDUg>
    <xmx:WQ4AZ08lVji0KlL8AifYL9OGUgwjWvGAghQHeCKCrU_Zgg5yfL5Okg>
    <xmx:WQ4AZylupLuav4phFlC8UcFw2PmK-8sp9E498D7joJGLU3YFRmaSiQ>
    <xmx:WQ4AZy4W6M8Lyt3bzVq7NaHmE3rUYrg-MkDBdPkY5U2mJRXW2crsagv9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 11:48:41 -0400 (EDT)
Date: Fri, 4 Oct 2024 17:48:39 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/20] ARM: dts: renesas: Use interrupts-extended for
 video decoders
Message-ID: <20241004154839.GM2071111@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <a8610814e31d0562732672f11d2be1404322121a.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8610814e31d0562732672f11d2be1404322121a.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:48 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 3 +--
>  arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 3 +--
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> index 47ffa278a0dfd79e..752feea087afbc93 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> @@ -402,8 +402,7 @@ adv7511_out: endpoint {
>  		hdmi-in@4c {
>  			compatible = "adi,adv7612";
>  			reg = <0x4c>;
> -			interrupt-parent = <&gpio1>;
> -			interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
>  			default-input = <0>;
>  
>  			ports {
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> index 1a0d2c6ed0e83ce7..e4e1d9c98c617883 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> @@ -434,8 +434,7 @@ adv7511_out: endpoint {
>  		hdmi-in@4c {
>  			compatible = "adi,adv7612";
>  			reg = <0x4c>;
> -			interrupt-parent = <&gpio4>;
> -			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio4 2 IRQ_TYPE_LEVEL_LOW>;
>  			default-input = <0>;
>  
>  			ports {
> diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> index 5334af25c10111c8..2c05d7c2b3776525 100644
> --- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> @@ -418,8 +418,7 @@ adv7511_out: endpoint {
>  		hdmi-in@4c {
>  			compatible = "adi,adv7612";
>  			reg = <0x4c>;
> -			interrupt-parent = <&gpio4>;
> -			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +			interrupts-extended = <&gpio4 2 IRQ_TYPE_LEVEL_LOW>;
>  			default-input = <0>;
>  
>  			ports {
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

