Return-Path: <linux-renesas-soc+bounces-33902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RFesCsa4K2oODAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 09:44:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DBC6775B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 09:44:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=jn4oyUUm;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFCD53010BF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 07:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097093DDDB2;
	Fri, 12 Jun 2026 07:44:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD3037CD52
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:43:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250242; cv=none; b=M+/rfOyrUl49ayyhAz+EkugAh1gpdxQUWKDMTHS9x+RsCyFGVaqL1b3wPRvc8d57XbVggj7kI0ZHluR59ZxpxcEx5yOB4/MV/BeVmZ9WD9rrWdexyo4wUbxeH9ICMo0QcROUe9F+vtdW/MaJCe1Iz2yBHN686e/QSR2K1hkRxqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250242; c=relaxed/simple;
	bh=xgLZ6ydEdxbm7XtxVmmjX5AJUpXge0zzzM7UHp0ej2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JInEBvFNUp1OL+VOcVnYxrgmpWrcCuI7tsrLdaSfIYGy0VoQNWkDp1Rtv4ggH/xb+K07GALP5wkZXpRkXbcmjLHFQb2DSJdVMdd71WIk4jAPhmZyvYVV0G8u8yZNrAjkvkf4lI9Mk+xQMyBtehPL9K/GWDcJURd644C4NBzToW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jn4oyUUm; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b613a17bso4908715e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781250238; x=1781855038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Rxr3RDnrGDap9ET6pVXLfD4X7lIkVPiU/6HValFYlE=;
        b=jn4oyUUmU8lFKGSp8oNixWQduVa9uqTC/hdb2bhX0boJZxKCDb0/eV+xtQZ4l6Nesf
         W8cHOolrQsecZGM7VsEqIXPjkK1dfRymfFFz9625BqO0JQYOjWacLgz/vcLMPY1xsCpl
         BfXdbTqtfZIEgCNoZhDnuBxd85tCgSPN9VC3KgkBxgZiDiDAIBOl6OuVQO4VxwnxPv3O
         Dq4qaTd/LH90YPNQOfC6Vga52c2DiXF4TZk475KEWMu88PkhIWGukXXEH1F3r0FJbYeq
         4QfEHB8gx/GA8C3rxokF4Or6OEb/LAhyU/uUn7NlId47MACyLYDcArYE/Szisgqxt5Y1
         k65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250238; x=1781855038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Rxr3RDnrGDap9ET6pVXLfD4X7lIkVPiU/6HValFYlE=;
        b=YJ3k2piMg89tsofiCfndKuhfztosBMcx82Fb9Xa447sBkAidBs7g1fzUocFtPbA8gM
         QCBlulSzn2lZLb+VVQeyXnZryVQcfYd7wflFrrB1dRmVxsMKtXWymRWFkUcz8i/FzBn3
         4nUwA7+3GukGxlvud9SANvCjhY7bnmWgWQGMQnaqXZTCmY1lv/2N5Xqq2u4Ac8boL6so
         Qye2xFfEFvqIhjaXjum7K6BCaYTzKX9oWencB84eljtTfhnjWuHPSLHUTJt9QSMZs1Fn
         nSvEo4K9WsWT9uY5i5PmO2Zj1KojC82be7MQdwss2zJwqvWwoAYphzeDrtq/a9Rrz8cP
         V0Vw==
X-Forwarded-Encrypted: i=1; AFNElJ9ccNRhUeIkMzAlo6lwY/1+xHmsBMCUQpWHYddLtOO88CCK3BIPO3as4ZzOYm689Q29GsU0NtpYPwRseF6xPCHl1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOgIrF4FbgPXDrXNSPoXoGhprh45obQ5KRgFoLKgCBjbOAX7KH
	xEUV7dkIBk7rNvXhjaMZD3CkB9k2n0rxURRSfVxfu5/wbUy41LhCuFj0l8tRWtHjQ/rgUTXKMdb
	eYApv
