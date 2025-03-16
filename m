Return-Path: <linux-renesas-soc+bounces-14428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F8A63464
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 08:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51DE03AE5C2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 07:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012EC1624C5;
	Sun, 16 Mar 2025 07:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bl6PgEg1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9BE2A1B2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742109008; cv=none; b=WizI+Gcwrda1OwdWONdRsBf8YrspX6sexy21T0JCVCaKiHayZzeLqwfuYj2ZNweL2tEhsMn8tXjgD/Y4ZFhdhY/ygXiLU05IvVaVwULhoYTHplmfRDc21A4R1nbc0qqL7L+336h0RcuY0l4KrtmW4NNR7wyxSTDw6h2RPcM8So4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742109008; c=relaxed/simple;
	bh=7Bt3Htz0T76ixuFa8Y3obzN5yDeY9iYAd3T2eHYBIhA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmOOGZcoJla2GMwix8vruZmQEfwIQHuk0A3kOtaDfKL6l2Gt5ERo/N4VyrkZrT9NvIC+U+7pFSfdntp8F9yGwwj7NMhzdFVTi0jTDOU1Cr8j0gW8CoOIjzxd6WAfU04++Z+TY6w+P4+MnSCKP5A2XjgczaLagrCzktDtGVDQxsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bl6PgEg1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7Bt3
	Htz0T76ixuFa8Y3obzN5yDeY9iYAd3T2eHYBIhA=; b=bl6PgEg1c98UjVJtsvcP
	/x8ofZ+DlGOMMPDVKXTiVYxcBd4ypoBrpKo+2MKkMqge7vAl/ctGxzpCnI2Divkq
	P74QxptuFfhnhEUXydXeax0/RJsAqbIyUAJjy8J/aG70yb1P+cgJ5yEQavwhm+yz
	8bGY0XYFIe2SAmz2Fc9bjfoP34ugWR6aTuYMmKv+Fp9qK9gnL1kvwlCKwl7zWKId
	CKPhBlkptuUcRUW62e6PFzsjGCM5B19oVna0BSznYBN9zKm6QaqWTn3Av9Z1OemW
	I2H67N1QsviIjCSRj6HMC0zQ01j3R9ZlSl6iI0WGRUKa5HhpBiMXiYaxZ/p7nh18
	Tw==
Received: (qmail 2607532 invoked from network); 16 Mar 2025 08:10:03 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2025 08:10:03 +0100
X-UD-Smtp-Session: l3s3148p1@v/9KXHAwqrQujnuL
Date: Sun, 16 Mar 2025 08:10:03 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
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
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
Message-ID: <Z9Z5S7ES8d7mjTsJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
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
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
 <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>
 <Z9ZuMzPS8dmQWe8D@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WIH0dino7qmZ6RwK"
Content-Disposition: inline
In-Reply-To: <Z9ZuMzPS8dmQWe8D@shikoro>


--WIH0dino7qmZ6RwK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> We don't have a practice yet. Keeping dev_name() was Doug's suggestion.
> But I like your idea better, so I will change to it. Thank you for it!

Just to make sure: there can only be one bridge, right? Because the
suggested name is not unique.


--WIH0dino7qmZ6RwK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfWeUcACgkQFA3kzBSg
Kba9AQ//XXCR8sK2z5UihUZZQS7uQDKev1Bx6x2O5Cu/iJkLndc5nTsbehxb38E9
ZvpQM3Kk+TgPpXZE+wbVfbZ/fOS/cgQttQhiDzPngStkOPeiBo2a80ZOD6kgf7Pa
iahUxOtWzGlYewbXboOYoV9EeeihAHSARkV0spDzCcjGk7+HcDFk5zgHfh00Wbnz
m2f1d71EtDOzu0H6FRzwOYmsyz9FBk2JdVNTgqog9gY08g2gr7LqDsMS1qi5kYL8
2SF847BxiBsUieJmpceuJb7NBS7Foetiwz0dpwfWEksVqad3xlSBpn11kvl2AJFv
FgOASHDVysEh4fV+Mp3EN7aUlxP7NtfVTqlR+QGirP7xfA8W6fB7qoLSmSu0on9k
ygaDeZrJVVzPHw2foALf9Da3OTdPl+IPA59Bh5n9OvdCqWiLQOGhhzoo7g2Hvf+/
6DSX4VqdmI6yLKMI5yJRFfGi15zYzL0vq8zyRd3QM6SvjuUHRZAKwAgFPpY/neYD
l144p/VBU7EXuH0pndhIQI2Nxp6tlJDH1QQ5cs8tHHafiT+aYzYBWdvjOTPiX1pt
4gsTLUB3Ja3bpWpO+mYDaHSKga4UJ4Dg0pWuxyPaw4p/3M/6UQ9HFb9mm3VhwKCQ
pLzEUcN4ttbv1J5qdGT6W8qRvHvHz/plsD09ht3w5UIwfp0rrmw=
=NG77
-----END PGP SIGNATURE-----

--WIH0dino7qmZ6RwK--

