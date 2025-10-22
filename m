Return-Path: <linux-renesas-soc+bounces-23430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B5BFBC94
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 14:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6A68189C18B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 12:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C57341644;
	Wed, 22 Oct 2025 12:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="I2Tx7BWj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="afgs+hpx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669C9340A74;
	Wed, 22 Oct 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761135100; cv=none; b=c4Socs6UcM39QloVFhQEapAGJknnESFKZ45uSc1FHMoPS848wjOxVpyQX0cMRXP54PLtKEp9Xz6JQmDdO8cV8mdSIQFkmqY7+IHXT5sIW+pNYm6BRxUDY9lPGXW/CZRfbu2OFdHT635j9zAZg3pSYmsDoiMR1Mmv0h0TV0AkfeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761135100; c=relaxed/simple;
	bh=mECsDdFjCrIKMYgGoxnHbPdtkOYxeUoa0WgtVRPLbCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAktgxk6WJQ7xjJQjsqGIF/c/nPLXW+fwcAUEbS9DEN4jd9vAlrUGXqMUjnOZffh27cB6t9YuqXrOaVKuWztQahkY7pQEw0JFUrGYPbauaC2VW1wwH4hW0CMcwJrDV0LycdpSKJ5msVf/9yG7f9lkpxCfI05f1kIvSqsoScyA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=I2Tx7BWj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=afgs+hpx; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 71CD714001ED;
	Wed, 22 Oct 2025 08:11:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 22 Oct 2025 08:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1761135096;
	 x=1761221496; bh=qJPg3aLK9s15SicvkiJXtX8ZgHxMs/B0zeAkFcOouJE=; b=
	I2Tx7BWjdjjc51baoFXGsWv5FhGrqOruRxWsrm2tX4xWlHc0kQrHSXH4cXtkPaXO
	NbSj1cchh/toWayPSH4fL/F1fHSdiFq8kBL3ceEGxdQ0V/kl5eyaQBTeMailfuGT
	3OokqFxV3rOfvJNPAEV5ePTWSFWku77jFs8VaOLDlHpJPNn2r9sRnWrg62Lro/DA
	EEnhENzbHICBuq9lo+wbUTIh1J37DEOWG0NwgV9bYi6qseMvs3Nl462QzFbs5mvr
	KCByhxSna6acnsjtTw6Ix76JxIKAeLSAlq9jZb5QFw0N3ZP2iCVMZIJXgOYS303t
	y0MVhQGWKC2jg042sCZvEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1761135096; x=
	1761221496; bh=qJPg3aLK9s15SicvkiJXtX8ZgHxMs/B0zeAkFcOouJE=; b=a
	fgs+hpxE7/RGgKxOfdm++DvjqR69+dtu7L7KSqLObP44akuyURMZspBclVt4xbGF
	7G+DOqX2GL3UuHAgFsyvlrZp1+9Hma1gxfy0xjXVqIjtaZPUxOXECnUHu3wiHoz5
	kHZ4ak9XZUMF9mngp8E5N6SO8qnPNOamsD4+W/0AgG1LtIEJ7K6n6a+HagFQzW+P
	PlaZXbrGhXD8KE+SeI3DPXv0g7vKWaVYG9NZOJ5U+x5BnxCwgQjd2Iwt6edpnGRF
	EpV8Ml8RaiPFMCFFaM/obsZoNduWTMgKgPGwaTNrYjwNF6qzFfwRY18x5O7Wz3YJ
	8l2JmPuP3S+27ugpbkPIA==
X-ME-Sender: <xms:9sn4aGPTPm834jlamya7NAeigdJC3z38O4K-447PjZh7YTjwBISftw>
    <xme:9sn4aF5xJ8VLHI8tnvWYe7K8uV-It0e_PsegPCt8iz0ZpnzySlpFTPeVDsFb_j8q1
    U4Fz4mF1KpbWrVD0w_kBlwbeHSjlp8ER2gDTZFU17F0TY_j1VlrGg>
