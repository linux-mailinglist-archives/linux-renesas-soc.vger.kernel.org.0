Return-Path: <linux-renesas-soc+bounces-16759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64AAAE269
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 16:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C4A1165967
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 14:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECB628A701;
	Wed,  7 May 2025 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kdB6uo86";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="u7XMX9l6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25DE28A417
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 May 2025 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626372; cv=none; b=k/2nAh5lBrT0jAc+E5jQchRjFwrvI+FoYby3jAPELX38ev2k6A1XHtcPiQNFiraNZmH2zfZiT11E4RTzEFAOXOnapZxvdrfvH6PZZ1OsTLaywlsiKOXHWGRISsq8F53GccMysM7pBg3yWPjOobAPMJq4kMaK4fjIjd/+2ul8zoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626372; c=relaxed/simple;
	bh=pcKi/R0GV2vMOkGgvV6+7cFvXkuBoiI3Y3F1/+0y1yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FndqpBTdo093OA9qd8ahnsRBZvFLgo1Cj8I1bJAuNLvfAph16uBEOxoUD/umJkCMHLuGeNn6kftIWsY4iH/aSRy5I1jPT/6yw38Odriu263gLKtc8Sf9P3xh2JOb/PcvVFzEACgNYz0z1bEv5luYY+2hHmlRMRFtOHKepCAnVxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kdB6uo86; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=u7XMX9l6; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AC57711401B8;
	Wed,  7 May 2025 09:59:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 07 May 2025 09:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746626368;
	 x=1746712768; bh=0AV+Ka0ghT60Ni80lSH36dlQfcwviMBQ0Aew0ZN84vs=; b=
	kdB6uo86SqBD2Of7Loe2W8jte3R9KTMIji0sbq4Mv1Ty3/t0j9B5V2JaZJjDxVT2
	KMyJTUsD4uBaypLwhftF7iiWoMlZHQ/6bt+6ZvqKYQnQNat5rGX5xVpUoNG2TrPS
	7REBks3Ppkp69CmBLtoV10tB6vNwfDlfMGqn6WeXoT/wESfxUmv+rsdE9KrkjBbs
	eZamRfMBFCB47S9l0GAuJRKkbxe9U7RDPT4+XVQMT6DiTRoRZcGi2QmO5BK9pMfy
	urNsIDTHgycB0K6RbUN3tMFKGj2OL6xx4gKhD55fXeELmnBt/piPZehfhInYHblv
	ja9qMa+g65ytdvIPkMAKQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746626368; x=
	1746712768; bh=0AV+Ka0ghT60Ni80lSH36dlQfcwviMBQ0Aew0ZN84vs=; b=u
	7XMX9l6e+g8yUvuOG025+Z+JG/iv6oKLPhCfHPFvN9B7/ZSRvGShMrvnBvRWZjMs
	2a5VToA/4EqOH6IEIuEnOM2df/PCzFI5vpTSWo1h07qg4E6LW+k0rf9P42VkXd1O
	3ehnr9jnOv3mPeFLftLE8iSHuD4g6Pmdd+264KUDpGWUimWUW476YTbVSUKqvsZ6
	vV1mYX5wOOk4mcUxN5QTcklxdyBLjBSPjMZPd8keDRw85jjOFiCOCgZ0mX6Hv7hZ
	SwFQhyZs3QS2YZxiW8A0ggtlY6oVfcpN2382Of363FR+CEMgS/qYz3dEw1H9gWcs
	nzgmKXtPTZTLVEOLCeUhw==
X-ME-Sender: <xms:QGcbaDJ5U54NwX75wOEnIg7d1QfCeLqjHnrGdKAbh-9AV6FaSxsVdw>
    <xme:QGcbaHKie8ZPCAQ5RzhuJsqcJx0QxprflIf5tXt0jZ9oMxTj5B3Nimw1s-RdsZJBz
    O9wrRkhMk_Vrup80Oo>
X-ME-Received: <xmr:QGcbaLvuDiuQMWbeV0_XZNZmpdMxoXYtjOv5iPH3f-mEW6tc-Fbly3fWoAwGUjy6nTJrjXd6O5QRCqAAOiY5PZeAWu6xpRyn1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejtdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrgh
    hnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghn
    vghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:QGcbaMYTH0NLeR5KJ5EvTLDq9xuQWjS7zhZNkYbTa_a4HUFrDz2noA>
    <xmx:QGcbaKYTy6qmGVa-Bk47FO_1oeOAyfUxnKWoIO8ovomgmF7g2GravA>
    <xmx:QGcbaAAeDb5NLgj2aTVPfQpM0cNu3ZriYtPM87HglTVr6KQQhjQggA>
    <xmx:QGcbaIZXJ8_hL_xqwJ1AkqsYI-qTRuac75CN_CDZJL7wh1FVrMFNwg>
    <xmx:QGcbaMxD-3oxVp98VYl9mbPQcaL_Dwql1iL3UKx_WtC6YvicA8tIvGO0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 09:59:28 -0400 (EDT)
Date: Wed, 7 May 2025 15:59:25 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-single: Improve Ethernet
 TSN description
Message-ID: <20250507135925.GA836326@ragnatech.se>
References: <367f10a18aa196ff1c96734dd9bd5634b312c421.1746624368.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <367f10a18aa196ff1c96734dd9bd5634b312c421.1746624368.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your patch.

On 2025-05-07 15:31:55 +0200, Geert Uytterhoeven wrote:
>   - Add the missing "ethernet3" alias for the Ethernet TSN port, so
>     U-Boot will fill its local-mac-address property based on the
>     "eth3addr" environment variable (if set), avoiding a random MAC
>     address being assigned by the OS,
>   - Rename the numerical Ethernet PHY label to "tsn0_phy", to avoid
>     future conflicts, and for consistency with the "avbN_phy" labels.
> 
> Fixes: 3d8e475bd7a724a9 ("arm64: dts: renesas: white-hawk-single: Wire-up Ethernet TSN")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v-6.16.
> 
>  arch/arm64/boot/dts/renesas/white-hawk-single.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
> index 8b4d313ad173cd3b..4ddb70e525c0532e 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
> @@ -11,6 +11,10 @@
>  / {
>  	model = "Renesas White Hawk Single board";
>  	compatible = "renesas,white-hawk-single";
> +
> +	aliases {
> +		ethernet3 = &tsn0;
> +	};
>  };
>  
>  &hscif0 {
> @@ -53,7 +57,7 @@ &tsn0 {
>  	pinctrl-0 = <&tsn0_pins>;
>  	pinctrl-names = "default";
>  	phy-mode = "rgmii";
> -	phy-handle = <&phy3>;
> +	phy-handle = <&tsn0_phy>;
>  	status = "okay";
>  
>  	mdio {
> @@ -63,7 +67,7 @@ mdio {
>  		reset-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
>  		reset-post-delay-us = <4000>;
>  
> -		phy3: ethernet-phy@0 {
> +		tsn0_phy: ethernet-phy@0 {
>  			compatible = "ethernet-phy-id002b.0980",
>  				     "ethernet-phy-ieee802.3-c22";
>  			reg = <0>;
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

