Return-Path: <linux-renesas-soc+bounces-24325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A06DC400F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 14:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 617FC4E8501
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 13:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2DC2D4805;
	Fri,  7 Nov 2025 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="GRgpHqSV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D8290D81;
	Fri,  7 Nov 2025 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762521280; cv=none; b=dhDko4xyTpC3p8A/4OQfq3N0pgxppdSGVvb9NuHzGehm4UUyf3z2VqzbLRgvXm5LJhNxyF0UEQlHpvLilNU9Akaq6Z17l8QIWwiMeA7FZYPZLIRXqJZz2p64SzPYKJEjlsK4jsFZKIo6nl/EV6D1Gm3/7YaHNhI059pa1jXfYtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762521280; c=relaxed/simple;
	bh=TP2jmT2RpugQ2S0KiJtUP705KeCOHsguj5RaLKyYm8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2wkUBYlJTaYSjgBqUkMoEUuK8UUQC/dwXdrIlmyzqoM6hynWtthhM02GnfjCv1HbzvY8XHqh3eZCjlixzgpgU743aJBAyxC6lqYi5wIdue17B4CXx2ifrWOQUPTTsbsNZu2MxkA9p3rY4YsVBrOKqM+bS+0cuPpu9eEuVtaJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=GRgpHqSV; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uL3/14aUyri5EUeLDBCTF+oCd5vtc1g9i23NSwdUYFY=; b=GRgpHqSV1mMywlq/Z65HWV+tkB
	TjlCSEpMC6DuheWw9lwrwt+N//+aR0fEpi8P1zk3/ZpyAYOdf4NN/T7LT0DD8Km6K7+tEVP681/h6
	AO/+RyzDtG2UULAfwmChgxaqw/dacXJvYidLqgHw39c3CsFJExWyGVOy0dtdpXeG20tU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHMIF-00DE9j-AA; Fri, 07 Nov 2025 14:14:19 +0100
Date: Fri, 7 Nov 2025 14:14:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next] net: phy: mscc: Add support for PHY LEDs on
 VSC8541
Message-ID: <2dabb0d5-f28f-4fdc-abeb-54119ab1f2cf@lunn.ch>
References: <20251106200309.1096131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ee6a79ae-4857-44e4-b8e9-29cdd80d828f@lunn.ch>
 <CA+V-a8vFEHr+3yR7=JAki3YDe==dAUv3m4PrD-nWhVg8hXgJcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8vFEHr+3yR7=JAki3YDe==dAUv3m4PrD-nWhVg8hXgJcQ@mail.gmail.com>

> > > @@ -2343,6 +2532,26 @@ static int vsc85xx_probe(struct phy_device *phydev)
> > >       if (!vsc8531->stats)
> > >               return -ENOMEM;
> > >
> > > +     phy_id = phydev->drv->phy_id & phydev->drv->phy_id_mask;
> > > +     if (phy_id == PHY_ID_VSC8541) {
> >
> > The VSC8541 has its own probe function, vsc8514_probe(). Why is this
> > needed?
> >
> vsc85xx_probe() is used for other PHYs along with VSC8541 hence this
> check, vsc8514_probe() is for 8514 PHY.

Ah, sorry. I was looking at 8514, not 8541. So yes, this is needed.

However, i think all the current probe functions could do with some
cleanup. There is a lot of repeated code. That could all be moved into
a vsc85xx_probe_common(), and then a vsc8514_probe() added, which uses
this common function to do most of the work, and then handles LEDs.

Also, is the LED handling you are adding here specific to the 8541? If
you look at the datasheets for the other devices, are any the same?

	Andrew

