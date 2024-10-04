Return-Path: <linux-renesas-soc+bounces-9442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B903E990843
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E945F1C21977
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFBF1C3048;
	Fri,  4 Oct 2024 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IS2V6njI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XFLTv5lU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392751C3034;
	Fri,  4 Oct 2024 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728056974; cv=none; b=YcqcznrPnzwiYhc7ydmoQwEWycB3k1b2Z50MxCMp8JJWlk6xWfYtZP3oqzx3DdD95YcrPsyJMmfZ2CjYIqgk3VW04c7mWKae+971TtqNNIlHcXCYvSLJarMMHXFdGDlM5jGb5a1qHwQzgYjUBwfN7F9YoEYnjMxTXxWj22z8XqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728056974; c=relaxed/simple;
	bh=g1QAFq1eUb02rZk84gaDCHRiksxPEgFhP/0Sdlo+Oxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCak19S6rIsAOw4zkdZ6TruTp6dS7XqhOJsfiGA8/K8yn3c67Ep8k+fj4f8yu6MXlw8GdAHRm97qfYDQviNzKRfteNM653aeDLNNue/Ec+OY8IyRf50kwXDN4QbM/NcdnbShLF0nEn5nELYdEgoWMx2imyorg2zph9ZUl7vSL3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IS2V6njI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XFLTv5lU; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 58BD6138039F;
	Fri,  4 Oct 2024 11:49:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 04 Oct 2024 11:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728056971;
	 x=1728143371; bh=hG5F/dEQBEZLwmUUS9ROJPYfgg2E9oCLojAsuu2GhQU=; b=
	IS2V6njInAapT+cpZ0ow/RouZIVVc1eXPYypZOEo3y+i5+yyk+cn03xTNbUp8jl9
	hshx7B3LkATRBuoIOvVjHEwIdXHDpZP1SWYyTrSXwUTIAbCdPu975AVmmkCVlzw8
	NZVvWuZ6Qlp88g7AFHLB50mIhG4nIv3gKwxQpLw4JGtpfpgnxINutNZ0oFKnMB/g
	5jw1Y9AcNyr0dpPLxP7aBEv/GXuXJP7+kmpRVlaU+Fio15LpUr8CTtwvTAtQ8cuH
	AzXLESmhhStobQETJLWJ4iBzGTLM5mBct9n6/8EA9G89UF6etaApmjBJlBHdPa+8
	MKqBacAC/Uq7zzAFNn7MNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728056971; x=
	1728143371; bh=hG5F/dEQBEZLwmUUS9ROJPYfgg2E9oCLojAsuu2GhQU=; b=X
	FLTv5lUsfhSjvWeDN8ZHGynMFqghL2oQOoXDedjOXl9tzuwdDE2CHM6MZNJyJ3Tl
	R7loDV0pe7CGecWphFUgJ8bO4JIvzM4kq1tjH4vw8fcQU8kwQo5zC+1h0RQBvlIG
	zSm/YaJhkv7BMj6pcrNFav5LUTF+wbZPIR4A96b1wDxDzMFpFPftICVEHQySfFeC
	IMGgNoXyuP4ojbMhnSlhxJy+UBQCTa8feNPg538KenyiSVPW8EB6T7bBxdwK3JuD
	wj+fWf3zii/WSodQY36cJqTlIk+UR0ImeLF1C4+xFoZyzM9Kmjm/SjTG4ycZt9DA
	dOPx1xvotSUKRA0qt671g==
X-ME-Sender: <xms:iw4AZ0VsHCqjUE-Fiay_lEKS80DoKUy4Z3l359-wIU1HHEhIG_EIGw>
    <xme:iw4AZ4kz8mS-RlsxmfnYk2kW6fvzbUBk6a2i60iyMTby12ozkQcFjGw-aNkq78gKh
    FDyLhq1z7TM72HN1Qs>
X-ME-Received: <xmr:iw4AZ4ZfGd3ecD7Dasp7fCC9lYnIjR4FZJFYSDvALkUjNhfQWsIc5NJYHig2xDqyhogYdkahxvaUx1g7U4uRFlXirSpkgNRqBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhi
    uggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomh
    dprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhn
    ghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iw4AZzV8C3gcEsxbP6EQv9F35Uy_q0JZ-CLddU26zk1oSti4HHDhHg>
    <xmx:iw4AZ-lEmyHFezUJKT3hKRR-n74QQb-cnL_cL8JNMZWrFUj2ikO5yA>
    <xmx:iw4AZ4dJuOT4Uq9j4M40C55aNK88BKAxhDeFIK88jofnXgHrLSYmXQ>
    <xmx:iw4AZwEqmEFfRlE4LTxeb_mo0QubNl85LMNKqdYvla1Zyz-gBkx9XA>
    <xmx:iw4AZ8ZswYRBr7kEkZ9_spaOa7CF2oUqRzvS0q5Wlt_NA_9uoCR2MTLp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 11:49:30 -0400 (EDT)
Date: Fri, 4 Oct 2024 17:49:29 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 08/20] ARM: dts: renesas: r8a7742-iwg21m: Use
 interrupts-extended for RTC
Message-ID: <20241004154929.GO2071111@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <f3838c730a8af5a904939929e30a4d892fef8b39.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3838c730a8af5a904939929e30a4d892fef8b39.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:50 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupt.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi b/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi
> index b281a4d164b0aae8..661cc5357b572165 100644
> --- a/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi
> @@ -55,8 +55,7 @@ &i2c0 {
>  	rtc@68 {
>  		compatible = "ti,bq32000";
>  		reg = <0x68>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&gpio1 1 IRQ_TYPE_EDGE_FALLING>;
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

