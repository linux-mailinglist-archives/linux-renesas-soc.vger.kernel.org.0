Return-Path: <linux-renesas-soc+bounces-5312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644608C283A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 17:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F7A21C21ED8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 15:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8059171E5D;
	Fri, 10 May 2024 15:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="cPmonIHv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95C017109C;
	Fri, 10 May 2024 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715356356; cv=none; b=L58/itCy454pAg8Fjc2cWzQkhAgiWxyZ8YNV4/1aVjF6QZd2ZKPHvclGhtkKgSqWxnkN50Y2Tfs5dqCpm7baKsQ5dYHQ0qyZQvJiBnQWswJrhTkBPdayoQcRekDZ0++Nl58CoJk3rnINnZFzSWv+s4Icr4IhIw87oVyU+548iHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715356356; c=relaxed/simple;
	bh=KbDSJ8sPoqUrtBTRtD44bCSBAhAd8j8GTBlXUJayVTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVElIey4VASUxiRGNxSAJPUR6Fj3MSfLFpCmZT1MrJfh0hVT5caitDmvJi2fWOoqN+fo760DkwIn+zo35Aw1PTfTX9NEI7IbZXRHVReo5nSSCCA0KyiXhatwibiNN1Dv5E2eyL4aTMKmFeYpUy/2HjB9hfovdfYwApBRxjVMEbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=cPmonIHv; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kgU5xDXwFs4QEjcHU4kuuCpha5X8eRsJv6GJUqZKdTQ=; b=cPmonIHvlTOPUe5pIJgg2HJ/qz
	eAOZt0HRWk9ANyinjkSfgJ96aPpC8iEoLUnqkZLpC1H3whU5XEbtPFsBxCJpkJ1HbW21YeWHlUGFr
	eUgFQE2DmtPSFNv2giA0Cx9DVQ4U1RCKFQfOqGr7CNMMs5mxILIOW1NbwizV1Lx0nr7/JRNthmKHV
	TMTAKiNii1V+8WvX+LyK3lfodxtZC1OgeSh7QfMWGwqWzVzbi/k4sY402xw1XF5g+gNvej+0gcTpE
	SvcRfQMjHRgEZMb1/TfH7yMYXzM2ZdMVj0ARRaE+artlqr1bUkUq5g7BCmBuaK5wja37qrWhmKEUQ
	6c87ObCA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42940)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s5SXW-0007aJ-2n;
	Fri, 10 May 2024 16:52:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s5SXT-0003Qx-Bi; Fri, 10 May 2024 16:52:03 +0100
Date: Fri, 10 May 2024 16:52:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v6 2/7] net: stmmac: Add dedicated XPCS cleanup
 method
Message-ID: <Zj5Co6wk4RV67vt5@shell.armlinux.org.uk>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
 <20240510-rzn1-gmac1-v6-2-b63942be334c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510-rzn1-gmac1-v6-2-b63942be334c@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, May 10, 2024 at 09:38:09AM +0200, Romain Gantois wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> Currently the XPCS handler destruction is performed in the
> stmmac_mdio_unregister() method. It doesn't look good because the handler
> isn't originally created in the corresponding protagonist
> stmmac_mdio_unregister(), but in the stmmac_xpcs_setup() function. In
> order to have more coherent MDIO and XPCS setup/cleanup procedures,
> let's move the DW XPCS destruction to the dedicated stmmac_pcs_clean()
> method.
> 
> This method will also be used to cleanup PCS hardware using the
> pcs_exit() callback that will be introduced to stmmac in a subsequent
> patch.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

