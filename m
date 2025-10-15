Return-Path: <linux-renesas-soc+bounces-23086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F294BDF68D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E8B784E73F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EC52FE05F;
	Wed, 15 Oct 2025 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="okey7Jxx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qPoTrkYt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F8028B3E7;
	Wed, 15 Oct 2025 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542567; cv=none; b=ZeXLS0anH3aUTXScmKWC/YSx7h/zk7PZJxYqibUAm4WShXDLYl7JhjQHLSFg49M8ZzL3MXoTsSrXtWuEjgMKaM7FKqRl3OupSwn/1X3dsD0whWW4Dkwyl+lqjFi8SGUktFDT6mnjQ4s+BE3fC1jetTUsYmu6YmNDW8XX1NuG30M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542567; c=relaxed/simple;
	bh=b3XNeJ043/GZIdvxE2tPziVWO1Z1tp3ag7pc0IcuOOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFyfs7YzUZ62IetYjNbd2V8Uhyb8FhrLGdhcPUXwojk2MfrfO3Ifeb5RwBFNjJkLjQdB7SWK/pTUb4xd8GDtqog60vKlhKfctCtzx38baHv6bPgpsCYIZfM/Xi8D9cPWcg+4W2ovZ5tuRBpl2tQQeguHe9tWkoOoymcAvGTv35k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=okey7Jxx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qPoTrkYt; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id F063D1D00165;
	Wed, 15 Oct 2025 11:36:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 15 Oct 2025 11:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760542560;
	 x=1760628960; bh=EgHwv9WjnZoGe6jMQYPkCOJwkRlt61B1V48ek/U9E1s=; b=
	okey7JxxAJTddB/vqMhWc+PTwrbbgUw7a818VoWE5psHG6Ry1wI14Ferco/alBDE
	rORG8Gzqhwk3oBSt92ozQGoSkIPJ9d9M8BKEK+o0pz619b+/CJtb7v+9pQndTr+e
	FCQf7nmQOnrS+CQ1+SJGlV98/hZ1QyxsJB7UBmjVjt/LKzHYUEI17ORZWx8EvWLR
	V8j8fvbzEyV7Tp4gM5dp3wBzXCKE7a+M6hSCVjbduS/SKJLz1KLB2G1Cp8qyTNnW
	43smCqP+O82h0SVXW8DTQpu6tCwkmE7bRfjZ8p2DkpJ1UGDypnipjb9AMppCCaaD
	GK8QCGV5LvdjQeVXAdCf+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760542560; x=
	1760628960; bh=EgHwv9WjnZoGe6jMQYPkCOJwkRlt61B1V48ek/U9E1s=; b=q
	PoTrkYtbH8W1eanxnfrZr+PDCTEA/CXFgCf2vT7hwBEDRcSp2C4VV8fnCMX8wiz5
	IgCt8K86XD2CxgVcL5u/5ZQJhBIA0Q6K9SEfZGwVhvxIghwG4bX3gCyzDKY02wFS
	CKdHpv4Ce12ZDskxYzHUDmmyAI1rY1ICS6gfOSBp0tFkYqX1jFTPDuZ7rABQsCJb
	VycCaMCAbeNOrdceUE+EuwARA9WToqM853iYzt4nyz+jh5lMNOjmBxSIC3NQLA/l
	PyZ291lvJjaPrpXtkPwxYuUgRded/ZEMMt8ssdxf9yNWaGWKSxGhm6FNTm63ISsA
	U9/k0pibirtkX2r22Zw8Q==
X-ME-Sender: <xms:X7_vaGhYkMXceChRuTalNKHTLcvoc7yxATglkDQvGeHjwhMInPzPfA>
    <xme:X7_vaMlzdjEogzgzIHuQ9SDTkXgDsMM27tsnHIUtaWIiyEysmyNQZ2th6aaOgyBWg
    xEBAG0TEAHlsaGZqOPNIErC2q0pjF8kRzeeUF4-tq-RazjTGlIESGU>
X-ME-Received: <xmr:X7_vaHpqE5uIz99naj-QOtuSpKqUL9y78R4FyPDJHd8ePYdErlPpwYTctBLsQQUg4zJBu0nE49Q1gnROlDCVTA4PmW_ERow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdefjeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:X7_vaAIw7EyMAeJwOqxQ1u-SU8J5ho84E9T8XD03CDQyld_l_DGy7w>
    <xmx:X7_vaLBYhmdvCQNS9mVcpIF4tgxXqH3O1a8ABBNBsBnnOOx-FTY-3g>
    <xmx:X7_vaK4uiPug7wzwV5h64KZmfYZ7RVkqi1YUfS46v3NyWILWuXtCEw>
    <xmx:X7_vaPFxUy-h3P1SxqN_J2jyt6kNLrhczQRFg4VPbmMc0i7t1vYvPQ>
    <xmx:YL_vaGVBg_TRMXvh4yNUSbfTvjWrjQNYX3t_LC_73UpqMlwW2nExhfg0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Oct 2025 11:35:58 -0400 (EDT)
