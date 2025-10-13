Return-Path: <linux-renesas-soc+bounces-22981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C21BD637F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 22:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C441C34F424
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 20:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4BD30B508;
	Mon, 13 Oct 2025 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Wkplw5YO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CwPTgwHj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F9530AD14;
	Mon, 13 Oct 2025 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388055; cv=none; b=jjG0SL8b8WspoQUk4aQIVIkv6HhB/mqo686JO7gvydtXU7+BBjudEsH40IR2DvEugQshxIUfrPsGBbyd0sE0JHb7OAqayUEKfd712jXLSQbf0ls5F5/bM71MoRAGbQ9AWSwQTjP/xO9iqwb4SmaB1QCSkHCbfDniAaou8FTd7m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388055; c=relaxed/simple;
	bh=DcVuVJp7HSiPvZDba2BpyATvzPUakSy82swwD6F23Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaRx23bzdGON9O2nlQ7FkS1P7kT9DJJ7DYZChZO+mX8rVrmgnn08E+5HFW0jFD2w2/TuYsgnPdtbYLsjFtMOdxhxRHO+DFT7NLjQPKVGaK8oVQYbLR0Mo+0/PSeYdZSLjgCpb10OEuQkoAWNtWhE5pHeJpxo5XxHUtJb3f63cqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Wkplw5YO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CwPTgwHj; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 061BC1400165;
	Mon, 13 Oct 2025 16:40:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 13 Oct 2025 16:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760388052;
	 x=1760474452; bh=1E3qnV2NvPsWuGT/7V3vu79n4mHMpSOWaib+n5zXDNc=; b=
	Wkplw5YOJDNZKrfuXqyqCoNc5CWl6u81ReXoq3SzKU0+ui+56v14Lkw2FYwmd0x6
	jelQnqB6dAKpXwtazGhZz7QIYVKNAv3QDs5f6QR1Fm0RXuL9ZJeikaqv4dU3Oz0i
	g/TTWBUqYsrEdPvxz9ZyUbXSfOm6pzWUXPL594np9nOPVX/B6oaWPSeR3jySmdzJ
	/pniFEYr7W7VGn5RCkj0UJPMflaIsTbLlF3RHq5XTQ4G2wECnfM8Vtb8XUxXfiWD
	wNqedlLtVNjDYGXYvgU60aJnxA8WIxyJd1K9j+UdiAulaJjXDe3/Bl4DHTrnEUcj
	K4eh/0UXpzk+hAvDZMJUew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760388052; x=
	1760474452; bh=1E3qnV2NvPsWuGT/7V3vu79n4mHMpSOWaib+n5zXDNc=; b=C
	wPTgwHjog83Jz4ZsTFIyZI0F6LqKOKKKDAv2KVXwcSXRnj2TfVb5szMCHHRCVl+E
	paezqZUDulk2/ljV5pw4xaKnlgRHLIKemN9tmieQnmOrOSXurMSEIvCuLXmxtH5l
	YOguEVuLdKWYJuSv3V3k5+90XMId55JZ15HTIeN3d7STs3s3QE5Vabv7MA7uX1to
	g+2LD2rNnnMFgNDAfrbuNUnl2jgAaRMP9dWGoqK9RTabY2QLVZ+E3/7cHgzKh58n
	EBP1ExdQsjQr3PBLpNVR2P9Rq5lLIFT1hhwVDifuVGOxeQ2cCNdN+/Uf0b7PXOfg
	rav4sq5Si7/5X9huuOsEg==
X-ME-Sender: <xms:0mPtaDGG9kM0bBzX36DWmHjgZs1amQq-LJ-zT6rKLm2izWJ8PJt18A>
    <xme:0mPtaPlgacTABIUfqqx3KGFp9Pr4ZG2XUuF_H-dWN1NTJfvtq2loFD7tcOFWl7oWZ
    VVVvTAVqMGUNyFxM8s9wLoFYcq_RmVX4tzcutBO1hPgDiRdgcUuoew>
X-ME-Received: <xmr:0mPtaH_06LuxLiWI0JuAe3kVJRqcwim1wpQacux0BAUtbmT5gZBk-OqfL-N_t7EAIaSTXF4XDTLoIFFpApO4fbfNMuKmQKI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduudekieefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:0mPtaIkLwFH1mkzzgNNUxblJGSbIee9pZAN_ztgfC6ec8B5UBjFjbA>
    <xmx:0mPtaNlHuvw7f6WXdtarydE6tRd8eVSSZg3b9LuHH5IryDh3JIhdKA>
    <xmx:0mPtaEvc7D3STaqX7beMFPlXX3BNk49_mundccdHWKBs0cIRGGF0hA>
    <xmx:0mPtaPIU_VMDQzN0WgiYRgjeNF9H0kTc-kEM55Hz3M_YG_IgUCJFEQ>
    <xmx:02PtaN4fSmNnbYw_CZzDSY87rvy0-Bj2E--O_yBohRgBbbyx6gZBIzXB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Oct 2025 16:40:50 -0400 (EDT)
Date: Mon, 13 Oct 2025 22:40:48 +0200
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
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Message-ID: <20251013204048.GA4091728@ragnatech.se>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>

Hi Marek,

On 2025-10-13 21:01:18 +0200, Marek Vasut wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Really cool seeing this.

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
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> index 6d039019905de..4f7b2e838c026 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -2565,6 +2565,18 @@ gic: interrupt-controller@f1010000 {
>  			resets = <&cpg 408>;
>  		};
>  
> +		gpu: gpu@fd000000 {
> +			compatible = "renesas,r8a77960-gpu",
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
>  			compatible = "renesas,pcie-r8a7796",
>  				     "renesas,pcie-rcar-gen3";
> -- 
> 2.51.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

