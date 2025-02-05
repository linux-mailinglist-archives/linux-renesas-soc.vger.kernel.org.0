Return-Path: <linux-renesas-soc+bounces-12882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1452A29A0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 20:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43841889D69
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 19:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997CE1FF5FF;
	Wed,  5 Feb 2025 19:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Vlm5sa+I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F53A38F82;
	Wed,  5 Feb 2025 19:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783688; cv=none; b=vEOf3jKIWi2qbesxWoIsW/n2d2MdibCz5yRBaYWsa8T8O6z7EgvSabYmBTVt6W0inOaou2Sn6NcymwP50fhYromwZq2OCKoMbGe1vvTKmf/NuZczOxlfBI0OCa1xuDsJyU5KPDkqe4uXUSfmnQkm4K9DjrDtP7wUGPbVMLFvRr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783688; c=relaxed/simple;
	bh=ARv2kuv1WdLz5e6A/Zs92BFETgS2nRXbUiLMxJQ9p/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMnOPBxR9UX5mG2xNc1y6PcPVSalltZkvVN8ImyoJoSgB+GdiKCyD7uqBRCcSKmo05kEnV9ybUx5digln0INtI62utvFQoLM3X8dkb1g7OpFCo02b1/Nwb7jzCpuqMEKJtYt2r5jaW1I3NZjwAl4/5Iv8c3mvFrC3/SS5was2vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Vlm5sa+I; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L3089WJW54oVnmL9DxNrP2/r2oAqezCtpZFJmUTCoXo=; b=Vlm5sa+IRgtWN1um3nZQpuqgGq
	Ru+1jE5uLzZLOexroAUspi/rI0APosvBFJVxKMLT0kiCiZMHm4hRwN9BD6XtdzyUffu2xmoWSOF84
	ZYZbnJjy77vMB8uukujoiR8t/Zg2Sf9A6wT+niK986Al/4RMJBF347GQ6t3OFdt/3kvU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tfl40-00BHgf-K9; Wed, 05 Feb 2025 20:27:56 +0100
Date: Wed, 5 Feb 2025 20:27:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>
Subject: Re: [PATCH net-next] net: renesas: rswitch: cleanup max_speed setting
Message-ID: <8ffa6442-2a3d-4903-84fc-e3f9b8bdd94f@lunn.ch>
References: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>
 <59bc0c2b-0ece-427e-80c5-5b6920132989@lunn.ch>
 <af3fb019-48fa-42e0-9e02-a4b0d3a724bc@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3fb019-48fa-42e0-9e02-a4b0d3a724bc@cogentembedded.com>

On Wed, Feb 05, 2025 at 05:26:09PM +0100, Nikita Yushchenko wrote:
> > You should only need max-speed when you have a PHY which can do more
> > than the MAC.
> 
> This is exactly the case.

O.K. Please expand the commit message to explain this.

> Unfortunately I don't have the spider schematics nearby, but AFAIU (one of
> flavours of) the board has PHYs capable of 5G but connected over SGMII.
> When two such boards are connected to each other, on mainline kernel
> auto-negotiation takes noticeably longer than with the Renesas BSP kernel.

I'm actually curious how it established a link at all. If both PHYs
are advertising 5G, they should be happy on the media side. They will
get link. But they will ask the MAC to swap to 5000BaseX or similar. I
assume the MAC cannot do that, but what does it do? How does the PHY
know it should try something slower?

> > Also, phylink handles this a lot better than phylib. So you might want
> > to change rswitch to phylink, especially if you have link speeds > 1G.
> 
> The reverse switch happened in commit c16a5033f77b ("net: renesas: rswitch: Convert to phy_device").
> I did not check the tech details of that, but decided not to touch it.

Might be worth taking another look, especially if anybody wants to use
SFPs.

	Andrew

