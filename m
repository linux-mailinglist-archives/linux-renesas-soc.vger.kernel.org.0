Return-Path: <linux-renesas-soc+bounces-23215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2507BE7E26
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7FF424E5799
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 09:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E81C2D9EED;
	Fri, 17 Oct 2025 09:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c2wKLsme"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7124517597
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760694385; cv=none; b=Wuq781DMtnrzAF2AF4ar932nLMLkhHmzpyUDEw7qDGYplEr9JSDtPFiTsz6jVX91bX8EWWTqSySECpJGkpwDp+HHUH/RIKl+r6S4gZmaquyOnnR4Ut3mUPMfhzk+tfaNMnHFodVAC+9WEeAGP6vBLGxexgVBRCktR9lOoLxmBvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760694385; c=relaxed/simple;
	bh=c+DdYce2/cYSGVOYvLZ78SnHDyiu6WUUXPEJEy1vZ+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hv1VQTDEeiY0PJqWqJA/iNx8ftSHByM37c8Ip3IN4Po5xXjz7hEAzfKN/woK4XCG/7hRfxFKhLbx3Qd5MYKhayRmxCun8lnuF0LLwSx6Xvx+mHPJdFZKlK6HCY3xMooIoj9TxoXi9GxDxp5J1B4y5mIXR39jZTtWZP9yWUheZgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c2wKLsme; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+KN1
	gucSczaLlotf+OfFl03qDe19MF1YEMDhNpFE5Lg=; b=c2wKLsmetW3LYR7tlkyH
	9nhTMK5J+QFKn7V+jf2A82YMD/XNhuQT1ePFDC4ouZhR5mXdMmDQs0d9/YLLRO2V
	4h/5yso8i+rE87/gH/ob8h6OTFagEDKIY0B9J1ixPubvi4T4EzWKC20QpcvHdwlX
	lBmw1YwXHoFVkar6YNsQkMgTM7UR0ptT564p+91UZMaIasFOXATTC1khxO2xvYnx
	Zf8/UPB8lMPniv/7ODSSewsQ5GGDez9bC4Fxs/7ceBxfEhbUrFW90YIc7uufhpmp
	8jybTA3cOamwG7tnm2NoT8LKAshizcVrN0QkVvq/MZBAmsf2cw/0dkFWaNPVqRba
	Ng==
Received: (qmail 4173788 invoked from network); 17 Oct 2025 11:46:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2025 11:46:21 +0200
X-UD-Smtp-Session: l3s3148p1@G24lm1dBAtMgAwDPXwQHAL/S9V79e5yL
Date: Fri, 17 Oct 2025 11:46:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if
 possible
Message-ID: <aPIQbaoNyXEcX2tn@shikoro>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
 <96d66ea4890b5f0d5c0961f8c8fac781a15865b9.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L34mAbg8N3wtnVVm"
Content-Disposition: inline
In-Reply-To: <96d66ea4890b5f0d5c0961f8c8fac781a15865b9.camel@pengutronix.de>


--L34mAbg8N3wtnVVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > This does mean RESET_GPIO will never be modular anymore, while it could
> > still work as a module (the reset core creates the platform device,
> > which can be probed later), albeit in a non-intuitive way.
>=20
> Btw, Bartosz (added to Cc:) is reworking reset-gpio into an auxiliary
> device driver.

Thanks for the pointer, but this is too much side-tracking for me ;)

> >     config RESET_TI_TPS380X
> >             tristate "TI TPS380x Reset Driver"
> >             select GPIOLIB
> >=20
> > I guess this should be changed from select to depends on?
>=20
> The drivers referencing GPIOLIB seem to be split in the middle between
> select and depends...

:(


--L34mAbg8N3wtnVVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjyEGwACgkQFA3kzBSg
KbYwcQ/+KyW50hRsckBXgPAr9YuEnOH3hIvmhXVU53cB6n4+3weRCFUb9o0VCam2
n71fj8+E8K/JIrLz6Rv9xmt3a7VeCEJGsh1xF2CNZ6UmtSpVPxakuzx4KLmH7SMU
zk+8/Za7qxTTCfPmEUyZ+r4SOUjVrysorPU8fYS1jDOvP1sc+8WRWlgdPsN+vKXQ
fweSr2CpEiJRfDCszIWR2W17/s0VfQ/PFNJeDB4M3YzlvXqC5o1y4wSL2LTZ1UfR
PkVAgKKjNvik9w0ZtkraPTg9eCBxTnzD2iFr1aaebt7/8pSFupOlKLbA2e9DKGN4
x0QbtuTM5d7lk2D2CBqNhFdwzIbK/N8FlKe86W2p3sovAlxhpWc9ZKRCe5AyVhe1
fjvx/o1RLbtTpXv7uWjVSOhn8AeLbds1xV+gIeijMd22lPSq7K81xTKOldh9CN+3
VYRvvSTyusuMfEm6iVlwaETKwA9BHHLwFASY5X0+VZqwWGAQViCtvChUKDvF3QZm
zVtZxBjT8i3yjvcQ8y1Xqnkz+f0Uhr79C8qP8RXyLIxeEOQw5xLFVfZiKaDKrldH
/yF0TMKAGnDIcW+hDSPjcrlhMMXdUHcAo0bJwR+sDv8qANDdo2DffFR0Zukt+9lh
1h4Oe+UVZ9nI99eJKtvOnlwImAyfriUCZDHmXsR40tXp9l3R+VM=
=1oBT
-----END PGP SIGNATURE-----

--L34mAbg8N3wtnVVm--

