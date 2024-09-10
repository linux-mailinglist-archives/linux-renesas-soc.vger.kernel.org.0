Return-Path: <linux-renesas-soc+bounces-8897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6831973D61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 18:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EC2BB2665F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 16:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8ED1A0729;
	Tue, 10 Sep 2024 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="k8yxs3ux"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4D1A00F4;
	Tue, 10 Sep 2024 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725985954; cv=none; b=S803274y8lizEt6a/uO3juncjLeqadwLuvRikXs8OSoOOguVMix7+//GJ36ro4FyMYlVPzmnS95mkeGTEAP8GeYct4cROCnvqZc2o3yDDSW9aP3uR4wp5jdF504sEehy+g/5KT7YnWmBBBpJ1BtYwn3lEL+Ujy2iiJbNz5B1omI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725985954; c=relaxed/simple;
	bh=wZJxvli6xkBo565gzmkeDC+luJEfvIDAFnW8fzt75k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbrEqByDLx5B35ZKoFrTMcEGEmUE0TB3+DY/4U/6bKQFid6WzHCp1ihLn0Y3MyJ0u0BpXrbNhBldWymxU/W2tRttXvitjWTlU9ftqmgSKaC67LnpwE4qt607zf5yus5a2QZ+egC8WEQQE7LnNeoJyTPMqwBdaxVsKyU/xuRusZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=k8yxs3ux; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=SmlzTZbd8ekrNP0FYd766dwtBomh66QlX4qmvlM4FZs=; b=k8
	yxs3uxXIdm3h/7P5qClb+5Y0IFLnq7kJN+tr/v8aq7P4WmBUBNT64ab71KZl/etAVcH9s209FcsQT
	EDHm4PnIIJAb6y1nY/gUbvl3iF6mv9tLIRBKyZ0Tum9k+Yiu4E0W2aWwqb+po3IFlIG3lEA5MvcVa
	QZFG11+sA1Pb1Ig=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1so3mt-0077rj-OF; Tue, 10 Sep 2024 18:32:19 +0200
Date: Tue, 10 Sep 2024 18:32:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Stefan Eichenberger <eichest@gmail.com>
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
Message-ID: <f18ef2e8-f3ac-43df-95d4-96cea73e72d4@lunn.ch>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <c334205e-6289-48da-b0c7-7ba82c6d2709@lunn.ch>
 <20240906213923.GZ3708622@fsdn.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906213923.GZ3708622@fsdn.se>

On Fri, Sep 06, 2024 at 11:39:23PM +0200, Niklas Söderlund wrote:
> On 2024-09-06 22:36:49 +0200, Andrew Lunn wrote:
> > On Fri, Sep 06, 2024 at 03:39:51PM +0200, Niklas Söderlund wrote:
> > > The initial marvell-88q2xxx driver only supported the Marvell 88Q2110
> > > PHY without auto negotiation support. The reason documented states that
> > > the provided initialization sequence did not to work. Now a method to
> > > enable auto negotiation have been found by comparing the initialization
> > > of other supported devices and an out-of-tree PHY driver.
> > > 
> > > Perform the minimal needed initialization of the PHY to get auto
> > > negotiation working and remove the limitation that disables the auto
> > > negotiation feature for the mv88q2110 device.
> > > 
> > > With this change a 1000Mbps full duplex link is able to be negotiated
> > > between two mv88q2110 and the link works perfectly. The other side also
> > > reflects the manually configure settings of the master device.
> > > 
> > >     # ethtool eth0
> > >     Settings for eth0:
> > >             Supported ports: [  ]
> > >             Supported link modes:   100baseT1/Full
> > >                                     1000baseT1/Full
> > >             Supported pause frame use: Symmetric Receive-only
> > >             Supports auto-negotiation: Yes
> > 
> > My understanding is that most automotive applications using T1 don't
> > actually want auto-neg, because it is slow. Given the static use case,
> > everything can be statically configured.
> > 
> > Is there a danger this change is going to cause regressions? There are
> > users who are happy for it to use 100BaseT1 without negotiation, and
> > the link partner is not offering any sort of negotiation. But with
> > this change, autoneg is now the default, and the link fails to come
> > up?
> 
> I'm not sure how the generic use-case looks like. All I can say all 
> other devices supported by this driver support autoneg by default and 
> the initial commit adds some of the autoneg features but disables it 
> with a comment that they could not get it to work.

I'm just worried about reports of regressions. It could be you are
currently the only user of this driver, and you obviously don't care
about the change in behaviour, and can change the configuration of the
other end so that it also does autoneg.

But then again, Stefan Eichenberger <eichest@gmail.com> added this
driver. Does autoneg by default, not forced, cause problems for his
systems?

Stefan?

	Andrew

