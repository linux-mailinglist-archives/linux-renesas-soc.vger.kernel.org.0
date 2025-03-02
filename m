Return-Path: <linux-renesas-soc+bounces-13875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C6CA4B4EF
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9577E169D28
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492781EC01F;
	Sun,  2 Mar 2025 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="PYOvh62i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7E713AF2;
	Sun,  2 Mar 2025 21:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740951257; cv=none; b=Zp2xSsDZQKcn8bBQVp8M0UXswu8/aa8LRaHDDBieZ1n2M90xcJqKEiuz1NPk1WoI751CwqtsD1FrLuWiDqd3LRFh5ioqKRPBFX0HGfoi8LdNdo9azU/5JgR4BrytH7fAe93OHh+5C80azDleZx37/XMhptUQ6bbAT24DPbG7bJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740951257; c=relaxed/simple;
	bh=EcVTks8u1/lSKSH+VEHk4BTWhWV3/fcnwpliI9pwYyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwp0JmdvOcXj4hYqXnz/dJvkeExS5YekndtHnw9BJ5fuB1KDknFlUtJHpNQCRyRd2zg1qjVl/JSQ9fgAf3aLodwayiljgaGIr79+6pQv6jNyZ6ODLLQaEd2+1Yad4zl87PHkRdkTVrS0reCNeePJh8iMHpQv8NbBstq6bBwwkLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=PYOvh62i; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=f497gegEci+02syONskjbkNepSIjl7ZiAjck74yxeZk=; b=PYOvh62iH8Wk1BHYrPuQqWsakL
	BXGaSwgTz525i0P6kUivxI0I4+9OeHzB1XSvY/GUocUuHTEQLSXA3FYtJeFB4oxFpUPG5b5B4xZ8/
	S0899UtBtOHM6c27KSiMrXFzUin5bQ1w4qyvwbbgczHwOyewrd6xyXRGh7Cu5zMbIgWU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1toqwe-001bwG-0h; Sun, 02 Mar 2025 22:33:56 +0100
Date: Sun, 2 Mar 2025 22:33:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] dt-bindings: net: Document GBETH bindings for
 Renesas RZ/V2H(P) SoC
Message-ID: <825379ce-f6dc-4c96-9a73-3562ffac79bc@lunn.ch>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a1dbb3e8-4a52-4cc2-8e7b-cf240f726d5e@lunn.ch>
 <Z8SxSU9lOgbNf0he@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8SxSU9lOgbNf0he@shell.armlinux.org.uk>

On Sun, Mar 02, 2025 at 07:28:09PM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 02, 2025 at 08:10:26PM +0100, Andrew Lunn wrote:
> > > +  interrupts:
> > > +    items:
> > > +      - description: Subsystem interrupt
> > > +      - description: The interrupt to manage the remote wake-up packet detection
> > > +      - description: The interrupt that occurs when Tx/Rx enters/exits the LPI state
> > > +      - description: Per-channel transmission-0 completion interrupt
> > > +      - description: Per-channel transmission-1 completion interrupt
> > > +      - description: Per-channel transmission-2 completion interrupt
> > > +      - description: Per-channel transmission-3 completion interrupt
> > > +      - description: Per-channel receive-0 completion interrupt
> > > +      - description: Per-channel receive-1 completion interrupt
> > > +      - description: Per-channel receive-2 completion interrupt
> > > +      - description: Per-channel receive-3 completion interrupt
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: macirq
> > > +      - const: eth_wake_irq
> > > +      - const: eth_lpi
> > > +      - const: tx0
> > > +      - const: tx1
> > > +      - const: tx2
> > > +      - const: tx3
> > > +      - const: rx0
> > > +      - const: rx1
> > > +      - const: rx2
> > > +      - const: rx3
> > 
> > There has already been a discussion about trying to make the clock
> > names more uniform. But what about interrupts? Which of these are in
> > the IP databook? What names does the databook use for these
> > interrupts?
> 
> >From a quick look, I haven't found anything that suggests the above
> is possible, but it clearly is... so I'll look more tomorrow.

stmmac_platform.c:	stmmac_res->irq = platform_get_irq_byname(pdev, "macirq");
stmmac_platform.c:		platform_get_irq_byname_optional(pdev, "eth_wake_irq");
stmmac_platform.c:		platform_get_irq_byname_optional(pdev, "eth_lpi");
stmmac_platform.c:		platform_get_irq_byname_optional(pdev, "sfty");

So it looks like these are already in common code. So there should be
no need to name them in individual bindings, they can be named in the
common binding, and the vendor binding then just needs to indicate
they are required, or not.

What i have not yet figure out is how the names tx0, .. tx3 in this
binding are used. There is no code added in this patchset. Yet
loongson_dwmac_msi_config() and the intel stmmac_config_multi_msi()
are the only ones setting res->tx_irq[], neither of which are using
DT? I must be missing something somewhere.

    Andrew



