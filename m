Return-Path: <linux-renesas-soc+bounces-24523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D3C54B11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 23:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ED83A344F7F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 22:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B892E8882;
	Wed, 12 Nov 2025 22:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="piS90BQR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327AC2D839E;
	Wed, 12 Nov 2025 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762985497; cv=none; b=GzqDPJlOxre7S00XHpIheCoiFf8xTHqlmItoR8WGQk6LMgQGS87Lrd8fKiwCa7We2RhyIne4E1JU10SYjoZgp763dJimu8xdmk6Ip0fM1a1MWyRRn2xydUa0ERk/crcK4HanCzsaI+ywCyp3jH9kkgGBipYrxYNvtYbqtVxLHnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762985497; c=relaxed/simple;
	bh=3dbb1glMmN4Hc/HfJc1ZiSvcOet6dpQDyyNgXSY3pm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bs98Jib59vFCYMTILgcjNuP87DPzBaeH/mIDHlR45IB9TjoouKWjRyNJDKE+dCMx9fnNuKmfzWii71WVI+z7dCJQZAr04cNSMKiPG+E1IBzflwSLzs9jDnMQ1gUIHp0KrujFxQt8jnoS0kvde4Ft+/9R9VdmZgKBmOdTmrThT68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=piS90BQR; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dD3fqFseYEbF2xvDfha1nIzZW8UZrTPdcl3szlzJX38=; b=piS90BQRKYqNHfVdh3rf4wmY9X
	MxDcJ3Uadg+v62kXwgzqB7sCgkOT1N7514BRvZNcaPbDDX82C1hbk2iXTJfJl/93ouXUvNbjddrhn
	bVMv+fZOtyFrtQTix2k9UsRtGIi9uTLCaBjaItV+qYrJLUhUlIjtIOMuNH3eiQQ24mf3CcVdZ/gFk
	aJNKWq33IcOSZ1ySkS9u+QqsX6YY5BeiTSgUhcex7Fi6l/2Dr0KH7xI3ECkN4rs2POqzDRKKijbut
	lT0HN9I3roJAAYIKukQTl/Cgto/jNR/ZPKPx5/Y1VOIXnUs3SNTctvJtw7MPqK3Zqhh5+OnyBQ0uD
	uWBr3gEQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54020)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJJ3a-000000004c3-3no6;
	Wed, 12 Nov 2025 22:11:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJJ3X-000000004Fi-180y;
	Wed, 12 Nov 2025 22:11:11 +0000
Date: Wed, 12 Nov 2025 22:11:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
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
Subject: Re: [PATCH net-next 2/2] net: pcs: rzn1-miic: Add support for PHY
 link active-level configuration
Message-ID: <aRUF_3K0BRInAp55@shell.armlinux.org.uk>
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112201937.1336854-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112201937.1336854-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 12, 2025 at 08:19:37PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support to configure the PHY link signal active level per converter
> using the DT property "renesas,miic-phylink-active-low".
> 
> Introduce the MIIC_PHYLINK register definition and extend the MIIC driver
> with a new `phylink` structure to store the mask and value for PHY link
> configuration. Implement `miic_configure_phylink()` to determine the bit
> position and polarity for each port based on the SoC type, such as RZ/N1
> or RZ/T2H/N2H.

To echo what Andrew said... really really bad naming.

include/linux/phylink.h:struct phylink;

This structure identifier is already in use, and what's more, this
driver includes that header file.

What exactly is this "PHY link signal" that you talk about in the
commit description? Apart from the LED outputs, I'm not aware of
generally PHYs having a hardware output to indicate link status.

If we're talking about the link status bit in the SGMII config
word, if there's PHYs that have that bit inverted, they deserve to
be broken, because they will be broken with most hardware that
interprets the link state bit (I've never seen the facility to
invert that bit in hardware.)

Basically, please explain what this is for, what this is doing, and
why it is necessary.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

