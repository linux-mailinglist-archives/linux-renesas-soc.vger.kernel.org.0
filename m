Return-Path: <linux-renesas-soc+bounces-3918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 674E588079C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 23:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84FC41C22987
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 22:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BDF5FB8E;
	Tue, 19 Mar 2024 22:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="X20fYEEC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hMJzRGKY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from flow1-smtp.messagingengine.com (flow1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A85EE67
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 22:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710888925; cv=none; b=JlnYHHI4eH5iTwNeH/ye/SvNK+Qj+rl+kxMEnTV0W3c+agPjKGjT7fLfwYsfx6i75Dj5cdr32V9OxGUaI2wHj11HF0KTjYGMVgykwB8TQXQz7+MOnGYZVI8OQj0Ph6182lGBAsfeECuEbvaJfY2n9NSOuNPV8t1Sv4pvFK9ECtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710888925; c=relaxed/simple;
	bh=KclUZ2wmWRs6wLU8wyVFBRJst2nClNGRowy4sbD1XDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpxHI5XxlzuhTzJX2b1g71Om8uAibDKaa7BPa2AKrTHmh0Imt0d2g7cgn4eNsc7yCBo27eFZqcZ97qUb6B/ofXEJPfzYO+jgSN5/Telm6eOXYGcUI6Kp2/UhTRLyb26JQCVmPMzJMSry+VP0M5+19uvqS1QvbovnzD8okEmwxYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=X20fYEEC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hMJzRGKY; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailflow.nyi.internal (Postfix) with ESMTP id 2F23C200324;
	Tue, 19 Mar 2024 18:55:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 19 Mar 2024 18:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710888921;
	 x=1710892521; bh=KGkaJNjA5uQOjDF0j/KQq+RkpHh/JsRYqokAA0Q1hA0=; b=
	X20fYEECJk/Od/CG2rg+VHOnLCP4xWiynllA4Q13wT6kRAm9QcOGjUGyVg1jXzHe
	aqIB9TMaKAdcQ7nBiZ5mnRCUWBDlapc6/kw957OPLYuwI8ie4MYYuoprHv+OraO/
	BdOfJyyWc3aKHsBCmV1AQoTjkWa6gnnlLrpY1y2g1VPsxvnQuAhGgNEuUlPzSJJt
	If0fqLxrZ0x6/xfKAEBD/zy27DxH+GSF6CU+w41ZslxRuS7aKUdj6LIuy2l/oDNZ
	I8OorTo3XeG8EohsU267ngxxG5+NfUehE7plekSRQ81kPIpyDO01pabr8Wklqnok
	XyrgNIQTRSxSgrKgHEtLjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=i80c9496c.fm2; t=
	1710888921; x=1710892521; bh=KGkaJNjA5uQOjDF0j/KQq+RkpHh/JsRYqok
	AA0Q1hA0=; b=hMJzRGKYMC54za1ypUGegK3hKD1uMQGwyDFk82PL5bg1Tow7CI9
	hXTx0ZgTI68/+QuzFoIBw3SJmcgzfcIdIuRm4UF/N4twwfdmElffSFpGkmEUkX+t
	YtT1boYi1WYFKWInoaQdnUAyN/NDVVhCA/DE09OupwbseVL9ayj/lRScpuFh9fLn
	0zJfze2EUEI6By3CbDsQ1i4BZnDyAGfUuQt9thpsj3B2xQMa4yXQBnX/qYextN1E
	3aw4YN3NHrAhzpIx67OupAGD1v9iIYHX06bB7/uk+npW2jh6CXqOh92jOKUYK2aK
	A3cFl5V7bXnJSCgAT3Ci5gzEJ3hCtTguQRQ==
X-ME-Sender: <xms:2Bf6ZVfa-peFqdNmCT9gITQL355b0VMi7hgkj3L-o_bhwZuS75mmog>
    <xme:2Bf6ZTM9IxiKnVS427omkxxwJEWdy28wmOPZ5kXEjxdwqZh7VVo75UoXoh0L3T-0N
    dBU2QebLjwBy68rmLw>
