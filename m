Return-Path: <linux-renesas-soc+bounces-13907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D04A4C4BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 16:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE87C164E5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 15:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D583222594;
	Mon,  3 Mar 2025 15:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgELjrF5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB332144C3;
	Mon,  3 Mar 2025 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014958; cv=none; b=m+EWMBhuaor4uHcz0DKCFVuwxAEyX+QI1qdeHB6kfvSWfKCDyy4ZH3mxb0wppeXvUBpK+mLF33yDGpqc7PCW9RF3g2zF2Pd92gc/zcA0DIqkq9EczingMOLHQVHkXakTdO/VlscIrRoNqfvSbX1+kCuLI0d3tzLekxK7hKv6IzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014958; c=relaxed/simple;
	bh=qCLav73TZAajCO7ugUZ4KXbItQ3IJnzhJL1wFaRXe44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+UjXIRsZLVvMfVbL0mO8ETIMKJjrER9gis0+Dfmly5YYZkbb4X44NhYU1hGLSD+z3qBbVkEyDkgBk4nWgVYvfEiOurC6+EQX8AerSCUtJoQYz3PZjK96EQZnib9MzFXrw46iyJJL3tYaYU4l2Kh4pYieJOPUQ9jWtE+K40zaAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgELjrF5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C690C4CED6;
	Mon,  3 Mar 2025 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741014957;
	bh=qCLav73TZAajCO7ugUZ4KXbItQ3IJnzhJL1wFaRXe44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgELjrF5an/5DV69LFe87N7tAjf/jd4bd4Xa+OIHCjlMvCByOxIUonsW+RHxQcuaH
	 Q1rV0IAR0/PL7FmDo8QL+wBBad93WvKyHap0uR0oomIZly52yckGnodrsJybi6zWe8
	 RLj6kRc8JSDI+/EA5MqXaRR+4Em4woE6vqlDXd1m0eVlxgf/Vhk8/xE+DZQSl97ad1
	 1ereG5a3tgjV11zLKtAZZ8SRiiXcyarXS3jLzY+EFMMKlIKglmPvnaFCnTOWm/2caA
	 P/Udqt4RoMLR2Ia0mqYQ684DKRQLyGbuBTCjwpCSComKipRW3kYAvDbxMrW51nO0Y7
	 Wv3EXxBUXeS6Q==
Date: Mon, 3 Mar 2025 09:15:55 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
Message-ID: <20250303151555.GA1868289-robh@kernel.org>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a1dbb3e8-4a52-4cc2-8e7b-cf240f726d5e@lunn.ch>
 <Z8SxSU9lOgbNf0he@shell.armlinux.org.uk>
 <825379ce-f6dc-4c96-9a73-3562ffac79bc@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <825379ce-f6dc-4c96-9a73-3562ffac79bc@lunn.ch>

On Sun, Mar 02, 2025 at 10:33:56PM +0100, Andrew Lunn wrote:
> On Sun, Mar 02, 2025 at 07:28:09PM +0000, Russell King (Oracle) wrote:
> > On Sun, Mar 02, 2025 at 08:10:26PM +0100, Andrew Lunn wrote:
> > > > +  interrupts:
> > > > +    items:
> > > > +      - description: Subsystem interrupt
> > > > +      - description: The interrupt to manage the remote wake-up packet detection
> > > > +      - description: The interrupt that occurs when Tx/Rx enters/exits the LPI state
> > > > +      - description: Per-channel transmission-0 completion interrupt
> > > > +      - description: Per-channel transmission-1 completion interrupt
> > > > +      - description: Per-channel transmission-2 completion interrupt
> > > > +      - description: Per-channel transmission-3 completion interrupt
> > > > +      - description: Per-channel receive-0 completion interrupt
> > > > +      - description: Per-channel receive-1 completion interrupt
> > > > +      - description: Per-channel receive-2 completion interrupt
> > > > +      - description: Per-channel receive-3 completion interrupt
> > > > +
> > > > +  interrupt-names:
> > > > +    items:
> > > > +      - const: macirq
> > > > +      - const: eth_wake_irq
> > > > +      - const: eth_lpi
> > > > +      - const: tx0
> > > > +      - const: tx1
> > > > +      - const: tx2
> > > > +      - const: tx3
> > > > +      - const: rx0
> > > > +      - const: rx1
> > > > +      - const: rx2
> > > > +      - const: rx3
> > > 
> > > There has already been a discussion about trying to make the clock
> > > names more uniform. But what about interrupts? Which of these are in
> > > the IP databook? What names does the databook use for these
> > > interrupts?
> > 
> > >From a quick look, I haven't found anything that suggests the above
> > is possible, but it clearly is... so I'll look more tomorrow.
> 
> stmmac_platform.c:	stmmac_res->irq = platform_get_irq_byname(pdev, "macirq");
> stmmac_platform.c:		platform_get_irq_byname_optional(pdev, "eth_wake_irq");
> stmmac_platform.c:		platform_get_irq_byname_optional(pdev, "eth_lpi");
> stmmac_platform.c:		platform_get_irq_byname_optional(pdev, "sfty");
> 
> So it looks like these are already in common code. So there should be
> no need to name them in individual bindings, they can be named in the
> common binding, and the vendor binding then just needs to indicate
> they are required, or not.

The vendor bindings need to define the order. And to define if they are 
required, you have to list the names again...

Rob

