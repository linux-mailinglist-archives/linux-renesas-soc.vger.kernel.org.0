Return-Path: <linux-renesas-soc+bounces-23092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9FCBDF7F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 117CE4F645D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5256C335BC4;
	Wed, 15 Oct 2025 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lF8XgbKI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b9grQocf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E14E323406;
	Wed, 15 Oct 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543789; cv=none; b=opRTJ/+7NobW6karHFmuuc4eIaKvikAcYesfToe9356vAmmwWZQY3LN8hYdyFoW+pIv0/2uHlUxFmz4RLmhMuXBOkr6Dl/eGaiv1xXlfEnWjMenxvmoGY5ciPCaZXwjK9ZHO+wDla0sTDs7vb9rzw4moWhmRnq50JVw7HiMYWS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543789; c=relaxed/simple;
	bh=YxaGtzOpXwnSnKbbuzaNul8jxGmuy2Gsw+VaF2D1CHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvA5GkM5HCGjqNHcsVQ3cpmutWqWPdI8lPT7x5sxsI3s2Zz5xcmmEG6398VLvTaUOhAiXbSlo7+G9aQLbiWssk8494gPv/0KMhCU+Gsv22l5DJS+ti3FVxu0/f23ioWnukCJyUf+waacrCw5/jFNehB3CW6SWrAn26ZtcHKFUFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lF8XgbKI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b9grQocf; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D8A7F7A00F6;
	Wed, 15 Oct 2025 11:56:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 15 Oct 2025 11:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760543785;
	 x=1760630185; bh=DVTLaUwndT/M5IWUsp/7e48/Ees2JbvZRFGUdIkyIEE=; b=
	lF8XgbKIM/lkHeT0Jwr2p/brgWX0wnlanBlu3jX6F1NmlUoIkCOl35YNSr7uSZpI
	6SaVmwp1tNtGS+PJapvymhjZZPnZLALNEbS5D1cYyQx+yWtMWRearitCDVB3RQE/
	104JwP+sIJ5P2sB5ZgEaidVGKc+Xhf3qYTCeqCtAkYmhkIPsT5Hshx9fsPz3OjrI
	Gi3D7+wsYEzZpNNvC7lljhsKECpdvED9+3h5biSAUmkfQeRpCmq4gDVO6VQb7amo
	PcLyOOrLP8/exiQpFCMyTfldJPSewg24XOb8rAD8xye/fT4YVhnm4WXpl9xulvJk
	juiMjwo7gywsuB6H4gb40w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760543785; x=
	1760630185; bh=DVTLaUwndT/M5IWUsp/7e48/Ees2JbvZRFGUdIkyIEE=; b=b
	9grQocfhAllzeGW1MEdjFSOuU874js0hNuDI5hxYKlY2E+jc7YAGtn017oP5p92f
	jWO2rNCt8q2EQjj/+TOaw8bf9BQ56xMWJrQ/EK+lb8OFytL1hQuOirF1lx9Mv5mQ
	6aGbfBhpv7O9vYuat3UijsIGbeeR8UiPPltybQ7fwTGeFs/kss8IToDaCdonX37m
	ecPAxY17klo+NFaGoiNlJBfn0wksAqDRxmi2OC8jmOR/eQ8rqD9QdM9jKmPA9/ES
	Of3XvJs+OmwaHF4VBrkqVI+OfazzBPBtZZo91ia7oaKeRcfBa46UMff7YSJATC10
	lNFXDvTGiiI3f/ATByDIA==
X-ME-Sender: <xms:KMTvaDTeieh9yOOV8ZJ-NNtnoZO2iNPhJwpThmNl3BKppUUKpy34cw>
    <xme:KMTvaKWz-YOmUgM1PxFSKWULUzDIsMIUYkzX0KxPyYNjEuK87Gsjz87QfZKilnnpG
    3x-wHQatoC4HGOmws13sL-2b1ulkAuKz3_mO1QAzU6iQxU-V--H2qY>
