Return-Path: <linux-renesas-soc+bounces-10601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D565B9D2FB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 21:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B615CB2A50B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 20:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165FD1D61AF;
	Tue, 19 Nov 2024 20:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mq6syHF9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NV6Ire6I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACB21D54E7;
	Tue, 19 Nov 2024 20:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732048763; cv=none; b=cUh1GZgmR7hkKaAfH9pTjiiTxIKsRRdRAjYqzuXwq+tAglJCmPZOTN0+JDDFN+uRdBySrksqbt4dSlX+13YcEw+CtdqFjfzOfqjY/5g66rnMP72X9nTzO+/mbdeLUuuaxWyqmlQuTB8IrT4ZAqcgr6c6z6ZtnbFiTFy7Zoud0nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732048763; c=relaxed/simple;
	bh=I3EJilw1V+I3SliTWa57THh7EDEQhro06SJUzckDtsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEI1yCs5H7dXGApTJaygiKpbVnJVpq5fl+0WrxlEy0mpr0V3xnERVRkbWMZnEQusHKyTCgexzXBXXi6lfAXUQ1pqo2g6Wq/utJYDSEoMVT6Vsr8kVS2CdC91/GoIUnlIv373THxWaZc6MdQrUlU6gQNAieCY5VZh77V1iD721GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mq6syHF9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NV6Ire6I; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A5512114021D;
	Tue, 19 Nov 2024 15:39:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 19 Nov 2024 15:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732048759;
	 x=1732135159; bh=t8pRxtE5/ITErPKjZ8wNtIWZlnuceIzAZrf0pP0tMDU=; b=
	mq6syHF9D//PyhfC/pPcqGqtBZQZLMmr8hW6klSjRD/wXkmp+k67GrpJZGUpVvM7
	Y494WDA8oUQIsjN6536a/OCGYjOBMrUMIdJvnHVDANI7cW4980MrQohKNifPKAwN
	6K+lYr48FURBqqAMPgW1D1s4bpkVCy9B00T1PQ7Ts63ZdcnmTLz4GL+8E64g6S0f
	hQk/o46dYdI0NCP0yAr+Tghb7x4eY18Ludq/fKtMy7XDhotUrcyLi21DUup+AHyo
	dVoZidaydJ50yAavLkIvIEb4RiPeIlazQXiCEmlajSh9OKUBzyZ60Yi2Mvwz8Fvz
	S/R187IjqL+CZHPLp8ORWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1732048759; x=
	1732135159; bh=t8pRxtE5/ITErPKjZ8wNtIWZlnuceIzAZrf0pP0tMDU=; b=N
	V6Ire6I76sMFGW1/KIi87EKnPcHu833RafEq29MiVvyCWLqasz81srTmYpiq+FHF
	4BVGxIBn5FDIoz55BkvOIHu927JWqQsUB/+a4h2vw6R7/CAS85w2/JFUWrq6uEvD
	zFbi7TN0eQmz9rbnS6A2AESu08f58SySZD4WsibeY64DzRupz1NqR8JHOCLG//MB
	vXHn1ixCI+sm/37YD2d+lTPiIcP9X5ECpHHXMmurBO/gaV3w8T8K8HPgBF/ZQs+N
	kZ1Jkn7nE0Gu0hkvi2i2LBXIh/ZArEmX2abMiW/9BIOoTorD53HthL/36bMjPPvs
	i+JcBS6J/S1goEe6GmCtA==
X-ME-Sender: <xms:dvc8Z4-tiiSQm_RNQZCZsdbEfJn-4pn-fXkUTS5DKfYphQjlnQ9oPw>
    <xme:dvc8Zwt8xHBDa4uIlF0UPsL6LANpDNto45-S2jU4gsgeMTsVU2EyTOm7riyXtYQDQ
    rkwiVRPMML5l0szTQ8>
