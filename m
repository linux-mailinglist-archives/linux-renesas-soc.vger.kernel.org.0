Return-Path: <linux-renesas-soc+bounces-23091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5304BDF756
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998A63A2737
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6555532F756;
	Wed, 15 Oct 2025 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="diEsTYlb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="w8mq62Yk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C12532ED5C;
	Wed, 15 Oct 2025 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543120; cv=none; b=dZW/3GnySrF230ct3NRXixPoZD8QmucXcD537o7IcyTl+fTcGi7MD8cQkXcx1pMQzf3085+cmd5EWyG8NYZBBhLO9tnbwnnJHGkzKdqDF5yqy5PTQwOhXIQwioafT9sigKktQ3QUPgUpbYH4MinVxPmXs7GgY7BalwFt23vyFdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543120; c=relaxed/simple;
	bh=meP/Aq84K171eC4phODrHaDH0svAHCll1WQAHZlh6kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWlaWph734ucnuip6JtX5s0h/tGtZx2qP+sJQlVZ3e/jO8VBKwt3DTQKX4MIrmBULQkHytp8Z/wD6KZNma6ICZrRLnSxJM9AOl9Yhzs3yfqBb9G35AQ07tHf0sRfstmoC1evWRz/MHjsbXSiXxb9k+MW9GBaXA6idGdxLKHuAig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=diEsTYlb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=w8mq62Yk; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 5E3571D000C4;
	Wed, 15 Oct 2025 11:45:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 15 Oct 2025 11:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760543117;
	 x=1760629517; bh=V/erT+QWunXqRIIEBMFZDjF8ybSTlOX6XftGy/9IXo8=; b=
	diEsTYlbRtS1xFOXXCLQq/ZnnwsfpRu+LWagHq+qkQkmV/LALEesnuC3MI935oYH
	ogk8vRYMRvuVlMUCHCf74A90DiS2j5C2I+rWXYcTHxY6JXmRdusU5r5M+Hy4IdnQ
	nEN3DrWnjTJrLfkrb5WVJ8LZaIeyf8rmpZszXJ/tUC4/XCqyhCWpFxj7XtSnDQb/
	Dq2LJpouh0UUfpXwBLZCY5HaXIlh/8Qr4HCWeXHRoKoiYUMET8i2DFcSZF4DvieR
	YbYueYDNkds+yJkG0PkoQ9THFsErWhKwym9vU9Q4tsqD9fIEPBvu6u1tYCgxfAs0
	9Rn3iBc8xKlfcoBlemC5Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760543117; x=
	1760629517; bh=V/erT+QWunXqRIIEBMFZDjF8ybSTlOX6XftGy/9IXo8=; b=w
	8mq62Ykr/bAnjg1p0SKj80LNm40Q331it/cN3MK/7w/Dq3GiIhmICAgDY2g3oQuo
	wy6Hlq/iRlIY2WF/yc6PobD2RAO3PVMfKdGPjhjlFjeAALenatav3bwfWYXM9PB0
	43JExsjRJLPLQk4WLHr6MdQLwl4/OWD1Kzitqz6N+vUkm0r2ywt6ei8GKv7vv3HX
	vpMiRbL2U2CreJ8ONtRr9kZyA/Ubl/VKiGHIGsTGV/7QQyHUAkWKfD2pFpFh1LIA
	0DKYVHstFwi913Zz7eIzzFTrKTG7djnfgHjymBKYRQWF64JNyq7o7fvh+kC1+3aQ
	ZwMVhyiEOXkpy6TZy7W2Q==
X-ME-Sender: <xms:i8HvaO_9L8t-M7hutUTD_Fidk4RBTg9yIJTIrfHYEJqj31qEi54qBw>
    <xme:i8HvaEQ4m69lKUsKgdVdNBxovmgr7eGyBYMhu_fZtw8nGupeaafBviw8wJFyfR5zk
    DtFxdOqz18gHXsjQDbOYh2QVWjuWE8b3skcPHIcz1yM59nNCZ__VeY>
X-ME-Received: <xmr:i8HvaNmUpSSNv2Aig13nn3zl1m9H8Gd1N75C8ReZUj6DDj06C4nYFeussE3OzhXkRZOEA2L0M0YsHvi8Gq9XMHr4suzAw50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdefkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepphhrrggshhgrkhgrrhdrtghsvghnghhgsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthhtoheprghnughrvg
    ifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghm
    lhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
    dprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggv
    nhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehsvghrghgvihdrshhhthihlhihoh
    hvsegtohhgvghnthgvmhgsvgguuggvugdrtghomhdprhgtphhtthhopehnvghtuggvvhes
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:i8HvaHWUzaMbpdnHQPSJy0V57I4ehPAIAp42itlniFChwvNKuZEwaQ>
    <xmx:i8HvaKdvwTnMkNusNvFnBd7hFfrlZzWBw2ZXbHsPzKUIMSF1w3oxOw>
    <xmx:i8HvaNnfBvOpFk03o7yQ3az12EetK3b2a70K6n2sFHLB9BX3nfhsIg>
    <xmx:i8HvaECDFQE2nsMdTvhirfdNqvbr4-uFIFx-pRpML3B272LNQVBPwg>
    <xmx:jcHvaA9OIHd8vfIiECDt5OZaJ0CD0ig5Sb2cc4oA5-Flr5h_x-a60sih>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Oct 2025 11:45:15 -0400 (EDT)
Date: Wed, 15 Oct 2025 17:45:14 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/3] net: ravb: Allocate correct number of queues based
 on SoC support
Message-ID: <20251015154514.GD439570@ragnatech.se>
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015150026.117587-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015150026.117587-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thanks for your work.

On 2025-10-15 16:00:25 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On SoCs that only support the best-effort queue and not the network
> control queue, calling alloc_etherdev_mqs() with fixed values for
> TX/RX queues is not appropriate. Use the nc_queues flag from the
> per-SoC match data to determine whether the network control queue
> is available, and fall back to a single TX/RX queue when it is not.
> This ensures correct queue allocation across all supported SoCs.
> 
> Fixes: a92f4f0662bf ("ravb: Add nc_queue to struct ravb_hw_info")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 69d382e8757d..a200e205825a 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2926,13 +2926,14 @@ static int ravb_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
>  				     "failed to get cpg reset\n");
>  
> +	info = of_device_get_match_data(&pdev->dev);
> +
>  	ndev = alloc_etherdev_mqs(sizeof(struct ravb_private),
> -				  NUM_TX_QUEUE, NUM_RX_QUEUE);
> +				  info->nc_queues ? NUM_TX_QUEUE : 1,
> +				  info->nc_queues ? NUM_RX_QUEUE : 1);
>  	if (!ndev)
>  		return -ENOMEM;
>  
> -	info = of_device_get_match_data(&pdev->dev);
> -
>  	ndev->features = info->net_features;
>  	ndev->hw_features = info->net_hw_features;
>  	ndev->vlan_features = info->vlan_features;
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

