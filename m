Return-Path: <linux-renesas-soc+bounces-9393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A24DA990346
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 14:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60F152824BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 12:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098A51DFE14;
	Fri,  4 Oct 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Zqe161aI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2091DEFF3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728046032; cv=none; b=UC/zAZFiut4woNM70snD3LNeChUDSOKUe9TBMvl6foNyR5kfCgrfH1BQsq0wPvHOd05MVxjo79fymePbqlAzrMY/RBDJwYfwLVnLfaCF0dxkFlHyY2ZW4vk/+7oXHpqd7P+bd29RRHgEqK6zGQ507QbNI+LDOUHLeCeDUxqLApU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728046032; c=relaxed/simple;
	bh=HICytwfdtw7/SipI7fgXAgtcwBx5F7Vc9P9Ftg8QFHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSVizekmvtyqECWc92cXZ8ceXjtlICbPvVw6Tg70xc92skFSPt8l9uY6WSg4qvK023ObcAaKeI4WSEpd30e5FxTJPYNnSIcZckgPJm/85PQxPNrEtHuprqw95ED3SKIJ8m82sAKJqp1y7/SnJkHVQjUUuQB67NuYrUkSoQWpUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Zqe161aI; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b3so5700618a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Oct 2024 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728046029; x=1728650829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihg4pApurv/9QiOH9PKnVypV3KdqAXrF75Gx9rMVrc4=;
        b=Zqe161aItsdTe5YLuEhMysDmfNET+6Sc1udDxFAtna9AELL4NbzaAcZEmOifxZIalm
         iA5rsLHIUFuVHhLqHWNXjcjT+maZx/UsdHxK89nriWCCXERUBfaEZnuVIKdZHKmj63hb
         nBJsQdIUp9PmyI7e6we0ND8ahqABVXze/qmygjyOeBGvk6S3tupo4HRwDjbpFNzPYIhD
         UW9OBomdw6vC8jcgnHA2BMXwEAj9QGDmg5j/kG7d5/UVQEtt5xdHLZxjwjnwtXqWV34J
         qRkzEteGSlUC473cXE1JRr+98bCSz9yj3+aPUGDX9riUe8j3wVV8yGiPnI8H68zGGGxa
         jq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728046029; x=1728650829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihg4pApurv/9QiOH9PKnVypV3KdqAXrF75Gx9rMVrc4=;
        b=Petmhe2G3xLFgEXOOLpNpoQgL5b9SVqmAAslgfaIOZlZPLcDzKf4lu6XfyBtTO00QO
         Iotdh8M3jqTJOCsGI+GYKuv/mxpVgXEvYJdl93XmYp6qT846Km7Gp+s4/wBl01216VDZ
         nDZ7WcwR7q343zJTxYDhrtUzXRVCduPpVMRjuvncgim/Hw4BYG9/ZYq15mye/J9DeLFS
         xYMQlmobB7r/gKUZrH0Cb+uyDQtFcCTQ8su4vV+DJx2sGNtfTJLCwxYR9J0+t8EadzVw
         CvJIGpVBl1U6J9twc16v+8ps1T94lgw1p754hapwzID/dRCGXC/chm5J7mbkRyS3C0ac
         jEEw==
X-Forwarded-Encrypted: i=1; AJvYcCVYlsJEx2xPr1yLUKyEp6z+l7jd4x5uO7NMear4LIF9XzuXHuoOGAd8bVLxas5l3Cewb0LsSdkIEahvjN477OmuAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzokKATXpIvM2zEtpx/VGk4zH7FoBwskl9/1nWsx8otcGJ0Zwz7
	xkLnq1xmpHTvH8tDlEBumegd6LolkMqwD5OcqE3V8fdXy/Hw7knfQowdUz2Pc3E=
X-Google-Smtp-Source: AGHT+IHw5OL6aWlKerVdXesc8DNMCsK4I0j59/2VIZC5lLt+vP5Gw/EU7fPESgWG9X+4R8TXDNt5uw==
X-Received: by 2002:a17:907:7e82:b0:a8d:4c83:d85d with SMTP id a640c23a62f3a-a990a04e25bmr678199666b.12.1728046028595;
        Fri, 04 Oct 2024 05:47:08 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99102a6553sm223316166b.82.2024.10.04.05.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 05:47:08 -0700 (PDT)