X-ME-Received: <xmr:dvc8Z-AKn2aitm1cJe2nS576EOEhhFqt_4AoMsJGOZ4ClRUUZ8mevNmU_7OQh_reUuThCuJevDUngLA4SXJ71O29suKucDGasw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfedvgddufeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedujedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoshgvnhhpsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhhurhhtsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheprghnughrvgif
    sehluhhnnhdrtghhpdhrtghpthhtohepohhlthgvrghnvhesghhmrghilhdrtghomhdprh
    gtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvggu
    uhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:dvc8Z4dN4CDV7wD_SwOwokrVDqNKTnwNVJTxZA1tUUkM3Ou077WDXw>
    <xmx:dvc8Z9MQ4EtC1387DiA06IFc45H75Us8oyLwrjqIwNeDAFJHqy-RZg>
    <xmx:dvc8ZylY75pvjm8GGTEA8fTYeRujTjntxcEW29wHmVpwHfsQWvaivQ>
    <xmx:dvc8Z_vwhkcR4MsiKLLgmE-LZKPagdewwgwcNotk37Bn3WncsNL7tQ>
    <xmx:d_c8Z-wwOHaxkZsi8BELPflMV_6mbeN6U-NJo5luebBj9YXhqNbl6mCV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Nov 2024 15:39:18 -0500 (EST)
Date: Tue, 19 Nov 2024 21:39:16 +0100
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
Message-ID: <20241119203916.GP5315@ragnatech.se>
References: <20241117212711.13612-1-rosenp@gmail.com>
 <20241117223850.GK5315@ragnatech.se>
 <CAKxU2N_VMSEo30u-C1VK4+jBSUBTo6QT1vgd14RQSS=P+g9w+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_VMSEo30u-C1VK4+jBSUBTo6QT1vgd14RQSS=P+g9w+w@mail.gmail.com>

On 2024-11-17 15:07:53 -0800, Rosen Penev wrote:
> On Sun, Nov 17, 2024 at 2:38 PM Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hello Rosen,
> >
> > Thanks for your work.
> >
> > On 2024-11-17 13:27:11 -0800, Rosen Penev wrote:
> >
> > > diff --git a/drivers/net/ethernet/renesas/rtsn.c
> > > b/drivers/net/ethernet/renesas/rtsn.c
> > > index 6b3f7fca8d15..bfe08facc707 100644
> > > --- a/drivers/net/ethernet/renesas/rtsn.c
> > > +++ b/drivers/net/ethernet/renesas/rtsn.c
> > > @@ -1297,14 +1297,8 @@ static int rtsn_probe(struct platform_device *pdev)
> > >       ndev->netdev_ops = &rtsn_netdev_ops;
> > >       ndev->ethtool_ops = &rtsn_ethtool_ops;
> > >
> > > -     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
> > > -     if (!res) {
> > > -             dev_err(&pdev->dev, "Can't find gptp resource\n");
> > > -             ret = -EINVAL;
> > > -             goto error_free;
> > > -     }
> > > -
> > > -     priv->ptp_priv->addr = devm_ioremap_resource(&pdev->dev, res);
> > > +     priv->ptp_priv->addr =
> > > +             devm_platform_ioremap_resource_byname(pdev, "gptp");
> > >       if (IS_ERR(priv->ptp_priv->addr)) {
> > >               ret = PTR_ERR(priv->ptp_priv->addr);
> > >               goto error_free;
> >
> > You have a similar construct using platform_get_resource_byname() a few
> > lines above this one. Please convert both uses, or none, mixing them is
> > just confusing IMHO.
> that cannot be converted.
> 
> devm_platform_ioremap_resource_byname has no res parameter, which is a
> problem as there's this lovely line below it.
> 
> ndev->base_addr = res->start;

I see, maybe we can refactor that too? I see not all drivers set 
base_addr, and some even set it to the remapped memory returned by 
devm_platform_ioremap_resource_byname() or such.

The documentation for this field is not crystal clear for me and it is 
marked with a FIXME in the definition.

struct net_device {

	...

	/*
	 *	I/O specific fields
	 *	FIXME: Merge these and struct ifmap into one
	 */
	unsigned long		mem_end;
	unsigned long		mem_start;
	unsigned long		base_addr;

	...

> >
> > --
> > Kind Regards,
> > Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund

