Return-Path: <linux-renesas-soc+bounces-15516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C556A7E92D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 19:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B4863A83BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 17:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFD72185A0;
	Mon,  7 Apr 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WlGmVHMV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CCB217679;
	Mon,  7 Apr 2025 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744048697; cv=none; b=QzGBf1FgDAoDs2UFw5Z2Qfdw72Z/6pXtlnaD/dKQajaNeNml2eEHp3ArbX5HlpjPEq7Pv/wysli3F71IPN2/TUBKj5qaFUcR74WgcpaMKeSA0jzf65Q2y8CYENah8nRjwAHAqWQh2Ht14hznWAg0ZIH1/9lMxQONnmBrfaoTKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744048697; c=relaxed/simple;
	bh=sBIyosl71LpJQSqFXDho9ZkMcYvbSRj90i95hQpHG38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qt6tqcjwVH4abuukt/7C6t+zxXRLKYQhLZcc+wVC+Rx3ShCO37gbMMDtjkRR8SyiIE5xT6V/yAr3mLiJMP5yWkCg/xLu8ro0ZcXbCRFOJBmrXFj9M6yrIsRF8F1t8iLsG74kIBkAKeDLJB0+auT5hvqW1ltoNIZ2fMb0rOqCuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WlGmVHMV; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FQZF3bHFrRzkhV+LKvF3d5dfM2bWmbi8UIfdjStHGX4=; b=WlGmVHMVJCxY5iiYt0wYPPv9S/
	K+r0x/7QswlLVAvAjukNFL5ndYGtlZ1/u8epQ0A4/lD0fy1PuATaJtDAUOKSTPMVB3m9d8mqIKVjQ
	jKN2HY2tLwGol6pm30f/jJ8D2W2NJXhjUoaM+zpHzzGpGA+RYhI+qVYQCTb85DINqdSiXuOlDyhut
	RWlHSwmJVAo/P+ipwBWUGibW6T4f1tJuG6S02ymjq8HT9Hasq+o7ilZgM8ppJa52emVHbWU7Cp5f2
	uutqqPomR9ipCpMvz5CIlO1TzpnSQ9Wb7PWqVOuqjvJIt5Y+T66c8eqehUGEvO+OrHR6oApwIZXip
	cYrIt12Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56466)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u1qjN-0005nL-0u;
	Mon, 07 Apr 2025 18:57:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u1qjG-0000aL-28;
	Mon, 07 Apr 2025 18:57:50 +0100
Date: Mon, 7 Apr 2025 18:57:50 +0100
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> +static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_data *plat_dat,
> +					  const char *name)
> +{
> +	for (unsigned int i = 0; i < plat_dat->num_clks; i++)
> +		if (!strcmp(plat_dat->clks[i].id, name))
> +			return plat_dat->clks[i].clk;
> +
> +	return NULL;
> +}

In addition to Jakub's request, I'll ask that you hold off for a week
because I have the following that I'd like to submit:

bbc73b8b6dfd net: stmmac: provide stmmac_pltfr_find_clk()

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c73eff6a56b8..43c869f64c39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -709,6 +709,17 @@ devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 #endif /* CONFIG_OF */
 EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);

+struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
+                                 const char *name)
+{
+       for (int i = 0; i < plat_dat->num_clks; i++)
+               if (strcmp(plat_dat->clks[i].id, name) == 0)
+                       return plat_dat->clks[i].clk;
+
+       return NULL;
+}
+EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
+
...

which will avoid glue drivers duplicating this functionality. This will
be part of the first sets of patches I'm going to be submitting.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

