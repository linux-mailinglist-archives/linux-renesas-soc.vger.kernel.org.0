Return-Path: <linux-renesas-soc+bounces-24607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB6C5A449
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 23:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C7933A65EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 21:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C86320A38;
	Thu, 13 Nov 2025 21:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="f25tQNVt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3DD2F5A05;
	Thu, 13 Nov 2025 21:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763071102; cv=none; b=b4udQdw04KuwyWLXNw9RKsXEEdvqu1U7rV6UyNZm6R4Uxhx0ewf0YhvCenNWr4ldDVqFpPww+pHnXr4tLJ4WxA92r3bVUdqqMqQGCKXmYrTSZRVdkbG0JRQth9G6kEGYFhVLtLeL7bSd3++/jcJHut5UUtwxfNMzVgpgCB2ut3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763071102; c=relaxed/simple;
	bh=u3RJTEuTMsu/Mh0lzU/eXO9euG6h1ckFdxYoSCZ8rNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taz5WQWwDmdf2BNE4aSHGNuVaIhVvHVQQsDKZof3m6cBSTpor4JF15QT6QkAMVGmDhaMRiKdv8Th0Z//XDH4XVNQp/fbBdwH2TCs7XqkJObtcQ5kpXFsi2Hf+BqH1C2g2rWUdyqBiqdd+qQVC8U8Yq54EkohUBWoW040jNGeDco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=f25tQNVt; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Qa18NJB1fJabOG9o5oBBmugYBETJSqlkvD8oDh6fndI=; b=f25tQNVtFX2MKpp463PhWDnU5K
	XefbmrMPqZwVTWuUsFxuhJE8F71oOZyaBvxwytjY9I3vpRa/rI8JMa9rW8EMiwGmD08QxLqEImeTy
	ZeamHA1hHPeIhjv7vW9Q7W5Ab6vpcntgXFZXEQkUXh+l885zw9KRgiCEa4BxfFGHiDX0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vJfKP-00DvH3-Gs; Thu, 13 Nov 2025 22:58:05 +0100
Date: Thu, 13 Nov 2025 22:58:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: pcs: renesas,rzn1-miic:
 Add renesas,miic-phylink-active-low property
Message-ID: <0d13ed33-cb0b-4cb0-8af3-b54c2ad7537b@lunn.ch>
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112201937.1336854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <de098757-2088-4b34-8a9a-407f9487991c@lunn.ch>
 <CA+V-a8vgJcJ+EsxSwQzQbprjqhxy-QS84=wE6co+D50wOOOweA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8vgJcJ+EsxSwQzQbprjqhxy-QS84=wE6co+D50wOOOweA@mail.gmail.com>

> Each of these IPs has its own link status pin as an input to the SoC:

> The above architecture is for the RZ/N1 SoC. For RZ/T2H SoC we dont
> have a SERCOS Controller. So in the case of RZ/T2H EVK the
> SWITCH_MII_LINK status pin is connected to the LED1 of VSC8541 PHY.
> 
> The PHYLNK register [0] (section 10.2.5 page 763) allows control of
> the active level of the link.
> 0: High active (Default)
> 1: Active Low
> 
> For example the SWITCH requires link-up to be reported to the switch
> via the SWITCH_MII_LINK input pin.

Why does the switch require this? The switch also needs to know the
duplex, speed etc. Link on its own is of not enough. So when phylink
mac_link_up is called, you tell it the speed, duplex and also that the
link is up. When the link goes down, mac_link_down callback will be
called and you tell it the link is down.

    Andrew