X-ME-Received: <xmr:9sn4aNm--kaXzOyzb6gtQ05-c2zxNRLYIlj24oa878jKbKfYTV7RuSoeMxXSlEIne1QY2g33ZWyG5iswVOMhWKG6ACjaLnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeefheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepphhrrggshhgrkhgrrhdrtghsvghnghhgsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthhtoheprghnughrvg
    ifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghm
    lhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
    dprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggv
    nhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghsse
    hglhhiuggvrhdrsggvpdhrtghpthhtohepmhhithhsuhhhihhrohdrkhhimhhurhgrrdhk
    tgesrhgvnhgvshgrshdrtghomh
X-ME-Proxy: <xmx:9sn4aFICyEvoFkLZuebjDM0obzhW197JCBKKHa3eLBdtZTSrpVIS6A>
    <xmx:98n4aFRLzO8qzRPU6_HvhrrFR_aF2BkBPFusDxJ0ylHKlf5rd78z_g>
    <xmx:98n4aKtJXjgz87Xy3APNh4oCit2x05Ov0249Ew5MDdZXatvtaVDTNQ>
    <xmx:98n4aA-c2qwHenZASkOKgSp8ZL62ufiD0lw5czFj6fb0Z-J-bH-7Qw>
    <xmx:-Mn4aC7AyMVu8uWSFzUI7Mwqv9APZmo_-oKx4w9rAlmyCsNMVCturHCL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Oct 2025 08:11:34 -0400 (EDT)
Date: Wed, 22 Oct 2025 14:11:32 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 3/4] net: ravb: Enforce descriptor type ordering
Message-ID: <20251022121132.GD1694476@ragnatech.se>
References: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251017151830.171062-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017151830.171062-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Lad,

Thanks for reworking this and making it very clear what's going on.

On 2025-10-17 16:18:29 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Ensure the TX descriptor type fields are published in a safe order so the
> DMA engine never begins processing a descriptor chain before all descriptor
> fields are fully initialised.
> 
> For multi-descriptor transmits the driver writes DT_FEND into the last
> descriptor and DT_FSTART into the first. The DMA engine begins processing
> when it observes DT_FSTART. Move the dma_wmb() barrier so it executes
> immediately after DT_FEND and immediately before writing DT_FSTART
> (and before DT_FSINGLE in the single-descriptor case). This guarantees
> that all prior CPU writes to the descriptor memory are visible to the
> device before DT_FSTART is seen.
> 
> This avoids a situation where compiler/CPU reordering could publish
> DT_FSTART ahead of DT_FEND or other descriptor fields, allowing the DMA to
> start on a partially initialised chain and causing corrupted transmissions
> or TX timeouts. Such a failure was observed on RZ/G2L with an RT kernel as
> transmit queue timeouts and device resets.
> 
> Fixes: 2f45d1902acf ("ravb: minimize TX data copying")
> Cc: stable@vger.kernel.org
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v1->v2:
> - Reflowed the code and updated the comment to clarify the ordering
>   requirements.
> - Updated commit message.
> - Split up adding memory barrier change before ringing doorbell
>   into a separate patch.
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index a200e205825a..0e40001f64b4 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2211,13 +2211,25 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  
>  		skb_tx_timestamp(skb);
>  	}
> -	/* Descriptor type must be set after all the above writes */
> -	dma_wmb();
> +
>  	if (num_tx_desc > 1) {
>  		desc->die_dt = DT_FEND;
>  		desc--;
> +		/* When using multi-descriptors, DT_FEND needs to get written
> +		 * before DT_FSTART, but the compiler may reorder the memory
> +		 * writes in an attempt to optimize the code.
> +		 * Use a dma_wmb() barrier to make sure DT_FEND and DT_FSTART
> +		 * are written exactly in the order shown in the code.
> +		 * This is particularly important for cases where the DMA engine
> +		 * is already running when we are running this code. If the DMA
> +		 * sees DT_FSTART without the corresponding DT_FEND it will enter
> +		 * an error condition.
> +		 */
> +		dma_wmb();
>  		desc->die_dt = DT_FSTART;
>  	} else {
> +		/* Descriptor type must be set after all the above writes */
> +		dma_wmb();
>  		desc->die_dt = DT_FSINGLE;
>  	}
>  	ravb_modify(ndev, TCCR, TCCR_TSRQ0 << q, TCCR_TSRQ0 << q);
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