X-ME-Received: <xmr:2Bf6Zeg4YYxMYCgdj7ouN67zp5U3Os1PKa5Z97i7MENV9QPOKkOsp8BxUn7lUgh0tM4loWKrPtl-1ubqu_IzcQt3E8y4y44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrledugddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfff
    jefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:2Bf6Ze8WSQkygIaiiGfG3kYPKzbZ-BrIGuQ7BlLV4J_BSFYV20FAzQ>
    <xmx:2Bf6ZRtCUUG0wR2mqM2kIDgWnDU-yEMdIc4x10U-4-L0hfE7gSvHXQ>
    <xmx:2Bf6ZdEDyKxOJbCsKlb8Feo03MUS0nHG_ZDRWdIN0CXZRSYMhL4ZIA>
    <xmx:2Bf6ZYP34Hmrpyy3LfkL7cpsBMc6P6IC68Vyd82L9QaqMKozegg0rQ>
    <xmx:2Bf6ZbLTmudAZo_5x3sLcedF5Vh2cI9if0T56cMu-hH_4LmR6vddnWruPkM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Mar 2024 18:55:20 -0400 (EDT)
Date: Tue, 19 Mar 2024 23:55:18 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: renesas: rcar-gen2: Add TMU nodes
Message-ID: <20240319225518.GD3438308@ragnatech.se>
References: <cover.1710864964.git.geert+renesas@glider.be>
 <7efbc8dbac6876f454011563edc1ae8eb50c95db.1710864964.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7efbc8dbac6876f454011563edc1ae8eb50c95db.1710864964.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-03-19 17:29:07 +0100, Geert Uytterhoeven wrote:
> Add device nodes for the Timer Units (TMU) on the R-Car H2 (R8A7790),
> M2-W (R8A7791), V2H (R8A7792), M2-N (R8A7793), and E2 (R8A7794) SoCs.

