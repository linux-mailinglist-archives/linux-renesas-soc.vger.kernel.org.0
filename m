Return-Path: <linux-renesas-soc+bounces-23432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FEABFBCEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 14:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77B84188348F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 12:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC5030DD19;
	Wed, 22 Oct 2025 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iSyD2eAC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gkayi/hY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21634285074;
	Wed, 22 Oct 2025 12:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761135379; cv=none; b=hYUj3UbPZvpVBzAx4ruUb26YbVIYmNeCzVgUg3BEpjQEYcBrykKsxw+BitKnfnAWaB7QsivCtcqn6QYfnFX5thB+JCtzaCcpUgZARQnyiG1eHJKtr7iel/LzbfVkAYtGuwWGXelV5s96Rl2Mh2IHjvpmeS+bGvWF3Dc+txKMdiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761135379; c=relaxed/simple;
	bh=cgt7CLQjSoyB4oOe7l2CcWFiQDCWV6sN2Ax5llb7nBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJ4zY2Pk/2jpSHEqvIujYTzWuz1r7a2i5w3kJMduQdl2d4T4GwEx2BGSALdZBEg9a3Pqlw13oGTBNn5zfXihW4yf5/IZEnN86B6yFuwnLPG9A/AQJ9nXcVooRMOoIhUs5t19kpvdKYLUu4/C+mWHKqmixRMpINwFH31gkIMuu0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iSyD2eAC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gkayi/hY; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 2694EEC0064;
	Wed, 22 Oct 2025 08:16:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Oct 2025 08:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1761135376;
	 x=1761221776; bh=FajAkPMbd4+2ubuOtdzYe8+OKPtN1c8032SY+wXAvDY=; b=
	iSyD2eACEzRF6VDWame1A5MHviX4LWMvaxRqBmr1pgb33aceXZfLqHU/ISr5i+tT
	qtN+n5sP9ZZLSCDiVRU/Rc/k2+esSNRKCCGraLclmrAIc0BzjfbCT8/H0wWyN+NU
	pCR7Qm9yQfThGY2m2HmIbKfbaCKGNCOv8uDoM/3B8Bg1hyMYoWzxVzsgNHQeJeFX
	7rl3VNuUXA+BzDkiI35MxMqKTLZRwN6jD08HR3ZSwiB2nipZ5wPaum+6GZpL/2LO
	ppg5li9qCS/IKHmEogzNRTf/tLuErnsrepjDxyRqSWJSla+jG0W2JyIG02cU3xqa
	kXYfAcKae9/KGNh3oPXcjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1761135376; x=
	1761221776; bh=FajAkPMbd4+2ubuOtdzYe8+OKPtN1c8032SY+wXAvDY=; b=g
	kayi/hYyHMifyC8iIhm4lQ/zTyJ4NhXv/m8BY0gEuzF7k3rfbZAcGrOFHuX03Gwd
	OIYyKa+y0Q3i6PUO3Zvc/YH+/4FMYjB/cjlxwY1gK1TgyiYx+MpDdAMgw+GqUYtp
	nd5XF9aMlgG+L4L8jgzUc8nd3r9plXaZWukysSoB7pS/5tj+PRvhv+tTDbF7YLnt
	y/MkurKZM25GaKVrS566CI/vApKIa6PW+1zI8d4KuNVK9KkYWcX01XMw9bN9SjUO
	BIEq/K0nFf8oWhkR/5TW1OcP+bdFQV8VVX6mvk2UHP7jsvQQNvf9SbNMdt7ZkV+Z
	QqRjrhKHaa6mDO5Gp74ew==
X-ME-Sender: <xms:D8v4aNEdLghyyTWWIoz-fduLwSRHBg1W-HyvnhTS0oyTE3-6Yd7l2Q>
    <xme:D8v4aDT2UOHVhQdxPd29RQimS1qQ552-p95GhdSlCVF-vCgSGh_xpP6yxtq1zwbDy
    YcDKyeYtTQPSVBsghwA6P-cQjQDR2O5W4crG8a0qAo8h3tQdZEWlQ4>
X-ME-Received: <xmr:D8v4aPeRSJv-GU6Sus5cMAVIbRKRq0j5Zl0lffpZ6IEwsQijlgfoLP9jTNZ4l4WsrmoRd9NP2k3dqJQJAICPRQ61LbaCzrc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeefheeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:D8v4aBjaP8DysEkFTY6jndxGe_WRCn6GI6dMIPMGeL34M4BWQ26okA>
    <xmx:D8v4aKION9Fh9EbRfbc9m-QiGIHmbd-iRS0GQDbpoaG-hOiVj1WMTQ>
    <xmx:D8v4aOGFM86KB_ajjLJsW8NLemQsDZ-3zi36hUbXEViRApSedQ-__g>
    <xmx:D8v4aA3DhWIAmcR5qaV8zGi49T_gFZlBVTDlcCQ5ew_yxAEI4eqokg>
    <xmx:EMv4aNy87RC6RJe0MigPyc-lHMrxy5gYkhDiktWYQfk8Ads_XrkqA7y5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Oct 2025 08:16:15 -0400 (EDT)
Date: Wed, 22 Oct 2025 14:16:14 +0200
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
Subject: Re: [PATCH v2 4/4] net: ravb: Ensure memory write completes before
 ringing TX doorbell
Message-ID: <20251022121614.GE1694476@ragnatech.se>
References: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251017151830.171062-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017151830.171062-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hello Lad,

Thanks for your work.

On 2025-10-17 16:18:30 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a final dma_wmb() barrier before triggering the transmit request
> (TCCR_TSRQ) to ensure all descriptor and buffer writes are visible to
> the DMA engine.
> 
> According to the hardware manual, a read-back operation is required
> before writing to the doorbell register to guarantee completion of
> previous writes. Instead of performing a dummy read, a dma_wmb() is
> used to both enforce the same ordering semantics on the CPU side and
> also to ensure completion of writes.
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Cc: stable@vger.kernel.org
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v1->v2:
> - New patch added to separate out the memory barrier change
>   before ringing the doorbell.
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 0e40001f64b4..c3fc15f9ec85 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2232,6 +2232,14 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  		dma_wmb();
>  		desc->die_dt = DT_FSINGLE;
>  	}
> +
> +	/* Before ringing the doorbell we need to make sure that the latest
> +	 * writes have been committed to memory, otherwise it could delay
> +	 * things until the doorbell is rang again.
> +	 * This is in replacement of the read operation mentioned in the HW

nit: I would spell out hardware here, if you do a v3.

> +	 * manuals.
> +	 */
> +	dma_wmb();
>  	ravb_modify(ndev, TCCR, TCCR_TSRQ0 << q, TCCR_TSRQ0 << q);
>  
>  	priv->cur_tx[q] += num_tx_desc;
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

