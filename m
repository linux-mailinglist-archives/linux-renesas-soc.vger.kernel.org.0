Return-Path: <linux-renesas-soc+bounces-5224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7FA8BFB68
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 12:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFBE528396D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 10:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6C481726;
	Wed,  8 May 2024 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DvUJDgk9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cu9Ug64G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC37C085;
	Wed,  8 May 2024 10:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715165920; cv=none; b=aZLIs7OneKRMgMmLku1k+g7ylULqDmqLR9tpVOxSNF4lekH3qBFezliDbhbbmOuudlGY/3HiCLxzyxOH+yoobXLC1lIKceJL+T2NdUsK+lonhCURAs/137J9QrCLiIoF1Fy3EW0+j9LcyIB5ANCZfmsbtgwtUiN8ym77EFHvfb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715165920; c=relaxed/simple;
	bh=idS1ES4Rzv7E1V5d77dhsTNNjZVbxur8PXU+daZsoIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJ0Fgd+OsX+e39+q18l6WYDYR9IH2DhN61/4vRYJG8YzrxWGwLIh6wtB8vLhWrv/GENaVo6NlKF27okOFW5osFCAa57ig0/h521jIzVEWI2kegSwNK2+04p47oGkW4RoFLzNkPP5uVGDSSy4C0Yc2W9zycsyI+XiquqGk38EDO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DvUJDgk9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cu9Ug64G; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 98866114022D;
	Wed,  8 May 2024 06:58:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 08 May 2024 06:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715165915;
	 x=1715252315; bh=SPo7QJbLZIacF052zts6mSMwRwP8f04PFXlVriUEmho=; b=
	DvUJDgk9wOk3oBqmpiW6KAc3/PV1D9c8kDKOy0YUGXC2vBNYV2iyIK5VYy1F6WLK
	/6iX4UFbi6XlzV0Kh9lt6rt3sMqDrTDQITB5FX/INUOOb3ddZfPclmv0nMXg90QO
	ZKdWmWlboAMjS4FfQ4iVSaYCuruq7uF+zdqhED/Dfeivp4nFMxxyU2g29+r1UbTy
	LXRM4bTYJMVF+Ei3RJGbuVnL99Q54/LWTOCA08ycgEinA82lFGdrKWKzA2c2nX51
	ua6CLQmg9ibtV4/WxbMUqjBBWtGaOrlDyL+BsQx0A2yZHcbU/BPc7ewCFLWrjFNt
	3aVEO4iURfTVQAOTJW8Zkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715165915; x=
	1715252315; bh=SPo7QJbLZIacF052zts6mSMwRwP8f04PFXlVriUEmho=; b=c
	u9Ug64GLHRH7lNvknJvPwRFNVRqSVSmS4zA0uFqrk3G5S8IIdddT6Uqj9vrYIyzE
	WzGU+BtGNBcQBF5jafCAh0Xv0UhDlETKZ6aaOZfxiz11mSieS1qpcExUbwREABe5
	YBsrOhO0TU8xWgjY1BVOSdz4U4Tj7VUVYjjtkEIWczN0qSR3IgmLAVdgpKuF6Kcp
	derFxEKwt8or0qgbIAGSi8rVSIuyPD7KoKdNe0wzbE6aW1+yp6/zPsrvUE56Fmvd
	zlulosSMJ4nivReJMDSQG0a5LWmkp8VAHzgc87iHfXkLGCTi/eBSBFvSN6Zggd2w
	L31zG2/Pi4azBPw3fLzMw==
X-ME-Sender: <xms:2lo7ZkJjR6GeOjO-NY8lGbJVD3_Pxsls3X5fhNRBCcsoMHQofWHM0w>
    <xme:2lo7ZkKrYNOUImb6NK4MbjUPJxAWyYH069A06_mjDdaTaig-3W1rahoWCUaiYKXEV
    1-mZfLz3voUVplIkE4>
X-ME-Received: <xmr:2lo7ZkuPPu7rk3ylfTQOMnBqs5pr7XWbbqss4rOWFaaF5imd4YqlVy-DT17T_alY9IJF_B9kfo7qvMhtTW9-407R9o3n_p4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:2lo7ZhbRZw3w0Gzxu9w115W0kGcB9hsUouCEGhdqHJ_dapRsItuUMQ>
    <xmx:2lo7ZraOmQtVzkh7GUUI2pomwhlYjp3fNlkgMTPrmy395BM4u9XnPA>
    <xmx:2lo7ZtDjR8srXY81IRufvMg4_xysizmyhCogNF8wWgbiWCKhIbD_ow>
    <xmx:2lo7ZhZxpvqvUYg2n3j-zFflRRl3LTwkyLvw_zhTCybqFdbi_ei74w>
    <xmx:21o7ZpPgq0B9uWKn_VbDaODWrDLs7loRHVEty0SWq-VSPTXpBwbuFl34>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 May 2024 06:58:34 -0400 (EDT)
Date: Wed, 8 May 2024 12:58:31 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240508105831.GB1385281@ragnatech.se>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <4970fd77-504c-4fb3-9c47-e4185d03e74a@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4970fd77-504c-4fb3-9c47-e4185d03e74a@lunn.ch>

On 2024-05-08 02:55:44 +0200, Andrew Lunn wrote:
> > +static int rtsn_probe(struct platform_device *pdev)
> > +{
> 
> 
> > +	pm_runtime_enable(&pdev->dev);
> > +	pm_runtime_get_sync(&pdev->dev);
> 
> 
> > +static int rtsn_remove(struct platform_device *pdev)
> > +{
> > +	struct rtsn_private *priv = platform_get_drvdata(pdev);
> > +
> > +	unregister_netdev(priv->ndev);
> > +	rtsn_mdio_free(priv);
> > +	rcar_gen4_ptp_unregister(priv->ptp_priv);
> > +	rtsn_change_mode(priv, OCR_OPC_DISABLE);
> > +	netif_napi_del(&priv->napi);
> > +
> > +	pm_runtime_put_sync(&pdev->dev);
> > +	pm_runtime_disable(&pdev->dev);
> 
> These appear to be the only two places you do any pm_ stuff. So it
> seems pointless. Maybe delete this for the moment, and come back later
> to add proper runtime power management?

I agree enable more PM stuff is a good candidate to follow initial 
entablement. But these pm_ calls are not pointless, I still need to deal 
with power. If I remove the pm_ calls things starts to fail. Maybe I can 
substitute the pm_ calls with something else, but I rather keep the pm_ 
stuff as adding suspend/resume support is high on the list of things to 
do. And reworking this now just to restore it later seems pointless as 
more PM is the way forward.

> 
>        Andrew

-- 
Kind Regards,
Niklas Söderlund

