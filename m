Return-Path: <linux-renesas-soc+bounces-13880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3382DA4B50F
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC6B216A376
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8738F1EDA3D;
	Sun,  2 Mar 2025 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="RJgmhFLy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE32A1CAA87;
	Sun,  2 Mar 2025 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740952330; cv=none; b=GMLT68lm2NyIFF/2Tsul6da5Es/VGuYpk26PbFE5p9oyg2SgSiSmKEfkU8vxNbnNcVzM0lg7n9ohM6ZUHivNXyd07LT8QS6gl1p3vWgTZS3/0BoGpWHi4nSaajJV0G5x+IaOniWHigrDi9rdOsGHgD7AXN7Bt88aUglLuVKyngo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740952330; c=relaxed/simple;
	bh=E6aT3RAqfDUZdhGyVCc36/yU58LfwfpgiylgMxfv6FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4GRxCTYsoqTKUj0CHLZusYg1xkSXgV3ws8uwMRaBh1JnlJ3PYVFOpuChFXC2oF4X6bEwZwXr49SUCPBryqG1jl8Lk4MTuypS4LO3/XZ4grR7umJyF4EJIN870fGkKznBvjBKHdDidK7GKuqhJwGNdChlg/TxhJ8jkRpWL50ao8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=RJgmhFLy; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rnQLU9GNxRFDxnGFVHo2NvgWIKdzeFNTssrY1D684qo=; b=RJgmhFLy2TVQQSytMunnV4dB7F
	3tVmcpNNZhWcL5uu2v02kgUzp09ubCmW2QDD69rJNzbWR/TXynKPk4BKpietSvINfrYEtZ6Xbxa/u
	S3BYZQKfGtTr0QzeVAPNYvC4pUosGvaL6dof5QhMOIQfTXTxePHw3a2ylMy6CMcu2Ita/coV64mSi
	P6vy/ERRQv2GwmwFDCmZLKCX5CpjmYbFXruye2sv762H8iHEv4WHdLCYrqba0g8uesd3NRnWATv8V
	FwMLPTerlbP1BYQ2vhIjN8Y6YGKE15M/soRNx93DSM/7vfeoYP58ygGMU0teJQT1XVZ5Jej5L6h85
	yA580i2Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42352)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1torE3-0007KS-2z;
	Sun, 02 Mar 2025 21:51:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1torE0-00037t-2P;
	Sun, 02 Mar 2025 21:51:52 +0000
Date: Sun, 2 Mar 2025 21:51:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
Message-ID: <Z8TS+CsLa/uF36Xv@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5a75f20-9b61-448e-941b-1106cd06ea04@lunn.ch>
 <CA+V-a8sCMn+v5y5v9CyyV2VsRmLj-Uyowt61tTS9dWN43CD0_A@mail.gmail.com>
 <Z8THE2hpybzP74bH@shell.armlinux.org.uk>
 <CA+V-a8up3Kv08sNarvC3gWLRpik3=_aKb3JCTGkxyGYMcj4Wbg@mail.gmail.com>
 <86f41f06-d544-42f5-b2c0-6c4a76ad9eac@lunn.ch>
 <CA+V-a8tjOmn4BAamr6BrniTiyMxNYMCRrnZaqzEs_Xr=359Rvg@mail.gmail.com>
 <Z8TSgxLqNwZ6zc3V@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8TSgxLqNwZ6zc3V@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Mar 02, 2025 at 09:49:55PM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 02, 2025 at 09:43:47PM +0000, Lad, Prabhakar wrote:
> > On Sun, Mar 2, 2025 at 9:39 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > > > Your SoC designer really implemented the 0° and 180° as two separate
> > > > > independently controllable clocks?
> > > > >
> > > > Yes there are separate bits to turn ON/OFF the 0° and 180° clocks.
> > >
> > > Do you know what the clock tree actually looks like? I can think of
> > > two different ways this could be implemented:
> > >
> > > ----+----------on/off---
> > >     |
> > >     +----not---on/off---
> > >
> > > or
> > >
> > > -------on/off-+------------------
> > >               |
> > >               +---not---on/off---
> > >
> > > In the first, the clocks are siblings. In the second there is
> > > parent/child relationship.
> > >
> > It's the first case in this SoC.
> 
> Umm, okay. I'll just pick my jaw up off the floor. :D
> 
> Given that, then yes, go with your existing clock binding, because
> that's the most sensible.
> 
> However, what would be useful for future maintenance is to put some
> commentry at the top of the new glue file describing this (pictorially)
> so that when someone looks at this later we know why it is this way.
> It'll be useful information if someone else does the same because then
> we can say "hey, we already have a binding for this situation!"

Additionally, it would probably be useful to include it in the dt
binding commit description because that will probably assist the
review of that patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

