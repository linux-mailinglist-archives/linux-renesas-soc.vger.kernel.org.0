Return-Path: <linux-renesas-soc+bounces-13872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F7A4B4D5
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 144F47A4FE0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF4A1E9B0B;
	Sun,  2 Mar 2025 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="fa0+f6Rj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0672E4A3C;
	Sun,  2 Mar 2025 21:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740949292; cv=none; b=eJshFaz2XryCj1hd3zyrrCse719HIXUoaw2LKVFdLnR3SAd4pdo4/UQjPwTTYUODDcOQuSwsxMiK59/RNVqEby+AveDDV4sCuHL4rrLp1+Lvb8pPGfS7B6xSx1CXE+BE08M8sN6fXCfOdsQfsz/grFNQVtxv8TQq5fjEefSOgeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740949292; c=relaxed/simple;
	bh=Ktknxaixw4jYjukpEyBo0fjDI8NFDTzyiF2hS45oJ4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFSsr73/8YLl8Wgm5BEvVcLSxc6MQzMt/FG4fV4d7Xq4E8He68vPuwRix4fpmANLkr7mlQWZku2btHCOFa9/JcqpS1usYqWxXK/yaR03ncVSi1AcXAIREFRyz7YcUNYHtjk5p/SZVBkm1NfCe0hYymBw61nNlVa8hv7lwa7JhzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=fa0+f6Rj; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YR0pONPUa1aSzoYgGHrsHSg33e+oRGYIk/EYXBHsyy0=; b=fa0+f6Rj5hvafOp2ulinC+pOGA
	0p1h0Dkgz9tD6DfBp48y1groqhC6ySDsf6P88p0hA9r8RkRxSpu7gTVPzadn0Hl9Cr+5qB36INB5C
	p7a1wezPg1qaEkID7l94Lw3t9AviiCNhGcxzAMa2wJEwMY0ir7tMtID3cLqYuxkj3IrzfRGpfux+3
	CmJ1eSkmnYzI+5thKRpPK6IesYZcIj/iET2uG1EaOZwJzdgXMoFpJuBk9Uwv46xOVHDqCanNrcIxa
	UM7PVjfk6AZ2ohGrRFjdiPO9UnN+Db177vaou0uqca9I4q49Gs61U9xUDLidsa4V1pE/4981zKZ2n
	eIEnYDxA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36196)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1toqQy-0007EE-1I;
	Sun, 02 Mar 2025 21:01:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1toqQt-00035V-19;
	Sun, 02 Mar 2025 21:01:07 +0000
Date: Sun, 2 Mar 2025 21:01:07 +0000
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
Message-ID: <Z8THE2hpybzP74bH@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5a75f20-9b61-448e-941b-1106cd06ea04@lunn.ch>
 <CA+V-a8sCMn+v5y5v9CyyV2VsRmLj-Uyowt61tTS9dWN43CD0_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8sCMn+v5y5v9CyyV2VsRmLj-Uyowt61tTS9dWN43CD0_A@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Mar 02, 2025 at 08:41:39PM +0000, Lad, Prabhakar wrote:
> Hi Andrew,
> 
> On Sun, Mar 2, 2025 at 7:25 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +  clock-names:
> > > +    items:
> > > +      - const: stmmaceth
> > > +      - const: pclk
> > > +      - const: ptp_ref
> > > +      - const: tx
> > > +      - const: rx
> > > +      - const: tx-180
> > > +      - const: rx-180
> >
> > As Russell said in an older thread, tx and tx-180 are effectively the
> > same clock, but with an inverter added. You should be able to arrange
> > the clock tree that if you enable tx, it also enables tx-180 as a
> > parent/sibling relationship.
> >
> I can certainly do that, but not sure in the DT we will be describing
> the HW correctly then. I'll have to hide *-180  clocks In the DT and
> handle and turning on/off these clocks in the clock driver.
...
>              clocks =  <&cpg CPG_MOD 0xbd>,
>                             <&cpg CPG_MOD 0xbc>,
>                             <&cpg CPG_CORE R9A09G057_GBETH_0_CLK_PTP_REF_I>,
>                             <&cpg CPG_MOD 0xb8>,
>                             <&cpg CPG_MOD 0xb9>,
>                             <&cpg CPG_MOD 0xba>,
>                             <&cpg CPG_MOD 0xbb>;

Your SoC designer really implemented the 0° and 180° as two separate
independently controllable clocks?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

