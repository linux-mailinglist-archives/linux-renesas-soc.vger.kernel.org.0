Return-Path: <linux-renesas-soc+bounces-6283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ECB90983A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 14:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 020F6B20B2D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 12:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042CE3C062;
	Sat, 15 Jun 2024 12:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eV3ZczMF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BM4Hp8ZD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EBCD53B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Jun 2024 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718453942; cv=none; b=kjuy5y6qTPMrcHX8neZTFOkLthczkb+OVUCicjkBYvw6hLDVQBSOtWbCk8A/APg32DY5wuNUvZzRUpr5Apa7cQ/Pgi9ANwvR8wap8ItPQc0C3kBMENscslnv178VQ4+cBV56hCufj7mGd0vsRtEK3peZ8ohVw8k8XAZSiMMOwEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718453942; c=relaxed/simple;
	bh=3/lVs8NcHOrjANODPIZObGlO2ZY6zhjYa7A1FbPMVqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADLsqSf7Jio4/QFEeaYZOLDam11cacqJ5jJ1VjiWlue29w44YCuz3u8LyChqmOdQGQQRnDgOULHV8d39i1x4FLoBfNEvUkQ50zAwMJ4GsiaFVWwAfE8lEOVjIPdULrajVbUbVi8owknHSZJ9WDhlnqpFCIn/vH/RUZgGWKO/4Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eV3ZczMF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BM4Hp8ZD; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 764521380294;
	Sat, 15 Jun 2024 08:18:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 15 Jun 2024 08:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718453938;
	 x=1718540338; bh=iTMP7YZ8I96ow20UdmaH+26dUUolejBhpId61eR8KZk=; b=
	eV3ZczMFdsBpwH/AYIdbpPyLnJPCLBeAexbcpAjOiTV6aoxZ56F7ZMxZjvY0XXbZ
	M31NAvn/FoC9oxAf0v2+LuxCykpyzTsJgxRqx2c6ZpdGbIqqDxSzcZ241qZUO8Uw
	+yJ1/gJp/0ZZ6Wl1BHvsVYghA2JAKBeK9XjmzLI5rXvgezXAsy23qHwWEAChNXKn
	Enu6oMLtm2ccDkpE6YHxYuzs2bVyz6YZHk3qxIH/PwTDb4H9EdP4/Wf8M6WBiAHW
	4GNadlQbGo2Hy8mT5zQfYHibraw0kXgnGagW4VHSZW3MPO104ME2K3B7A4Lae17F
	FVs5HkrsKsnJLl6xIzYXQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718453938; x=
	1718540338; bh=iTMP7YZ8I96ow20UdmaH+26dUUolejBhpId61eR8KZk=; b=B
	M4Hp8ZD8kPeh3KIgJw9CL1PdLrzMzVOtKhwUwtI9+nYhF4rusJfjMEgZ+1DEFhIX
	ZUy1dCBAQjVXsT86xFH74fmeo+FNW7nbDBkYYWvJHJdWpnfWKYCu29nEMqGOjdVr
	aSOvyfq4RcYl0Zt37v607J2IwrvShfJuJHaI0ud2CWoaYndMVYVkLaWGbZyZU9YP
	pE6E+8OTuYSS/HoR2gOrF3+fNgkZGGOTsT/lElNYRg3m8IMpt0DRQ38b1TViR4nV
	aiobVQEqh9ny4eA2QLlANTrP+ghjJicqcsDZJkElKTcblSU0OHgWn8+D9s0Y8c9u
	ci1PfCH44QCPW9mivxSMg==
X-ME-Sender: <xms:soZtZkeMj5P-2VUkrgF1o2pwCTtnUFhKH0pSQCy02F2lbermANXBEw>
    <xme:soZtZmOgkPciU7iouE5OQKQC1AGjOL83Tp95epaXSVB4j21ZFvrBeBAcgCpcqkgt9
    wi1nxe2W11oSMVJKBw>
