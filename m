Return-Path: <linux-renesas-soc+bounces-9441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FC9990842
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D239F1F210D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499641C3030;
	Fri,  4 Oct 2024 15:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iprSmbuN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c31HFYBM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A030F1C302B;
	Fri,  4 Oct 2024 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728056958; cv=none; b=P8n7fzOjCg6cQXmS8tWdhLM/HhhnLa+0jo4BPMSQpInXJuxdCvEjdT4VmsVXZiEOORSoX+G8jiyRAB8UCI2MFFVJwaGiT9zlnZVdjZgitv7b9XJS/1z7eE912FAOOpZw+ZdB4dSJZaRU4e0aKLPOcJYEko8HGAAGE9p54IQrEGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728056958; c=relaxed/simple;
	bh=duTbYwuSmUmOCTbIaRMckE+xsDb2Zi2o8KtUJX43pU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkXtQ9xhaTmhs243fXol67Q5yxMqLjO7U93OTojS7B/6JxKiercypC6GfPZd0PyXx4vNNYL5NuOMiBOZZpJp0ZQj8DIAI4+ceCPUs9C3NWuwz0GyVoSsj5DmEfj3X/UL5+BNOPd3mMk927sbeItQ9/T97cDEQNu70v8+LAe46PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iprSmbuN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c31HFYBM; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 93A4D13801D0;
	Fri,  4 Oct 2024 11:49:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 04 Oct 2024 11:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728056955;
	 x=1728143355; bh=5+eFpQaMQq8Ya7FrxZSlUl+HFRuoK01LnsMJRAbX8HM=; b=
	iprSmbuNQnKK2SBwwalbMC0YXKGH2VQYwSRFTqtQ7swz8MxgKGDoFZnhJv8AVKRi
	3DXenOd++jRvf5KdYsiSXOB+FnWAzSECHk0Yfs5CYpAjqqxDzy+aJZ++brNrryyn
	RreY/FD1jVledzCJjwVySBUKmd8Hfyt5VO5vlV4h4IqIJ4Ql1IU5sl8elMciaNFu
	NzelOEqSjBEIJT3efM4Q85RdSqE9c8ptFM+0ceMyfIZ0seTTYfD0g07OcN9NDTLL
	cPMdZJ8VwzOu+YPeLjMx/IoblzpXLyt8G6FwF1iQik17JYTe20BCt/DZ0fuMRrjj
	5XVclCduYL0bhAI5DQS8yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728056955; x=
	1728143355; bh=5+eFpQaMQq8Ya7FrxZSlUl+HFRuoK01LnsMJRAbX8HM=; b=c
	31HFYBMNgeaaUIIb532mBILzYkgMldgJdblXCXLQd1mAZ3YqCKif6kRyRo8lkIXh
	ADdIEdwyO3miZpv4Bqa7Y7/JNs9klCVpHDMREWstfiy2HiCseUdtYoVlOLE1IkbD
	xlEUgt3OM/TGNji3+aBfv82ORNC+xqThPqMEHCuT45Gghy+pPV9Txhnu1pmYiJJJ
	JYpVW/xVutA6sde0ATUxZFg0uddgfi5iHzXlsIVZVYnF+ggOqWRY5NpDHGQ0i0rS
	FY0GD+ONesrrrVmsvE1p8mEDchxe7MxHAo8vYUrzTM/i0ff/OeAc+LdPXKb8h7lY
	l4SWnYJ/jYqP2TJ/y9w4w==
X-ME-Sender: <xms:ew4AZ1b_3sBxBqneyzkv6_JvZyBeX9ryoY8ZAiASBpCpw29yAjjE-g>
    <xme:ew4AZ8YXmLf8H4M0g-dKgMXPMje4XixJwXyzMP6McdvjxlYh_xgK8A1sI1pPg3VBU
    EalDOipSOZTD66tKZc>
X-ME-Received: <xmr:ew4AZ39bBmdvHZbLMXbfZa22bBo4-OPMxsMFVMobP93Y9_WM5uVf058UjrP8PeTaBvXZDq-eKFZPOGbzW-lzDF9LcAD4j18tzw>
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
X-ME-Proxy: <xmx:ew4AZzp74FOCBVKT2HNR386lLNRePX61SnDhGU77yG4gS29S3gns1Q>
    <xmx:ew4AZwpYBoeHLlll1KM9cuNF4Em9X3xXH7oxV_xYErNQ-HENf1ZBRQ>
    <xmx:ew4AZ5QU64Yx-T49skw3RHrBPEq2b2s_BrAwRg0AUpqUaWDxLSjyrA>
    <xmx:ew4AZ4pMomkwtocYw3zec_-1-lPC95f6c-fPteawvkgkiCcNrl8OAQ>
    <xmx:ew4AZxfmAlWu7fqzTi7d7ekomqrVQcQVGrO3cyGaENTELGQSRL7gAEZD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 11:49:14 -0400 (EDT)
Date: Fri, 4 Oct 2024 17:49:13 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 07/20] ARM: dts: renesas: iwg22d-sodimm: Use
 interrupts-extended for port expander
Message-ID: <20241004154913.GN2071111@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <835b5e851939f6fa2c9567d6850a7e0c2574c1c7.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <835b5e851939f6fa2c9567d6850a7e0c2574c1c7.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:49 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupt.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
> index 24411044ef6c4f0b..3ac2526a24a1e130 100644
> --- a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
> @@ -185,8 +185,7 @@ sgtl5000: codec@a {
>  	port-expander@44 {
>  		compatible = "st,stmpe811";
>  		reg = <0x44>;
> -		interrupt-parent = <&gpio4>;
> -		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio4 4 IRQ_TYPE_LEVEL_LOW>;
>  
>  		/* 3.25 MHz ADC clock speed */
>  		st,adc-freq = <1>;
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

