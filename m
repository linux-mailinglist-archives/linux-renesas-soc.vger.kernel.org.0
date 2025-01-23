Return-Path: <linux-renesas-soc+bounces-12394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FD2A1A578
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 15:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E9731668E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 14:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608D220F976;
	Thu, 23 Jan 2025 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EBQNfVlN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002820F064;
	Thu, 23 Jan 2025 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641307; cv=none; b=CyR5KrHCg0YNM0A1MG/VzFVLIyBOoc0CTdJXOe9VNQvCjeo4B1Y9e8sTMsOVGVO4NqpK/0GiTql7IYgYUS3oigBbZdlvrj/KXhVw4netgwGI0j2gudbZY/Dw/z+SI+4ZjkAcZUCXmQVBvGHGNVqf07mW98y8ofmBc1YQuoV4w2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641307; c=relaxed/simple;
	bh=M6JxkSxEDxl4DwmjNDMA6kF/gm876jsYYcOeIsoiaoE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E3gGt+vj5w+AMdxPe9GB14b3vQOBVgD1vZMjH+vnL5DYGFDwcKSyHZWoRFiN2XuI7g1oatROa8KVnhbb0PDxhW+1QJ/tAEvv8No0lUVHGA+41cLVv5TmFRv0wfx8dKBEyvvp1jYP15NNRakWNWq2KXmL7bIeyjHBNQQpN9Zh4+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EBQNfVlN; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A07D824000C;
	Thu, 23 Jan 2025 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737641297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R0CPMiUMbSeJFEVTgaATxQx7OkNxoXe/Q8N/WfldAiM=;
	b=EBQNfVlN1d1marGVSZ+33PfclZi9mHpcsbeGw6qGYlwRxZZTONT6/WIUtmiwhxjah6FXij
	q4WAgRb+bK2a99mQcY0cNDhmA0rH/hoyrOGl+n/SnqF5a6T02prTl2Xx0xA8IT9K4Dzgaf
	R5QY3LPufwMVQZUCFweR470R2sgvEW2DzQ5Fi7Fang4fHimMNVNTMlTd8xAWu5x2I04IE7
	mXwBNU/i8Xw7PuxLtFUMe1fq17nr8Qr0AOczbmiknmb9PD67oagmkfQ4+pkQrryBUpbRUT
	qKQfehFF5GNYqilYaa+kwmc4obaToO1pIFYN5B8HopWg7ZHb+dTN7amZkqRvhw==
Date: Thu, 23 Jan 2025 15:08:14 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>, Niklas =?UTF-8?B?U8O2ZGVy?=
 =?UTF-8?B?bHVuZA==?= <niklas.soderlund@ragnatech.se>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Mikhail Ulyanov
 <mikhail.ulyanov@cogentembedded.com>, Sergei Shtylyov
 <sergei.shtylyov@cogentembedded.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: ravb: Fix missing rtnl lock in suspend
 path
Message-ID: <20250123150814.6c46ec9a@kmaincent-XPS-13-7390>
In-Reply-To: <806d2df6-68d3-4319-8ce6-7049563508cf@tuxon.dev>
References: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
	<20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
	<806d2df6-68d3-4319-8ce6-7049563508cf@tuxon.dev>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: kory.maincent@bootlin.com

On Thu, 23 Jan 2025 13:33:30 +0200
Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:

> Hi, Kory,
>=20
> On 22.01.2025 18:19, Kory Maincent wrote:
> > Fix the suspend path by ensuring the rtnl lock is held where required.
> > Calls to ravb_open, ravb_close and wol operations must be performed und=
er
> > the rtnl lock to prevent conflicts with ongoing ndo operations.

>=20
> I've test it. Looks good.
>=20
> Thank you for your patch. However, I think this could be simplified. The
> locking scheme looks complicated to me. E.g., this one works too:
>=20
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
> b/drivers/net/ethernet/renesas/ravb_main.c
> index bc395294a32d..cfe4f0f364f3 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -3217,10 +3217,16 @@ static int ravb_suspend(struct device *dev)
>=20
>         netif_device_detach(ndev);
>=20
> -       if (priv->wol_enabled)
> -               return ravb_wol_setup(ndev);
> +       if (priv->wol_enabled) {
> +               rtnl_lock();
> +               ret =3D ravb_wol_setup(ndev);
> +               rtnl_unlock();
> +               return ret;
> +       }

What happen if wol_enabled flag changes it state between the rtnl_lock and =
the
if condition? We will be in the wrong path.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

