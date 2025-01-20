Return-Path: <linux-renesas-soc+bounces-12266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A2A16C99
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 13:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5761E3A15B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 12:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85D81DFD80;
	Mon, 20 Jan 2025 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Kd5G6htV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="esbe+zYl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D53E1FC8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737377725; cv=none; b=nqe3oTyWzXZon5DzFc5twiz6qKMrw6hlzMaxDigxw3vqfAjyMKHcPqncV7ynp1KqNtzjzryQ4XEYbZVCJEYhzmEeAE0cqM+9DqCaHW+nTHiuJ+2Cry4dsr3PgXhIisc29rv/1i9rfp0dFxgJLo4eP8BVkwPO7IMyoSFVKp02ctY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737377725; c=relaxed/simple;
	bh=aCNDFXQpqiUKIyA1ghveSZhrTGJng4IZBoc2Q8W+rvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9xnok6IodaERTHa2fU7HKZcxNgLdt+L338jKXyGKxLkq08iMkLI5eDYysJF8jXfOyci7Y68BsZkQKLgN3GjS5mUh/I50f03Oz96fdCm8M1r8c77e5PyQ5h5eBERnOn/Udn5j9llLOb7I+y5UBEYuaNP5l/pR+IJWIxYE2GeldE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Kd5G6htV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=esbe+zYl; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F405F1140200;
	Mon, 20 Jan 2025 07:55:20 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 20 Jan 2025 07:55:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737377720;
	 x=1737464120; bh=62r1sM0l1Yp4OlCuM25K7HddxB3fldSXZQM27P3xJBc=; b=
	Kd5G6htVP33uv0d097pz2+zuMeu98dQzZSwErNiwBoBKX69Ppe0AR/oILgjMqf8M
	suU3NjvFsJAFVazva/SQO/v9q+e7plT7XfG96uhJYeHDjeaID8TwUFXM6bdf6a76
	fLYBw0s6qlGRZGL+m9WnjacRJ3O/8jMlzyDs/gJ5/NzcLgTjVFGq1/5pJGa3yWJd
	NAVKlXCM8bJ2hrh703JJBaBmDBBTY2VNSMBRGzx6iRulIN4kKundx7aCrhe0buc0
	2CyRhTaWAyikNswPNY37uNbngwl2cT4hSY5Jn/NebHu9hT1zyOpn0Gng3YAS8eNm
	pCc8l/luZ9qzYnwchn8B/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737377720; x=
	1737464120; bh=62r1sM0l1Yp4OlCuM25K7HddxB3fldSXZQM27P3xJBc=; b=e
	sbe+zYlkofnDdGtK8jZVYnJLnmKRcHcfNEkDxjmQhFdp8TIi8awS/19wICnrfh9d
	lmSpord1AnWfI4vP3K91mYL0RDP2r2At7F4ZKnsHJOx8hlH2ZL/JzAQJCxwyXHka
	PNnrdqugryeafhySN+M928MXJ6IXhVFzpTQkwV6pWM+JoEzEEVnzn3kEuywGcmPk
	24T5TlzN0KUOKYChtqRbgnOLRSXzQPJoqv6+LGc4yiNNiN7fUzH86bsxdBzzEQTW
	uy9M8c9gjTbWMgGWPfH9i6W3aAKUDPkhkvajc09a65ttf5u0uZKUEjHXmC3yWt+1
	K7khdkB4bkH8B5/CVt76A==
X-ME-Sender: <xms:uEeOZ-T4ODMKqjaMy3zgMdpfZnRT9RK85bRZ63U9fRJuPj8JC3RLNw>
    <xme:uEeOZzztBHEggfy4RKFvRCWZYjK8UDlEOpdeOQsgEiZfBBDRCPStYyv3le9optC64
    4FJvzakErsgQ0p4oFc>