X-ME-Received: <xmr:KMTvaCZDJU9A_Jel8UhkD6_bSD5UJ97nsPDGutdij6MCaf3hDvx2zGXXdXV-ewlsrAD4DFuYm69H26COqGJ0Itxbrd6w3KY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdefkeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:KMTvaD75v-cdSk0nHnNvl6LJwMUBhuYGEPYCHKKPUjiP4l7WDeVUzw>
    <xmx:KMTvaDzvziX0qm3Lk7Ikzc2dPcPjpzRJemMqrChUkQESQXaLjB2gug>
    <xmx:KMTvaEoQwmhaQsAi9wEbmm_VhpkMVqnLD504fAYJ7S5YYYmYijp39Q>
    <xmx:KMTvaF2pevWgZ4PrPdh04L-aXDhX_OpxI87fIsPpAQc-V8Ke2LwbHw>
    <xmx:KcTvaOEZvs282OyMgxBV3zSv5iXW9OTJiLLiubEC_Oim_-mqLCqzxBRl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Oct 2025 11:56:24 -0400 (EDT)
Date: Wed, 15 Oct 2025 17:56:22 +0200
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
Subject: Re: [PATCH 3/3] net: ravb: Enforce descriptor type ordering to
 prevent early DMA start
Message-ID: <20251015155622.GE439570@ragnatech.se>
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015150026.117587-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015150026.117587-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thanks for your work.

On 2025-10-15 16:00:26 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Ensure TX descriptor type fields are written in a safe order so the DMA
> engine does not begin processing a chain before all descriptors are
> fully initialised.
> 
> For multi-descriptor transmissions the driver writes DT_FEND into the
> last descriptor and DT_FSTART into the first. The DMA engine starts
> processing when it sees DT_FSTART. If the compiler or CPU reorders the
> writes and publishes DT_FSTART before DT_FEND, the DMA can start early
> and process an incomplete chain, leading to corrupted transmissions or
> DMA errors.
> 
> Fix this by writing DT_FEND before the dma_wmb() barrier, executing
> dma_wmb() immediately before DT_FSTART (or DT_FSINGLE in the single
> descriptor case), and then adding a wmb() after the type updates to
> ensure CPU-side ordering before ringing the hardware doorbell.
> 
> On an RZ/G2L platform running an RT kernel, this reordering hazard was
> observed as TX stalls and timeouts:
> 
>   [  372.968431] NETDEV WATCHDOG: end0 (ravb): transmit queue 0 timed out
>   [  372.968494] WARNING: CPU: 0 PID: 10 at net/sched/sch_generic.c:467 dev_watchdog+0x4a4/0x4ac
>   [  373.969291] ravb 11c20000.ethernet end0: transmit timed out, status 00000000, resetting...
> 
> This change enforces the required ordering and prevents the DMA engine
> from observing DT_FSTART before the rest of the descriptor chain is
> valid.
> 
> Fixes: 2f45d1902acf ("ravb: minimize TX data copying")
> Cc: stable@vger.kernel.org
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index a200e205825a..2a995fa9bfff 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2211,15 +2211,19 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  
>  		skb_tx_timestamp(skb);
>  	}
> -	/* Descriptor type must be set after all the above writes */
> -	dma_wmb();
> +
> +	/* For multi-descriptors set DT_FEND before calling dma_wmb() */
>  	if (num_tx_desc > 1) {
>  		desc->die_dt = DT_FEND;
>  		desc--;
> -		desc->die_dt = DT_FSTART;
> -	} else {
> -		desc->die_dt = DT_FSINGLE;
>  	}
> +
> +	/* Descriptor type must be set after all the above writes */
> +	dma_wmb();
> +	desc->die_dt = (num_tx_desc > 1) ? DT_FSTART : DT_FSINGLE;

IMHO it's ugly to evaluate num_tx_desc twice. I would rather just open 
code the full steps in each branch of the if above. It would make it 
easier to read and understand.

> +
> +	/* Ensure data is written to RAM before initiating DMA transfer */
> +	wmb();

All of this looks a bit odd, why not just do a single dma_wmb() or wmb() 
before ringing the doorbell? Maybe I'm missing something obvious?

>  	ravb_modify(ndev, TCCR, TCCR_TSRQ0 << q, TCCR_TSRQ0 << q);
>  
>  	priv->cur_tx[q] += num_tx_desc;
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

