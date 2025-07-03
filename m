Return-Path: <linux-renesas-soc+bounces-19089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91387AF7536
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 15:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1045189A465
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 13:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FAA4A1E;
	Thu,  3 Jul 2025 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SLmp6xJ/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mAocVhQk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B085081E;
	Thu,  3 Jul 2025 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751548588; cv=none; b=UhKCLHta/OyKuZ7wJAQKCOknlyx/oX5BXlCweB6JBxd/23WytsQ3HLg9XorA3lmrc1lkfSz6HBsBlCvin8c8eYX5wjB6wVwz07cXV/lb5Lynv1+T10Cw0UJZB+rBtNc+u9zp5MtzkDvaAdvun9J8K4rWpcCoLxSOYKxTj36ky7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751548588; c=relaxed/simple;
	bh=XytcD+vaZ9RJo/DfZdRUZv3WXvu5odrf278v+i2KoHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGqGxj6FtiKmY+KvHelXHm56bI7SNcnhf78OerzFKk1s6tLuIQo/IJnsLeqgCYxEVKuYvgaWre6TxwgxIUGIuod1T/odM5uAdfrTsPOfwto47b5ambqhvgxY2VWtvkq562bEPwEU/s3GlUwy++em3YJKFAFOCtKZlGxFYKE2Rwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SLmp6xJ/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mAocVhQk; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8AE197A0178;
	Thu,  3 Jul 2025 09:16:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 03 Jul 2025 09:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751548584;
	 x=1751634984; bh=BOGBp2DJegAx2Lc/mJxCM1Eut5ojkmLVEQeycC/XxH8=; b=
	SLmp6xJ/tPVDiaA5ooFReHwnYWyXCGOD4CZUs39MpuykhRPXb6lLCTjLst84fo3N
	/SSInCJYaDIYO/RURtuLkeXgWLeSHO+dn2/ffU/Kw0FnAh3MSH5sD+y2lYkr/hMz
	zoBUq4prc7TwrFLi+GNYevzXEOODe9E1rL0RqqJJxljAVb/35dH2/3l70tpYsbu7
	RMpnKOJ6l6SPvA4GUtxTLA+1PNFUcKPzo7jejiXoh/JOjQRmrKbUVN5A44pvhAzu
	E4Jsf2hDknzw+S2Jf6uj1TVGyKa4RvhPmlin0VfjwyhfajrHL/3EEdsvAhpShhnx
	RvT24+LCYVvhzB0cmjekFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751548584; x=
	1751634984; bh=BOGBp2DJegAx2Lc/mJxCM1Eut5ojkmLVEQeycC/XxH8=; b=m
	AocVhQkiUtqa5yHFhPYWsVRPfvekoRGfnPsytzCArFklpslMni53h1K3wmbtiDjS
	BL/eCFE3mrMSKjXGDXhCRbKY16Z0qHx79VfktuC78ThTnp4bVCLr+2JeTzYEdoAc
	VQ9iVtQx0jK2LCVEhfvWoYRyvAZ8bwd5Ut1HmaXUBa32ABE6HRmwseF++LiwzYkP
	0Z/WY1GDWhUOSlevdhgAtlm2AGN5UYZwZV9iqyrUN1YBEj+TasnuE5Gy++Amc7tp
	D+E3wOzZiy43byEphB7nhidxgTIfK6g1jmjtcUOL/b+PYM63f671xYznlKlas6c2
	QZL/V+k+YKgJnvVNelCow==
X-ME-Sender: <xms:qIJmaDSSR9LmqGPrfgfcIgZcBZyxFfepZ-IzPs6NraVsd4o8I8SFew>
    <xme:qIJmaEwUuv2le5Y5qsy2Gm3tY9qQ3ssZGHITqmaKuRZHfp_4OPNJlR6ulpguLCHyA
    ng7nCFo5X9TzmBkY4M>
X-ME-Received: <xmr:qIJmaI1E58ujjTX93pRqPB3OdeW4PqZJkIbb2uASVLxSsJ5BzgwYB4dYZRTMJKkUVC2HT9f9iVM0PrvoI3z68n5xEh85B1PJRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehhrghogihirghnghgplhhivddtvdegseduieefrdgtohhmpdhrtghpthht
    oheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvg
    hmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohho
    ghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrihgthhgrrhgu
    tghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhs
    ohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qIJmaDBK7lUQ_By2uIWr5UtX3THEi_zbpdfh0jnjzMPqeeEcEYGdHA>
    <xmx:qIJmaMh6oO0szYF9TLacp2BMO92KUT0ng5h6VGVfPbYDgLYxpp3GKw>
    <xmx:qIJmaHqT6nzcM3yrTMSThzH2xayrXDB_iQCIg5xNGVtIRBV4fWJBsg>
    <xmx:qIJmaHj4dSMI9mfPDKPd-6p3ceeUgTkvQqVjJLZ6750y6jQGO9yKeA>
    <xmx:qIJmaFEGiyLTcw_JceSAG82Ik7gWYRB-XbAOxd5rALA0GyBPYHsmC1Vd>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 09:16:23 -0400 (EDT)
Date: Thu, 3 Jul 2025 15:16:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] net: ethernet: rtsn: Fix a null pointer dereference
 in rtsn_probe()
Message-ID: <20250703131621.GB3900914@ragnatech.se>
References: <20250703100109.2541018-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703100109.2541018-1-haoxiang_li2024@163.com>

Hi Haoxiang,

Thanks for your work.

On 2025-07-03 18:01:09 +0800, Haoxiang Li wrote:
> Add check for the return value of rcar_gen4_ptp_alloc()
> to prevent potential null pointer dereference.
> 
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes in v2:
> - Add a blank line to make the grouping similar to the
> style of other error checks in probe. Thanks, Niklas!
> ---
>  drivers/net/ethernet/renesas/rtsn.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
> index 6b3f7fca8d15..05c4b6c8c9c3 100644
> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -1259,7 +1259,12 @@ static int rtsn_probe(struct platform_device *pdev)
>  	priv = netdev_priv(ndev);
>  	priv->pdev = pdev;
>  	priv->ndev = ndev;
> +
>  	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
> +	if (!priv->ptp_priv) {
> +		ret = -ENOMEM;
> +		goto error_free;
> +	}
>  
>  	spin_lock_init(&priv->lock);
>  	platform_set_drvdata(pdev, priv);
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund

