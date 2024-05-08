Return-Path: <linux-renesas-soc+bounces-5231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF88BFDD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 14:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28DD61F2273A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 12:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AD159158;
	Wed,  8 May 2024 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ImavNCcA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b/0JDle+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895515787B;
	Wed,  8 May 2024 12:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715172966; cv=none; b=husZSAJmGgI0jyXb1O3Dbcz1409tcoEoRimzEcTuEiFHkoWDy8o9SEI4MSXff1K/Uo0jB7J3nISbgy+fip83kpK703UWXV9Hn8fIpYdNGhAGgn27CUrrhagL0P65Kfpi/wKi27iC/FZL0jXksjihZ6QAIUXn3Yme8OW2uabkUIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715172966; c=relaxed/simple;
	bh=w4yR9gdASJwyKjyCdLixIM0fJqpS1fqLpRWzO7TtIeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SincjTixgTYHXyG50uULNDUiXLnbQtmpONH4OPIiarGu6ftBOqtL+DNOmB0Ub8WrUvgiiCPb/MUiRsSML4Iv4J+1q/sg128x4SvgcjLgDEcVaAwkYtArJw8PJS+m9cdAaWbHJ6EgeujNzAQAaBawhwoU5cwKYLEsHMZsrzgnakM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ImavNCcA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b/0JDle+; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 1288A18001F0;
	Wed,  8 May 2024 08:56:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 08 May 2024 08:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715172960;
	 x=1715259360; bh=sXyc4nCsmkhlgO4voM/zoRX4m0lYfRHhZGXup9GE38A=; b=
	ImavNCcAbpAyNe7pZj/bXlpeTzuuvQh/6DtuxbMt9dm/gDGBrfFqaKt8HhM6GDup
	OGMwQSGRJoh7fuTF2meV6i8Ty8UUi5z4LfFV1RKuCJXrDsVHLQCbWEVfYxSzES1n
	IPTTVa0XMeUwysCpQPvbISG/UZStVKBxMxAzlT/+7uKXDZ1Lx/im3QivJM2PKM4n
	WR5veEXDpuYao4URuD43UumlNxjqZu8dRxuMl2UVaA+YR0zpI2MUiCyzZnaAHXha
	fg6DKH5kg3Q3umBZFBdD4JweHXikBKAIa+WhWDqm3DIkNZ/bfRZalnhSnAUIoNZb
	pLhPQJP9nNqMZ99vS1Jnrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715172960; x=
	1715259360; bh=sXyc4nCsmkhlgO4voM/zoRX4m0lYfRHhZGXup9GE38A=; b=b
	/0JDle+HiYlU9SKJfUxfbKyZjsdDzPFXDjMvedDWIMccLKtra1LJmUTctfy0UVdv
	yEJz8yVfkdCEpCfLH7tK/+INjBt8lhQ40HH48mhL6qAVkZOc20Du3kCRcxh5SMHD
	WSlNHuSKKBvu8NhnNLmouwrSmnNDVh6mN/p4jiAlr2eS/8Nnxl0UaHxKXE2y2di+
	M+l2ZkFA2JE/PPHcDKE3f9WxrUYgUkdzdS7Vgo25ofQ5yGL0Wr9L9dvt19TbgC3p
	1XIZvxtBP6IJdyhM8ZYFsn6DaGGsoyD3LD47pUzD4jP7BX9K9dA+tc03fqdWve3x
	ap0Yn6QlwGbuZ+ihEfv3g==
X-ME-Sender: <xms:YHY7Zv5yP-x5yL5vUgiOCxOaje2-m55qno90K6pkNJBfZw3nIgsm6g>
    <xme:YHY7Zk5GcibYAFrEpQ51eHUlslsfsk4Z0LulYVcQLstcxgjOJcTCppV4_e41VAxaV
    1A3hhU4LjI-U5TCt3U>
X-ME-Received: <xmr:YHY7ZmdbGnXTzMZQ8QhY2dgbiuj7eQumZbE7w4LlUp9fYD3Ksn82VfGm7ts7_cAjGEFeyF0OxAW4qrJDrX3sSSB7hEUfDxo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:YHY7ZgLhLmQAEBP-brVHBgv_IhdLdx2-8GTqTSaeZZJyk2HQ5s8gwA>
    <xmx:YHY7ZjJeOSzZkTr6Qu0ArYSAGv7IZ8bAjw5PUcpMcgzsJYtolNj84w>
    <xmx:YHY7ZpyjDBKlRJCJCwX4troxYyzVSEwlj-2Gbqi-z7fViBROOIm3lA>
    <xmx:YHY7ZvJizZgtcA6O1Bx07DvblQN4RpMDo-_8xMHEEHuZZs0pjDi4pA>
    <xmx:YHY7Zq_rwjI32Gn16p_qf808eyJyIc484eplQ_IAq8NkT_KYPKFxt2E9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 May 2024 08:55:59 -0400 (EDT)
Date: Wed, 8 May 2024 14:55:57 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240508125557.GG1385281@ragnatech.se>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <4970fd77-504c-4fb3-9c47-e4185d03e74a@lunn.ch>
 <20240508105831.GB1385281@ragnatech.se>
 <ba35173c-eaba-4f13-a2ed-011f6f7a48d1@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba35173c-eaba-4f13-a2ed-011f6f7a48d1@lunn.ch>

On 2024-05-08 14:33:24 +0200, Andrew Lunn wrote:
> On Wed, May 08, 2024 at 12:58:31PM +0200, Niklas Söderlund wrote:
> > On 2024-05-08 02:55:44 +0200, Andrew Lunn wrote:
> > > > +static int rtsn_probe(struct platform_device *pdev)
> > > > +{
> > > 
> > > 
> > > > +	pm_runtime_enable(&pdev->dev);
> > > > +	pm_runtime_get_sync(&pdev->dev);
> > > 
> > > 
> > > > +static int rtsn_remove(struct platform_device *pdev)
> > > > +{
> > > > +	struct rtsn_private *priv = platform_get_drvdata(pdev);
> > > > +
> > > > +	unregister_netdev(priv->ndev);
> > > > +	rtsn_mdio_free(priv);
> > > > +	rcar_gen4_ptp_unregister(priv->ptp_priv);
> > > > +	rtsn_change_mode(priv, OCR_OPC_DISABLE);
> > > > +	netif_napi_del(&priv->napi);
> > > > +
> > > > +	pm_runtime_put_sync(&pdev->dev);
> > > > +	pm_runtime_disable(&pdev->dev);
> > > 
> > > These appear to be the only two places you do any pm_ stuff. So it
> > > seems pointless. Maybe delete this for the moment, and come back later
> > > to add proper runtime power management?
> > 
> > I agree enable more PM stuff is a good candidate to follow initial 
> > entablement. But these pm_ calls are not pointless, I still need to deal 
> > with power. If I remove the pm_ calls things starts to fail.
> 
> That is odd. Why does it fail? What is turning the power off? Did i
> miss you registering some callbacks?

I agree it's odd and I will try to find out.

If I remove all pm_ calls and the include of pm_runtime.h register reads 
from the device do no longer works, so operating the device fails. Even 
if I dig out the root cause for this, is there any harm in keeping the 
pm_ operations in the initial entablement?

> 
>      Andrew

-- 
Kind Regards,
Niklas Söderlund