Maybe add the TMU3 issue on M2-W from the cover letter here too?

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/renesas/r8a7790.dtsi | 58 +++++++++++++++++++++++++
>  arch/arm/boot/dts/renesas/r8a7791.dtsi | 58 +++++++++++++++++++++++++
>  arch/arm/boot/dts/renesas/r8a7792.dtsi | 59 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/renesas/r8a7793.dtsi | 58 +++++++++++++++++++++++++
>  arch/arm/boot/dts/renesas/r8a7794.dtsi | 58 +++++++++++++++++++++++++
>  5 files changed, 291 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/renesas/r8a7790.dtsi b/arch/arm/boot/dts/renesas/r8a7790.dtsi
> index 46fb81f5062ff6bc..583b74a9f071c39e 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7790.dtsi
> @@ -434,6 +434,64 @@ irqc0: interrupt-controller@e61c0000 {
>  			resets = <&cpg 407>;
>  		};
>  
> +		tmu0: timer@e61e0000 {
> +			compatible = "renesas,tmu-r8a7790", "renesas,tmu";
> +			reg = <0 0xe61e0000 0 0x30>;
> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2";
> +			clocks = <&cpg CPG_MOD 125>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +			resets = <&cpg 125>;
> +			status = "disabled";
> +		};
> +
> +		tmu1: timer@fff60000 {
> +			compatible = "renesas,tmu-r8a7790", "renesas,tmu";
> +			reg = <0 0xfff60000 0 0x30>;
> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 111>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +			resets = <&cpg 111>;
> +			status = "disabled";
> +		};
> +
> +		tmu2: timer@fff70000 {
> +			compatible = "renesas,tmu-r8a7790", "renesas,tmu";
> +			reg = <0 0xfff70000 0 0x30>;
> +			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 122>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +			resets = <&cpg 122>;
> +			status = "disabled";
> +		};
> +
> +		tmu3: timer@fff80000 {
> +			compatible = "renesas,tmu-r8a7790", "renesas,tmu";
> +			reg = <0 0xfff80000 0 0x30>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2";
> +			clocks = <&cpg CPG_MOD 121>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +			resets = <&cpg 121>;
> +			status = "disabled";
> +		};
> +
>  		thermal: thermal@e61f0000 {
>  			compatible = "renesas,thermal-r8a7790",
>  				     "renesas,rcar-gen2-thermal",
> diff --git a/arch/arm/boot/dts/renesas/r8a7791.dtsi b/arch/arm/boot/dts/renesas/r8a7791.dtsi
> index b9d34147628e1201..de08ceb62230b6dd 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7791.dtsi
> @@ -351,6 +351,64 @@ irqc0: interrupt-controller@e61c0000 {
>  			resets = <&cpg 407>;
>  		};
>  
> +		tmu0: timer@e61e0000 {
> +			compatible = "renesas,tmu-r8a7791", "renesas,tmu";
> +			reg = <0 0xe61e0000 0 0x30>;
> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2";
> +			clocks = <&cpg CPG_MOD 125>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> +			resets = <&cpg 125>;
> +			status = "disabled";
> +		};
> +
> +		tmu1: timer@fff60000 {
> +			compatible = "renesas,tmu-r8a7791", "renesas,tmu";
> +			reg = <0 0xfff60000 0 0x30>;
> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 111>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> +			resets = <&cpg 111>;
> +			status = "disabled";
> +		};
> +
> +		tmu2: timer@fff70000 {
> +			compatible = "renesas,tmu-r8a7791", "renesas,tmu";
> +			reg = <0 0xfff70000 0 0x30>;
> +			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 122>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> +			resets = <&cpg 122>;
> +			status = "disabled";
> +		};
> +
> +		tmu3: timer@fff80000 {
> +			compatible = "renesas,tmu-r8a7791", "renesas,tmu";
> +			reg = <0 0xfff80000 0 0x30>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2";
> +			clocks = <&cpg CPG_MOD 121>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> +			resets = <&cpg 121>;
> +			status = "disabled";
> +		};
> +
>  		thermal: thermal@e61f0000 {
>  			compatible = "renesas,thermal-r8a7791",
>  				     "renesas,rcar-gen2-thermal",
> diff --git a/arch/arm/boot/dts/renesas/r8a7792.dtsi b/arch/arm/boot/dts/renesas/r8a7792.dtsi
> index ecfab3ff59e843ff..7defeb8e4cd1f499 100644
> --- a/arch/arm/boot/dts/renesas/r8a7792.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7792.dtsi
> @@ -351,6 +351,65 @@ irqc: interrupt-controller@e61c0000 {
>  			resets = <&cpg 407>;
>  		};
>  
> +		tmu0: timer@e61e0000 {
> +			compatible = "renesas,tmu-r8a7792", "renesas,tmu";
> +			reg = <0 0xe61e0000 0 0x30>;
> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2";
> +			clocks = <&cpg CPG_MOD 125>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
> +			resets = <&cpg 125>;
> +			status = "disabled";
> +		};
> +
> +		tmu1: timer@fff60000 {
> +			compatible = "renesas,tmu-r8a7792", "renesas,tmu";
> +			reg = <0 0xfff60000 0 0x30>;
> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 111>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
> +			resets = <&cpg 111>;
> +			status = "disabled";
> +		};
> +
> +		tmu2: timer@fff70000 {
> +			compatible = "renesas,tmu-r8a7792", "renesas,tmu";
> +			reg = <0 0xfff70000 0 0x30>;
> +			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 122>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
> +			resets = <&cpg 122>;
> +			status = "disabled";
> +		};
> +
> +		tmu3: timer@fff80000 {
> +			compatible = "renesas,tmu-r8a7792", "renesas,tmu";
> +			reg = <0 0xfff80000 0 0x30>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 121>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
> +			resets = <&cpg 121>;
> +			status = "disabled";
> +		};
> +
>  		icram0:	sram@e63a0000 {
>  			compatible = "mmio-sram";
>  			reg = <0 0xe63a0000 0 0x12000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7793.dtsi b/arch/arm/boot/dts/renesas/r8a7793.dtsi
> index f51bf687f4bd55d3..d32a9d5d3faa71fc 100644
> --- a/arch/arm/boot/dts/renesas/r8a7793.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7793.dtsi
> @@ -326,6 +326,64 @@ irqc0: interrupt-controller@e61c0000 {
>  			resets = <&cpg 407>;
>  		};
>  
> +		tmu0: timer@e61e0000 {
> +			compatible = "renesas,tmu-r8a7793", "renesas,tmu";
> +			reg = <0 0xe61e0000 0 0x30>;
> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2";
> +			clocks = <&cpg CPG_MOD 125>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
> +			resets = <&cpg 125>;
> +			status = "disabled";
> +		};
> +
> +		tmu1: timer@fff60000 {
> +			compatible = "renesas,tmu-r8a7793", "renesas,tmu";
> +			reg = <0 0xfff60000 0 0x30>;
> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 111>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
> +			resets = <&cpg 111>;
> +			status = "disabled";
> +		};
> +
> +		tmu2: timer@fff70000 {
> +			compatible = "renesas,tmu-r8a7793", "renesas,tmu";
> +			reg = <0 0xfff70000 0 0x30>;
> +			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 122>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
> +			resets = <&cpg 122>;
> +			status = "disabled";
> +		};
> +
> +		tmu3: timer@fff80000 {
> +			compatible = "renesas,tmu-r8a7793", "renesas,tmu";
> +			reg = <0 0xfff80000 0 0x30>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2";
> +			clocks = <&cpg CPG_MOD 121>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
> +			resets = <&cpg 121>;
> +			status = "disabled";
> +		};
> +
>  		thermal: thermal@e61f0000 {
>  			compatible = "renesas,thermal-r8a7793",
>  				     "renesas,rcar-gen2-thermal",
> diff --git a/arch/arm/boot/dts/renesas/r8a7794.dtsi b/arch/arm/boot/dts/renesas/r8a7794.dtsi
> index 371dd4715ddef83d..f37f094cecc8c399 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7794.dtsi
> @@ -292,6 +292,64 @@ irqc0: interrupt-controller@e61c0000 {
>  			resets = <&cpg 407>;
>  		};
>  
> +		tmu0: timer@e61e0000 {
> +			compatible = "renesas,tmu-r8a7794", "renesas,tmu";
> +			reg = <0 0xe61e0000 0 0x30>;
> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2";
> +			clocks = <&cpg CPG_MOD 125>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
> +			resets = <&cpg 125>;
> +			status = "disabled";
> +		};
> +
> +		tmu1: timer@fff60000 {
> +			compatible = "renesas,tmu-r8a7794", "renesas,tmu";
> +			reg = <0 0xfff60000 0 0x30>;
> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 111>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
> +			resets = <&cpg 111>;
> +			status = "disabled";
> +		};
> +
> +		tmu2: timer@fff70000 {
> +			compatible = "renesas,tmu-r8a7794", "renesas,tmu";
> +			reg = <0 0xfff70000 0 0x30>;
> +			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
> +			clocks = <&cpg CPG_MOD 122>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
> +			resets = <&cpg 122>;
> +			status = "disabled";
> +		};
> +
> +		tmu3: timer@fff80000 {
> +			compatible = "renesas,tmu-r8a7794", "renesas,tmu";
> +			reg = <0 0xfff80000 0 0x30>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "tuni0", "tuni1", "tuni2";
> +			clocks = <&cpg CPG_MOD 121>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
> +			resets = <&cpg 121>;
> +			status = "disabled";
> +		};
> +
>  		ipmmu_sy0: iommu@e6280000 {
>  			compatible = "renesas,ipmmu-r8a7794",
>  				     "renesas,ipmmu-vmsa";
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

