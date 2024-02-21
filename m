Return-Path: <linux-renesas-soc+bounces-3030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20085D3D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 10:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2836D1C2266E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 09:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511923D38E;
	Wed, 21 Feb 2024 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OJiEUiYW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000E03D39A;
	Wed, 21 Feb 2024 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708508390; cv=none; b=HyM3CgWmyXvD/fJfJaCwyJa07wmWNjEPutp3YtagYkUsdAzC3EACRKCu/sP1LRoycpN2YKTnBFiWGZh4+/E6w6SlXX54IfyIVhju2lBb4nqqaDn8/xttyMDpM/hUMQInkFkupEj5GdxVX5ulwK3qvYDlKcnIJDf2O+wf2x32siU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708508390; c=relaxed/simple;
	bh=/LiR59cdT7x9aBHEIvBXkoWV3hpSjN1Z6Ja+DO3v9Zc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WIBChv9LyyoV+RsGip34mzwPUkr/qzmb1yPGSfTjVbRKvXAZ/0tY6YFuKNa1DuK5qwczLPG9UJpvl99TxfiiFG+WO+EaGaAy7e7vgZnEEOmbxsO9IIuYRqiObgM6YDI4q1Snz/wJ65oNOnItsaD5RDVyy+t2jQ1rxGHy9hc1Wds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OJiEUiYW; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D2CF24000D;
	Wed, 21 Feb 2024 09:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708508380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xr1h5K30G9MBY/JWOVj85ZQBdVlWSBtQJRX0YVGUwUU=;
	b=OJiEUiYWioWWVy7fpqJv/3WVpgZDBbegcbSmaG4Vm34r0L7mR1K6SgLIiMIYpK9Pcs1iiV
	22A26aitmZoSfA58c8LK37aXF36sli8Ho7vQushhwJRWseNe3tv6rY9SJl/otDqLGVvj1F
	mOyIL7jv8KQKbrZotC9sLIZnunnb1vKIGrx8NuFJuEIKCty43XsOH/6VFLzIPzSRDC/ndD
	3sTjT1yuTOznavogBz4bFwe1qvEvrNiqv9VVkpa5Q1zVL69izNF649QNMQuITL2X918AFo
	SkoumL/Z8whT/v0o1J1ZrdIhbzIsDJyMbdMkvRBEjgySLWBoXFb7r2cXCZD+QA==
Date: Wed, 21 Feb 2024 10:40:06 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
cc: Romain Gantois <romain.gantois@bootlin.com>, 
    Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
    Heiner Kallweit <hkallweit1@gmail.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Jose Abreu <joabreu@synopsys.com>, 
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, 
    Miquel Raynal <miquel.raynal@bootlin.com>, 
    Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v3 7/7] net: pcs: rzn1-miic: Init RX clock early
 if MAC requires it
In-Reply-To: <20240212185332.2ebf2935@device-28.home>
Message-ID: <cc90a3d2-4a6a-7274-4ede-cf6ff2f9db17@bootlin.com>
References: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com> <20240212-rxc_bugfix-v3-7-e9f2eb6b3b05@bootlin.com> <20240212185332.2ebf2935@device-28.home>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-GND-Sasl: romain.gantois@bootlin.com

Hi Maxime,

On Mon, 12 Feb 2024, Maxime Chevallier wrote:

> > +static int miic_pre_init(struct phylink_pcs *pcs)
> > +{
> > +	struct miic_port *miic_port = phylink_pcs_to_miic_port(pcs);
> > +	struct miic *miic = miic_port->miic;
> > +	u32 val;
> > +
> > +	/* Start RX clock if required */
> > +	if (pcs->rxc_always_on) {
> > +		/* In MII through mode, the clock signals will be driven by the
> > +		 * external PHY, which might not be initialized yet. Set RMII
> > +		 * as default mode to ensure that a reference clock signal is
> > +		 * generated.
> > +		 */
> > +		miic_port->interface = PHY_INTERFACE_MODE_RMII;
> 
> There's this check in miic_config :
> 
> 	if (interface != miic_port->interface) {
> 		val |= FIELD_PREP(MIIC_CONVCTRL_CONV_SPEED, speed);
> 		mask |= MIIC_CONVCTRL_CONV_SPEED;
> 		miic_port->interface = interface;
> 	}
> 
> As you set the interface to RMII and set the CONV_MODE below without
> really looking at the speed, is there any risk of a mismatch between
> the configured mode and the speed ?
Good point, it is probably necessary to set the default RMII speed in 
miic_pre_init(), since miic_config will not do it if the link mode hasn't 
changed in the meantime. However, this is only an issue if the link isn't 
already up when miic_config() is called. If the link is up, then that means that 
miic_link_up() has already been called and has set the appropriate speed anyway.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

