Return-Path: <linux-renesas-soc+bounces-23700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E44F3C1135A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 20:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 31EE55656D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 19:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E62D3233ED;
	Mon, 27 Oct 2025 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mrYv1MBo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zwb4x3c/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977CE2C15A9;
	Mon, 27 Oct 2025 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761593413; cv=none; b=ehpbEc8fh6diqeVi/YbD6u3KzYpvQ1SEnpp6JWMz8BYcPhfyF1r6VE+UCbjz88Mgf7T4fEmFRkktFNjhSLZ3gigLc+p31a4NE6LkC7YqzWvnBhekM9nvSiQjUK7ifpiZsLaa+fpkH5V+az1MChZ7+EM3Ty6qabGe8aTM3W6VgeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761593413; c=relaxed/simple;
	bh=9m44Y/IwGGg4Kx8N1Z/QNcq/n+0sr9kSoUTvjAUqXvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2g762pkRIW9R/IXT9FSUCYRxhtinCg0uJn+CbP10zPEpl80BEJ3ORrixCxNaFJCL1z5BiIl5t+76tekGFZbJ+u1fB2Ki6AriuNAIWdt83AjgK2RH7Axj9dS99XVTmnv5jEQ9ghTyMTSQKoi4ET9XhfSPtLsz1j7GbQrjfVNWn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mrYv1MBo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zwb4x3c/; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9B92A14003D2;
	Mon, 27 Oct 2025 15:30:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 27 Oct 2025 15:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761593409;
	 x=1761679809; bh=KH51SDLV05//kaF4c9OyIlbgbmFjlPSc2TV/0Yjx49w=; b=
	mrYv1MBoyeJvc3XqFuzkS444IPaHMBVl5l6XC9shpyJwV2GoXc8Gz5idklsumjt/
	qXnPkaiPzGGy2Fg/GjnkG6KKVsmF9hO2qq1zWui/uUUVJ1RiJ9RoP4m3byXE/vFO
	00CtXIzLcHOLsP536s8e/iT8Z/o7auEDRQV7xE/HQIS7MKnvfJLUgNeFadRBHJW1
	B8tOp0tWEGD3J7btJ1V6YqEk9e1+zXbliDF+1h/fbbDb4ONs3RnTjPNZrL4geyC4
	CwcWHK9cfG6egRx2V3wpTteMeQ/DQIpp6qxDX8LvWS6BLTXrhhGoOndKxVRfbQT0
	s9xQbnxTFp8sWh99Lwn28Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761593409; x=
	1761679809; bh=KH51SDLV05//kaF4c9OyIlbgbmFjlPSc2TV/0Yjx49w=; b=Z
	wb4x3c/Nk9uOCRQc0r4nXJqpTNVpKcE6/y1jIrWdXLdiO95rFxX2QZnCc1j6E4JA
	9Rl/DwW5CJtGLFOuv08PRPGXZbXrUHtzNA/BSaDFCKbUVUsejYiV+x4LgC6H5Xhw
	QJP1Om0CTS3Qnc3iVO6zukz+MmmnNoUIjKPkcr4Dq49MrqXiK/TjgqIT5Z/o1t+x
	+EGvJp+QM503Ksm4w2UjQZE5WoSyuYkYQky8nXbePou8pSVIi1QmMHi/mVNvUgLH
	nL1ZH+4/SsswKieKINIgj/R5pILTj+Hlr9dgGUm3cdiNKe6lKHPCdTPTiJnY1bC3
	zwpyawhfPn3hHr/IS/EZg==
X-ME-Sender: <xms:Qcj_aIczRwkjoau1-ChC5BTK-TrmjbKLmJA9zFLBmAm_y9V-WsBSlw>
    <xme:Qcj_aKrwsY9hLrQDti-eVZhPjZigWcj_Ik8xDlfw3iR-QzeQiUiDZatgMN3Bwe-Y0
    N8cQKaUjUCVBZO2r8oN5M3HqNjH3PpfbcvzWnhuodM514Pyf1VQ4Qw>
X-ME-Received: <xmr:Qcj_aKMwux4lsIOnU7ug8dHh6JCLz5yVqtA8Lv3FkeJzRZVZs6Y6WI-VNuZAyelUw4BnvFdWF4wyhQjt4soBkEID41J6eIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduheekkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsohigrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    ghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Qcj_aFgOduvt8YIcUhKHFZ1SrVsy2RzdcpLFRdrdIVI6jmqj1MiODw>
    <xmx:Qcj_aFtk7U5NoCF2gQBxzEgq9WA_KYj8c5gJyRNK5niezG5OivzfWw>
    <xmx:Qcj_aBh-loHtjVPEg2r7lPgQqpOr859WFeu9e9sbbNN_8g9YI2Rnow>
    <xmx:Qcj_aDYYm8xyi91aqWbSjGnzH_B6zDZkbuhHGLwYq-cj-6OxHp_dzw>
    <xmx:Qcj_aD-W74irlF7IuokXH8n5wqyezPQ6I4oiuVxLzFz_p9vigMpq6S8w>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Oct 2025 15:30:08 -0400 (EDT)
Date: Mon, 27 Oct 2025 20:30:06 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Fix full-size DP
 connector node name and labels
Message-ID: <20251027193006.GB365372@ragnatech.se>
References: <20251027184604.34550-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027184604.34550-1-marek.vasut+renesas@mailbox.org>

Hi Marek,

Thanks for your work.

On 2025-10-27 19:45:53 +0100, Marek Vasut wrote:
> The DisplayPort connector on Retronix R-Car V4H Sparrow Hawk board
> is a full-size DisplayPort connector. Fix the copy-paste error and
> update the DT node name and labels accordingly. No functional change.
> 
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> index 0e36a1b96b83a..f4181f6020203 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -119,13 +119,13 @@ memory@600000000 {
>  	};
>  
>  	/* Page 27 / DSI to Display */
> -	mini-dp-con {
> +	dp-con {
>  		compatible = "dp-connector";
>  		label = "CN6";
>  		type = "full-size";
>  
>  		port {
> -			mini_dp_con_in: endpoint {
> +			dp_con_in: endpoint {
>  				remote-endpoint = <&sn65dsi86_out>;
>  			};
>  		};
> @@ -412,7 +412,7 @@ sn65dsi86_in: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						sn65dsi86_out: endpoint {
> -							remote-endpoint = <&mini_dp_con_in>;
> +							remote-endpoint = <&dp_con_in>;
>  						};
>  					};
>  				};
> -- 
> 2.51.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

