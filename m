Return-Path: <linux-renesas-soc+bounces-9481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A21991470
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 07:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CD67B2100B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 05:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B0D38DFC;
	Sat,  5 Oct 2024 05:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lJoY6Zn8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D06322B
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Oct 2024 05:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728105812; cv=none; b=UNHSm5hbWt1EXk1AhAtog1xRaWhg3uzrQCHKpzImpeA1KmZqn5KEsT63MFu0nuWRakzWBbRL+i5pgRccRx7qmLpBPxHc+cg8eln4VQDGXR0ZvXWofOe8PIKbIgeamCHrTkblMBWv862IhFy2dqcSn9T2hBU6sEgb3UdEYYW749Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728105812; c=relaxed/simple;
	bh=X+ta/FjiQIn6B3rd5Toivd0nVfLbmtxqSlFZCe82hqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/7xDW5tDkpj7WfAY6GtfAE2vHyv0y17DcixyoyxHCqGn6yxqqQMkFpBl+Ymqhlkmi6an/krwX10WF0Ybt/TNXcxCEA6Z1SpwmYySMmjSlIjSwlJ36WMxgEB/0k9JRNWhTfHRYMl5tLl8POtt7z9lXTPk29nHHd+t1MlK0SMXW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lJoY6Zn8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i/G/
	nfWcYVPe+IQeC4sULDvoPUYhTOwvzFh1cg28cXo=; b=lJoY6Zn8mvkA4E2TEd3R
	Cl40TRFnOP08274eSaiJj7DITCsoJH7N5QLTx8lInfxLPuiePUFkiwlA97KurWyP
	hiCocp/9W0RsySdM9mqSqLLijxpvxXFOp/QxvsBkSVSQxpkHMlAROVm7CwJwqBta
	tIUBKwoxT+lE4ZgXPC7a6U7X5qlqtpT8uyY9NRyJV+34CH31Xb+pa4ChLQ3Sg+Hs
	QpCpXu/Lnu8SzSgJ5/Zxvu1CzNfalkXZLyOipUJvu1sCPADOf/mEFfyOdoPk8mqy
	sJtboSxEq3gCEqXvnK/p1hvmmzjQPFdPUENQQlF32UyuBAS820iZVM7GdR6Z24a7
	cQ==
Received: (qmail 3672784 invoked from network); 5 Oct 2024 07:23:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2024 07:23:24 +0200
X-UD-Smtp-Session: l3s3148p1@GK2c/LMj3KpQvCeD
Date: Sat, 5 Oct 2024 07:23:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jerry Hoemann <jerry.hoemann@hpe.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 3/9] watchdog: hpe-wdt: don't print out if
 registering watchdog fails
Message-ID: <ZwDNR29rqWcLYlRZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jerry Hoemann <jerry.hoemann@hpe.com>,
	linux-renesas-soc@vger.kernel.org,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-4-wsa+renesas@sang-engineering.com>
 <ZwBeJUXqm3Tf0th_@anatevka.ftc.rdlabs.hpecorp.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AXghRCVBWp2XDeJH"
Content-Disposition: inline
In-Reply-To: <ZwBeJUXqm3Tf0th_@anatevka.ftc.rdlabs.hpecorp.net>


--AXghRCVBWp2XDeJH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2024 at 03:29:09PM -0600, Jerry Hoemann wrote:
> On Fri, Oct 04, 2024 at 10:03:06PM +0200, Wolfram Sang wrote:
> > The core will do this already.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  drivers/watchdog/gxp-wdt.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> Question:  should email have been titled
> 	"watchdog: gxp-wdt: ..."
> instead of
> 	"watchdog: hpe-wdt: ..."
>=20
> to match the module name as the email title gets put into
> the git log for the file?

No objection, we can do that. I check git-log for the prefixes and found
there the following:

6b47441bed49 ("watchdog: hpe-wdt: Introduce HPE GXP Watchdog")

I am fine with both.


--AXghRCVBWp2XDeJH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcAzTwACgkQFA3kzBSg
KbYivhAAsYGJiUz4EJue7VM/zt9VeJp7omXpYipxpqBIA74GYGjfXx0no7tm8Hck
P7+tWV07GVuHt+PrMQPpdkbmmWg6EBzqTiARlDDfzNiyVkEDeX7BV6qT8XyhUjG9
gT90thBKUGH9LEeomP1eNar2IlxVTJgpVGBi1QGLz+aczYvKNzyqLJkn7BlFYGCn
HYTgWoYIpk2yyjveK9pdkGSmeAS345XRdIfh+ZDqZ7N8wQ5zSJXi1v3sDHObt8/d
MzpI+gDZD+UYS4/B4zZltAumwzgQig2XkhIKF53y60pP6x3SL6F/OyWyaHkqS1fn
+16Ofy84XrX5GP3atpBEjXBlqaHlZGT9S+xb7uLnsU5Nzy46T3mugeRAlRw+MDWe
xdGw24AFury3bNkfC1GnjzDNraROH2Tal0n1/t90jW+62UGrUaIYYgaajC5x4Alb
KLUB/yrYTrYPszPgGilFEa1WpM+xFQuVaNMr4V0JcSspbWvCCxmuh9Dg2ahDgYSQ
NBgPppmFYw4o1FHwuxiGWdIokX67fWu8U27R4ElRna9LG1NS9VUSeZPF393YggX2
mNXeF6546xPSq7SBUu0Tk45OMk3V5uRsMJhFCi2NdyG64apPWfByGy1q44Bh6Y8f
Y7N1lfGTzuBtFXGTbgiWQE1tt9c/XFWfobPk8gqGzAOrd2SJMXg=
=slor
-----END PGP SIGNATURE-----

--AXghRCVBWp2XDeJH--

