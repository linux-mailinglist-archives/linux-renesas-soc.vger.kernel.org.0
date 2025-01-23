Return-Path: <linux-renesas-soc+bounces-12396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE2A1A5D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 15:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 352CE1697DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 14:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DDD20F97F;
	Thu, 23 Jan 2025 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ag6tYhJn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBC11CA8D;
	Thu, 23 Jan 2025 14:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737643105; cv=none; b=Y9kbahFErKoVJYY1BAJjpbL5eBjDO08GByRU9j56t+ZRxXjJPEnvgAe8IV2UW6IUwXDE9GOgrX01Qadkp/SkaRDw/Qt/kdmTg5bqnL7Qv11yZs0yFzeEHONTEjZwpPeiW3SDcNcvJBEjxw/yOUl1n7RC4xyo6y26rHl3ak1Rfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737643105; c=relaxed/simple;
	bh=87JlTBQepoGOvxHQwv6teUuQgawFORdI/vb2V4SMbZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kePCn3gE/Gr35Ktg7aWAWPsllQcsJUhKTeH+vB1JipfbT4YMDeLoINxtOtVK3x2RG31uJjKMskPlfI6O8O/SE8DIlmynAAqbqIcthA2cKy/nALCD7d0eEDQ/JpGRmD3whzg+xGjBpqRPmeDnnSCr5d7IpZLr2fdn338Rus4faWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ag6tYhJn; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7432A1C0004;
	Thu, 23 Jan 2025 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737643101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFuxqFuP+ftoKRayLGCrGBhAvOZt/OEF+ZuARfI9ydo=;
	b=Ag6tYhJnqSciWy5plm55iGnBgcnNW2pb/H6+bk127KtyZELMHX65jlfOJP99pYn0A51ZmX
	akmKrp7bQLmB/zCyKwIuLn0EKsB82b0VTLskmpTT+WwHexFqAGZCjhivWbq7HOCGVUl/qg
	DYEDe8xob9bZ0k7O5ahZzLyp0eoaQjTI5OdccvsvLd8qIwUP2n+PewTfDqthGKWQKdZYlf
	oTjboeB7dc2c1DxvTL836lIvJXddhE00VpoeaLiw0vQuAfiknKd1/M8iOcyxMfIgSsZ8iF
	nB7Kco2zu8WUuls6OOmH0hhIWItgKH18A405vZeJOGvgpM+ENEuhJSF7YDfJIw==
Date: Thu, 23 Jan 2025 15:38:17 +0100
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
Message-ID: <20250123153817.398ee16f@kmaincent-XPS-13-7390>
In-Reply-To: <cdf4e312-92bc-44f3-a049-bd3ddf3222e1@tuxon.dev>
References: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
	<20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
	<806d2df6-68d3-4319-8ce6-7049563508cf@tuxon.dev>
	<20250123150814.6c46ec9a@kmaincent-XPS-13-7390>
	<cdf4e312-92bc-44f3-a049-bd3ddf3222e1@tuxon.dev>
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

On Thu, 23 Jan 2025 16:17:58 +0200
Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:

> On 23.01.2025 16:08, Kory Maincent wrote:
> > On Thu, 23 Jan 2025 13:33:30 +0200
> > Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> >  =20
> >> Hi, Kory,
> >>
> >> On 22.01.2025 18:19, Kory Maincent wrote: =20
>  [...] =20
> >  =20
> >>
> >> I've test it. Looks good.
> >>
> >> Thank you for your patch. However, I think this could be simplified. T=
he
> >> locking scheme looks complicated to me. E.g., this one works too:
> >>
> >> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
> >> b/drivers/net/ethernet/renesas/ravb_main.c
> >> index bc395294a32d..cfe4f0f364f3 100644
> >> --- a/drivers/net/ethernet/renesas/ravb_main.c
> >> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> >> @@ -3217,10 +3217,16 @@ static int ravb_suspend(struct device *dev)
> >>
> >>         netif_device_detach(ndev);
> >>
> >> -       if (priv->wol_enabled)
> >> -               return ravb_wol_setup(ndev);
> >> +       if (priv->wol_enabled) {
> >> +               rtnl_lock();
> >> +               ret =3D ravb_wol_setup(ndev);
> >> +               rtnl_unlock();
> >> +               return ret;
> >> +       } =20
> >=20
> > What happen if wol_enabled flag changes it state between the rtnl_lock =
and
> > the if condition? We will be in the wrong path. =20
>=20
> wol_enabled flag can't change in this suspend phase. The user space tasks
> are fronzen when ravb_suspend() is called.

Oh ok, I don't now the suspend path but if it can't conflict we can got for=
 your
proposition.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

