Return-Path: <linux-renesas-soc+bounces-16011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB38A89FB8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 15:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB4243B13F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 13:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B627155C82;
	Tue, 15 Apr 2025 13:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="v1X6VO4i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCDD1527B1;
	Tue, 15 Apr 2025 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724365; cv=none; b=K2stE/N0akI0d9ApcY+k/5G6AcEDuuhsWa/4vMjXykFoF7En8BfruXeuD8ML8ENaVFGgVice+bokVnpgMR1cbBl3JzWc1pfC7mte29cVfsP3MDOSw0ycJEHDlTOC8jLZiMBT5bhmOcSiPUyWkXr+puKtblI9FitnNaj3mGEJq2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724365; c=relaxed/simple;
	bh=vF9s+eKKrzm2PVY8rjFr8lb+4O6o58gC8oTdQLEAgkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szF58rTAQNoML5CRYBEPqE67RDngeQ0pgmFcbx2/2+3v9Q0AgqOU+dDlpSAv47poaXD96nESdS27nkxpL1wuvkQnfvgtc9Bis/0TtUAZe7QBfsl0G5Mh9MznDZLtnbwgih2Ol+Wbo9+bLmj5auKchFvVgWFkfQ15cTj1gyrUl/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=v1X6VO4i; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A+3jtqXU4vmgll+2WkVE5wbB1NFuZVYYqMzchyGrBWo=; b=v1X6VO4iU7zcYdg4rSH2c0sKbK
	QbfCKdEbDRBl9y/S6Y7lrbNLbDy4+WCFufssyXqxyg9+WEVvXKlYhNtjURwLkDoycDOWBXMLNbw5l
	QndoO/EQN425aBitIdAGwoD3FoH3NyurEEXyNkY0HMebSa+GU6eDfQj0ZespMa8DwnSsM0qXkYYpe
	ra0fEpRk8dBNozM/vN/5pNwYzKvz6JzvrwkR3v3B+MQHC9dUQGhW1UGJ8DOYjCC8pKOSpbE1mxlsU
	cDSsEsMnLxsxZ6LZq70ZaxISuMlNI50lSKK+K9AK99vk7u6BASiBiD1L78yVr37NIy8kftKKUL8zb
	mVJ5Tl3w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37272)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4gVF-0008G3-0z;
	Tue, 15 Apr 2025 14:39:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4gV9-0000PK-1O;
	Tue, 15 Apr 2025 14:38:59 +0100
Date: Tue, 15 Apr 2025 14:38:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v6 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <Z_5hc151mud_UM1C@shell.armlinux.org.uk>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Apr 15, 2025 at 01:56:41PM +0100, Prabhakar wrote:
> Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
> SoC.

I think we're almost there, but now that the trees have parted, we can
start seeing other bits of wood :)

> +struct renesas_gbeth {
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct reset_control *rstc;
> +	struct device *dev;
> +	void __iomem *regs;

This appears to be only written, never read. Do you need it?

I think that's the last thing I can spot in this driver, so with that
fixed, please add:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

