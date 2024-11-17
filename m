Return-Path: <linux-renesas-soc+bounces-10561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7E9D06B2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 23:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21DE5281F4B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 22:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73011DC19A;
	Sun, 17 Nov 2024 22:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="d7kp6BQH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mnbU/buw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A5E144D1A;
	Sun, 17 Nov 2024 22:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731883137; cv=none; b=tMrZ7T3S9GHdEWoPnSVzGTVPC4t04qBMO0StIG/AKN4pMLuze28hLlzkNZblyKO9lfJFOgTG6KIGJ0dhf+nvFoYdZ1o0xqvgjKurcumXVpg+rKjJUTlq7W3T5dU1QujFw/8WDNZ2zpXbvbcsB2WcsINmMqgDAmMgQ8SJZ7EIKis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731883137; c=relaxed/simple;
	bh=kcUhqc1H/sSqKzCIml06tsv1hCK1orZ6aFoj1a6W/Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgjozZkZti6u+7gZhiskUEsIFYDokoBz3sfedc8GATWkPma+700nZB5s263pewID3yAkKKBwFQmB8JnMCEfwB1Qi1xkJoP7gfX4yiZS4xxArt94jhPKu+MSvWEuxIoR0YX8wYRF8VHZQQftyT387Jb+mquYY/Egc6vt5BNAKoUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=d7kp6BQH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mnbU/buw; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F3A46114019E;
	Sun, 17 Nov 2024 17:38:53 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 17 Nov 2024 17:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1731883133;
	 x=1731969533; bh=TyZQ3oux8sXs5BpOMWkWK8bYbC++bbMBVEmXrfZoS3Q=; b=
	d7kp6BQHytP1h9Wp35KVSneMQe8evLLLOkjCYcZ9p/UZvRs3wS0jsmnvACxhnS9P
	kuTBVemnvrG+p1SRIybTuokCLK7ZiCA7y4Z/5rDwPPjlpctmxOJibbGCBQSFjViZ
	i6pezuzo8gHtc2eoJ0Rg0qrJ2WmFv4/hlnUB0x9cy8EqcC2NQxc3wE57nhK0RrCi
	n1WHqU08GvU7z4t5CIG4oz2CyHnNRf26ZeX57do3xsMitXHjevaBMDgwsAdm4QQQ
	mUOMewDydZS7cfx7thYr0FqRSznihaRjPK1acB1Qr+zZOf8JWOmMDoB4r/QhZAbD
	4IDH9mA60Y1OmNbNTx2lPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731883133; x=
	1731969533; bh=TyZQ3oux8sXs5BpOMWkWK8bYbC++bbMBVEmXrfZoS3Q=; b=m
	nbU/buwwYUrQAyx5S9Y7uuXXfhNb908OyP4OSZ0ui9lAbUpIzSgloO984WKrOZpS
	i8MTMQUztUCu0nesuRcyIqmp2VPxAWg4XfidJvrUZ3DgU2JdHGv8dSqIWNDdv4qR
	VZ0lW1flKA0RkoQvr6t+juwMEAUa41qNUu7rln76uDpXMIp0wiDImQK7eTJGzNzL
	UV/bSlKG80qwrdWxoVGIQDz6wyhzlxG44k9lICevx6yoZxv7agU97OnXdksUaTdc
	Vfs+yUo0XN4RSgZQQ1V3QD5PGooKiEcbeBA/6Vh1m3vb1kMH8t1v6wYXaeMP2ox6
	DRbYFkFh67Tu2qKdc6DYA==
X-ME-Sender: <xms:fXA6Z96BCF5uYknDq7mRGDIKHd991mX2eKgLCQQJCrb7zLx2kYUUzg>
    <xme:fXA6Z67b6jLmzDPUhLwwE8ep_ShVAW5psEdB4I14W_j2rUL0YbRGatjAOVPTG_xJX
    KGQv426Dkw6r039kds>
X-ME-Received: <xmr:fXA6Z0c1Jg8mZidDRcUEwDk5lAxp2RenM78Vkpoh0q5MAtWiYxVNRW2UsR18LpUI7xtnz0YEGqBA-yZ-PbvjVpntmbnrl4_q-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvdelgddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedt
    vddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepudejpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehrohhsvghnphesghhmrghilhdrtghomhdp
    rhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkuhhrtheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegrnhgurhgvfies
    lhhunhhnrdgthhdprhgtphhtthhopeholhhtvggrnhhvsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughu
    mhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:fXA6Z2Llebuj6Mu__Xn91mLXJlHF_1Ia91oHwnN3c5vx8QSXQpSO7Q>
    <xmx:fXA6ZxJ7mAUShv7861GzoKjOyMv88BDtZR2EkO4JCWWlvt4KGKkaXw>
    <xmx:fXA6Z_wu_fGarudwg0_BqSGgyVmFBb5JpzFJroGUnFnzu9T0_ASD3g>
    <xmx:fXA6Z9L68MvcmYZk6Cv8RXh_V5z1eU9cMr1IxjnNadVK7exp8tQldg>
    <xmx:fXA6Z-dNDxbuUacU3sy5A9HaBR5hB-c8fAgdPyXnSZZ5Dr1N_6w3_BhF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 Nov 2024 17:38:52 -0500 (EST)
Date: Sun, 17 Nov 2024 23:38:50 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Kurt Kanzenbach <kurt@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS ETHERNET SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv3 net-next] net: modernize ioremap in probe
Message-ID: <20241117223850.GK5315@ragnatech.se>
References: <20241117212711.13612-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241117212711.13612-1-rosenp@gmail.com>

Hello Rosen,

Thanks for your work.

On 2024-11-17 13:27:11 -0800, Rosen Penev wrote:

> diff --git a/drivers/net/ethernet/renesas/rtsn.c 
> b/drivers/net/ethernet/renesas/rtsn.c
> index 6b3f7fca8d15..bfe08facc707 100644
> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -1297,14 +1297,8 @@ static int rtsn_probe(struct platform_device *pdev)
>  	ndev->netdev_ops = &rtsn_netdev_ops;
>  	ndev->ethtool_ops = &rtsn_ethtool_ops;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
> -	if (!res) {
> -		dev_err(&pdev->dev, "Can't find gptp resource\n");
> -		ret = -EINVAL;
> -		goto error_free;
> -	}
> -
> -	priv->ptp_priv->addr = devm_ioremap_resource(&pdev->dev, res);
> +	priv->ptp_priv->addr =
> +		devm_platform_ioremap_resource_byname(pdev, "gptp");
>  	if (IS_ERR(priv->ptp_priv->addr)) {
>  		ret = PTR_ERR(priv->ptp_priv->addr);
>  		goto error_free;

You have a similar construct using platform_get_resource_byname() a few 
lines above this one. Please convert both uses, or none, mixing them is 
just confusing IMHO.

-- 
Kind Regards,
Niklas Söderlund

