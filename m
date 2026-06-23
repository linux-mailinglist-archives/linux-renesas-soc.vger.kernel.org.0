Return-Path: <linux-renesas-soc+bounces-34383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dBAuFrYRO2pqPwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 01:07:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE516BA8C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 01:07:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=ObK0ZbtP;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 935D030C7AA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 23:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A308A3A8727;
	Tue, 23 Jun 2026 23:07:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760B248867
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 23:07:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782256051; cv=none; b=enPLwSApii4ikwTiAH00t/PZXguGueKwK3gP26ZgvY/rrAcDvygVAKD+xTmRsDIpHFz7Qgyrkx/KqlKMo3yJtZTbOdnKOiXYxHGjGBXyH9buXk1H519TjOxHhw8nlX0MWWU6bgCrhq4rAyd+qf98RfVPviez/ycxsXBZ/TH57Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782256051; c=relaxed/simple;
	bh=Yd545GqIfbnXZUQCFl4mDlvW28Qjy3hR1AIQLLHO/BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoqElH3HKUnbbRcTLInW/ZR9ceFrulKlyQ5ixN405ByMYzSYWGlIQaBwvrZDbLPR3AAlXrtpQXXWCEVirel/IMm9kQc56/VaHZAxbwZe0+YmvGDMnIJOh9eGRrZVAprqz7ktFowoJ7GCqSssZDV4Qj6tEASu7+8ruQrKwFUdKnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ObK0ZbtP; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+QeS
	jfYgJlnAI/ew10CUiFjFUaNitNkHaAXMPMGpm3U=; b=ObK0ZbtPGq81Co+OWjRO
	7I8xaepsQSQVXCQ8lP27l0b+4hQeCzfjsGeWuIuh9UoNSSAXgKOj3oyxhOB/caCf
	5EHij71JQA48I6aYY72PM2b7D9GkjL8ztH2xi7y7KZaXqyKPYXgvRTKIRY95ANcW
	qZ1AA/erhHev2kofs5chWlU8J/bn4hkLqCpoqbssYtkzH/HagXPgXxvKYpeYSywm
	+g1RGpVMlSDHSKCUikF8nzrkrx8omsh4wMseo5Wj+VzCZ98SsAfXcViRz8Ke3Uwg
	TbuhgdBvQvimtDfdmfu0BowyM48LbB/jx8skgQliEbRCF3ydzjU3CnfjNL/VCTMt
	7g==
Received: (qmail 2528513 invoked from network); 24 Jun 2026 01:07:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jun 2026 01:07:24 +0200
X-UD-Smtp-Session: l3s3148p1@7eJt0vNUkuUujnuj
Date: Wed, 24 Jun 2026 01:07:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] spi: dt-bindings: snps,dw-apb-ssi: add
 'power-domains' property
Message-ID: <ajsRrFBdhiXm4Iwp@ninjato>
References: <20260622174806.74450-5-wsa+renesas@sang-engineering.com>
 <20260622174806.74450-6-wsa+renesas@sang-engineering.com>
 <20260623-banana-bettong-from-saturn-417cce@quoll>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4vIwgRz2LlLolQzb"
Content-Disposition: inline
In-Reply-To: <20260623-banana-bettong-from-saturn-417cce@quoll>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:herve.codina@bootlin.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[sang-engineering.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34383-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ninjato:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACE516BA8C0


--4vIwgRz2LlLolQzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +  power-domains:
> > +    maxItems: 1
>=20
> You should explain in the commit msg that likely other devices belong to
> power domain as well or likely can belong. Otherwise based on the commit
> msg I would suggest restricting it per variant... except that indeed
> these other variants could have a power domain.

Okay, if 'likely' is enough for you, I can reword it.


--4vIwgRz2LlLolQzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmo7EacACgkQFA3kzBSg
KbZpUQ/8DweF5fY+8taKeSRhmRor2A/dFaL2ORXt8pokPumkA2w75fh3FpqYfP4j
FUDJUpt5WkmPPP/eKJtC/M4LrwMqwYnluODx1axtw3AwK9n+ZK/+O1K/tbBvY166
9BPDtLl0mTSXUYjdw1bN+GegDl5gIHgkpgzGK9wyzu+vBK+WvLcmVi6Ua0BTwP1i
uF0IzhabpyZ/ZzqVKfJNuE+ca8Yg8++ajiiHmvBdF4gAdKPaCzasfauwjxq8UBJ3
cKKR5+RPoqQ7A4cFYN5y6KClVuYY3osvwudvqcsSqv3FGIVaexwvNFiuQaAIl5ne
I0kMqe9jXLsnP/mgj6u1HbwWmD5F86wGaIZo+0zvYAhLwuL599k+cf2rgycmBCwC
e+Yd0Gww1ur2+fdwbn7zuXsvDnwr0a8dCZ5OIbHcvZL1MeLGLBM34Vf1RwXHRwAq
Dej8Ned7UwLUaq2shbqvkdy9rgKZEcTcx8oXo+FzVgXqJ9Tw4gVGi9PuhvhT2/B8
PmfPxLWHhDC7aZseGUcPl76e4HJ0AJn3XgbRl7VN3s5aHawM+EfmS37YkF0ckASK
xO1ohRha+5QmwBoQ9fjChyYj21zJJ3ZQMKmwEmez+Lt5SI2cuUy7pwVZGVfHcZ/s
LMPGFK7egMnFeZXGK5qA8lPtuOvdT6pG11j8kgSmI5RYXCjJCcA=
=2lbN
-----END PGP SIGNATURE-----

--4vIwgRz2LlLolQzb--