Date: Fri, 4 Oct 2024 14:47:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH v21 3/4] pwm: Add support for RZ/G2L GPT
Message-ID: <thfymed6o42wcascazgpvgq6zcqrjxloz3nt5h2pwypqgs4fra@zeyh36lcphia>
References: <20240808131626.87748-1-biju.das.jz@bp.renesas.com>
 <20240808131626.87748-4-biju.das.jz@bp.renesas.com>
 <slpywmbmamr4kw4jg2vyydheop44ioladvvm52aocnojgjkcsy@3eoztwsej5mn>
 <TYCPR01MB113320CDF49DB0564A958241A86722@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s2ajehwltv5lgpne"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB113320CDF49DB0564A958241A86722@TYCPR01MB11332.jpnprd01.prod.outlook.com>


--s2ajehwltv5lgpne
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Biju,

On Fri, Oct 04, 2024 at 09:53:08AM +0000, Biju Das wrote:
> On Wed, Sep 25, Uwe Kleine-K=F6nig wrote:
> > On Thu, Aug 08, 2024 at 02:16:19PM +0100, Biju Das wrote:
> > > +static int rzg2l_gpt_request(struct pwm_chip *chip, struct pwm_device
> > > +*pwm) {
> > > +	struct rzg2l_gpt_chip *rzg2l_gpt =3D to_rzg2l_gpt_chip(chip);
> > > +	u32 ch =3D RZG2L_GET_CH(pwm->hwpwm);
> > > +
> > > +	mutex_lock(&rzg2l_gpt->lock);
> > > +	rzg2l_gpt->user_count[ch]++;
> > > +	mutex_unlock(&rzg2l_gpt->lock);
> >=20
> > Please consider using guard(mutex)(&rzg2l_gpt->lock);
>=20
> Agreed. expect rzg2l_gpt_apply() as it will cause
> deadlock as rzg2l_gpt_enable acquires same lock.

Note there is scoped_guard() if you don't want to hold the lock for the
whole function but only for a block. Regarding rzg2l_gpt_apply() calling
rzg2l_gpt_enable(): It might make sense to shift the semantic of
rzg2l_gpt_enable() to expect the caller to hold the lock already. This
way you won't release the lock just to allow a called function to retake
it. This is usually also safer, consider someone manages to grab the
lock in between.
=20
> > > +	 * clearing the flag will avoid errors during unbind.
> > > +	 */
> > > +	if (enabled && rzg2l_gpt->bootloader_enabled_channels[pwm->hwpwm])
> > > +		rzg2l_gpt->bootloader_enabled_channels[pwm->hwpwm] =3D false;
> >=20
> > Hmm, not 100% sure, but I think if rzg2l_gpt_config() below fails, clea=
ning this flag is wrong.
> >=20
> > Does rzg2l_gpt->bootloader_enabled_channels[pwm->hwpwm] =3D=3D true imp=
ly enabled =3D=3D true? If so, the if
> > condition can be simplified to just the right hand side of the &&. Then=
 even an unconditional
> > assignment works, because
> >=20
> > 	rzg2l_gpt->bootloader_enabled_channels[pwm->hwpwm] =3D false;
> >=20
> > is a nop if the flag is already false.
>=20
> I am planning to drop "bootloader_enabled_channels" based on your comment=
 in probe()
> which simplifies the driver.

If by saying "drop" you mean that you remove bootloader_enabled_channels
completely from the driver, that is the wrong conclusion.

Best regards
Uwe

--s2ajehwltv5lgpne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb/48gACgkQj4D7WH0S
/k6NaggAiQi3Y76HgjjED3RCzql93qWlJLrzWhShgwCXJDxAol/sYWCNZ3uKFoA7
lg84/KRGSKi+FAnh4ljqZkMCUHgggKttBxewS5PdEBgABPtmHf6QvFlbC6o3hX0G
BoPeruYCePjnj6EvtwMNF+3me0rQvja6KLPAxlz2dLEhYKyO0p7kAUOfabYyX64M
EUOJdxlQUiI3OZJMXUYejzIZlwmGCnWjlJxHfxYsBtz6QlX0VUzLG60JvG0bPTPH
2OsNQFKbjGMR6+qWBJqBx6YOO0VKEDdmu2TafXQgfmRbRNJrP7EiaBS8c4kyt3qa
IvXmgDDX46VvBnne6S/pn+031HL5qQ==
=FXoC
-----END PGP SIGNATURE-----

--s2ajehwltv5lgpne--

