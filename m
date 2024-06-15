Return-Path: <linux-renesas-soc+bounces-6279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB690982F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 14:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A741F21330
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 12:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4D945025;
	Sat, 15 Jun 2024 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LJGVYQMP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nDW6waZC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E09945020
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718453817; cv=none; b=G0aWaW5QF46x9ZOo8VnaW1L6vIzaFxsRDZUXdW9hOeC/onIzg/kd2iFl/nB9mHLYD7KLrxHP/3Drs3Ck7tEWMPH1FV246c/UROKyCxqmRBOVItNtaZYJuDJFGTxlDaX96QzKn/lvALP4bX5WWtDsSzCkgjrHkyiks2dYGXT0G9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718453817; c=relaxed/simple;
	bh=pk0D2LsMuMKkFaRFEQyr2KOId8HAt7PQ90JSJvJXmPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbHSauH6sh4sK0kNN4CN0HSRrU7emwY0/i8p4ufMfWtBrhHSJcXY99uLcTXAxad+sUAw2EhYGz5LbQvGuF6w1UUnXzZMmj/Vx36HDxzRrsgxvJJyQJqD2Czx97Ops1Z9MVRAkk7KRfUKUn+m4/ZXaAg90P7JQ5/5TBGMyvD/1LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LJGVYQMP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nDW6waZC; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3FCD41140216;
	Sat, 15 Jun 2024 08:16:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 15 Jun 2024 08:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718453811;
	 x=1718540211; bh=al/mISkJvgA0c4oYsbZ+ARXm8AmD6jXmmn4u67ZcEs0=; b=
	LJGVYQMPXMA3U8Xo8+bSq2bkvnmWkRPs4nmkx0pBNDK0ggSpgViH23MB5FIKKQTy
	qSpiHo6YghNcfRFqSET/AKtndHiGigubpEn5+AGhSnQuWLD37u84Z2szTYUk7PGR
	k0jB8f1WYNn55qxxkPtx7+DyI7JkmZb0panb6AvGlGfl7ugbeNmnbd5b1OplfKaG
	MUmDX9RD+BD0jfbncHh8E0SHip7LZe1vVB0Ar+z6QrHpOKbkwQ85gZpNqMcXmE6P
	HyUJ3ziBk5i7Uti8jsxNnEHkBuNWzhWgngBmMF/QFhkBHf2oXJPPT+daZpC5vTVK
	uIU6pOrXD9bPrKRyBei7BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718453811; x=
	1718540211; bh=al/mISkJvgA0c4oYsbZ+ARXm8AmD6jXmmn4u67ZcEs0=; b=n
	DW6waZCEAiMaSG41fGN37FXDKZkePBQ/PBzT6z/ICB7K7aMmaRccaHWu7VyzKNH+
	xQrk/2vYYDRVdje24ERi5B+rNEzUIVoK6Sq1p3Cs3Yb3FKY72fcfShvNEL7yslWm
	cRn3mK/RUBegDCHMR2MDQFaWb+v60cI/WwvJXuoiNNJ1c7jZwayyEKrWCHSy2gt9
	iobG+tdzlcpqGpOWO2PvwyFnY6r6o5g/QMBmLu6GA8/xzXy1RlCZugMPzzTNFfDS
	3WKyRVHMqmL+kzH4hygG0OdsqZzlTGUKQw2T9sp57Y+T59oCf+pUAiHKTuIxzUra
	9Rv49/S4e0JhmJkkX/sXA==
X-ME-Sender: <xms:MoZtZmLTXorKaxPFRdG8MoqJXeCLyBY6CbndMFlFmE3vQlfg_pgJDQ>
    <xme:MoZtZuIomD5_OX6NLwaBMUTDvt_9JaYDZ4J6YaYD7jRVvknFQMuRPxHSg9CiyHz6j
    NSTQ-fNowOoKx5zb6M>
