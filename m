Return-Path: <linux-renesas-soc+bounces-2023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34956842646
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 14:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B93E4289AD1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 13:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407206BB4E;
	Tue, 30 Jan 2024 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LrKfnFVs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EA166B51;
	Tue, 30 Jan 2024 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706622016; cv=none; b=l/RSZZTwr/8S9111sKqQbR930CqieTM59S5LJTaIeB8hxqVUSAx3WJCWBleituZ+Cs5KUv3POn4g+5f1oR7KDk9OFhw8d2jkEucSVXnrfqgph6Z+Sjk/5+P3jRy0a/8frEch6SriOat7VrKe8x8dt/YD1bA1I49zS8LMu7mcZrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706622016; c=relaxed/simple;
	bh=G9LEm9bshqz7RWavexvFMjjfPjpGFNeDdMRx5fScUkI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jP42Ii4AQmAIEyI+EDLuO7ijSyXiU7UnWmHIbLgIHyW4S0SU6wKMKex+JqbYD1u/Hc8ibkmrjC/17Y12ANuv3PcrN8yt0r81PVackJcPSAjraak2YIb+5myY1Bkptf7F7viAmN9pdcTjSLjA9lH3+eZFBTxfbBqzAALDDxInkns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LrKfnFVs; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB1221C0005;
	Tue, 30 Jan 2024 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706622010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3wtrD2uoXhVlXOQf9qkwgkVdNZsFSpbdjrR4OR46j4=;
	b=LrKfnFVsBIoEn/8B5X8Q4FrVyf8P3XnWHnYRgT04wSxgpV6el0DMo9SCrOYyuTlNWRy9F6
	HiMifCO0TYFOfj1nXd7yppKz47BmgspAYw26tmMHKIroClhx4tqd94/B2C7y1n9iIs7nM2
	5AhD1nOEdr729xRmPWHdrlVN+0yjF3PF3u4ih5/SG2gfgZTc7l46mgcAWQ2OhaNeJMiwJd
	hJmhwDRxnp3iwd88Jqru9WGzBoBTH1yEWeMs6ITKE79IvuRZtRyQzWckvB5Qid55y+yUrd
	ZCfiUJZfROj1ZhBBYxDvSMdZQrem47kgWHWsZX5uxyP+SYZu1LypAurOGVhPyw==
Date: Tue, 30 Jan 2024 14:40:31 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
cc: Romain Gantois <romain.gantois@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
    Heiner Kallweit <hkallweit1@gmail.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Jose Abreu <joabreu@synopsys.com>, 
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, 
    Maxime Chevallier <maxime.chevallier@bootlin.com>, 
    Miquel Raynal <miquel.raynal@bootlin.com>, 
    Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/7] net: phy: add rxc_always_on flag to
 phylink_pcs
In-Reply-To: <ZbjLN+FzBSohg1c2@shell.armlinux.org.uk>
Message-ID: <3e1617d8-b8c9-64d6-030d-5b6781544692@bootlin.com>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com> <20240130-rxc_bugfix-v2-2-5e6c3168e5f0@bootlin.com> <ZbjLN+FzBSohg1c2@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-GND-Sasl: romain.gantois@bootlin.com

Hello Russell,

On Tue, 30 Jan 2024, Russell King (Oracle) wrote:
...
> > +int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs)
> > +{
> > +	int ret = 0;
> > +
> > +	/* Signal to PCS driver that MAC requires RX clock for init */
> > +	if (pl->config->mac_requires_rxc)
> > +		pcs->rxc_always_on = true;
> > +
> > +	if (pcs->ops->pcs_pre_init)
> > +		ret = pcs->ops->pcs_pre_init(pcs, pl->link_config.interface);
> 
> Given that:
> 1) phylink supports switching between mutliple different interfaces,
> 2) from what I can see you are only calling this from stmmac's
>    initialisation path,
> 3) you pass the interface mode to the PCS here
> 
> then we don't want the PCS to configure itself for the interface mode
> passed in, because this function won't be called when the interface
> mode changes - and PCS driver authors will have to bear that in mind.
> So...
> 
...
> However, do we really need it - if the PCS is supplying the RXC to
> the MAC, then is the interface mode between the PCS and PHY all that
> relevant at this point?

If a PCS can set the needed clock signal without configuring the details 
of a particular link mode, then passing the interface mode to pcs_pre_init() 
would indeed not be relevant. Generally, I agree that setting the interface mode 
shouldn't be the concern of the pre-initialization function. I'll dig a bit 
more into the PCS datasheet and run more tests to see if I can get away with 
enabling the RX clock selectively for this particular PCS model. If not, then 
maybe I can hardcode a "default" interface mode for the pre-initialization that 
will not interfere with the rest of the link setup process.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

