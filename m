Return-Path: <linux-renesas-soc+bounces-30432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HjkKSJtxmmkJwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 12:42:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A23343A25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 12:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1CF20304585C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 11:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D01379987;
	Fri, 27 Mar 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DgRcgvWt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965FD37C10C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 11:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611741; cv=none; b=DYpefHW+KG4tU1x0Uxffb/XD5tLKD4jk6wIlNUyPH5kdq/Dds8KNmL6U9UAT3me9uiE0fExsFt25PJn6OHiQSUa02f4Lpo5aEkB2NXXe7hB+5P6fiQ3v3gmgdZwoJH/zTibtRF8jd4a2icKB9cxhT7n9Lk07VJxC6zoQsaBvBVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611741; c=relaxed/simple;
	bh=0gNNgBVGYh8Ey7dt65ZbDW4KBJ8GG5AJCMvKQ7K41tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgKeHnAtkL6yK8FIRk88E0Hv2G1uDWh89PkE5OSyPSzE3lAy6Cippx6dgIwG+LE3/qsDd5biXrDsg7v6R7RL2c5oX5fPSo4cDGH5160OWgeTihHWPS248SJr2P0WyJ4lHfAYQjiJ/GeF7rRtmxg+yWDQgoVlpiQVKIfHvrK7sIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DgRcgvWt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ll7Q
	PbYcaZzXLDm7R5fAYHXXbyoncQmJhMQ4I8rbyoA=; b=DgRcgvWtvrQy6T2u4jyW
	AIJDUPHdxYF+rgV0lv2AnV5AzzYCtYehOJYE6w25xVhDYLqM/s6k9FrdGqLvmhrl
	v6ceSjSaFwln4uGhgavEE/rMAPlvkYL8P43gwNTcLmKA7s3YDm8oW7GuToReqRd4
	tR2I3V3/7Vdi5aTaZdzpVhWbYY+iqJpdSTBplKkb+yYE6hcO0Pqm7L9Ky4JMMd94
	89NmCtFfmi1/kbc33N8IM7IYECQ0wNDAXCLAFJZZOeTK2lf56JK5qEjm3CYCkkZJ
	iIO5bMyvra4wMLQxsXu5i6veunl8mPwuZrHlwbbuxDDwoI48ejpo5/6Vc6SQE8tJ
	+g==
Received: (qmail 174297 invoked from network); 27 Mar 2026 12:42:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2026 12:42:09 +0100
X-UD-Smtp-Session: l3s3148p1@W+C1/f9NQ0JUhsJN
Date: Fri, 27 Mar 2026 12:42:08 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Marek Vasut <marek.vasut@mailbox.org>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: renesas: Document MFIS IP core
Message-ID: <acZtECu-1kuIuNrx@shikoro>
References: <20260325110717.17083-1-wsa+renesas@sang-engineering.com>
 <20260325110717.17083-2-wsa+renesas@sang-engineering.com>
 <20260326-magnetic-cautious-earthworm-aee7ec@quoll>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DwxLgM9CZ9KSlu5e"
Content-Disposition: inline
In-Reply-To: <20260326-magnetic-cautious-earthworm-aee7ec@quoll>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30432-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,mailbox.org,glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 50A23343A25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--DwxLgM9CZ9KSlu5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> > +  interrupts:
>=20
> Missing constraints.

Will add.

> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    system-controller@189e0000 {
> > +            compatible =3D "renesas,r8a78000-mfis";
>=20
> Since I expect next version, one more detail I forgot to ask last time:
>=20
> Use 4 spaces for example indentation.

Will do.

> > +#define MFIS_CHANNEL_TX (0 << 0)
> > +#define MFIS_CHANNEL_RX (1 << 0)
>=20
> No improvements and no answers to comments. Same review, drop, not a
> binding. If disagree, respond to v1 comments.

I think I did. I explained above in "changes since v1" that I decided to
keep it because of the existing users in upstream that Geert mentioned.
Also, you have been added to CC to get the driver this time because you
were missing that in v1. So, what exactly is missing?

Happy hacking,

   Wolfram

--DwxLgM9CZ9KSlu5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnGbQwACgkQFA3kzBSg
KbZOKA//UTjb+9A+HLfSUB7iGe8jE24Gyeyx2OM/PBdhWhwLjbpNz2/kjOzv5yAz
w4gsv1KxPUgL8m3eI4kZiuIOQenk8KWZoPl3MU5MC8tW1Qn3tHpLqeCb8TJLK4X5
EERZAPloCosYPYnAnxHAoOPt+RLuYh3TmZ1hiA8tIawwVF4ZoAioDdjfU6i4ccXH
dTJinvKDyqvny4Z1kxUj4tpa5riGfEC/wdCAQC4RazpRPNovQTsKGR5kPHzL7yAi
KD+ayimBZ1k4bN8AL3Pq035bto0RKsVtaytcB3rHanCL927qkIN4rUH8OyXcTQqf
hxOYaHCE026ImQrzDz48R79qx1VN/RNsUZ6bhQCCTRsAEGcEpThssGuAHJj1JPG/
sO/lMIS5vMyOnBVgjMGdY+LljI4LryRKP5TjbUlsexL5VGHKPPaZZ5TGRzEZnUvU
VBEE8UONUptJJm7FLQ8dapE7Mp59dNEo2qGefnyxIlenu7DpTrlOOdHsg59eZfWM
r3r2uMqmli1GLeeivn6qPllwv6bCQLRV1bdXeov/Vnx1Jgx1mpAX7lEwB1sFEEol
l8Z9mNCBqvouKoK/nJ2UqzR0obH0CBGXObULjlvTuw+aDvMBp6SyMsz8kC65sHq3
5eaD05mU1GEHigM7nSD0qBelmyEwKNTInlAYTFntHTs/P6St6wg=
=/VyW
-----END PGP SIGNATURE-----

--DwxLgM9CZ9KSlu5e--