X-ME-Received: <xmr:MoZtZmvMPP9IMtc9kigCDsznx4s_00QP8nrN0f5UwH-rJXRPZwTvWOGBsSOBFAOodEcIWo_ZkOc-c0BQ7gp1JjE5pXDq9vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvuddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:MoZtZraXEs7G-o98Q9q0Cw6zLAl-3OeYXBYezrCfvNnhQJHWDbwrAA>
    <xmx:MoZtZtbgQ14RKa_mTIJ748ivXggwkgus40ENn2ckTK7zvf243XHEXA>
    <xmx:MoZtZnCbFXlD0YW4kfdfwKZI4PDlSLTUvUKuyLxPeBjFA07uolv7pA>
    <xmx:MoZtZjZgt9Vx-ZdGE7363Kmglw4Av5xzt3LBa1oKnweM_myze8hUmQ>
    <xmx:M4ZtZiPVjxM7IiWacLk2Q56HY1zVLR6V2SQHtNBFQdW1FuareUk1Hbzw>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Jun 2024 08:16:49 -0400 (EDT)
Date: Sat, 15 Jun 2024 14:16:47 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] pinctrl: renesas: r8a779h0: Add AVB MII pins and
 groups
Message-ID: <20240615121647.GJ382677@ragnatech.se>
References: <4a0a12227f2145ef53b18bc08f45b19dcd745fc6.1718378739.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a0a12227f2145ef53b18bc08f45b19dcd745fc6.1718378739.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your patch.

On 2024-06-14 17:26:45 +0200, Geert Uytterhoeven wrote:
> EtherAVB instances 0 and 1 support both RGMII and MII interfaces.
> Add the missing pins and groups for MII.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Compile-test only, as all AVB interfaces on the Gray Hawk Single
> development board are connected to RGMII PHYs.
> ---
>  drivers/pinctrl/renesas/pfc-r8a779h0.c | 52 ++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
> index 438d1f2739dd4bcd..944bf927449ddc1b 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
> @@ -1236,6 +1236,30 @@ static const unsigned int avb0_mdio_pins[] = {
>  static const unsigned int avb0_mdio_mux[] = {
>  	AVB0_MDC_MARK, AVB0_MDIO_MARK,
>  };
> +static const unsigned int avb0_mii_pins[] = {
> +	/*
> +	 * AVB0_MII_TD0, AVB0_MII_TD1, AVB0_MII_TD2,
> +	 * AVB0_MII_TD3, AVB0_MII_RD0, AVB0_MII_RD1,
> +	 * AVB0_MII_RD2, AVB0_MII_RD3, AVB0_MII_TXC,
> +	 * AVB0_MII_TX_EN, AVB0_MII_TX_ER, AVB0_MII_RXC,
> +	 * AVB0_MII_RX_DV, AVB0_MII_RX_ER, AVB0_MII_CRS,
> +	 * AVB0_MII_COL
> +	 */
> +	RCAR_GP_PIN(7, 11), RCAR_GP_PIN(7,  7), RCAR_GP_PIN(7,  6),
> +	RCAR_GP_PIN(7,  3), RCAR_GP_PIN(7, 18), RCAR_GP_PIN(7, 17),
> +	RCAR_GP_PIN(7, 12), RCAR_GP_PIN(7,  8), RCAR_GP_PIN(7, 15),
> +	RCAR_GP_PIN(7, 16), RCAR_GP_PIN(7,  4), RCAR_GP_PIN(7, 19),
> +	RCAR_GP_PIN(7, 20), RCAR_GP_PIN(7,  2), RCAR_GP_PIN(7,  1),
> +	RCAR_GP_PIN(7,  0),
> +};
> +static const unsigned int avb0_mii_mux[] = {
> +	AVB0_MII_TD0_MARK, AVB0_MII_TD1_MARK, AVB0_MII_TD2_MARK,
> +	AVB0_MII_TD3_MARK, AVB0_MII_RD0_MARK, AVB0_MII_RD1_MARK,
> +	AVB0_MII_RD2_MARK, AVB0_MII_RD3_MARK, AVB0_MII_TXC_MARK,
> +	AVB0_MII_TX_EN_MARK, AVB0_MII_TX_ER_MARK, AVB0_MII_RXC_MARK,
> +	AVB0_MII_RX_DV_MARK, AVB0_MII_RX_ER_MARK, AVB0_MII_CRS_MARK,
> +	AVB0_MII_COL_MARK,
> +};
>  static const unsigned int avb0_rgmii_pins[] = {
>  	/*
>  	 * AVB0_TX_CTL, AVB0_TXC, AVB0_TD0, AVB0_TD1, AVB0_TD2, AVB0_TD3,
> @@ -1314,6 +1338,30 @@ static const unsigned int avb1_mdio_pins[] = {
>  static const unsigned int avb1_mdio_mux[] = {
>  	AVB1_MDC_MARK, AVB1_MDIO_MARK,
>  };
> +static const unsigned int avb1_mii_pins[] = {
> +	/*
> +	 * AVB1_MII_TD0, AVB1_MII_TD1, AVB1_MII_TD2,
> +	 * AVB1_MII_TD3, AVB1_MII_RD0, AVB1_MII_RD1,
> +	 * AVB1_MII_RD2, AVB1_MII_RD3, AVB1_MII_TXC,
> +	 * AVB1_MII_TX_EN, AVB1_MII_TX_ER, AVB1_MII_RXC,
> +	 * AVB1_MII_RX_DV, AVB1_MII_RX_ER, AVB1_MII_CRS,
> +	 * AVB1_MII_COL
> +	 */
> +	RCAR_GP_PIN(6, 13), RCAR_GP_PIN(6, 12), RCAR_GP_PIN(6, 16),
> +	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 15), RCAR_GP_PIN(6, 14),
> +	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 19), RCAR_GP_PIN(6,  6),
> +	RCAR_GP_PIN(6,  7), RCAR_GP_PIN(6,  4), RCAR_GP_PIN(6,  8),
> +	RCAR_GP_PIN(6,  9), RCAR_GP_PIN(6,  5), RCAR_GP_PIN(6, 11),
> +	RCAR_GP_PIN(6, 10),
> +};
> +static const unsigned int avb1_mii_mux[] = {
> +	AVB1_MII_TD0_MARK, AVB1_MII_TD1_MARK, AVB1_MII_TD2_MARK,
> +	AVB1_MII_TD3_MARK, AVB1_MII_RD0_MARK, AVB1_MII_RD1_MARK,
> +	AVB1_MII_RD2_MARK, AVB1_MII_RD3_MARK, AVB1_MII_TXC_MARK,
> +	AVB1_MII_TX_EN_MARK, AVB1_MII_TX_ER_MARK, AVB1_MII_RXC_MARK,
> +	AVB1_MII_RX_DV_MARK, AVB1_MII_RX_ER_MARK, AVB1_MII_CRS_MARK,
> +	AVB1_MII_COL_MARK,
> +};
>  static const unsigned int avb1_rgmii_pins[] = {
>  	/*
>  	 * AVB1_TX_CTL, AVB1_TXC, AVB1_TD0, AVB1_TD1, AVB1_TD2, AVB1_TD3,
> @@ -2444,6 +2492,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>  	SH_PFC_PIN_GROUP(avb0_magic),
>  	SH_PFC_PIN_GROUP(avb0_phy_int),
>  	SH_PFC_PIN_GROUP(avb0_mdio),
> +	SH_PFC_PIN_GROUP(avb0_mii),
>  	SH_PFC_PIN_GROUP(avb0_rgmii),
>  	SH_PFC_PIN_GROUP(avb0_txcrefclk),
>  	SH_PFC_PIN_GROUP(avb0_avtp_pps),
> @@ -2454,6 +2503,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>  	SH_PFC_PIN_GROUP(avb1_magic),
>  	SH_PFC_PIN_GROUP(avb1_phy_int),
>  	SH_PFC_PIN_GROUP(avb1_mdio),
> +	SH_PFC_PIN_GROUP(avb1_mii),
>  	SH_PFC_PIN_GROUP(avb1_rgmii),
>  	SH_PFC_PIN_GROUP(avb1_txcrefclk),
>  	SH_PFC_PIN_GROUP(avb1_avtp_pps),
> @@ -2628,6 +2678,7 @@ static const char * const avb0_groups[] = {
>  	"avb0_magic",
>  	"avb0_phy_int",
>  	"avb0_mdio",
> +	"avb0_mii",
>  	"avb0_rgmii",
>  	"avb0_txcrefclk",
>  	"avb0_avtp_pps",
> @@ -2640,6 +2691,7 @@ static const char * const avb1_groups[] = {
>  	"avb1_magic",
>  	"avb1_phy_int",
>  	"avb1_mdio",
> +	"avb1_mii",
>  	"avb1_rgmii",
>  	"avb1_txcrefclk",
>  	"avb1_avtp_pps",
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

