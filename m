Return-Path: <linux-renesas-soc+bounces-24578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C905C58CF2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 17:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 767D54F4A18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 16:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC442F7AC9;
	Thu, 13 Nov 2025 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="J7URCsAY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70ED2F4A19;
	Thu, 13 Nov 2025 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763049506; cv=none; b=edzVvkaZwJBuvPXCYQVqAjZxgQkEptT6OsDRo/rASu9GYb1khVX08lhXmin7mw0xIdOsBXsxvCldkWqj7ssViAJPv11mUHX1jQSue6HUcNRUMt736WwUaOzppWcSdzBgMYHfyYnKEXt3FGaK+rrYAV/sMeuOkKd6tkDZR4avl88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763049506; c=relaxed/simple;
	bh=NYeJSyKg8aRuFEhyCnL0JQc7N+mw1OvuhAKAZHnRiGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbHrLDccZluabgLgpX2v0IzSwza876Bo3pFpluz6uR2bP6b4p6jieSE7e7L9x9+D3n1cuqsDR/8Gcsq+b1X+J91fL83YU3umgIq6ODD0hH8i/gQChAIQsuGAQQP8CpItl05EapygzvreV8s7BebqVJ5EJuXaDVOoyat9shDKXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=J7URCsAY; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aWqMO5dgKynFXVsf0PHGotO7feJhY392/1Tkcj5y4X4=; b=J7URCsAY11Fgeyi5sgnO0X8T0v
	DLtkvJJl3PyIkZ3+pQdqa5PD08pffN0ZsYf84O5wPEbDPpiWRbX+vKOEbp87LAFPiB/mZ3rOhRUev
	wl/E73KkEUEJOW0cczLixDs89IGZapg8+t4mzKPDkp7aY+fu0dlQCpHoXtiBE7C0V33WqRqWR7Ina
	pGBEbTpoHbR8kIAbT9jLtTXZHlosI5thcir0tsA3EceaS1T7Iz5jB9+WtF3oM79LWHPkzQX873kD2
	U6e/ONoRJWyV2KMfNwpRVagYpVP1QRU/T0TRZyKfyznhdLSkKcCxnC3ab9fjEVPKPNTuo4mJ0PCIM
	jRyeeBKw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59990)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJZi5-000000005f9-20ny;
	Thu, 13 Nov 2025 15:58:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJZi1-000000004yz-1Tfu;
	Thu, 13 Nov 2025 15:58:05 +0000
Date: Thu, 13 Nov 2025 15:58:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: pcs: renesas,rzn1-miic:
 Add renesas,miic-phylink-active-low property
Message-ID: <aRYADfD8QkIw9Fnd@shell.armlinux.org.uk>
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112201937.1336854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aRTwz5QHq9U5QbQ-@ninjato>
 <CA+V-a8s5fg02ZQT4tubJ46iBFtNXJRvTPp2DLJgeFnb3eMQPfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8s5fg02ZQT4tubJ46iBFtNXJRvTPp2DLJgeFnb3eMQPfg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 13, 2025 at 02:45:18PM +0000, Lad, Prabhakar wrote:
> Hi Wolfram,
> 
> On Wed, Nov 12, 2025 at 8:40 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Hi Prabhakar,
> >
> > > Add the boolean DT property `renesas,miic-phylink-active-low` to the RZN1
> >
> > Hmm, we already have "renesas,ether-link-active-low" in
> > renesas,ether.yaml and renesas,etheravb.yaml. Can't we reuse that?
> >
> On the RZ/N1x we have the below architecture
> 
>                                                       +----> Ethernet Switch
>                                                       |           |
>                                                       |           v
>     MII Converter ----------------------+      GMAC (Synopsys IP)
>                                                       |
>                                                       +----> EtherCAT
> Slave Controller
>                                                       |
>                                                       +----> SERCOS
> Controller

I'm not sure that diagram has come out correctly. If you're going to
draw diagrams, make sure you do it using a fixed-width font. To me,
it looks like the MII Converter is bolted to GMAC and only has one
connection, and the GMAC has what seems to be maybe five connections.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