X-ME-Received: <xmr:uEeOZ71C7T6cTnTpzpDJOple8KhPgGU3hjT3p3WuqNwipCjfNMSKmHSnyIiB8Bw_oiSjydPe7i-6ZcUjkWrvQdpoMTdOTJCorQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiledggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhi
    uggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:uEeOZ6CkGqaIIug1PDzg1VJTkO21PglsMI6yvwrFYuEJbOMOUnMEkw>
    <xmx:uEeOZ3icA2kKHLUWEBIR4o1606cvigErRKWw8Cuy0zpfncjj0qcTuw>
    <xmx:uEeOZ2oLpMRU30BUy4pTDdF7xF6e9ACQWxCvXLFUj0WCHXn05dbVIA>
    <xmx:uEeOZ6ipbwCLF5ODfRYGDnnGDtgQw0yIs2r08x2K4hvqmHyVyLDJ7w>
    <xmx:uEeOZ3fF_ZrcvHH89PsdsHy-DlDwZasOOExrh1ibJLSCLCgtDBP3jSOT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jan 2025 07:55:20 -0500 (EST)
Date: Mon, 20 Jan 2025 13:55:18 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Restore sort order
Message-ID: <20250120125518.GB2692966@ragnatech.se>
References: <ccd215c1146b84c085908e01966f7036be51afa8.1737370801.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccd215c1146b84c085908e01966f7036be51afa8.1737370801.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2025-01-20 12:09:12 +0100, Geert Uytterhoeven wrote:
> Numerical by unit address, but grouped by type.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v6.15.
> 
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 80 +++++++++++------------
>  1 file changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index 89049e40086c2d41..cbc4680e497734d3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -2171,6 +2171,24 @@ fcpvd1: fcp@fea11000 {
>  			iommus = <&ipmmu_vi1 7>;
>  		};
>  
> +		fcpvx0: fcp@fedb0000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfedb0000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 1100>;
> +			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
> +			resets = <&cpg 1100>;
> +			iommus = <&ipmmu_vi1 24>;
> +		};
> +
> +		fcpvx1: fcp@fedb8000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfedb8000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 1101>;
> +			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
> +			resets = <&cpg 1101>;
> +			iommus = <&ipmmu_vi1 25>;
> +		};
> +
>  		vspd0: vsp@fea20000 {
>  			compatible = "renesas,vsp2";
>  			reg = <0 0xfea20000 0 0x7000>;
> @@ -2193,6 +2211,28 @@ vspd1: vsp@fea28000 {
>  			renesas,fcp = <&fcpvd1>;
>  		};
>  
> +		vspx0: vsp@fedd0000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfedd0000 0 0x8000>;
> +			interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 1028>;
> +			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
> +			resets = <&cpg 1028>;
> +
> +			renesas,fcp = <&fcpvx0>;
> +		};
> +
> +		vspx1: vsp@fedd8000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfedd8000 0 0x8000>;
> +			interrupts = <GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 1029>;
> +			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
> +			resets = <&cpg 1029>;
> +
> +			renesas,fcp = <&fcpvx1>;
> +		};
> +
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a779g0";
>  			reg = <0 0xfeb00000 0 0x40000>;
> @@ -2453,46 +2493,6 @@ port@1 {
>  			};
>  		};
>  
> -		fcpvx0: fcp@fedb0000 {
> -			compatible = "renesas,fcpv";
> -			reg = <0 0xfedb0000 0 0x200>;
> -			clocks = <&cpg CPG_MOD 1100>;
> -			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
> -			resets = <&cpg 1100>;
> -			iommus = <&ipmmu_vi1 24>;
> -		};
> -
> -		fcpvx1: fcp@fedb8000 {
> -			compatible = "renesas,fcpv";
> -			reg = <0 0xfedb8000 0 0x200>;
> -			clocks = <&cpg CPG_MOD 1101>;
> -			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
> -			resets = <&cpg 1101>;
> -			iommus = <&ipmmu_vi1 25>;
> -		};
> -
> -		vspx0: vsp@fedd0000 {
> -			compatible = "renesas,vsp2";
> -			reg = <0 0xfedd0000 0 0x8000>;
> -			interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 1028>;
> -			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
> -			resets = <&cpg 1028>;
> -
> -			renesas,fcp = <&fcpvx0>;
> -		};
> -
> -		vspx1: vsp@fedd8000 {
> -			compatible = "renesas,vsp2";
> -			reg = <0 0xfedd8000 0 0x8000>;
> -			interrupts = <GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 1029>;
> -			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
> -			resets = <&cpg 1029>;
> -
> -			renesas,fcp = <&fcpvx1>;
> -		};
> -
>  		prr: chipid@fff00044 {
>  			compatible = "renesas,prr";
>  			reg = <0 0xfff00044 0 4>;
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

