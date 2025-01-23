Return-Path: <linux-renesas-soc+bounces-12430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 265CDA1A8F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BA3B7A482D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40207142E9F;
	Thu, 23 Jan 2025 17:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LqF1W+bs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3004DEC5;
	Thu, 23 Jan 2025 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737653652; cv=none; b=lZZAohwun4MLSXodwGenxHQ8Lk7YNSQizYs+6VnmQDyXWnUDle/0YKHLK8WFIYVrsidHUBvKH5Gv2t/8zZEctsWNUyEvCj36/qIWCqi3Ku35fuTK7Z75TSakisitYlRNQ6FWj8/XjXlZALVA9BkWSXRNfzNmhjFjZxaHLSOg2C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737653652; c=relaxed/simple;
	bh=kaPRzjjQYMWFZhtoj/1Un3wM8LD1wJDUj259OrKeXJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aJZPbCXT/X3SwfWimHrU1lJ6lhaaK268HFLAPpaIBmU/7o0+MF5Mq84A95p6AX314/VOCfATIOkga4HvQZeIG/irKoplBca3d6aY5AJgi2vyFkNRCBUpm54JEwGef7SzC1f7CQACT3Pm4I1m+jaFqtzEG4DM424A/kxAt3i1uSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LqF1W+bs; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCDA640007;
	Thu, 23 Jan 2025 17:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737653641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIhyFrvgufOBRDk5pPK33nsAdZ0l2MEWOeRkXJJbqlY=;
	b=LqF1W+bsA0i3QmonY2GBHbow+Gb3otweMGpoV9p4WHcUqBB/EgO2U4hdBP1Wd8DJrFsQDl
	IV8tIMkQuMMl3MNBXvaHK5Xqq2zOFLputtj0KO9dWbaiEi2uMxsjxzipW1uVFueoMjj2QA
	6Jy36N2KzoVrIla1Ic2ZZtpshrDz1dTgI0AOFRk+mIKF9ySE2sWKpSDKRRCPO9mEvhiJjI
	77vRjqfIxh91lFfSwjxabmPlsC/2j2Vnb/gzOxjRaU2QeteV4cYvFcjt9c5eX/a2rX9ury
	9t3OmFuBwpdfKgB2T+ogN+P+n5Ue2xlXx/LgJ92q4suP98IxQTuq1rFZjB/luw==
Date: Thu, 23 Jan 2025 18:33:58 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Mikhail Ulyanov
 <mikhail.ulyanov@cogentembedded.com>, Sergei Shtylyov
 <sergei.shtylyov@cogentembedded.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey
 Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH net v2 1/2] net: ravb: Fix missing rtnl lock in suspend
 path
Message-ID: <20250123183358.502e8032@kmaincent-XPS-13-7390>
In-Reply-To: <e39ac785-9d4e-43d1-9961-d6d67570ff49@bp.renesas.com>
References: <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-0-e6206f5508ba@bootlin.com>
	<20250123-fix_missing_rtnl_lock_phy_disconnect-v2-1-e6206f5508ba@bootlin.com>
	<e39ac785-9d4e-43d1-9961-d6d67570ff49@bp.renesas.com>
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

On Thu, 23 Jan 2025 17:23:11 +0000
Paul Barker <paul.barker.ct@bp.renesas.com> wrote:

> On 23/01/2025 16:58, Kory Maincent wrote:
> > Fix the suspend path by ensuring the rtnl lock is held where required.
> > Calls to ravb_open, ravb_close and wol operations must be performed und=
er
> > the rtnl lock to prevent conflicts with ongoing ndo operations.

...

> > =20
> > @@ -3247,7 +3253,9 @@ static int ravb_resume(struct device *dev)
> > =20
> >  	/* If WoL is enabled restore the interface. */
> >  	if (priv->wol_enabled) {
> > +		rtnl_lock();
> >  		ret =3D ravb_wol_restore(ndev);
> > +		rtnl_unlock();
> >  		if (ret)
> >  			return ret;
> >  	} else {
> > @@ -3257,7 +3265,9 @@ static int ravb_resume(struct device *dev)
> >  	}
> > =20
> >  	/* Reopening the interface will restore the device to the working
> > state. */
> > +	rtnl_lock();
> >  	ret =3D ravb_open(ndev);
> > +	rtnl_unlock();
> >  	if (ret < 0)
> >  		goto out_rpm_put;
> > =20
> >  =20
>=20
> Please remove Reviewed-by tags when making changes like this in a
> subsequent version of a patch series, this is no longer the patch I
> reviewed.

Oh, sorry for that!

> I don't like the multiple lock/unlock calls in each function. I think v1
> was better, where we take the lock once in each function and then unlock
> when it is no longer needed or when we're about to return.

You will need to achieve a consensus on it with Claudiu. His point of view =
has
that the locking scheme looks complicated.

On my side I don't have really an opinion, maybe a small preference for v1 =
which
is protecting wol_enabled flag even if it is not needed.

---
pw-bot: cr

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

