Return-Path: <linux-renesas-soc+bounces-1275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F5D82302E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 16:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 651EA1F247E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 15:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D491A727;
	Wed,  3 Jan 2024 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="vRPIlCaf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51A91A702;
	Wed,  3 Jan 2024 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g8K4Wbg5JDQXx3q/iM3cUgJD+tm3dXGYqWadi7wsaLo=; b=vRPIlCafJtPTrLDLkNkZyvUl24
	xXTcQv22UTsNwmoIsCywmF04xqy6lyWQK7KYruZXaUaDViF1OsvA9njVSvWZhVAjorCzROmbXDnZ5
	HBNIdw52sG47eqZTfY1LV4xew4V0KVKtwyDSxrE+W45fbgni3Tk4ETlr8k5x8nxUvDd/eOn415kIZ
	Z3NrN5jVaJ0ePDyNWY1jLcUbVzZbDVrQ9TxJt6ajP33+fn5inC0g2cnbaW1NXLNnGiLtyOrKnzW6y
	NHn5jw87eNqwA+y0t2l9AkfpVAStCcudTUtAWpz9YWgt7jXCL/t8sJTKfWH6T7db6AbezzbiTJWR5
	b42yMw4w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48018)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rL2k2-0007cb-1L;
	Wed, 03 Jan 2024 15:01:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rL2jz-0006Sx-I0; Wed, 03 Jan 2024 15:01:07 +0000
Date: Wed, 3 Jan 2024 15:01:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Marek Vasut <marex@denx.de>, Clark Wang <xiaoning.wang@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sylvain Girard <sylvain.girard@se.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net 5/5] net: pcs: rzn1-miic: Init RX clock early if MAC
 requires it
Message-ID: <ZZV2s/TGKanl76TI@shell.armlinux.org.uk>
References: <20240103142827.168321-1-romain.gantois@bootlin.com>
 <20240103142827.168321-6-romain.gantois@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103142827.168321-6-romain.gantois@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Jan 03, 2024 at 03:28:25PM +0100, Romain Gantois wrote:
> The GMAC1 controller in the RZN1 IP requires the RX MII clock signal to be
> started before it initializes its own hardware, thus before it calls
> phylink_start.
> 
> Check the rxc_always_on pcs flag and enable the clock signal during the
> link validation phase.

However, validation is *not* supposed to change the configuration of
the hardware. Validation may fail. The "interface" that gets passed
to validation may never ever be selected. This change feels like
nothing more than a hack.

Since the MAC driver has to itself provide the PCS to phylink via the
mac_select_pcs() method, the MAC driver already has knowledge of which
PCS it is going to be using. Therefore, I think it may make sense
to do something like this:

int phylink_pcs_preconfig(struct phylink *pl, struct phylink_pcs *pcs)
{
	if (pl->config->mac_requires_rxc)
		pcs->rxc_always_on = true;

	if (pcs->ops->preconfig)
		pcs->ops->pcs_preconfig(pcs);
}

and have stmmac call phylink_pcs_preconfig() for each PCS that it will
be using during initialisation / resume paths?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

