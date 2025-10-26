Return-Path: <linux-renesas-soc+bounces-23613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C8C0B7CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 00:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D267334A358
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 23:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8102F83C4;
	Sun, 26 Oct 2025 23:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="S35jypQk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD52F7ACC;
	Sun, 26 Oct 2025 23:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761522539; cv=none; b=iX1Dndz0xKiFdvFtf5yy8JeHZFoIyCmWGHi/EeU+v93enryCVuJe/PrySq0fRBdxQy73dNqzb0Bl2eQ6cBgIJQ3OEZGBdu4VMhnc5Wz+QHSapi9yVOvAbhuSlEjWZUbgs2FwI1rkFNLNhD2V3h7dIvBJF8R+XFjYAmGb5LqGRN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761522539; c=relaxed/simple;
	bh=DQEM1/fsd9TQtViLf4p2BU4r6qsamM6AT5sqzM+muyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+VKER1WD/J9ldbvJnT5NDCpE6sKxASjPJMYY5VJ1oe7hByqrD1SzHHoVsJ6wZEfRtjVr3XL7JccPQBQQjqfiyj5tV8BVaRFhFxKTWRqyMYiyuBFjnKI+rwj2buVHhChXt73KqZ/q/F9hobeYGnCsBTQkX3VZh/bnKmafdzv1kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=S35jypQk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hJAmbdV3I7Dp/Y/zwukW1+3//y7tC+atyy9E8zU6ODk=; b=S35jypQk5R34TiIJzqZMrGpgpC
	O7JQBQMMi2w4xTbYLFVZkEY5+RZpU6G1syhNfIA7mPj8ufWP1sMkjfyN8Hf+r0x49GfjDfqo5jPmF
	hDMwkJcx1VZuGJfNh/1nBqFA7SwWtuxbQJCU2KPpNcqWlmCOFQHSbCI3fjPp9IvAIMss=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vDATY-00C8mV-JQ; Mon, 27 Oct 2025 00:48:40 +0100
Date: Mon, 27 Oct 2025 00:48:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: netdev@vger.kernel.org, Thanh Quan <thanh.quan.xn@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dan Murphy <dmurphy@ti.com>, Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net,PATCH] net: phy: dp83869: fix STRAP_OPMODE bitmask
Message-ID: <3b5e2a79-186e-4c92-9bef-51fdd34af351@lunn.ch>
References: <20251023224018.192899-1-marek.vasut+renesas@mailbox.org>
 <825c8662-831d-43e0-ba28-a1373f9d5a9d@lunn.ch>
 <168f8017-8da8-4ec0-878f-dae5b52d1994@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168f8017-8da8-4ec0-878f-dae5b52d1994@mailbox.org>

On Sat, Oct 25, 2025 at 05:09:17AM +0200, Marek Vasut wrote:
> On 10/24/25 2:24 AM, Andrew Lunn wrote:
> 
> Hello Andrew,
> 
> > On Fri, Oct 24, 2025 at 12:39:45AM +0200, Marek Vasut wrote:
> > > From: Thanh Quan <thanh.quan.xn@renesas.com>
> > > 
> > > According to the TI DP83869HM datasheet Revision D (June 2025), section
> > > 7.6.1.41 STRAP_STS Register, the STRAP_OPMODE bitmask is bit [11:9].
> > > Fix this.
> > 
> > It is a good idea to state in the commit message what the bad
> > behaviour is which the patch fixes. Somebody looking through the
> > patches can then decide if they need to cherry-pick the patch into
> > their dead vendor tree, etc.
> > 
> > Please add to the commit message what issue you where seeing which
> > made you create this patch.
> 
> In short, on the hardware I use, the interface to the PHY is SGMII, but the
> driver is confused into thinking it is RGMII based on the STRAP_STS register
> content, and misconfigures the PHY for RGMII.
> 
> I plan to extend the commit message this way. I tried to cover all the bases
> there, so people can decide whether the are affected or not. Is this
> understandable or is it maybe too much ?
> 
> "
> net: phy: dp83869: fix STRAP_OPMODE bitmask
> 
> According to the TI DP83869HM datasheet Revision D (June 2025), section
> 7.6.1.41 STRAP_STS Register, the STRAP_OPMODE bitmask is bit [11:9].
> Fix this.
> 
> In case the PHY is auto-detected via PHY ID registers, or not described
> in DT, or, in case the PHY is described in DT but the optional DT property
> "ti,op-mode" is not present, then the driver reads out the PHY functional
> mode (RGMII, SGMII, ...) from hardware straps.
> 
> Currently, all upstream users of this PHY specify both DT compatible string
> "ethernet-phy-id2000.a0f1" and ti,op-mode = <DP83869_RGMII_COPPER_ETHERNET>
> property, therefore it seems no upstream users are affected by this bug.
> 
> The driver currently interprets bits [2:0] of STRAP_STS register as PHY
> functional mode. Those bits are controlled by ANEG_DIS, ANEGSEL_0 straps
> and an always-zero reserved bit. Systems that use RGMII-to-Copper functional
> mode are unlikely to disable auto-negotiation via ANEG_DIS strap, or change
> auto-negotiation behavior via ANEGSEL_0 strap. Therefore, even with this bug
> in place, the STRAP_STS register content is likely going to be interpreted
> by the driver as RGMII-to-Copper mode.
> 
> However, for a system with PHY functional mode strapping set to other mode
> than RGMII-to-Copper, the driver is likely to misinterpret the strapping
> as RGMII-to-Copper and misconfigure the PHY.
> 
> For example, on a system with SGMII-to-Copper strapping, the STRAP_STS
> register reads as 0x0c20, but the PHY ends up being configured for
> incompatible RGMII-to-Copper mode.
> "

This is good. It nice to have lots of details, cause and effect, even
if its a silly topo bug.

Please add my Reviewed-by to the next version.

   Andrew

