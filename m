Return-Path: <linux-renesas-soc+bounces-1276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF328230BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 16:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89B39285B83
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 15:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5273A1B270;
	Wed,  3 Jan 2024 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dnwFiQ8z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81C1B268;
	Wed,  3 Jan 2024 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E18B8FF811;
	Wed,  3 Jan 2024 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704296726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IWjkiu+Pn7NSDSot/BDX4VO1c88sUMIDcvmCdxNCc2o=;
	b=dnwFiQ8z9oNvUtQevzNXWb9RtQCaxMbcs8LC/XVnb2Yn+ucN6HP/mYzEDfyF1iGn2gOs1j
	hRj/WlrUINF8U5SsNiY9h5Ox3SppS9zCQsCkz3Iijr6ATYQQNPEi0kn7zc0/MYGpo6EXTB
	bygE7iVp73Ew8ybVHZu/bLbCgfN6KGdM/kVYsx0k4ZGfMbByXztgzaAlSL+YuzaXDKiJJ5
	Drh8v/js8uUfffKGYnpZ00GSCSIvYKP5jA8oLg6MZUPIUpJffsCfQaVulgjbyv8VzKd0xY
	yPJMD3iD7EAQQkLR+A0fNjPMGqg76lSutfu7bkyQDe3NuXGNlbKCaVIluI5fAw==
Date: Wed, 3 Jan 2024 16:45:48 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
cc: Romain Gantois <romain.gantois@bootlin.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, 
    Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, 
    Marek Vasut <marex@denx.de>, Clark Wang <xiaoning.wang@nxp.com>, 
    Miquel Raynal <miquel.raynal@bootlin.com>, 
    Sylvain Girard <sylvain.girard@se.com>, 
    Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net 5/5] net: pcs: rzn1-miic: Init RX clock early if MAC
 requires it
In-Reply-To: <ZZV2s/TGKanl76TI@shell.armlinux.org.uk>
Message-ID: <7712bd49-3827-636c-ceff-998b37cc2738@bootlin.com>
References: <20240103142827.168321-1-romain.gantois@bootlin.com> <20240103142827.168321-6-romain.gantois@bootlin.com> <ZZV2s/TGKanl76TI@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-GND-Sasl: romain.gantois@bootlin.com

Hello Russel,

On Wed, 3 Jan 2024, Russell King (Oracle) wrote:
...
> Since the MAC driver has to itself provide the PCS to phylink via the
> mac_select_pcs() method, the MAC driver already has knowledge of which
> PCS it is going to be using. Therefore, I think it may make sense
> to do something like this:
> 
> int phylink_pcs_preconfig(struct phylink *pl, struct phylink_pcs *pcs)
> {
> 	if (pl->config->mac_requires_rxc)
> 		pcs->rxc_always_on = true;
> 
> 	if (pcs->ops->preconfig)
> 		pcs->ops->pcs_preconfig(pcs);
> }
> 
> and have stmmac call phylink_pcs_preconfig() for each PCS that it will
> be using during initialisation / resume paths?

Yes, that is definitely a much cleaner solution. I'll reimplement the PCS 
changes in this way.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

