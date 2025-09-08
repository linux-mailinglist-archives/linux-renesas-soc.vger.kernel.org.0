Return-Path: <linux-renesas-soc+bounces-21584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA4DB494FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 18:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E1903B2CAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 16:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E681430F80A;
	Mon,  8 Sep 2025 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZLYGhvrL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C706230F55E;
	Mon,  8 Sep 2025 16:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348321; cv=none; b=JfxPXp8CoG1CA+qDDs6W6+/ECqhs4H/7gjMOCtryD6Rr74a2yelbsk6UO76ckaNu3Mo6KUMPqg+Zt2H7A1AzZasOSCJgwHCf0XLnPrI4Pdd/eoFIKzeDussTJSs3no5TGDCr21PuIBv+9KqHvHJx6M0UoFB6bk2z7sOqeTrpm+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348321; c=relaxed/simple;
	bh=HjaSUkvFe9Zf1Jko2GILk8f9W1Z02HpzK2jNLOVrTfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUBIGcEpahvb42pz/jBdnPgbTzeBSyrdTxvkN7zX6UFAT84y0bQwzZldXYJkdjA2o+NU3/w+YsY7hIy3c+XlCQuQNgJ416XykPZsGjFbYz4lEurEBYDuigChORAXBY6c1/88D++3k3M/gH+341baKxcPPwpLnS1op/csgjRduvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZLYGhvrL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=EeR/8Ymk60ruReRK9ZfH2vJcsqf8z8v4x0XDb+bu+ZY=; b=ZL
	YGhvrL54zOR4/eRylD1TF6eHvOG6RjgZwEQP5I41LWjf0AyYcjlCnLh/1brxEjfO98J3E4hP7Qhwh
	o3Dhn4VhMoc53UfNVthkH75D3c0HM/sV0rJmim0SKrcE0UuSKz1ZEo0R9XvpjWw4nwXipkc8C7JeR
	emA6E3N9cNojAqU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uveZW-007gf8-Vg; Mon, 08 Sep 2025 18:18:26 +0200
Date: Mon, 8 Sep 2025 18:18:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] sh_eth: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <3952a6b6-6428-4c7b-9a3f-7ae9c8599077@lunn.ch>
References: <cover.1756998732.git.geert+renesas@glider.be>
 <ee4def57eb68dd2c32969c678ea916d2233636ed.1756998732.git.geert+renesas@glider.be>
 <082d5554-7dae-4ff4-bbbe-853268865025@lunn.ch>
 <CAMuHMdU96u41ESayKOa9Z+fy2EvLCbKSNg256N5XZMJMB+9W6A@mail.gmail.com>
 <c1f6fb82-9188-48ed-9763-712afa71c481@lunn.ch>
 <20250905184103.GA1887882@ragnatech.se>
 <CAMuHMdU=Q6AZcryj1ZBGW+5F+iYvZCL=Eg0yPw0B4jnczmA8nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU=Q6AZcryj1ZBGW+5F+iYvZCL=Eg0yPw0B4jnczmA8nw@mail.gmail.com>

On Mon, Sep 08, 2025 at 04:36:29PM +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Fri, 5 Sept 2025 at 20:41, Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> > On 2025-09-05 13:57:05 +0200, Andrew Lunn wrote:
> > > > You cannot enter system sleep without CONFIG_PM_SLEEP, so enabling
> > > > WoL would be pointless.
> > >
> > > Yet get_wol will return WoL can be used, and set_wol will allow you to
> > > configure it. It seems like EOPNOTSUPP would be better.
> >
> > Out of curiosity. Are you suggesting a compile time check/construct for
> > CONFIG_PM_SLEEP be added in the driver itself, or in ethtool_set_wol()
> > and ethtool_get_wol() in net/ethtool/ioctl.c to complement the
> >
> >     if (!dev->ethtool_ops->get_wol || !dev->ethtool_ops->set_wol)
> >         return -EOPNOTSUPP;
> >
> > checks already there? To always return EOPNOTSUPP if PM_SLEEP is not
> > selected?
> 
> Iff we want to go that route, I'd vote for handling it in common code.
> Still, there is no guarantee that WoL will actually work, as on
> some systems it may depend on the firmware, too.  E.g. on ARM
> systems with PSCI, the SoC may be powered down during s2ram, so
> there is no guarantee that any of the wake-up sources shown in
> /sys/kernel/debug/wakeup_sources can actually wake up the system.
> I tried having a mechanism to describe that in DT, but it was rejected.

WoL is a bit of a mess. Russell has done a little cleanup for when the
PHY does WoL, not the MAC.

I don't think we can check for PM_SLEEP in the core. There are some
PHYs which are powered by the standby voltage, so not effected by
power off. And their WoL output is connected directly to the PMIC. So
they have the ability to wake the system from off, not just suspend.

For the hardware you are dealing with, the MAC does WoL. You know it
cannot work without PM_SLEEP, so i think it needs to be the MAC which
returns EOPNOTSUP.

	Andrew

