Return-Path: <linux-renesas-soc+bounces-22982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D78BD63A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 22:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B70B4042DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 20:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12F930B518;
	Mon, 13 Oct 2025 20:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HOom0KBy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jSy5gwsC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AB430AAC8;
	Mon, 13 Oct 2025 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388089; cv=none; b=AkxNToZjyy0+LeG6v7nPY7TlJJbknUC58qK3ptW1B3eqVRMA49WYLtr0X72fxP7l8zkwqsaDW3JZ4fjweau1Ke4AdRMw5BRpXP+e/TrBGkgHGO5uYgbb9sG4OjbwkiUixkoqJ67s56xNCfdm9jtBfK/dJ0zikzHMYAQD51/vp/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388089; c=relaxed/simple;
	bh=B3ry13noz6I2h+9BRUwuB7F1wBJaTRTmfizwk96KIYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+J3dQ/bVeuHY/MMlzKN4vBWMU5mk2qVqPSnyRM+Mpk5xK3THpLPCc19mvI/NrXnFGHLfGaAeSeTuBhNqtOOn7IE5zJ4t6IrNWfhqjoak8jSznP4w7nbdeBJkEbhkw7VG3p5lrTtz3fMD4Vkft/nh5gV/p3gSDS2Hn3N9uk69LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HOom0KBy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jSy5gwsC; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id E742BEC008E;
	Mon, 13 Oct 2025 16:41:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 13 Oct 2025 16:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760388086;
	 x=1760474486; bh=iEl72fcRPaB9ijt1qGe2FaeztvY/Cj30Nyzx8mav8ck=; b=
	HOom0KByqoB4u/4Bi8TnF+BuIlEgEaoSU9emlpn/IDQW58olj9I5Txh2Zdb7HerY
	bNBaDSY9DhHUK7HsAy7BEvZPRk4DZ5jc4p3yDS9w5p93sI2AFcnWhqE3Ry/Qg8ps
	yYhl+WX5uadJXO7N0KEi2X7HR4ocZvCISrax5wseo0kHD1CTRXephZeQSYXrd+MY
	MtVRf+mgplZZhn9XTB08Zo7EkMMn+67NQ+X/u8IGcT3tC0+ToHulx3SsbZO1FGpj
	XfxBmZ4SoUygXxaviuoV3MMs1JZL4jQxAwz4u3dKk78jo8b/yx0iFbs3VmDO4yVZ
	+NuuZ8ORbLlS+cmvx0y9HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760388086; x=
	1760474486; bh=iEl72fcRPaB9ijt1qGe2FaeztvY/Cj30Nyzx8mav8ck=; b=j
	Sy5gwsCsteDZw62AfuqscklAJhBsE+itz8LQpvg+86zNDc0GkYgHZ+7KZOAkk44j
	Z8hUPOG0yop78vkrB2vl++t9mbCPgBVFUgPo4TRZCHt17VtHgo8g6NhltsJZwJh5
	1g/EdCA+L49IoZ/BY9UL0Secwot4rXrTw/bjJ6kas3A6etHG5N86Oh7gA3Aj0N/x
	AGGSGKrqVJpHRLX97CXZsm+fLMq+IxmX2RBcjMdDn7mETGoQFITTcIK6y/hhe3D7
	N9I1EY8A8eEZcSt9vfkUyrhE4/oqzfEcge2o+13VG8Lgpg4lp6GRc/u0hphU2Lr7
	MykuJf8BiqchccphlRPKw==
X-ME-Sender: <xms:9mPtaPC-MYrr0bSi5GqQs2fXSIYYMPWb5F1Yv8rPBNTMvVnoJcjv2A>
    <xme:9mPtaEwksNIErxcf0IqijoyNV3VdLGI_uENvRK25vAxH0ib30AHPFltfmg-g04pg6
    9kZ3IFpvNLdz0ZYDpniAp7DTLliaHXea9HOl0Sd2shypz1NgMk2qndo>
X-ME-Received: <xmr:9mPtaNawCm7xgmkm_VBlZs3uWSac31tZCoRrjGglumBmzzPoHvEBlgf5opeiubGg2KthnRiy4jPr8rjRqt7wDobedLQH_uQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduudekieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidr
    ohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrfhhorhguudejfeesghhmrghilhdr
    tghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehfrhgrnhhkrdgs
    ihhnnhhssehimhhgthgvtgdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrg
    hssehglhhiuggvrhdrsggvpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrghigsehrvghnvg
    hsrghsrdgtohhm
X-ME-Proxy: <xmx:9mPtaJRmh4vcgA6lgFccTZIsXWH3d-H8Iy_zNLe5ZxWlnfTKBMK69A>
    <xmx:9mPtaIjtiyonJrGZ2qiGgTWfLmeQw_-NhVohqkaiTnUy44ejUWXSWw>
    <xmx:9mPtaM6hX5qvajUTVteoiGwReOZAx3y8gChDugYkzOpyKCLAH2J3wA>
    <xmx:9mPtaLnfEn3cOu9xIwALCpQAridEcT6KjFw9BTNTykLasyVc6-ZqFQ>
    <xmx:9mPtaEBKGlW5GFv8sgeAa9pIkbGlo2AfwD9fWfedcenVDTH4W70PqzRx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Oct 2025 16:41:25 -0400 (EDT)
Date: Mon, 13 Oct 2025 22:41:24 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
Message-ID: <20251013204124.GB4091728@ragnatech.se>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-3-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251013190210.142436-3-marek.vasut+renesas@mailbox.org>

Hi Marek,

Thanks for your work.

On 2025-10-13 21:01:19 +0200, Marek Vasut wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77961 M3-W+ SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index 1637b534fc68b..77ed99e8d7b9e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2445,6 +2445,18 @@ gic: interrupt-controller@f1010000 {
>  			resets = <&cpg 408>;
>  		};
>  
> +		gpu: gpu@fd000000 {
> +			compatible = "renesas,r8a77961-gpu",
> +				     "img,img-gx6250",
> +				     "img,img-rogue";
> +			reg = <0 0xfd000000 0 0x40000>;
> +			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 112>;
> +			clock-names = "core";
> +			power-domains = <&sysc R8A7796_PD_3DG_B>;
> +			resets = <&cpg 112>;
> +		};
> +
>  		pciec0: pcie@fe000000 {
>  			compatible = "renesas,pcie-r8a77961",
>  				     "renesas,pcie-rcar-gen3";
> -- 
> 2.51.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

