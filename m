Return-Path: <linux-renesas-soc+bounces-26527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E42FD0AB7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 15:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 628773019860
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 14:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160F13112BD;
	Fri,  9 Jan 2026 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HjQC29jO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC93E3101B9;
	Fri,  9 Jan 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767969999; cv=none; b=JA3RvItmlaaGvVtP555CS579Pn9ZUVpaTZh4WX1gS2mlUg77Wazhy6Dkg6mKCaJ0Q8Ng5LA81/p3sqEK8MuzokI8oIWMjtKwhYu8+z4i0O8XYHiCIvjzIHRBM2Mq/2/bLVZOwErfkpFLVIoPjetVGWENFtnDRRyHSctqU8dkjc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767969999; c=relaxed/simple;
	bh=B6sznWUxpO5Ih9NiRDT77oADP2VoqUFi3ScgXNcmFu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWCA8iHYv0Sc3o0IILHIT1No+w6bXfU+WKu+h9CssRA9ZYDq+6Rv3Hsg68CEAhh2zA0hFqIQEm/RvrnqLgoUjxkdEhmh+pbYd/66HcHsFuR6quYQ1eIlsSdZBUAaCgwOjjWUqVC67juPPXsWlsETLB4LYDxy/W0ZIRMVVC8dsRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HjQC29jO; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zDHHj7CfQYDxXShv+s7OPmgXz2bEdCrtei4bkY9twy0=; b=HjQC29jO/FmWHhPhNnPey2YJL0
	ygfO0IYKggY+V3iLs+V40lCeeP/iH7a8h0vHNioSdcCCxFF48xY3EqqHS73J/O0QVPb0Ds4ioa5BK
	lYWBmtRUDPYZko6VOGRTGsdaJxqesu6gT4/e4NSbTX+UOTwq9qu7n2uMCmu31Ns6tX90L2Bo2dtDK
	Ie6TDVnNxiT7ZZu5xcBw6h+9MGWwGV3TbKj1Ep4gas21y4WVhhrXO5EQFBe7Epws3FY3hSxzzuQOD
	lZ6hbGfzCpvCqMzJ6nkvSdFIVmZM6GwejlnnP9QS3WxIjm77JXWepU8SMKAmPF6aFAsEii1e63f91
	50ZXJ6mA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43020)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1veDkv-000000003w5-1B1y;
	Fri, 09 Jan 2026 14:46:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1veDkr-000000003OZ-2ksH;
	Fri, 09 Jan 2026 14:46:21 +0000
Date: Fri, 9 Jan 2026 14:46:21 +0000
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
Subject: Re: [PATCH net-next v2 2/2] net: pcs: rzn1-miic: Add support for PHY
 link active-level configuration
Message-ID: <aWEUvef4eDlmuOic@shell.armlinux.org.uk>
References: <20260109142250.3313448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260109142250.3313448-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109142250.3313448-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Jan 09, 2026 at 02:22:50PM +0000, Prabhakar wrote:
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
> 
> The accumulated configuration is stored during DT parsing and applied
> later in `miic_probe()` after hardware initialization, since the MIIC
> registers can only be modified safely once the hardware setup is complete.

Please do not re-use "phylink", we have a subsystem in the kernel named
as such, and, for example, it too defines "struct phylink".

> +/**
> + * struct phylink - Phylink configuration
> + * @mask: Mask of phylink bits
> + * @val: Value of phylink bits
> + */
> +struct phylink {
> +	u32 mask;
> +	u32 val;
> +};
> +

You don't get a warning for this, because, although you have:

#include <linux/phylink.h>

which delares "struct phylink" as:

struct phylink;

The definition of this structure is entirely private to
drivers/net/phy/phylink.c and is intentionally not exposed.

By redefining "struct phylink" here, it means that anyone using gdb
is going to run into problems - which version of this struct is the
right one for any particular pointer.

You describe this feature as "PHY-link" and "PHY link" in your commit
and cover messages. Please use "phy_link" and "PHY_LINK" as identifies
for this so that grep can distinguish between your PHY link feature
and the phylink infrastructure.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

