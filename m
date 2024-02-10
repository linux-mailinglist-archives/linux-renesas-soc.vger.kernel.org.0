Return-Path: <linux-renesas-soc+bounces-2573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3368505BB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Feb 2024 18:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41708B22D0E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Feb 2024 17:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554C65380C;
	Sat, 10 Feb 2024 17:27:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECD15D46F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Feb 2024 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707586027; cv=none; b=Z4Ql2Pvd7H/COvoMrOqMLZGUfvLR4f8hrCPtviNJK+4j/Kf6KWC5t2Blc/fKrUNFymU9n84+Q2V0pmSw87nVqO0QQ3oOXU2mhtLQZsMrrwrg5geoUB65V1IFacuGzDR/W3JCczq3eTXrxRDkODG93wsX3CY9Nj5QlDZ/3noARJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707586027; c=relaxed/simple;
	bh=kYlYZarxarehUc3Rm6u3vvzFdwZBHOLP1oKLB6hcC+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSD0RYY3nfcpfxIU7oEGvnUcJHueO8hAI6LlWtNHUVWnW6nzhv/Gj0CgUlsS/1aqNJSBLZSt9TUIShjwOX7XC1bihe8FyIohpZLxvEiQvLgfK4NeBwwHS6M0acLR+/fm9UQV1r+e1JfpwYkBQaRsnBoV+BqtE1d+juByKrZw53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rYr7x-0003aw-4S; Sat, 10 Feb 2024 18:26:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rYr7v-005icp-J7; Sat, 10 Feb 2024 18:26:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rYr7v-002FaZ-1d;
	Sat, 10 Feb 2024 18:26:55 +0100
Date: Sat, 10 Feb 2024 18:26:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 2/4] pwm: Add support for RZ/V2M PWM driver
Message-ID: <vovrjoymovpjzz2myx73ns4zvbqyfw6twzvjhuyruogmcqvj4y@g2at4kznmqxh>
References: <20240208232411.316936-1-fabrizio.castro.jz@renesas.com>
 <20240208232411.316936-3-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="54ywnhorhz2yusl6"
Content-Disposition: inline
In-Reply-To: <20240208232411.316936-3-fabrizio.castro.jz@renesas.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org


--54ywnhorhz2yusl6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Fabrizio,

On Thu, Feb 08, 2024 at 11:24:09PM +0000, Fabrizio Castro wrote:
> +static inline u64 rzv2m_pwm_mul_u64_u64_div_u64_roundup(u64 a, u64 b, u6=
4 c)
> +{
> +	u64 ab =3D a * b;

This might overflow.

> +	return ab / c + (ab % c ? 1 : 0);

This division triggered the kernel build bot error. If you want to
divide a u64, you must not use /.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--54ywnhorhz2yusl6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXHsd4ACgkQj4D7WH0S
/k6VxAf7BRJFHg4rZZBSb4p15FSV0UzFczMlAmvdvLSdCf/buM63Xc4SHh4h0IwY
KkQy4v/FePDnnm547P5yJunOFXcdfeOVz+8VA5gV4fFcx8l7Vl+F+bjof/bvPGBe
9buARqONaOcY+7h2K6Kkgi00KOcnsxLFcbohMswn5hTGYodJfkWsYTk+ln6PMoRv
YX9SnHX1XyPjeHMTYjUwS3vxDZ+IehYuKVpPX44ZA+AsIQeHAjp8/4AhKkpPEX44
xFLsToSxV8bJizIcbO+3GFhXWdjXa87AF/KqXRcvbdeYcj1C+ivP3buiurGq+UM8
rkLSPSDx8sz8FXfdQHJGGpkvc/L+Eg==
=y35U
-----END PGP SIGNATURE-----

--54ywnhorhz2yusl6--

