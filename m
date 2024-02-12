Return-Path: <linux-renesas-soc+bounces-2649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F98851C2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 18:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21AEE1C2105E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 17:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54ED23FB30;
	Mon, 12 Feb 2024 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wf+FWb25"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3114BA9A;
	Mon, 12 Feb 2024 17:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707760436; cv=none; b=s29ZQDcm6v2977+QTbcEqcF+h3M/gi5+EQX/VvVZ8SAYHTJaVOKyBcd8Rc8g5izq8yKU6y4F4UEjOZUHerVTpEx63ohY5vQp+GCAknJoQUcM7Rghz2RR1YyPXnzWNfXmWP2x+/etegGCO1olG60u1XUSkeKPEop0kHmkXTqZhXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707760436; c=relaxed/simple;
	bh=HE4qoCMkNfCr8Tzigwiyj/kHZUGmLMZiIb/PxPu6nS0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f96puQ0pjICOawPv7Y2heK1jFY292OTDO5epoWDz7xFEzvt9Bm6z4ZjD1IZMHfQLhdhDPz0ZC44CWiBFCb6R3zLxXKJ3J9ezO9LJpSIxbVcPYbbi1zXIpLfybRQGjxDer/XkYeTx10AQga6awdUYoxEaaKVYcxQyFZdD+xebUpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wf+FWb25; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F233C0005;
	Mon, 12 Feb 2024 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707760424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gU11AbgjtFz5RC8B4oWWKuN/o3wR/cYTDZ0PY2ujtQ=;
	b=Wf+FWb25cxP3y/kxWLOxq/1UDuAUYDpVbftVo/1d1BRY46DHlcaXRJVoYy0Ij6Fr1T16Mr
	mJq6/1RYBo/fJjjWoFvnhBoqTtYdmcQ35phNdfZ15RtlTJ4MY2BtcLhLLRM7RCTavQVnbO
	LoXbd5LEeRXPEDPQxMXpX6a9zZ6e3KvTj3TTn/f+WPkQiEDvtU2H7DhHaKi6riC2p+50oi
	XuUyw97uMmPC6l5Wj3WRsIpBrZw4ljluorhRI1KUhg/z9qNWgxExwoewyplm6UhWmnMLaZ
	AYXcYAYgZz38l9Ba67MTO6if0nBxVZ52ph57tGMHTP/EX+DcNePRKxRhys+PMw==
Date: Mon, 12 Feb 2024 18:53:32 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v3 7/7] net: pcs: rzn1-miic: Init RX clock
 early if MAC requires it
Message-ID: <20240212185332.2ebf2935@device-28.home>
In-Reply-To: <20240212-rxc_bugfix-v3-7-e9f2eb6b3b05@bootlin.com>
References: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
	<20240212-rxc_bugfix-v3-7-e9f2eb6b3b05@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Romain,

On Mon, 12 Feb 2024 17:42:14 +0100
Romain Gantois <romain.gantois@bootlin.com> wrote:

> The GMAC1 controller in the RZN1 IP requires the RX MII clock signal to be
> started before it initializes its own hardware, thus before it calls
> phylink_start.
>=20
> Check the rxc_always_on pcs flag and enable the clock signal during the
> link validation phase.

It looks like this commit log doesn't match the content of the commit.

> Reported-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> Link: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-cl=
ement.leger@bootlin.com/
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index d93f84fbb1fd..b0d9736c678e 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -279,10 +279,37 @@ static int miic_validate(struct phylink_pcs *pcs, u=
nsigned long *supported,
>  	return -EINVAL;
>  }
> =20
> +static int miic_pre_init(struct phylink_pcs *pcs)
> +{
> +	struct miic_port *miic_port =3D phylink_pcs_to_miic_port(pcs);
> +	struct miic *miic =3D miic_port->miic;
> +	u32 val;
> +
> +	/* Start RX clock if required */
> +	if (pcs->rxc_always_on) {
> +		/* In MII through mode, the clock signals will be driven by the
> +		 * external PHY, which might not be initialized yet. Set RMII
> +		 * as default mode to ensure that a reference clock signal is
> +		 * generated.
> +		 */
> +		miic_port->interface =3D PHY_INTERFACE_MODE_RMII;

There's this check in miic_config :

	if (interface !=3D miic_port->interface) {
		val |=3D FIELD_PREP(MIIC_CONVCTRL_CONV_SPEED, speed);
		mask |=3D MIIC_CONVCTRL_CONV_SPEED;
		miic_port->interface =3D interface;
	}

As you set the interface to RMII and set the CONV_MODE below without
really looking at the speed, is there any risk of a mismatch between
the configured mode and the speed ?

Thanks,

Maxime

