Return-Path: <linux-renesas-soc+bounces-12045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A426A09238
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 14:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3922A1889FB7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 13:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFF420E308;
	Fri, 10 Jan 2025 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="J0E0EWKG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hiRw9MwW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150120DD7F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jan 2025 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516329; cv=none; b=IaSv64g52+lNb0pzX2b769CYqdG/aWLe+SWSj2By5zG/A8Vpgj9q2h3jN5cI1CmS2lebNY4cmyr2/SUyFzAvGJpwkNpfgsPDmc7pUzW17cD684fec0yOPPIHXRfnCytFp1ZZYdOYXf/OrOFCWCo1dxswV3k6wCI2ZGye6kLz0Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516329; c=relaxed/simple;
	bh=3WQhaeRVoWHhiuk7AjMFIM24wj6H69+Eg6bP/VpB10w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ccju683fegQ29yc9yZ8XPSO/bYlSgmZnX/LcQQl5frcojVogcyJBfi18ET/iDR95MryqBZVTdjBe68drlgEasYAQxqqkvWJUeJBh8WMs6VcExjN59Y9W/nLccTZsKMNxtOjWXLc7d6GG4w3lc00ioZQmNVF3Ud92L62pSkGyONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=J0E0EWKG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hiRw9MwW; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id C62181140138;
	Fri, 10 Jan 2025 08:38:45 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 10 Jan 2025 08:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736516325;
	 x=1736602725; bh=xVsMzVieHTIOrNbvOMfvelHxO8lTDQWrOTcGVeRSltM=; b=
	J0E0EWKGu3DBaapBXg7wBcycPvqq723/TuH5HqN2pb3gVOGhqODELmUi7IHk0BdT
	sHw7Ug39KYCDI8j4QG98Wtps9GL5igsrAPjqv2exkm3r6usLohPOvD5QzxI3Mm2i
	BbAzs9RJHihh7W3UtllKHMU/Lu+XolkRACVChHgNujN5lR37hRF6o9xZed4K8jF8
	VHkYo6LCLZ1qAArO83VTI/r3RDeI25Vqwb/kCg8WqrOdAsyyAp5vZ0OJ1/xtSKBg
	/dxZoxCYrQpd7IPCW/FolQLNIZrAiGS5tpYNEMrH6WzUuOT26LYFqN4JpG7Ud14U
	bb7ULy31H7Vwzys5qLvMyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736516325; x=
	1736602725; bh=xVsMzVieHTIOrNbvOMfvelHxO8lTDQWrOTcGVeRSltM=; b=h
	iRw9MwWEHjCogHAkVvdUBDBJWdd7hH97iY0Rni8wdGsmwa2+V0OlDpdvwRj1ZxIV
	dATlMdH2Hdl/jXX3zP31SkH7Y8bSpbejbf34llK9VTwFHBzKWzFDFONTITAob9Z8
	x3y3BLy3a10xjLygLLpz85dw5p/23FdlL2fwf08HK40ymm6KsmuH7TtIborObllo
	P2rreDcymuJpGH+9bs0PNiS6N58puYId9RtgTrMVxdBplPAh+wbpO3j2mZHHZx5a
	mU7x1KF+DGhDmygHUsnqVYaRbwbaFOnCCU5M1V/6eMMPl5fkvhlgnmauWyFF0Lub
	eR2pfuUrAY5TtgomcN4BA==
X-ME-Sender: <xms:5SKBZwk5W6cNdTlfdmOIUfVOi5VqxVPN4amk4QwRzEy0ifZAXk1Bkw>
    <xme:5SKBZ_16V-F6thq2kQPO-4zAjIFTWbIwgl99lNhLkRy6QeSxiPjGg8Yh7DsRa2LAY
    j-sqf8ii1IevdbqxC8>
X-ME-Received: <xmr:5SKBZ-oDW0kPnHASjPf6m1eVj0Q5Ox25BGqER9UfOKg_cW-yjC1t5o39vebZ0JgQqU084IdSvnc8Q4EBpmiPdr1OxdaTT5myNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegkedgheegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:5SKBZ8lS4M0PnRRfE4U1TgbMYc7Dun0oWQyiy6qiE4EsBPCqwgntyw>
    <xmx:5SKBZ-2Zcw43psGPmpOJQ20THOaFeo_PiSAAXQngSQ_lLzQpDMZRbw>
    <xmx:5SKBZzsU5vCj-J-Rpn1NLHjI-PySmykbzKcOX1iY-cUab4KTWmytrg>
    <xmx:5SKBZ6UwJYuMVxYPzCYjVhhRRmxz8qZyAacFZ1WToTCNz3_ElV8PBQ>
    <xmx:5SKBZxRPzODnY2zeK96Qmg6Bb480_J-o8RlayRF6T5__4wWJ8kh_aW21>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jan 2025 08:38:44 -0500 (EST)
Date: Fri, 10 Jan 2025 14:38:42 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: gray-hawk-single: Restore sort order
Message-ID: <20250110133842.GD308750@ragnatech.se>
References: <4f3e057b9a73d7ee7ff073f51bb9a4c30bdd0c84.1736506813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f3e057b9a73d7ee7ff073f51bb9a4c30bdd0c84.1736506813.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your patch.

On 2025-01-10 12:05:09 +0100, Geert Uytterhoeven wrote:
> Alphabetical by label name.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v6.15.
> 
>  .../dts/renesas/r8a779h0-gray-hawk-single.dts | 38 +++++++++----------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> index 18fd52f55de5b75b..d58f64d927feb17b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -233,25 +233,6 @@ channel1 {
>  	};
>  };
>  
> -&dsi0 {
> -	status = "okay";
> -
> -	ports {
> -		port@1 {
> -			reg = <1>;
> -
> -			dsi0_out: endpoint {
> -				remote-endpoint = <&sn65dsi86_in0>;
> -				data-lanes = <1 2 3 4>;
> -			};
> -		};
> -	};
> -};
> -
> -&du {
> -	status = "okay";
> -};
> -
>  &csi40 {
>  	status = "okay";
>  
> @@ -292,6 +273,25 @@ csi41_in: endpoint {
>  	};
>  };
>  
> +&dsi0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +
> +			dsi0_out: endpoint {
> +				remote-endpoint = <&sn65dsi86_in0>;
> +				data-lanes = <1 2 3 4>;
> +			};
> +		};
> +	};
> +};
> +
> +&du {
> +	status = "okay";
> +};
> +
>  &extal_clk {
>  	clock-frequency = <16666666>;
>  };
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

