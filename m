Return-Path: <linux-renesas-soc+bounces-5332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF8D8C3C08
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 09:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A8CF1C21081
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 07:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F468146A8A;
	Mon, 13 May 2024 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cCy6F3db"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D4B146A77;
	Mon, 13 May 2024 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715585144; cv=none; b=sfqgDX8tCT5+3k3ZGD2f5briml618i/uK94fuZ73dXY7weXkbVEjzua6H3Q7lVlgaW/qL8CDPmuKX/sM30wSS9LXyjaL1oE0QjlaFk1W45XV/LrfGTNYMeT6PyFvVNxNl+1Fz6rMKswWJZpFHhi+BD4Vn2CyFfaasVH+5CNXgZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715585144; c=relaxed/simple;
	bh=90qi8fWxM1Bs9HINt8y+fri3O1GINnSZ+60me1bYPZg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=johwYwtFNn/YxpESWiDhsGh5wUri3evT8RL+2rm2/bdHPhkUQbAteeAz7v0xIkIJ8xvNfAC2ucNBAtXxEqRQrIO5IysUAiBUPaWmRS/q7bBe4UEp993IT64zP1U7N/hrIYipA+alL9P8pfnd62BPOls4R91+F4kKNAN6NoFfB8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cCy6F3db; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06AE8FF805;
	Mon, 13 May 2024 07:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715585133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3iN0ItRZDrnSlN4ReBOmK3jB09/b+zxkMx2rwDWFhp0=;
	b=cCy6F3dbOTlV7pzWtlwoZ44WYFXoU2cAF7OG54Sc0QLZlnlGdhfHRvYqZvFzxYGjujiUdd
	nQMhXPhZvumnfIkPQX0/ZrFylRcn46YaJGRJVqp652RjQLRG3da0gI6o5MdCsINxr97hcw
	lihvuOARiHJcz9HqMhPW++79zSKHs0OPOpgwmTCBon18G8sOmK8wAc+bonYwEXXrOakIti
	2mZHmm/x873gCXflMPdJJbhmybgoZOR5BGt9+II4f+ax6EkdwN2lVsUDQFqprigpmRoUvX
	0ku1un7VeG7ZvTmlOoomwYrb4SczoLhLhHPCJJ9fOI/4At6FnuuZ4IR5fe0Gxg==
Date: Mon, 13 May 2024 09:26:12 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Simon Horman <horms@kernel.org>
cc: Romain Gantois <romain.gantois@bootlin.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Geert Uytterhoeven <geert+renesas@glider.be>, 
    Magnus Damm <magnus.damm@gmail.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Jose Abreu <joabreu@synopsys.com>, 
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
    Russell King <linux@armlinux.org.uk>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, 
    Serge Semin <fancer.lancer@gmail.com>, 
    Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-renesas-soc@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, 
    "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
    Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v6 4/7] net: stmmac: introduce pcs_init/pcs_exit
 stmmac operations
In-Reply-To: <20240511181119.GU2347895@kernel.org>
Message-ID: <64f188d8-9336-2578-fb47-ce6ff615acab@bootlin.com>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com> <20240510-rzn1-gmac1-v6-4-b63942be334c@bootlin.com> <20240511181119.GU2347895@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-GND-Sasl: romain.gantois@bootlin.com

Hello Simon,

On Sat, 11 May 2024, Simon Horman wrote:

> > -	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> > +	if (priv->plat->pcs_init) {
> > +		ret = priv->plat->pcs_init(priv);
> > +	} else if (priv->plat->mdio_bus_data &&
> > +		   priv->plat->mdio_bus_data->has_xpcs) {
> >  		/* Try to probe the XPCS by scanning all addresses */
> >  		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> >  			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
> 
> I am unsure if this can occur, but if priv->plat->pcs_init returns 0 then
> xpcs will be used while uninitialised towards the end of this function.

Indeed this could occur, I've just sent a v7 that fixes this.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

