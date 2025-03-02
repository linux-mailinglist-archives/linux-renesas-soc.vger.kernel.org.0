Return-Path: <linux-renesas-soc+bounces-13879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8CBA4B509
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D26A3A9712
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0491EB9FD;
	Sun,  2 Mar 2025 21:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HhVYBK9t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49AB1CAA87;
	Sun,  2 Mar 2025 21:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740952213; cv=none; b=WTxIMVfg+UBi/EMCK7pXNdASCXZMw0xM+1+RtmwrL79BAAQGZqx7Wgdzt6RbxANi/GcKaLR5FJDakWUXpCxS7bgrjC784ZRWP65c+VoKsuXLJO4+kEgZOqj6yABtYSi9d7F6/a07GaUIHKFYiK+Bnz2Id3eAuaQ7XebFetCIr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740952213; c=relaxed/simple;
	bh=qVAn8wHXyBURJZAopkHnyWHpVWjzGfEMPF0cu1CZUvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNVrmbp3zhMpjxqhq64wXallCSzk6npbt/ZrKkaFcisrhAQUR5lktqJPA+MfYvLICkdUyPty9PWW+Q/cA72UV0/4OW+A2V1xwF+1w/4q64H9LWufGoymPzOsXSvkFNtnJTwyL4wYVZY9kvRiLzfbbNoshOv/W8nIICdHYVGGt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HhVYBK9t; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6fyHBuEJjVkSvvpwe5epNG1Hltrzkrd+FB0MoDTMTkw=; b=HhVYBK9tUzSihn3ql2rdLNstyO
	w1ectV4GYiKWakjlCXoo++Ft0Ybc5iFNPZ9yuqPb0cN1mbxSG0kwoJaJHCs8SiHuZCVMQGRcDKe9R
	JXZxl8UJSQYPaJVGwgsUs/SxLVZ4Mal+pXTSCEpXz2sSEID4Sbs53s59ixXxnS4mbpSx5bOL19Z1n
	EryuzjPsMAesNdRB7YnkWOE5I5SjhP1f8nlZ0cVMcJ5z/iyx00nytTFtYigz0NWOJe0HtDr2+w0sP
	3oscSp1ll5YOxEo1LLOljcVF3Sal4kdFUCfQpxMG5wZUY9EAZj3OrqQKocNouiz0RqQDzn6FqKaYc
	eok1KMgA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55890)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1torCA-0007Jj-1s;
	Sun, 02 Mar 2025 21:49:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1torC7-00037l-0n;
	Sun, 02 Mar 2025 21:49:55 +0000
Date: Sun, 2 Mar 2025 21:49:55 +0000
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
Message-ID: <Z8TSgxLqNwZ6zc3V@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5a75f20-9b61-448e-941b-1106cd06ea04@lunn.ch>
 <CA+V-a8sCMn+v5y5v9CyyV2VsRmLj-Uyowt61tTS9dWN43CD0_A@mail.gmail.com>
 <Z8THE2hpybzP74bH@shell.armlinux.org.uk>
 <CA+V-a8up3Kv08sNarvC3gWLRpik3=_aKb3JCTGkxyGYMcj4Wbg@mail.gmail.com>
 <86f41f06-d544-42f5-b2c0-6c4a76ad9eac@lunn.ch>
 <CA+V-a8tjOmn4BAamr6BrniTiyMxNYMCRrnZaqzEs_Xr=359Rvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tjOmn4BAamr6BrniTiyMxNYMCRrnZaqzEs_Xr=359Rvg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Mar 02, 2025 at 09:43:47PM +0000, Lad, Prabhakar wrote:
> On Sun, Mar 2, 2025 at 9:39 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > > Your SoC designer really implemented the 0° and 180° as two separate
> > > > independently controllable clocks?
> > > >
> > > Yes there are separate bits to turn ON/OFF the 0° and 180° clocks.
> >
> > Do you know what the clock tree actually looks like? I can think of
> > two different ways this could be implemented:
> >
> > ----+----------on/off---
> >     |
> >     +----not---on/off---
> >
> > or
> >
> > -------on/off-+------------------
> >               |
> >               +---not---on/off---
> >
> > In the first, the clocks are siblings. In the second there is
> > parent/child relationship.
> >
> It's the first case in this SoC.

Umm, okay. I'll just pick my jaw up off the floor. :D

Given that, then yes, go with your existing clock binding, because
that's the most sensible.

However, what would be useful for future maintenance is to put some
commentry at the top of the new glue file describing this (pictorially)
so that when someone looks at this later we know why it is this way.
It'll be useful information if someone else does the same because then
we can say "hey, we already have a binding for this situation!"

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

