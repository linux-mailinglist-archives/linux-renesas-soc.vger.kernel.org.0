Return-Path: <linux-renesas-soc+bounces-13868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66888A4B45E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 20:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 771167A4563
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 19:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6311EB5E9;
	Sun,  2 Mar 2025 19:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Hl41ejlz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8986D1DF26F;
	Sun,  2 Mar 2025 19:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740943717; cv=none; b=WIELmUx0k8SK5m536H/SmH1WHzj747bKDCclW+4CzEkr4bgfnwCrCk3Q07z1BAa454axwYNQxR5RlrAbTuTLHPjTVLR/D/vNFVv9s0AS4u+IVwjGcmYb4ISwt32PYDVrqzElE1mcvigZTW97lizWlPx7XmqG5FZeW7lWZpA4M+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740943717; c=relaxed/simple;
	bh=Fdnn7tH2jo2mvmW1J9Vif5efjIzGHkbPVUFAvcTLSU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7hmkuDKkvw9Au4bQHGSVe5+9JSc9xHgEnk9PTRjurlM1ZLi8qepwAo5HMxAsbcoKJEc/UO/lNJHxwLGT7oCV+8wrze/+IRMdM3tzJ1ixVMREeWOexJSMEf0WYsQjmceKpZgOCQhMTL9+wTBUc6g5nee35wiyoDgbSkO5GyE1Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Hl41ejlz; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P1+SolrjFRxzUjJxkQb/KRh9HBG2DaWmNEJ2h60N+/k=; b=Hl41ejlzNAsfk3+UvO+7OLb9Eb
	mS8fIPXcRG8CxGuvIQfjxQcoX/MnoNTDig6Rm/nh9F32nOHB+xAzFI/IGd1TIb4L/PdGCqdhZsvJx
	qjlJ8FHkPznLpEIUvUGrkXqe/29DpdPsjrtgTEOnDmmJtGxeRXZjxOn3iXvJwhTN14v2FB15+NkhF
	r3Agrso8RLXU9mT6GfKsrkFu1h+ka520PJecniEzL8lilCf1zR2dwNey4FjA48aFcukb9ZFDsrY9l
	oyDYgijzhDwUMRmWlIULZIRy3fYlultAwzZVonrOOMkx6dfBLud2ekK08FAx2C75Ii3Q6kxkd6W4C
	Sy+dXukQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52148)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tooz1-00073r-1Q;
	Sun, 02 Mar 2025 19:28:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tooyv-00030T-1q;
	Sun, 02 Mar 2025 19:28:09 +0000
Date: Sun, 2 Mar 2025 19:28:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <Z8SxSU9lOgbNf0he@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a1dbb3e8-4a52-4cc2-8e7b-cf240f726d5e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1dbb3e8-4a52-4cc2-8e7b-cf240f726d5e@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Mar 02, 2025 at 08:10:26PM +0100, Andrew Lunn wrote:
> > +  interrupts:
> > +    items:
> > +      - description: Subsystem interrupt
> > +      - description: The interrupt to manage the remote wake-up packet detection
> > +      - description: The interrupt that occurs when Tx/Rx enters/exits the LPI state
> > +      - description: Per-channel transmission-0 completion interrupt
> > +      - description: Per-channel transmission-1 completion interrupt
> > +      - description: Per-channel transmission-2 completion interrupt
> > +      - description: Per-channel transmission-3 completion interrupt
> > +      - description: Per-channel receive-0 completion interrupt
> > +      - description: Per-channel receive-1 completion interrupt
> > +      - description: Per-channel receive-2 completion interrupt
> > +      - description: Per-channel receive-3 completion interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: macirq
> > +      - const: eth_wake_irq
> > +      - const: eth_lpi
> > +      - const: tx0
> > +      - const: tx1
> > +      - const: tx2
> > +      - const: tx3
> > +      - const: rx0
> > +      - const: rx1
> > +      - const: rx2
> > +      - const: rx3
> 
> There has already been a discussion about trying to make the clock
> names more uniform. But what about interrupts? Which of these are in
> the IP databook? What names does the databook use for these
> interrupts?

From a quick look, I haven't found anything that suggests the above
is possible, but it clearly is... so I'll look more tomorrow.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

