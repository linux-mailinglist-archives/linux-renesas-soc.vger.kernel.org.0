Return-Path: <linux-renesas-soc+bounces-6104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 320EB905189
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 13:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48EF81C2119B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 11:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8B916E881;
	Wed, 12 Jun 2024 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Aq7Y21kW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FH+cfj8N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1CA1420B8;
	Wed, 12 Jun 2024 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718192736; cv=none; b=VHlLTch4L2IISHAAIn5KrS0yZvjnwS1BaqvPmDZ5CZq1cjG1bjQsysBnn9fSzSUXz+QTB19pByRIsKVXPXml1/gEE0mqZDIeHKuKx5i6VRE6aJkERUYFhlCSWsBBlFyWTcJk/kgDp6qs/c6xfK2MTXYCvs7FOjCoVyB5Ip2xfFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718192736; c=relaxed/simple;
	bh=oG2S4Kzid14rixJgh3ulnQ1e6vm+VNLJ3m0/vYw/4nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V36r6qUWJA/N+CSzbP3JSmYR1WX1wNRF2Y5UAQ4ehbqQk0AwPQ4kcWK3knwiFeqvTxhgN30LlkXmKw2GlnikEYwwdvfEIJ/0SEwAwnAILUdw06Kc3vHM3ek8YLVOgGNnfLTh0Og1LXxWf2bo4+cowjK2IvKi7j9q6PHIQaN9rAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Aq7Y21kW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FH+cfj8N; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id BFC981380117;
	Wed, 12 Jun 2024 07:45:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 07:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718192731;
	 x=1718279131; bh=sdail6Zp5HKLGsJ5PziERQkRfftw3aOCCiinAKseHl8=; b=
	Aq7Y21kWKNnSOkUDgsQ5DneuWjxJMnBPsB1/giEfaYMRjBL05k9Ax9AW+gVHMht6
	JlpfwgL8J3J+FEc4V6fffavcGueohzXFn0CyS+qRqx5OEQYjNGiF5vmNu0O5rxcm
	jmJp7RCFGkMqUhMnPtFHgjonUpHQl6aX3ATkPaLlENbUtlNKvV+2AUl2M1hqYN7x
	4Fd9le9zpS3yYTP4t8TgU6Ywlc7vtAqB3bFLmo7XXFDdIPPfaPsuqXRsQpux2PUa
	GF7wC175ETjL5qx+U0NBYHlEwl0s3B9rA8zJUwt3laaCCS5sO0pWhi5o84XVcRiB
	3d5l5IoUvMYukeOBzSKRuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718192731; x=
	1718279131; bh=sdail6Zp5HKLGsJ5PziERQkRfftw3aOCCiinAKseHl8=; b=F
	H+cfj8N/ewRh08AyNpxcyoi2D5PCLZnbOda9ZEONzZTUlc7QCiIJdwapKs94Oq0s
	7GiMcFd/uRIN3b6c3ScY6ov+OLiOrEUNCtFIT1PLlvM9L+E2Em8jUpmjWiLwP5p2
	9kTzU34WDR9ogw2sE3ARDRWnVl9rGQX76AX+idQAOykujkJqnD4IcePKljA8PjqW
	0tOfeRygkZUigunqQcVY9o8dh1YreBLFgzNMwtMyMR6/xgJJamvea709PEHX8n0K
	OD91kHihwwfBObs250FGfrHstOEvgLqq9dP0dHLAP3tV05mQBTCqDbEc6om0nE8n
	qcXmjT9XI+qFBEAxK1iCg==
X-ME-Sender: <xms:W4ppZrcGuLab4PUpzi-zS8i7QOpj6lSzee7zQ6DNC173B1wQSh7fSg>
    <xme:W4ppZhNiDU2f_18egBX5iuDcbfCtdgPAjhfcHVgLzgVeQWjvaWY2NKg_cyypBPkUp
    HrtuAF48P-lY3RiRTA>
X-ME-Received: <xmr:W4ppZkgstK-vaPA0dtplNc3TNkZq1M0nLPlcLlprqz1kzopKIrVkRPKL8pM54Om89cMfp_iDjp0mveyHSPVuFdudup9lTrs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:W4ppZs_2wjYnMVJJCRQEr5txDC-2IxWo5q0Fb97JBpgxUBQbkrVbgQ>
    <xmx:W4ppZnvU2L_bDuWN3RrHzxr5UvpS1Qc-jXbzndBATUknOSn58be-SQ>
    <xmx:W4ppZrGWg4p5MPJU5EK3MIVeDNPA5C73F2w6fA4ywx6-3HgoXKKfVg>
    <xmx:W4ppZuPAMw-hSDitqXEj5mAbAz1IfqBOQ40qRsMPoGgRhQakME8gbA>
    <xmx:W4ppZtC2Zk0D9qDqfxgdL2ImhFoYBLBYznwPZLflk_eNslDVqsN3g7ZV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 07:45:30 -0400 (EDT)
Date: Wed, 12 Jun 2024 13:45:26 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v6] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240612114526.GF382677@ragnatech.se>
References: <20240610135935.2519155-1-niklas.soderlund+renesas@ragnatech.se>
 <20240611195616.2e71c334@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240611195616.2e71c334@kernel.org>

Hi Jakub,

Thanks for your review.

I will address all comments. I had already posted a v7 of this prior to 
your comments addressing a silly build issue I failed to catch. I have 
mark v7 as change requested in patchwork.

I do have one question.

On 2024-06-11 19:56:16 -0700, Jakub Kicinski wrote:
> > +	netdev_info(ndev, "MAC address %pM\n", ndev->dev_addr);
> 
> That's fairly unusual, why print the MAC address to logs?

Renesas net drivers print the MAC address in probe,

* RAVB

    netdev_info(ndev, "Base address at %#x, %pM, IRQ %d.\n",
            (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);

* SH_ETH

    netdev_info(ndev, "Base address at 0x%x, %pM, IRQ %d.\n",
            (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);

* RENESAS_ETHER_SWITCH

    rswitch_for_each_enabled_port(priv, i) 
    	netdev_info(priv->rdev[i]->ndev, "MAC address %pM\n",
		priv->rdev[i]->ndev->dev_addr);

I have no strong opinion on if this is good or bad, but I do think they 
all shall behave the same. What do you think is the best way forward, 
keep this behavior in this new RTSN driver or remove the print from the 
old drivers?

-- 
Kind Regards,
Niklas Söderlund

