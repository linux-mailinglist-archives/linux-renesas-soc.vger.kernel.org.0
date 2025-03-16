Return-Path: <linux-renesas-soc+bounces-14427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F37A6344D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 07:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D6A81895975
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 06:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC9A1448E0;
	Sun, 16 Mar 2025 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cDPCaFi5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E4EA933
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 06:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106373; cv=none; b=Wo7IuEjC0E1J3J5sam46z6lzYMkhkXBEgMrXkdX7XQ9VN9115+yD9eNJ+XQX9vzT0IU/3n80Marftv+mEwm5L/HSUr6n4W5qXSiOScetaEiux0ec6ScXif6tfYgnsN8hxfAU+3KnodfPJk+YpXtHkV8N3A1RPRtAQlnGwJ+tmzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106373; c=relaxed/simple;
	bh=7OWY7bLnKXwF41G1Et/cpvKrKdeIj/r/n7tTweHyFBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIK2OQ0zNxa8sI38TMwKDO87eTpZg9ZQZjJJwHk9VQakRmBMK8ZMDACTlicfGcVqSrTRy295CjfefymzzLEdN/IkN6Ugg8SLXMgD9ZXvh0BtCWe2cLpTveNYrrsw6ZXdG4BnaDXcCedr+u3R6PVO/HLKoPVwpHs26cEhZ0Qu/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cDPCaFi5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GFMu
	I/i8RqHZ5FxcHveqpSf7m+TSCq0zAHS3qDWrPtQ=; b=cDPCaFi5oRyjBPSDvR4V
	sQ3HDuXhnzqwFS5KHPj8t9ZZXjprjLG9VqywlQuEvBliqg03lN4C9so2N9pzb1Bo
	Ws8GLgQpGhE/iz91cIBHLN4iGfD1genKNervXZ3kyR5J67YKF2zBwnnbhCLGzu3K
	IGSN3fsfAOWVtV3k/UMvv0R8eBNBJu6+kdb7nmHf0tTzodpZbxIHUXxU+LNll2zm
	s0PI5upGGSmzoNgJtXFQ9/v8VIu1Jf8+Ah2QR5fGv91/vnAWPCei85bS3wOKu/+9
	8/4xmqsU+vyFd7XQLC8EWMDJ8VWnP4icCRjlauwO9bsJUAmlhklYaGWHeCdO7EEK
	iA==
Received: (qmail 2597127 invoked from network); 16 Mar 2025 07:26:08 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2025 07:26:08 +0100
X-UD-Smtp-Session: l3s3148p1@uBs6v28wdqMujnuL
Date: Sun, 16 Mar 2025 07:26:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFT v2] drm/bridge: ite-it6505: make use of debugfs_init
 callback
Message-ID: <Z9Zu_5K0DK_egHl4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-renesas-soc@vger.kernel.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
References: <20250315201946.7428-2-wsa+renesas@sang-engineering.com>
 <xd3purmdhn34guhconvpuvw5n7nfhkt2vg4c3pdyn6f4ksgu25@ssxzqbysngww>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gi+Ru5WAH0A/Pp90"
Content-Disposition: inline
In-Reply-To: <xd3purmdhn34guhconvpuvw5n7nfhkt2vg4c3pdyn6f4ksgu25@ssxzqbysngww>


--Gi+Ru5WAH0A/Pp90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	struct dentry *debugfs =3D debugfs_create_dir(dev_name(it6505->dev), =
root);

I will switch away from dev_name() here, too, of course.

> >  	int i =3D 0;
> > =20
> >  	while (debugfs_entry[i].name && debugfs_entry[i].fops) {
> >  		debugfs_create_file(debugfs_entry[i].name, 0644,
> > -				    it6505->debugfs, it6505,
> > -				    debugfs_entry[i].fops);
> > +				    debugfs, it6505, debugfs_entry[i].fops);
> >  		i++;
> >  	}
> >  }
>=20
> Ni: I'd say, it's better to move this function rather than moving
> it6505_bridge_funcs. LGTM otherwise.

I started like this but it meant to move all the sysfs file ops code as
well. That was quite a chunk. You still prefer to do it?


--Gi+Ru5WAH0A/Pp90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfWbv8ACgkQFA3kzBSg
KbYiLxAAn9YPNDFZFYK0QZmdbFcSR22jvw0IWSEBqt/PWANMQISynMS0xgv567i+
E9O9bc8Dc7h5wxFs1D1A7odCcnpNRMUhR78jKrBnHiBMMptcdW1hr9NcRbf3jqdz
Dw0PSi2u37lLP2EmvZMRyuothJvlMFSHEFNCQpup4+tVn6cSw0vsJZTtS4U1XAqH
wQx9d2FrRVyw/j3NrdVDbKAnIMG19cCKB5E9/WRFZuyl59ZOHPgFgEiVs5fPp1Dz
SCByrzp6ZTL1AnEa6gR4PiN0CnOf5uwE+acoOIGJpNLldYboZ/Kow2V6jgAtmmuU
U/gFfv0EZY+wBO5YpQNWZ/c/mzzcrJSNdDfUDRsJdLVWkmKF3bNpZZbKuSXWK9uz
s0d6+pPH2XHA3HwZOOmKgSImoqWMPE5tBgjyhIl8VsN09LxI6o8L2XpSS4kaPHIL
xqdEJDsnTblHYxcnBLKtlIc/snSkzVkl3hNbzspCKX0EVkdDd8PGEk/Af85f7o6H
nNM9hSLpRcZdsmcC1jUSOw8Pm/ZcnTvBfFiaye/BwX7BeEk36epl5ywSYQc8+5DJ
rbWKKyA5V+k2jAEVDhjC2BBbMv+hTkaCIXArK67Su3k2FTQ7fSydGtSKNSGgZ27D
kNmmPYNpcYMfqRLBCjSlJVt7ASq8RbPIrxM/C5fFqvr8MXZGOWw=
=jSKA
-----END PGP SIGNATURE-----

--Gi+Ru5WAH0A/Pp90--

