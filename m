Return-Path: <linux-renesas-soc+bounces-13876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E3EA4B4F8
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 673037A6362
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424CB1EE008;
	Sun,  2 Mar 2025 21:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="d70Nfatq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CDE1EDA1B;
	Sun,  2 Mar 2025 21:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740951610; cv=none; b=fvs0D6d54Ja0F6/mISBOcksAxxfSmWxMlwpqiXxV7A0xTy0EQlrJ2eNnKBP+Wht/roZLRNjXYz95y354ILg4wFB5LoODGmhQtkS1+MZCj/CTn/6aCkmtCZN8EsnSOEdOWW1Iv8ePYY3Gx80x8J5ezXfi6JBj+4/CUYMdGQddrMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740951610; c=relaxed/simple;
	bh=rXtDZ2yr0SyY14nrPLo+qp+HXF3u2NYAW1CktshMwZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOkYtiR2biCmxjpASC//FALP5vFbH+3V2zQtmfJN1keEZfJ7CULX2NhggwPp8ZIDk1qw/w/FJzLb6YyFU1asn+ewgocZDro7yeE4qhHXKoYCLRXK2ouYoJm+Ucd/FiglQNbvQ2DlFOX3aPnooYixMkO0ebuMqjqWJYyjYOpapKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=d70Nfatq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=N/2ZFPWYJb8JtWxhys3Oe+wy0c71G8tXb/B0rXelUc0=; b=d7
	0NfatqjXuZ1sx7JmlmcPv0z+5ofjxToh4C2mEa1KU2WwVHnXyuOTQ7zIzGrffiAyyaMtlkM92p0wT
	TTG24B1k8xnV+RoTA7HQrXJYYilSNV0ZiuCvVngRC2iRsuFrhU1QF9oqLFXcqMcNLrKvlHSywSrmz
	MB3ltcXNifiqROI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tor2P-001c0v-Nr; Sun, 02 Mar 2025 22:39:53 +0100
Date: Sun, 2 Mar 2025 22:39:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
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
Message-ID: <86f41f06-d544-42f5-b2c0-6c4a76ad9eac@lunn.ch>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5a75f20-9b61-448e-941b-1106cd06ea04@lunn.ch>
 <CA+V-a8sCMn+v5y5v9CyyV2VsRmLj-Uyowt61tTS9dWN43CD0_A@mail.gmail.com>
 <Z8THE2hpybzP74bH@shell.armlinux.org.uk>
 <CA+V-a8up3Kv08sNarvC3gWLRpik3=_aKb3JCTGkxyGYMcj4Wbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8up3Kv08sNarvC3gWLRpik3=_aKb3JCTGkxyGYMcj4Wbg@mail.gmail.com>

> > > I can certainly do that, but not sure in the DT we will be describing
> > > the HW correctly then. I'll have to hide *-180  clocks In the DT and
> > > handle and turning on/off these clocks in the clock driver.
> > ...
> > >              clocks =  <&cpg CPG_MOD 0xbd>,
> > >                             <&cpg CPG_MOD 0xbc>,
> > >                             <&cpg CPG_CORE R9A09G057_GBETH_0_CLK_PTP_REF_I>,
> > >                             <&cpg CPG_MOD 0xb8>,
> > >                             <&cpg CPG_MOD 0xb9>,
> > >                             <&cpg CPG_MOD 0xba>,
> > >                             <&cpg CPG_MOD 0xbb>;
> >
> > Your SoC designer really implemented the 0° and 180° as two separate
> > independently controllable clocks?
> >
> Yes there are separate bits to turn ON/OFF the 0° and 180° clocks.

Do you know what the clock tree actually looks like? I can think of
two different ways this could be implemented:

----+----------on/off---
    |
    +----not---on/off---

or

-------on/off-+------------------
              |
	      +---not---on/off---

In the first, the clocks are siblings. In the second there is
parent/child relationship.

	Andrew