X-Gm-Gg: Acq92OEVZSjagl309c8UvNRfB1WvInaalkHSChOCTLqzDvRZTy6DwfOX1Ai7hO+IeET
	S/kjt2C0BNJWxf2Mfj3OX7O06KvS1sVM084Y3797271CH0Yxfh/4SLqs0GI53kbvFKW7dp8ern8
	g2NmDnGSafJit5p7rFVXmBGaSqsC+Ekl8tgO61jcALAt9F13UyMJAkITGyk5KVV1kxMZaCAI2oF
	sQmEak1FXPP+sZJL9uhO6bT0cSUcrWmTBUiCxoKSo+9iUbZwqAzwFJeyo5QfWngSup8y4oUBb4u
	pCS0gaaDlfk8yYLGPtkzLemyqTYkqNcbfS2iMbvdbcPFNVh8DJvsaHYDuEUpiPCln3/64Ytq6XS
	6XKu+P1WAP9/yBP10Goe3YCYsYFPXo2PxYCM8UUlzW18kC2DV+5IH2UVgJUE3qV0UKrAP+mVXWg
	AHf6M34Lr/tSDIhtRBlNmHcZeFPIMfVLvWI6KMN9bk0ioImQ6ufIstsorbMejjrFNLA/oNTOpjc
	x0oL2aYe80mRQ==
X-Received: by 2002:a05:600c:820c:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-490ec4cd08fmr20296955e9.1.1781250238091;
        Fri, 12 Jun 2026 00:43:58 -0700 (PDT)
Received: from localhost (p200300f65f47db040e4e5c1e98e7f0ff.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e4e:5c1e:98e7:f0ff])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490ea7c09bcsm44786175e9.2.2026.06.12.00.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:43:57 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:43:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] ASoC: renesas: fsi: Simplify driver_data handling
Message-ID: <aiu4T1HgDW8xl2nC@monoceros>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
 <308c08c0fb309c190412f5ceb21b0027842b6294.1779958164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="33zssqxog3lq5pt6"
Content-Disposition: inline
In-Reply-To: <308c08c0fb309c190412f5ceb21b0027842b6294.1779958164.git.u.kleine-koenig@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33902-lists,linux-renesas-soc=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,vger.kernel.org:from_smtp,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96DBC6775B9


--33zssqxog3lq5pt6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/4] ASoC: renesas: fsi: Simplify driver_data handling
MIME-Version: 1.0

On Thu, May 28, 2026 at 11:06:01AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Instead of hiding the fsi_core struct for the only supported (non-of)
> device behind an abstraction for multi-device support, hardcode the used
> pointer which gets rid of (open-coded) platform_get_device_id() and two
> casts.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
>  sound/soc/renesas/fsi.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 8cbd7acc26f4..efd1447eacb9 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1905,8 +1905,8 @@ static const struct of_device_id fsi_of_match[] =3D=
 {
>  MODULE_DEVICE_TABLE(of, fsi_of_match);
> =20
>  static const struct platform_device_id fsi_id_table[] =3D {
> -	{ "sh_fsi",	(kernel_ulong_t)&fsi1_core },
> -	{},
> +	{ .name =3D "sh_fsi" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, fsi_id_table);
> =20
> @@ -1929,9 +1929,7 @@ static int fsi_probe(struct platform_device *pdev)
>  		fsi_of_parse("fsia", np, &info.port_a, &pdev->dev);
>  		fsi_of_parse("fsib", np, &info.port_b, &pdev->dev);
>  	} else {
> -		const struct platform_device_id	*id_entry =3D pdev->id_entry;
> -		if (id_entry)
> -			core =3D (struct fsi_core *)id_entry->driver_data;
> +		core =3D &fsi1_core;
> =20
>  		if (pdev->dev.platform_data)
>  			memcpy(&info, pdev->dev.platform_data, sizeof(info));

With commit 38d3273075d6 ("ASoC: renesas: fsi: remove platform data
style support") this patch doesn't apply any more. I will wait till
after the upcoming merge window and then respin this series. (But if you
take the other patches until then, I won't be angry :-)

Best regards
Uwe

--33zssqxog3lq5pt6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoruLkACgkQj4D7WH0S
/k61EggAgll/pk23f8RfaCUiIfOyRHFxGAcldRRnRxxCMNzlPUzrpNxBfDyxg2y7
DAMOlGiBXys0r4vCUHYvDH+ShS0qQifZV8oNXy3r/mRaRRP20Fw4xhopzGiQUYCQ
aDsBs1NOQUaD0VraBA53JBkLQpL2I7osSlq62GgF9n1dkL0qIXgK1WNYaLc1QT5l
oUzcBzyGVrldHnG5D8TMfZRAx206Kamj04Qki7zp6R7QG0IuiuIq4IMd2006FMES
uBi/B7T1fctq8uLYMqkBwAbyy3mYsaWEpIfAYCi7GjJwpmPhnd6FiaQ24sWnRHvT
sboWrBbS1d8HbAmFGsG+Ed4IB3xH3A==
=3Yia
-----END PGP SIGNATURE-----

--33zssqxog3lq5pt6--

