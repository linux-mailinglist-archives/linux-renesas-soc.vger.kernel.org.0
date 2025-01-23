Return-Path: <linux-renesas-soc+bounces-12431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B650DA1A9B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 19:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1E9F188EA1F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FC415625A;
	Thu, 23 Jan 2025 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CBiEy5d3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TBuyCnXa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1DC15574E;
	Thu, 23 Jan 2025 18:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737657485; cv=none; b=pqwQ4vwlRv5I77O9zO53dGRGOCBhCwZ8EevAMXd+64TYTdRKwO2m/RQfA5f8+G5h2mqI8N1XC4o7uOXc3c8BSPOB4/gFINbLSB0yjQGFLyLOobKyNCI3FuhetMI4EWFPHntssdHzVGWAosbdrjTajxict3DeC1wiJKy31OK98n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737657485; c=relaxed/simple;
	bh=gS+JsjiQsfaevj5iF7bRRpl7Kht6CAZB5zDPGjdQm4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uj1zoFCrBr86xA2GrV1hZ18sesE70t3Zzhu8/eq3L1OT8ZaDCFycFjwHFqb9K0KLP1kDQqA2r/qFONaui4FuIQ7jI2Tf8P99fNFmv5wxgPJh9WxyuiG3qm+gjfBMKDYDGYb9S830gJW0+y/u8boGdZD1EFL6mSdQ6PMOa/u8P6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CBiEy5d3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TBuyCnXa; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1DE1311400E4;
	Thu, 23 Jan 2025 13:38:02 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 23 Jan 2025 13:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737657482;
	 x=1737743882; bh=HUTQU5mANTyBEG4HhBxkrJ4GgQfZfqNMqaiW7sVkm1k=; b=
	CBiEy5d3UTihLhWnJjuBWRwHpR/Dk2iPz0iSoA+TzGfFPM3r5nmGxARE0uKDHtHX
	kHVOT9WA0HBGpLspKKdnjXvI0bmT+geVrnoupfN43cjOtD2JfPVw/eCjeYzkku2N
	ptHWa5wO4Ri5B+HOFIzeoGd4hI2Trd7VPejZ+l291/v3p+8B0h0dcCQPZkKjUkh6
	6oCWkflXBGCVDbzdIggtLU33QSeVZaByCaw+k1wjUjrYtpUeb2V7D3YDgJHxi4UN
	QLgigUOo15lyFWO8Q6e1k/Afh67wFct0UWzx04lnQPx01BVCpPhIrI1Fq1QrHfWz
	2MBy24ZmonrktVjJw0Edlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737657482; x=
	1737743882; bh=HUTQU5mANTyBEG4HhBxkrJ4GgQfZfqNMqaiW7sVkm1k=; b=T
	BuyCnXaPbJ+ihVzqXJCKkw0pIy0van2BQ8/ZpHb14AAISbQeoI2u4TYVtVPcBSak
	cZbNEieND78hT+L9XEJQLx0PiPcTAW9stf5oi7kcTcdHQeGOkLXGycryYyFepN0w
	z07w6j2WQ/UQFDEbM+0e4oiNHai7QalYLif7mbpqQxdbtm1Cn2MrsSBpFe23KiwI
	Dc/S1mXXg0wwYv3dmFl16jXiDn7XBiDb6ZcvHHtBwyf6yH8QJYjWrDfKL9rves1c
	nb2SocoR0OG8diTlnkS5KztpPumcvU4cv1BvAL5RpEV779ZmmlzU/yN5UTyxYQD+
	dRP1Wp2MwZfbOIgtpqFrQ==
X-ME-Sender: <xms:iYySZ5D0lPHX7aBXvy-IZC6BxTLTUzltVa9aFUtUP2hlojwCvseAXA>
    <xme:iYySZ3id20xWO_OtTtqVk7qDznq2lKaVjLjF_NFTWZvogCE85pWAiK0kI8pNdQC29
    Z0xdvXdSoFPr7NnhUc>
