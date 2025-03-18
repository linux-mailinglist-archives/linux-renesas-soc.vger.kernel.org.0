Return-Path: <linux-renesas-soc+bounces-14610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF5A67E72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 22:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9959819C0114
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 21:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0826D1DEFD0;
	Tue, 18 Mar 2025 21:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S0XxPKkh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633B521147C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742331638; cv=none; b=VXlnrmiO1ExXy/UXhKS2nackdrGYWUu4VOxVXk5GrQSjfGwfsghDxKsQjcA4UNHlvZe63HzHmBLnCp2LFPKmCHl6jZWrb6Ji2GliFt85C+RxtVejHLlm7790tGVXhR95zzpqefV8zeRfRUigT8p78wj4SNUITg3TFrum3AvYVxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742331638; c=relaxed/simple;
	bh=jDbSn82C38j7+Xj6sOj+ms4Jc0IxsltW3mEpGzG+Ats=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFllMdfQX3DzejcV/hWY9grcIjvCL0zwZ92ySu6kxSOYeVqw15XgRRprP2TlXKjTNfFS6jBr4X7sXAmD2tZRufJ3m6OZX/QjE6GbzKqVz1eJV9+VLP0EvQBYdhf9flRxZ/fcVNP/Yrpka0WfGSXSe12poH6QX0U65UzzthGOeaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S0XxPKkh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Alm3
	x2zwURgvPY8POW7lo0RkXBypewzaF7jaX9WC4CM=; b=S0XxPKkhONCFqnZSTTaL
	X9zmPmBUQ//QQdqFKPQxtBjW/jkRQUUkjNHHB2W8CAVnnakMNZq9aoud7S8jVG6O
	0GWrMIzQfUqmE9ptUl6YpkwMK4iOMA6ed5J+RSfWMB34pKoX8E0lKEskvG2Tt46E
	zMUZQR4O9heU9K5yftfcrvBbqfr5JSCOF1dM+CTDPi86U+AF+7xy+CEcFy81fZwk
	6+4uqF1UFBeogKmAkqJgD5yduG2aeDr/Ih5CAXx5euIDKIxez6TBjg0bIvVBVIlI
	9XF7PS5L/3i3EK+I1iqqCNPU0+8YTfwICcqMj9pyBfewu/qQxlXqYEhqu7NS7tYL
	JQ==
Received: (qmail 3995406 invoked from network); 18 Mar 2025 22:00:31 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2025 22:00:31 +0100
X-UD-Smtp-Session: l3s3148p1@t5D0MaQwsrgujnsn
Date: Tue, 18 Mar 2025 22:00:31 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
Message-ID: <Z9ne78KhxfKYgnh_@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
 <20250318204133.GC22890@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V93gJJxLrjmSUwfG"
Content-Disposition: inline
In-Reply-To: <20250318204133.GC22890@pendragon.ideasonboard.com>


--V93gJJxLrjmSUwfG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

> > Read out and check the ID registers, so we can bail out if I2C
> > communication does not work or if the device is unknown.
>=20
> What's the advantage of that, what are you trying to guard against ?

That a random chip at address 0x2c will be used.

> > Tested on a
> > Renesas GrayHawk board (R-Car V4M) by using a wrong I2C address and by
> > not enabling RuntimePM for the device.
>=20
> What do you mean by not enabling runtime PM for the device ?

I left out pm_runtime_get() before regmap_read_bulk().

Happy hacking,

   Wolfram

--V93gJJxLrjmSUwfG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfZ3usACgkQFA3kzBSg
KbY+DQ/8Dn0anJh88GbCa2wy1JyR1GyUnytfETCtm9KO3YrpEWmLUwnHANZz/rVP
HRz8Gf6QY80ebWW7ZaclpPwet21iVYc+Vi4vJCOx0pNS5HTOKs1z8pSL+B8dof7w
5tH01QCTPNV4s88+0w3fH4rUaxzvmQKS6Uo+u9E8C+XTlofPORxl18ydImOkQ+cz
0x+g344T54BmbRt6tcFfEniueHGeBb6BOMa949eTXYwMx9sleqmVrljuiP+VJO5x
Y2t3aKFZjlaFlnE2eNmRyLk+Uct11/dx5Ezdh5FpuobP9CfrXLvAHJQKPAMzAmNw
v726M3M+ket5xFc14rGk7FRUIgRdKhs2PaZlIJxuNwiYqDrBZs9cVcpoXYd8FPih
GCA6rdJlR+b3Sm9vEB6J8eV+ON40tP8GTSPkKdjgwDX/vSargDC5yPFLkwN2Xgd0
jzOi8M6eMow3tcyqWkedGwRvYTK9k+VA/ow0RVPWKpM2jzGk9xEjHyrrk+U1TE7T
X2bcMZO0Z7X/Y4iIujFgSXlfjUZ/4A4v3myhjwqn3kQs5CqRlQbRDfxydfR0b3mS
atN4MCGtIqQzwrq/9a2O2UunsI64bk59GQF5sYDMcQKYiyV3RYHfpjapg/X1a3vS
IHF41DiZ2pS7BDcms/SsRVkrkQKQSZITsA09n0ltvbzUYHJQFXg=
=kgfC
-----END PGP SIGNATURE-----

--V93gJJxLrjmSUwfG--

