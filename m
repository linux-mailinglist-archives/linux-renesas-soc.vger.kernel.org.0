Return-Path: <linux-renesas-soc+bounces-12552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA9A1D477
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 11:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C9A17A20EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 10:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9641FCFE5;
	Mon, 27 Jan 2025 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="clfIuDvp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1751FDA6F;
	Mon, 27 Jan 2025 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737973743; cv=none; b=QYfCXiMo2+StCTF9+F/2jHw1C2fPraVfGWlFoapwO6wb8oVZM2Zx3lztxXxm/4tlUP1tmM684wTAqL/bmkwpL93zzgj+XSDWICjGvWKz5lMBzroPRqW8TS8cy/yega8ow+tsZ/eF0mt61ovXTUCpA5Pe6xp/qtbJoaUV/jYFNwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737973743; c=relaxed/simple;
	bh=3dGh5aicqxXpGqYawX4jj7PGnHHREJ1ehE0lRjq0iLE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQKHW+6KmlZT0XclqgH9X0ds6NXaaJew8RlyhNgwoy2ek0mhDMKp5RNct1WRqs9iXMq7Zw9r4AW/HCfvcj/OU1DgJV4HO53YILvXiKVv0++q38/XfoWcHUYI1m/e3w48PVoiFDsK5uqyCmHaqPmPXkKA3mUDVhdXJzvVkg9ivPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=clfIuDvp; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 984DD40003;
	Mon, 27 Jan 2025 10:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737973732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClRoqS46FR93YUeQi/B1Mhyf/pz5HzAgn+iqWYgRebM=;
	b=clfIuDvpl2eeKAwrLnf9sOqKKWdpBanLB+VV2QBDQymTtthGH2DldSskJWGFyAniyJjgrD
	Vwyk4NtG0AoxlNCMJnDGs3y1aYxk+EcZ7UxcHs9Au6q+61GsSk198fTe2bNy46bBvtGtRU
	KjCkdsWpXY6Zqr+adE8CzE0f0dDWZ2vW1SKzUhq/JDrF/IPYuM4cP83ly585/5aEQRepZG
	kEpsd7/16unCrOrl26hf6LgyzzzPhX6MorafssJ3lkpj9dsRN2oJNPngWHl2Rfyy+SqQ0r
	rhwzHuaDaZV+h9s8o9i1Fxbo49WygyxsK+g6SwmhJ36KPzQ/NrfglpY4N5VO/A==
Date: Mon, 27 Jan 2025 11:28:50 +0100
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
Message-ID: <20250127112850.05d7769b@kmaincent-XPS-13-7390>
In-Reply-To: <20250123183358.502e8032@kmaincent-XPS-13-7390>
References: <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-0-e6206f5508ba@bootlin.com>
	<20250123-fix_missing_rtnl_lock_phy_disconnect-v2-1-e6206f5508ba@bootlin.com>
	<e39ac785-9d4e-43d1-9961-d6d67570ff49@bp.renesas.com>
	<20250123183358.502e8032@kmaincent-XPS-13-7390>
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

On Thu, 23 Jan 2025 18:33:58 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:
=20
> > > =20
> > > @@ -3247,7 +3253,9 @@ static int ravb_resume(struct device *dev)
> > > =20
> > >  	/* If WoL is enabled restore the interface. */
> > >  	if (priv->wol_enabled) {
> > > +		rtnl_lock();
> > >  		ret =3D ravb_wol_restore(ndev);
> > > +		rtnl_unlock();
> > >  		if (ret)
> > >  			return ret;
> > >  	} else {
> > > @@ -3257,7 +3265,9 @@ static int ravb_resume(struct device *dev)
> > >  	}
> > > =20
> > >  	/* Reopening the interface will restore the device to the working
> > > state. */
> > > +	rtnl_lock();
> > >  	ret =3D ravb_open(ndev);
> > > +	rtnl_unlock();
> > >  	if (ret < 0)
> > >  		goto out_rpm_put;
>
> > I don't like the multiple lock/unlock calls in each function. I think v1
> > was better, where we take the lock once in each function and then unlock
> > when it is no longer needed or when we're about to return.
>=20
> You will need to achieve a consensus on it with Claudiu. His point of vie=
w has
> that the locking scheme looks complicated.
>=20
> On my side I don't have really an opinion, maybe a small preference for v1
> which is protecting wol_enabled flag even if it is not needed.

Claudiu any remarks?

If not I will come back to the first version as asked by Paul who is the
Maintainer of the ravb driver.

Sergey have asked to remove the duplicate of the if condition.
Paul is this ok for you?

@@ -3245,19 +3250,21 @@ static int ravb_resume(struct device *dev)
        if (!netif_running(ndev))
                return 0;
=20
+       rtnl_lock();
        /* If WoL is enabled restore the interface. */
-       if (priv->wol_enabled) {
+       if (priv->wol_enabled)
                ret =3D ravb_wol_restore(ndev);
-               if (ret)
-                       return ret;
-       } else {
+       else
                ret =3D pm_runtime_force_resume(dev);
-               if (ret)
-                       return ret;
+
+       if (ret) {
+               rtnl_unlock();
+               return ret;
        }
=20
        /* Reopening the interface will restore the device to the working
state. */
        ret =3D ravb_open(ndev);
+       rtnl_unlock();
        if (ret < 0)
                goto out_rpm_put;


Note: Sergey, I have received your mail as spam.=20

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

