Return-Path: <linux-renesas-soc+bounces-5322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E888C3314
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2024 20:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D44271C20A4C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2024 18:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7512C1CAA5;
	Sat, 11 May 2024 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2jdkaZb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424EB1CA8A;
	Sat, 11 May 2024 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715451090; cv=none; b=tQc3zcdJ/QvddwJrhgF5vJFuASuqT/m5qtRdofq5IwYWlwP4RgZGJSF17U0Ism+/AXtTeyVC3gomMJCFlwsGLp6NP8BCSfWBucQdZLBgZPI1hnVbwQ8+CNT0dVXLs46DmxdsuSfghPwTjz4X4D/HsRFLAVgTpLMjUU+c4Ou8k5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715451090; c=relaxed/simple;
	bh=+t8uRZp6FGvXN+V4ScRGLv+eJyrrubY4gibWN6mdiHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fmp2vJKyLsxf3420WNjsLvJl0gW1eIeIFZbEy3bS89ah3Jz6uKfGsRbFMoKLEQ8m/5EVfWUu72Cp73KLAXBgm7DbifaLtKoKXmpq1qbvq9JBYx3veVla4t8EXURxaQWcGf0MeEcJhhhGYXq2Shj5AYj7NA779JePC+R20XqB0C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2jdkaZb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD5DC2BBFC;
	Sat, 11 May 2024 18:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715451089;
	bh=+t8uRZp6FGvXN+V4ScRGLv+eJyrrubY4gibWN6mdiHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2jdkaZbC/mdPAuuX1eCHbhGEu4F1appnZLT1q4rOQrw8hs/5sppQXOV2zRweyBYM
	 JTRs/m6M7JXBsqp66uNQmSheaAZglqcUtJ3KTp+CYxoJdYVdL8mkPlW0T9h3sdNZd/
	 NMAoMhuFa/s8NWyrGFlr48VOgPI0J7tCsvDWvHG2Z4+mJITYr+8ino8G7uaoGs94dq
	 4IQKjoJsADnxbivm5h7bvNIelFTpLU0gvAMQXaZVDsCvKI+jM49sYKr3VuamE5KHNX
	 TdHySYjtKa8IrqdiexAKN418X1uM8P+d4U6H6DtqFXH+Skitspy7NC7OV4gLXyj7w0
	 zsmqfQV10pQgQ==
Date: Sat, 11 May 2024 19:11:19 +0100
From: Simon Horman <horms@kernel.org>
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
	Russell King <linux@armlinux.org.uk>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v6 4/7] net: stmmac: introduce pcs_init/pcs_exit
 stmmac operations
Message-ID: <20240511181119.GU2347895@kernel.org>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
 <20240510-rzn1-gmac1-v6-4-b63942be334c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510-rzn1-gmac1-v6-4-b63942be334c@bootlin.com>

On Fri, May 10, 2024 at 09:38:11AM +0200, Romain Gantois wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Introduce a mechanism whereby platforms can create their PCS instances
> prior to the network device being published to userspace, but after
> some of the core stmmac initialisation has been completed. This means
> that the data structures that platforms need will be available.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 +++++++-
>  include/linux/stmmac.h                            | 2 ++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 778d79cdb2e6d..f562c563aab55 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -505,7 +505,10 @@ int stmmac_pcs_setup(struct net_device *ndev)
>  	priv = netdev_priv(ndev);
>  	mode = priv->plat->phy_interface;
>  
> -	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> +	if (priv->plat->pcs_init) {
> +		ret = priv->plat->pcs_init(priv);
> +	} else if (priv->plat->mdio_bus_data &&
> +		   priv->plat->mdio_bus_data->has_xpcs) {
>  		/* Try to probe the XPCS by scanning all addresses */
>  		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
>  			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);

I am unsure if this can occur, but if priv->plat->pcs_init returns 0 then
xpcs will be used while uninitialised towards the end of this function.

Flagged by Smatch.

...

