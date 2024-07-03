Return-Path: <linux-renesas-soc+bounces-7016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACA79253BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 08:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B74D28A02C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 06:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0830513248E;
	Wed,  3 Jul 2024 06:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JEp4RvZn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KcV9nhrQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57874DA14;
	Wed,  3 Jul 2024 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988313; cv=none; b=O+4Tc0ih50DGjRBuk8eOAjbTCGHEaWL2Frs6mVqML8twp+in2aoSoQ4EbhFkfMkhsthnA5hiUpxiv2kTGUYKrh1m15mECPzKgo42FOQwOu8CNDPCCcaGsQTS81cA20mhLqQgDmptl2b5lgLo0+lvZR1ghnL6GTG75EcaUTz/dxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988313; c=relaxed/simple;
	bh=Wvra2Y+ajUjrepq1MTs6X1rMSM+t9KKrAJUWGcfpJV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chH/+h3c6N7F1BStl8BCH5F9dPb+szoHKv2OSp7hCo44uKEEe2auS0zxqqIKWJGjDXWZqHAYuDttRUVPOdHHw/zodKiUex9cBrpxCC0eqKKxJ51Q+va34IHOA8F9yrRUocfWcWAHWa5xJqbray0lEPj1zUZb29fA4J6whRNeGCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JEp4RvZn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KcV9nhrQ; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 5958C114024D;
	Wed,  3 Jul 2024 02:31:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 03 Jul 2024 02:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719988308;
	 x=1720074708; bh=hMbYP6DHP7kVg2SiP+j1vfWk4sRe9Q8bZVHKepSO0js=; b=
	JEp4RvZnrBYPmV6PdkdGaozbB4fNb/AAddtZuvzWqmgtuN/Yb4POF3A7ocOemtlf
	nyScoghR+yxXdCb3ppTWYEjF3NhVxKN0ttQvKSOPyzB/MpNmDCLC5VyqlsAqrspl
	qtk4YAu12aui6Y/lK9y7B9yaQX+lEhYqu/Tm5GAt/rGem52ZCXQFGB4G10erz+gP
	G/zS6jfPbQdCjvuKfEGb2KoVMXGjXjMDnblQhjdztBGAanoixQexdsJrUL4DlGer
	j1Uh880amcmaq/0aw/cjYU+7vmBt2a1EHC/VG2xWlSfPopcgMGYkcaN1jXklVHXB
	9PpegYqRJl1eAOHRz+dURA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719988308; x=
	1720074708; bh=hMbYP6DHP7kVg2SiP+j1vfWk4sRe9Q8bZVHKepSO0js=; b=K
	cV9nhrQtMYi9J0MiFDoysheMIXndiybNjc7wDCx6+DwWOItXY8OefRyIWDk21yJv
	t9lq2KvIa5Tb/eHlVsE5ucpvW4VvPygsIzhmjT7n4aiw11OVTiWLGjb8vQ5QYrk2
	TcHPVGJNIFmsyx0ElcgBH8JBM32R7q/8MsO2FiKICwq5oyAjmkAJNVMVsHY1F2YN
	jWJG+lCr+LrE85/wlaXSfm8Hklvqf8ql5qjhjmswfd4nJ8RkJYRSCMv9VCW12TJZ
	tT4udcuFtdNMCNWZd6T+yT/0VwBtwyOZsDRah4EvQUQ/giQi2xCnA7EbYYRqGDQ/
	4NYq0Khz57CUVjVLjX3xg==
X-ME-Sender: <xms:U_CEZsA7NN7oEpzGfplZW5ca8qOR1Iw97RmNCNmGf6D0UvnMCQgsSQ>
    <xme:U_CEZugM4mZTa1qv4Hm5DH6WBRiueF0xGV_DX_V6oJoyzwrcVjIMs82IvX4f92XJZ
    671BjJGKWVuhAWbY5I>
X-ME-Received: <xmr:U_CEZvlGGPOd_jZuwio06YRjxOl1yU3uqzI9ytrIWJXtMw-zIRmkj8BWQMtHHgzySDr6WGLFhttyxycWeH5eax6pafRjkaU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeigddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:U_CEZixaifF8Vb76VzVkCR5AWlPohxCg1dyPyunDQXEyl7Tl2Ukv0w>
    <xmx:U_CEZhSxUsPuH9zRx-up78qOqO77pl41afsFoAeMHayd3cvVQM5beQ>
    <xmx:U_CEZtb5o4zdfl-pnx335ZkfPXzE5_jhEFjTMluNnw59agV_MG-0Ig>
    <xmx:U_CEZqQ1LYzIexl7fe-lKQP8zvD_DE-W2A2wIeALRmDAaXTf2oRUMA>
    <xmx:VPCEZsHfOqptC2d6l1cgeTAKMgcxDKRTz28PmhAd-TiPQvoa7-1PkBMl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 02:31:47 -0400 (EDT)
Date: Wed, 3 Jul 2024 08:31:44 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Radu Rendec <rrendec@redhat.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] net: rswitch: Avoid use-after-free in rswitch_poll()
Message-ID: <20240703063144.GA3385125@ragnatech.se>
References: <20240702210838.2703228-1-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240702210838.2703228-1-rrendec@redhat.com>

Hi Radu,

On 2024-07-02 17:08:37 -0400, Radu Rendec wrote:
> The use-after-free is actually in rswitch_tx_free(), which is inlined in
> rswitch_poll(). Since `skb` and `gq->skbs[gq->dirty]` are in fact the
> same pointer, the skb is first freed using dev_kfree_skb_any(), then the
> value in skb->len is used to update the interface statistics.
> 
> Let's move around the instructions to use skb->len before the skb is
> freed.
> 
> This bug is trivial to reproduce using KFENCE. It will trigger a splat
> every few packets. A simple ARP request or ICMP echo request is enough.
> 
> Signed-off-by: Radu Rendec <rrendec@redhat.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/rswitch.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index dcab638c57fe8..24c90d8f5a442 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -871,13 +871,13 @@ static void rswitch_tx_free(struct net_device *ndev)
>  		dma_rmb();
>  		skb = gq->skbs[gq->dirty];
>  		if (skb) {
> +			rdev->ndev->stats.tx_packets++;
> +			rdev->ndev->stats.tx_bytes += skb->len;
>  			dma_unmap_single(ndev->dev.parent,
>  					 gq->unmap_addrs[gq->dirty],
>  					 skb->len, DMA_TO_DEVICE);
>  			dev_kfree_skb_any(gq->skbs[gq->dirty]);
>  			gq->skbs[gq->dirty] = NULL;
> -			rdev->ndev->stats.tx_packets++;
> -			rdev->ndev->stats.tx_bytes += skb->len;
>  		}
>  		desc->desc.die_dt = DT_EEMPTY;
>  	}
> -- 
> 2.45.2
> 

-- 
Kind Regards,
Niklas Söderlund