Date: Wed, 15 Oct 2025 17:35:56 +0200
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
Subject: Re: [PATCH 1/3] net: ravb: Make DBAT entry count configurable per-SoC
Message-ID: <20251015153556.GC439570@ragnatech.se>
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015150026.117587-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015150026.117587-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thanks for your work.

On 2025-10-15 16:00:24 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The number of CDARq (Current Descriptor Address Register) registers is not
> fixed to 22 across all SoC variants. For example, the GBETH implementation
> uses only two entries. Hardcoding the value leads to incorrect resource
> allocation on such platforms.
> 
> Pass the DBAT entry count through the per-SoC hardware info struct and use
> it during probe instead of relying on a fixed constant. This ensures
> correct descriptor table sizing and initialization across different SoCs.
> 
> Fixes: feab85c7ccea ("ravb: Add support for RZ/G2L SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I have not verified with documentation the setting of 2 for 
gbeth_hw_info. But the change itself is good.

> ---
>  drivers/net/ethernet/renesas/ravb.h      | 2 +-
>  drivers/net/ethernet/renesas/ravb_main.c | 9 +++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 7b48060c250b..d65cd83ddd16 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1017,7 +1017,6 @@ enum CSR2_BIT {
>  #define CSR2_CSUM_ENABLE (CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4 | \
>  			  CSR2_RTCP6 | CSR2_RUDP6 | CSR2_RICMP6)
>  
> -#define DBAT_ENTRY_NUM	22
>  #define RX_QUEUE_OFFSET	4
>  #define NUM_RX_QUEUE	2
>  #define NUM_TX_QUEUE	2
> @@ -1062,6 +1061,7 @@ struct ravb_hw_info {
>  	u32 rx_max_frame_size;
>  	u32 rx_buffer_size;
>  	u32 rx_desc_size;
> +	u32 dbat_entry_num;

I have been wondering for some time if we shall not start to document 
these fields as they always take so much time to get back to what each 
of them represent. How do you feel about starting a header?

/**
 * dbat_entry_num: Describe me here.
 */

Without, but preferably with, this added.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>  	unsigned aligned_tx: 1;
>  	unsigned coalesce_irqs:1;	/* Needs software IRQ coalescing */
>  
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 9d3bd65b85ff..69d382e8757d 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2694,6 +2694,7 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
>  	.rx_buffer_size = SZ_2K +
>  			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
>  	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
> +	.dbat_entry_num = 22,
>  	.aligned_tx = 1,
>  	.gptp = 1,
>  	.nc_queues = 1,
> @@ -2717,6 +2718,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
>  	.rx_buffer_size = SZ_2K +
>  			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
>  	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
> +	.dbat_entry_num = 22,
>  	.internal_delay = 1,
>  	.tx_counters = 1,
>  	.multi_irqs = 1,
> @@ -2743,6 +2745,7 @@ static const struct ravb_hw_info ravb_gen4_hw_info = {
>  	.rx_buffer_size = SZ_2K +
>  			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
>  	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
> +	.dbat_entry_num = 22,
>  	.internal_delay = 1,
>  	.tx_counters = 1,
>  	.multi_irqs = 1,
> @@ -2769,6 +2772,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
>  	.rx_buffer_size = SZ_2K +
>  			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
>  	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
> +	.dbat_entry_num = 22,
>  	.multi_irqs = 1,
>  	.err_mgmt_irqs = 1,
>  	.gptp = 1,
> @@ -2794,6 +2798,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
>  	.rx_max_frame_size = SZ_8K,
>  	.rx_buffer_size = SZ_2K,
>  	.rx_desc_size = sizeof(struct ravb_rx_desc),
> +	.dbat_entry_num = 2,
>  	.aligned_tx = 1,
>  	.coalesce_irqs = 1,
>  	.tx_counters = 1,
> @@ -3025,7 +3030,7 @@ static int ravb_probe(struct platform_device *pdev)
>  	ravb_parse_delay_mode(np, ndev);
>  
>  	/* Allocate descriptor base address table */
> -	priv->desc_bat_size = sizeof(struct ravb_desc) * DBAT_ENTRY_NUM;
> +	priv->desc_bat_size = sizeof(struct ravb_desc) * info->dbat_entry_num;
>  	priv->desc_bat = dma_alloc_coherent(ndev->dev.parent, priv->desc_bat_size,
>  					    &priv->desc_bat_dma, GFP_KERNEL);
>  	if (!priv->desc_bat) {
> @@ -3035,7 +3040,7 @@ static int ravb_probe(struct platform_device *pdev)
>  		error = -ENOMEM;
>  		goto out_rpm_put;
>  	}
> -	for (q = RAVB_BE; q < DBAT_ENTRY_NUM; q++)
> +	for (q = RAVB_BE; q < info->dbat_entry_num; q++)
>  		priv->desc_bat[q].die_dt = DT_EOS;
>  
>  	/* Initialise HW timestamp list */
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

