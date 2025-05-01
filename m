Return-Path: <linux-renesas-soc+bounces-16588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1980AA6436
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 21:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 384414A6F9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 19:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D9A225A2C;
	Thu,  1 May 2025 19:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hSnBMiQS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA0D155A4E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746128696; cv=none; b=nxASqZnjAJOZt6ld/4vibhjsCbqteGxbHrPPn56JgvWQTSwSndvEa20YzRXl5nelRZfd7f8Ff79LJq/82mB2Cwtetb2/mJeTGsmUh4f0o2AQ5yktdDGB8RenLHdYKbPef3ynQC/VCSVbGp7r/+5j3+/A2icwMhXN3Ps96f9g/RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746128696; c=relaxed/simple;
	bh=mnKKNGFyUO8w+4qxXpO6NVJeqhx/DOdnHV6ARi1fHPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkZtlVt/qduHnE2qpikdLr8gc+aYS9p+1vufTrWTYznRpdnWIHrdkYyGSJdGIChUJAc9p7wIMXTEI3BKVTLHAX+rTY+SRlG9Eo+1ewW+RQ539Wh1cZbVMVWEVesc7E18IMa+9XjvFL4Ah5lrYNruaZEjBacGPv4Bee6oeOzlBqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hSnBMiQS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WtAU
	QG5Ocn4Ukv9zlKxSH4ggJXIwR0N75Q99e79Yin4=; b=hSnBMiQSEKwVLNhztEwF
	3t3K9kxjSzbjq2raZMEe97KtRMA2P4AdgcD8hqmPW3PjNQroWJ6pRwNH5nGyVjEq
	FmK0m2zYNmi+3M06qibMNdjfgatSIyEmBz44AVrMmnS+CjSNo1JvYKHB8av790fg
	1kFX2iLk/FYI1gv0/JmKVN7OZUN3ja+30NcTT3rNIJ4IwW4MZDDEhotl5gTxc4YU
	4JDGc8KiPR/OuJeVLRlJfbYuNkVt+Tn74Go3rCUEod93bcW8JZMvpL7tzwBMl4Cn
	A4Iv+eee3PozO28rH5ZEhgoC4pEFI9h/qUUvTtiaKE6E+0JLxczW44RCRAo4hnu9
	oQ==
Received: (qmail 1153633 invoked from network); 1 May 2025 21:44:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2025 21:44:47 +0200
X-UD-Smtp-Session: l3s3148p1@1TweRBg0oN0ujnsd
Date: Thu, 1 May 2025 21:44:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v9 2/2] i2c: riic: Recover from arbitration loss
Message-ID: <aBPPLkmrYwSpNp6z@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430194647.332553-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aBKFWxIRaa4W7TDf@shikoro>
 <CA+V-a8v5qFC+uxzC8Qw4F3M1XSFnVq90MWxbvmiRks=ZbkzZjw@mail.gmail.com>
 <aBMpjKtQYYB-teNt@shikoro>
 <CA+V-a8t8AApJTgF8Zc3w+JjAu6yPvzUEgTo0g+1H+6GhvJUdbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="faLuQdkgOFz/iIk7"
Content-Disposition: inline
In-Reply-To: <CA+V-a8t8AApJTgF8Zc3w+JjAu6yPvzUEgTo0g+1H+6GhvJUdbA@mail.gmail.com>


--faLuQdkgOFz/iIk7
Content-Type: multipart/mixed; boundary="x5L95JmzpuD0L5NN"
Content-Disposition: inline


--x5L95JmzpuD0L5NN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> From 10=C2=B5s to 50=C2=B5s, the clock pulses are part of the recovery se=
quence.

Ahh, that explains. I thought this was all after the recovery.

> Around 55=C2=B5s, the transfer function starts attempting to send data
> hence the clock pulse.

The short SCL spike around 55us is still strange. However, we might
violate t:buf time between STOP and START. Can you please try the
attached WIP patch?

> The slave device is versa clock geberator 5P35023 (exact part number
> on SMARC RZ/G2L 5P35023B-629NLGI)

Hmm, G3S has a versa clock generator as well. But I can't find a way to
wire GPIO lines to RIIC1 or I2C_PM.


--x5L95JmzpuD0L5NN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=buf
Content-Transfer-Encoding: quoted-printable

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7ad1ad5c8c3f..42058c789f3f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -278,6 +278,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 		}
 	}
=20
+	ndelay(RECOVERY_NDELAY / 2);
+
 	/* If we can't check bus status, assume recovery worked */
 	if (ret =3D=3D -EOPNOTSUPP)
 		ret =3D 0;

--x5L95JmzpuD0L5NN--

--faLuQdkgOFz/iIk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgTzyYACgkQFA3kzBSg
KbYb6g//cjsuZlboo7q6XgI773+cQbtUobkeVe8nQq07XQAbBXjY1Y8COfRGvd4M
NEpaExCKxsTHnpUmMbsCWxn3yjsXndRYeROO2pYmDqbvzlDkVSGDVVT5uv43aoGO
Pb3//LREZ+Yek8/aQ8Xs1DtiA49dHJpJPRizdsUr7IyKR3NWtZqs4gdWHGL9ByTu
Or2fq+ioBzQAPPRBYYyAYnbEwsDK6zULzDgtOZqSzmqqU7l/CAfjt8EcFjubAz85
r5IL0jQJp/3sP6fNRd9ZLben9mmWh+pl5b4uBU3ub0hZIX3TxUNOqaIiuUxF9sZC
cv9bcMgr04sF6am4LHgAkqDnPikzZBoofT4DYtrhfK3Lblq9RhLUnULJocfgnFj9
eBZdrgcWfjxToDCxCACGgJRm+CinQmqY6Uy/mJ0ecI0eC9B8LYm6G5FnHhLcrJhW
sw6J+fRtY4rKdE2lg8gW3N/6AMxW3v0n4QeL9G4qfDDn5mnxs+S7vndU5fgwgzZq
P7/I4oFqcKlqUKDw5FU9kHUKmK5d9u/ad706fN9CcOZjyo1fo8jGn98o5i3gJVve
zdEGvwtguJsn7EZxqB8jydqOZ/f2FqGsPX+4sUuDqoXD3Qk7SsFuXuKL3kM5Zl+Z
zy12HuAw4r8U2QoloStvhyIMfjGDkGzBEKJcGYDuEggcKI90Atg=
=4/FD
-----END PGP SIGNATURE-----

--faLuQdkgOFz/iIk7--

