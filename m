Return-Path: <linux-renesas-soc+bounces-5314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8598C284C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 17:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BA561F254BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 15:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E475171E70;
	Fri, 10 May 2024 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="j2TqeLIG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA8212C49A;
	Fri, 10 May 2024 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715356552; cv=none; b=MdUrzuUrOHsuqosYU4xyZmYRA+UfpwZ6Sv/7CyR+z8wG/pkak7NJeO9tFCgimv64O4hW/inW6vBhJgHpTAcmdgA+XVotbeBy0cpumGjK63XAB11O35lnuXmZ1rwcGDc3F6fnHtBYRRQprRWxJSdd7I8+6rcgsWHyDsRDnqxxDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715356552; c=relaxed/simple;
	bh=IBLZr/tGroMZp0lVjQIUbjuvOt/Nd1d3apRv1DjPoXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5MBER0OKGQyfqx3QZ1DdhVvjlR0SVvPlYTA05yw3eIcUM6RfiQ+7OBcevy+d1IcD7gHOK3EXSVbH6wtZduwW/9IAQ04DHOZvMwaai+on8Kh4DogWQyMikDmTMxL74gPndfjCjAiv+cgSJyFQdAYyaSwx5VHdpPbiuBJFy8SqHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=j2TqeLIG; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dy8lSBZHGbHQucNhRUnmeh0rwb1O8iiwSESw+dcfU8A=; b=j2TqeLIGRT+ss1rjOoJ2nVsQgo
	8wXrn3qFtsaVTL35D/EoE1B/D3oVEMpSXUgYDR42dPQEMAwNi6EmP+RKs6DNvbpiNyoBv+utI+Rde
	4XDlVZFI659lKYxs9nW+Wmwk18TRd0FxdzkO0Zm8HZfFzzsWyBBvvj8+CIhz2wfplqG6Yaoe57IkF
	ef/yIA1z0C6ZtKKI8/JpZyttM7s2DcorU6JCY0AmWJvmmXFno9Qv3dMpYwOZmbRN5VekXeC83terg
	YrAjAuovYMSRQ6cyZK4bIz8trOfi3914NvnzuXM8q6W2AS+yB0WBgdyY13YR9eIIQo1AWbXIMVkRX
	jgVRTthQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42354)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s5Sar-0007b1-0E;
	Fri, 10 May 2024 16:55:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s5Sar-0003R6-5s; Fri, 10 May 2024 16:55:33 +0100
Date: Fri, 10 May 2024 16:55:33 +0100
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
Subject: Re: [PATCH net-next v6 3/7] net: stmmac: Make stmmac_xpcs_setup()
 generic to all PCS devices
Message-ID: <Zj5DddF4nl/B4zZM@shell.armlinux.org.uk>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
 <20240510-rzn1-gmac1-v6-3-b63942be334c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510-rzn1-gmac1-v6-3-b63942be334c@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, May 10, 2024 at 09:38:10AM +0200, Romain Gantois wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> A pcs_init() callback will be introduced to stmmac in a future patch. This
> new function will be called during the hardware initialization phase.
> Instead of separately initializing XPCS and PCS components, let's group all
> PCS-related hardware initialization logic in the current
> stmmac_xpcs_setup() function.
> 
> Rename stmmac_xpcs_setup() to stmmac_pcs_setup() and move the conditional
> call to stmmac_xpcs_setup() inside the function itself.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>

stmmac_pcs_init() looks weird in this patch, but the reason is set out
here. So:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

