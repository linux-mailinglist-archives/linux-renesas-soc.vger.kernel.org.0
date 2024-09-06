Return-Path: <linux-renesas-soc+bounces-8834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14096FCD3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 22:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6ACCB27B50
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 20:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E391D79A1;
	Fri,  6 Sep 2024 20:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DfJgY94q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5425C13C3F2;
	Fri,  6 Sep 2024 20:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725655023; cv=none; b=R0+PgGKgDICVWvkMSA8MnUc9NBT/bRPLiZp7ilvi4zzjxRzUkIZEqNmulrQOJ/6vJ772ZUnvhYqlAcorDuoCqfg7OrGll9WhQvzappA5t6ZErLtyGvHLSGjYwODfceOoB0APYdhTHAMbHGTSZjNEq0gt0xinfHok1U6wKf3woyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725655023; c=relaxed/simple;
	bh=t8YNNTqYRRbmcQdAG5OK5iWCGtztKg26juRhi71GzM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIa36mV6u86MZOace4XeDy+QbtPXAOfIlCfYtzQL5ajYzKBZZ7SLsav3RFF48ePendxrmUUo7K5APRcReTY7O7K5KXohvmWsmgAqApOmUn8ZtljTAQOJr1FfJ1FgjjrMw9C5lNwqIt+3vJgn7B/P9eD/kgvXS+L/uXkc8qmCPU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DfJgY94q; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=Tp21UrDua1a3GT+yOVfFg1PUUg94Nlf+7saY6rn/Y4g=; b=Df
	JgY94qgqcOb2CJdTdoTgx0aq8k0S7OLZoGWPTkEybA4YM2bdoCd6BoH3PuZeYeDhaI1gPHm6jL68m
	tGjIy9+LvB6qOjab9O6rv094swY9yp87rJMTDW+WdRBHucUo+TwC63KmFG/AqdZvNmN82jGN20wVt
	m8XxfHJbpPzH6ac=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1smfhJ-006rEu-CH; Fri, 06 Sep 2024 22:36:49 +0200
Date: Fri, 6 Sep 2024 22:36:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto
 negotiation for mv88q2110
Message-ID: <c334205e-6289-48da-b0c7-7ba82c6d2709@lunn.ch>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>

On Fri, Sep 06, 2024 at 03:39:51PM +0200, Niklas Söderlund wrote:
> The initial marvell-88q2xxx driver only supported the Marvell 88Q2110
> PHY without auto negotiation support. The reason documented states that
> the provided initialization sequence did not to work. Now a method to
> enable auto negotiation have been found by comparing the initialization
> of other supported devices and an out-of-tree PHY driver.
> 
> Perform the minimal needed initialization of the PHY to get auto
> negotiation working and remove the limitation that disables the auto
> negotiation feature for the mv88q2110 device.
> 
> With this change a 1000Mbps full duplex link is able to be negotiated
> between two mv88q2110 and the link works perfectly. The other side also
> reflects the manually configure settings of the master device.
> 
>     # ethtool eth0
>     Settings for eth0:
>             Supported ports: [  ]
>             Supported link modes:   100baseT1/Full
>                                     1000baseT1/Full
>             Supported pause frame use: Symmetric Receive-only
>             Supports auto-negotiation: Yes

My understanding is that most automotive applications using T1 don't
actually want auto-neg, because it is slow. Given the static use case,
everything can be statically configured.

Is there a danger this change is going to cause regressions? There are
users who are happy for it to use 100BaseT1 without negotiation, and
the link partner is not offering any sort of negotiation. But with
this change, autoneg is now the default, and the link fails to come
up?

To me, this actually seems like a generic problem for automotive. We
want to indicate the device does support autoneg, but we don't want it
on by default? I don't know if we can express that at the moment?

	Andrew