X-ME-Received: <xmr:soZtZliUUQXHdSY1xQtw_0aFc43Pprk4aKqm0AY2rS32Mo2eOHiT9sqAnqwV9pqUAUEYoWfnb00slbD7arETZBxabikDoNU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvuddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevkeektdek
    udffvdeludejffejffehveektedtgeekteelfeeitdefudfhieejueenucffohhmrghinh
    eprhgrvhgspghgshhtrhhinhhgshgpshhtrghtshdrnhgvthenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluh
    hnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:soZtZp-lBuXUOEtW3b3HMRZGdgHuTkrqM8ThUQ2blk-eOhXPTaAQMw>
    <xmx:soZtZgsjeUnK5r_cBJl0e77cqGdSMzDkdlPGt9dQ_2szaunMBRMOZg>
    <xmx:soZtZgFqGncNKWHC6ZEyce2KXDftSoBMopEiDARfFNolyF45kL0AHg>
    <xmx:soZtZvOZBXuQH1CLZuV-rHwDOPUhypuR-7TSfvt-e_WMkzGWS7HQtQ>
    <xmx:soZtZkiRJHIZ9pk3lTuZf-as8MTmZQGm_wGrguIadepwTTZUZyYx2vC_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Jun 2024 08:18:57 -0400 (EDT)
Date: Sat, 15 Jun 2024 14:18:56 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] net: ravb: Add MII support for R-Car V4M
Message-ID: <20240615121856.GK382677@ragnatech.se>
References: <f0ef3e00aec461beb33869ab69ccb44a23d78f51.1718378166.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0ef3e00aec461beb33869ab69ccb44a23d78f51.1718378166.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-06-14 17:25:22 +0200, Geert Uytterhoeven wrote:
> All EtherAVB instances on R-Car Gen3/Gen4 SoCs support the RGMII
> interface.  In addition, the first two EtherAVB instances on R-Car V4M
> also support the MII interface, but this is not yet supported by the
> driver.
> 
> Add support for MII to the R-Car Gen3/Gen4-specific EMAC initialization
> function, by selecting the MII clock instead of the RGMII clock when the
> PHY interface is MII.  Note that all implementations of EtherAVB on
> R-Car Gen3/Gen4 SoCs have the APSR register, but only MII-capable
> instances are documented to have the MIISELECT bit, which has a
> documented value of zero when reserved.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only, as all AVB interfaces on the Gray Hawk Single
> development board are connected to RGMII PHYs.
> No regressions on R-Car E3, H3, M3-W, M3-N, and V4H.

This would be interesting to test on a platform if we ever find one 
which uses MII. The change do match the docs.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/ravb.h      |  1 +
>  drivers/net/ethernet/renesas/ravb_main.c | 12 +++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 6b2444d31fcc3093..9893c91af1050fa1 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -258,6 +258,7 @@ enum APSR_BIT {
>  	APSR_CMSW	= 0x00000010,
>  	APSR_RDM	= 0x00002000,
>  	APSR_TDM	= 0x00004000,
> +	APSR_MIISELECT	= 0x01000000,	/* R-Car V4M only */
>  };
>  
>  /* RCR */
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index c1546b916e4ef581..cbe2709e0ace871f 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -579,6 +579,16 @@ static void ravb_emac_init_rcar(struct net_device *ndev)
>  	ravb_write(ndev, ECSIPR_ICDIP | ECSIPR_MPDIP | ECSIPR_LCHNGIP, ECSIPR);
>  }
>  
> +static void ravb_emac_init_rcar_apsr(struct net_device *ndev)
> +{
> +	struct ravb_private *priv = netdev_priv(ndev);
> +	bool mii = priv->phy_interface == PHY_INTERFACE_MODE_MII;
> +
> +	ravb_modify(ndev, APSR, APSR_MIISELECT, mii ? APSR_MIISELECT : 0);
> +
> +	ravb_emac_init_rcar(ndev);
> +}
> +
>  /* E-MAC init function */
>  static void ravb_emac_init(struct net_device *ndev)
>  {
> @@ -2657,7 +2667,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
>  	.set_rate = ravb_set_rate_rcar,
>  	.set_feature = ravb_set_features_rcar,
>  	.dmac_init = ravb_dmac_init_rcar,
> -	.emac_init = ravb_emac_init_rcar,
> +	.emac_init = ravb_emac_init_rcar_apsr,
>  	.gstrings_stats = ravb_gstrings_stats,
>  	.gstrings_size = sizeof(ravb_gstrings_stats),
>  	.net_hw_features = NETIF_F_RXCSUM,
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