X-ME-Received: <xmr:iYySZ0k0_DorKIWWpHfjtKr19UKf8MXHFDnHSMDbCWZqes2Zz1hPF0hMqDbqfSid-YoD4pKVjWFE-jLseQh6bo8rh937ugH8TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgvdegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepffekgfdukeeghffhjeetvdeitdegteeikeffieduhfegveetjeevtdffvd
    ekffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnug
    dorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglh
    hiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsoh
    igrdhorhhgpdhrtghpthhtohephihoshhhihhhihhrohdrshhhihhmohgurgdruhhhsehr
    vghnvghsrghsrdgtohhmpdhrtghpthhtohepkhhunhhinhhorhhirdhmohhrihhmohhtoh
    drghigsehrvghnvghsrghsrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgr
    shdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:iYySZzxFi3qHyMCkvIsoQ9xo6_gSlxw1FfV6GriyUltz-TdG_vg2gw>
    <xmx:iYySZ-QmFGXAQJ8l1cgexfCYfX5bS-is-_i7zxZfC9aEpmqNuRrUWw>
    <xmx:iYySZ2YDnDcnmNwLreDovbAHnUK10nctBztCHv0h-0pCpAuI8F1oyA>
    <xmx:iYySZ_SnIOF4ZQJRHNIDJmpwV3m24SCPgM0IGFaugdWi40umI7J6kg>
    <xmx:ioySZxHBNDunnY1VhaXuhYz2XGIGXMqyCsIAOupQcacWbPFKdFyTIoHl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 13:38:00 -0500 (EST)
Date: Thu, 23 Jan 2025 19:37:58 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Disable rswitch ports by
 default
Message-ID: <20250123183758.GK3436806@ragnatech.se>
References: <c4688de8e3289ad82c2cd85f0893eac660ac8890.1737649969.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4688de8e3289ad82c2cd85f0893eac660ac8890.1737649969.git.geert+renesas@glider.be>

Hello Geert,

Thanks for your work.

On 2025-01-23 17:37:10 +0100, Geert Uytterhoeven wrote:
> The Renesas Ethernet Switch has three independent ports.  Each port can
> act as a separate interface, and can be enabled or disabled
> independently.  Currently all ports are enabled by default, hence board
> DTS files that enable the switch must disable all unused ports
> explicitly.
> 
> Disable all ports by default, and explicitly enable ports that are used,
> next to their configuration.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is similar to how Ethernet switch ports are handled on RZ/N1D, and
> CAN-FD channels on R-Car Gen3/4.
> 
> If accepted, I'm wondering if I should move it forward, before "[PATCH
> 3/5] arm64: dts: renesas: s4sk: Access rswitch ports via phandles"[1],
> which would become slightly simpler.

I let you and Marek figure that out, for the content of this patch.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> [1] https://lore.kernel.org/all/20250118111344.361617-3-marek.vasut+renesas@mailbox.org
> ---
>  arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi | 3 +++
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi                 | 3 +++
>  arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts             | 6 ++----
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> index 892729786d00b36e..ad2b0398d35431a1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> @@ -57,6 +57,7 @@ &rswitch_port0 {
>  	phy-handle = <&u101>;
>  	phy-mode = "sgmii";
>  	phys = <&eth_serdes 0>;
> +	status = "okay";
>  
>  	mdio {
>  		#address-cells = <1>;
> @@ -75,6 +76,7 @@ &rswitch_port1 {
>  	phy-handle = <&u201>;
>  	phy-mode = "sgmii";
>  	phys = <&eth_serdes 1>;
> +	status = "okay";
>  
>  	mdio {
>  		#address-cells = <1>;
> @@ -93,6 +95,7 @@ &rswitch_port2 {
>  	phy-handle = <&u301>;
>  	phy-mode = "sgmii";
>  	phys = <&eth_serdes 2>;
> +	status = "okay";
>  
>  	mdio {
>  		#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> index 840ba73c03f1b6f4..06be9f7720d64179 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -989,14 +989,17 @@ ethernet-ports {
>  				rswitch_port0: port@0 {
>  					reg = <0>;
>  					phys = <&eth_serdes 0>;
> +					status = "disabled";
>  				};
>  				rswitch_port1: port@1 {
>  					reg = <1>;
>  					phys = <&eth_serdes 1>;
> +					status = "disabled";
>  				};
>  				rswitch_port2: port@2 {
>  					reg = <2>;
>  					phys = <&eth_serdes 2>;
> +					status = "disabled";
>  				};
>  			};
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
> index 24ecdf6e8476a945..df652e7b85c95ebe 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
> @@ -187,6 +187,7 @@ &rswitch_port0 {
>  	phy-handle = <&ic99>;
>  	phy-mode = "sgmii";
>  	phys = <&eth_serdes 0>;
> +	status = "okay";
>  
>  	mdio {
>  		#address-cells = <1>;
> @@ -205,6 +206,7 @@ &rswitch_port1 {
>  	phy-handle = <&ic102>;
>  	phy-mode = "sgmii";
>  	phys = <&eth_serdes 1>;
> +	status = "okay";
>  
>  	mdio {
>  		#address-cells = <1>;
> @@ -218,10 +220,6 @@ ic102: ethernet-phy@2 {
>  	};
>  };
>  
> -&rswitch_port2 {
> -	status = "disabled";
> -};
> -
>  &rwdt {
>  	timeout-sec = <60>;
>  	status = "okay";
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

