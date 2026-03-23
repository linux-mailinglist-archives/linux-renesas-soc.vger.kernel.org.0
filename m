Return-Path: <linux-renesas-soc+bounces-30097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDNRJ/cfwWnCQwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 12:11:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBFF2F0F1F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 12:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A1673047ACD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 10:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FB739098E;
	Mon, 23 Mar 2026 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BvUNBxLs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A89D337B99
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263498; cv=none; b=YVSu5EltIfQZ7MHQy12kljgYk8TjqQNTGhp8bBo+WeKUpkphCKJszPL3xKCxo6yr1505EHO6rDajrwT7qm3QmLiVGMfIHtJLb9tdjy839xpUcJ/+10kQ9R69z8u7HiJFWwbs5HzwclpmTlHFs7dyzCxYO1cBF9Y1XH9SuPDNVxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263498; c=relaxed/simple;
	bh=3wvG0qoe2oCimuQCKxlUUbT2Q+fw2cfEIID1/gn0m3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRu0w4T6ptE9JukhZw7yTzKxHhXrNwuGMIN/KWD/2nmzy9jCm3ZRw0Rc0+pNzY8X3lbg9PEZotR1zAS7Pk0wF5l1cvzu9DigfXUDiP2hzwJbXXGNv0tM1QxykXSK0l2qdV73BeS6Xem0BeYGjxRf0vis5z1EV0QPVo5p6sjPYPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BvUNBxLs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dC2x
	ZeXtzJ+6Vzy1PATTNvraN8pjxNaXxHhVQHWUAzg=; b=BvUNBxLs3hioYH/N1njD
	+nIwycVTqT1SntMzX3ng4S6IbqOg/r1TwS0ct1jrHH6LZoHQtDFM1lIlTrZFlmEk
	iv6ds5RFB7MWyjsPQro1a9KTe8Fnh060HgUbNMWg1EvKLRQCJCwUtRQXfZYm/oUr
	vPk6uXA53Ixto74KTROMyK6Cg5CgB5iT7LNz7HlseLpKIRJ27wzGWDXBuM11CWJo
	vNO0T0PQyZ4FKgLfCAUyq8vxc0HsuUqNhIw6ddoSsUn8A7qhqa+uMqjzeL1uYJjN
	miNo6QvZZi/dj90lLkWlFEp4bOobHu/ynUe2rxUBtf+mvjGFczihqFQaMO7mVu+5
	Bw==
Received: (qmail 2632584 invoked from network); 23 Mar 2026 11:58:12 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Mar 2026 11:58:12 +0100
X-UD-Smtp-Session: l3s3148p1@xt0i6a5NJJwvQbLk
Date: Mon, 23 Mar 2026 11:58:10 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
Message-ID: <acEcwqHPWIuSJFdS@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
 <ab-vWbjdlAIt1qaX@ninjato>
 <CAMuHMdUxbKEbm6EoZmVwnoT5uiBZqwrZ6hYpWieW=-K5uVEARw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yBmy8yhmLjoVDE6U"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUxbKEbm6EoZmVwnoT5uiBZqwrZ6hYpWieW=-K5uVEARw@mail.gmail.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30097-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,gmail.com,renesas.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0DBFF2F0F1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--yBmy8yhmLjoVDE6U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> While there are no overlapping bits, and thus both OR and PLUS have
> the same effect, I agree PLUS is More Correct(TM), as that matches
> what you are using in the second iowrite32() below.

Yes, it is more correct, yes I will change it, yes I don't like
bike-shedding ;)

> > Yes, it can. It even needs a hwspinlock instead of a regular spinlock
> > because it needs protection against cores which may not run Linux.
> > hwspinlock support will only be added later because of dependency
> > issues. My plan was to add the protection once we got hwspinlocks. But
> > maybe I should add just spinlocks now and convert them to hwspinlocks
> > once their support is in.
>=20
> Have you ever triggered this race condition when running the mbox
> test? Or is that impossible due to locking elsewhere?

Haven't encountered that yet. But since we are talking about generic
mfis_write() here which can be used in further ways in the future, we
should not rely on external serialization here IMO.

> > Yes, this was overlooked so far.
>=20
> .suppress_bind_attrs to the rescue? ;-)

I was considering this for sure, on top of the suggested improvement. I
guess it can be argued for a mailbox and hwspinlock driver, or?

> That is an interesting one I never considered before!
> So far we always assumed of_device_get_match_data() cannot return
> NULL if all match table entries have their .data members filled in.
> However, you can indeed still trigger this by using driver_override
> to bind to the wrong device, which obviously has no match entry at all:

=2E..

> Do we care about that?

I tend to say: yes. On the one hand, using "driver_override" is a
you-better-know-what-you-do command. On the other hand, failing
gracefully is not hard to do and not much code.

Happy hacking,

   Wolfram


--yBmy8yhmLjoVDE6U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnBHL4ACgkQFA3kzBSg
KbbaMw/+Mo7dNdtNBgLHdxTXtyrKpRHvF37hHmj3jf8c2hD8pVc+Q125ws9xiMC0
Vcq7+WdAlo7yUV26m4OI0WXobpPQT8RaBTZZwGlaILaV5e4LI430IA/1Ihs9gnY3
Nnvfrp2ESUEQPGtb6fmChl2eFbPYiGD0jbD/h3jLE7lLZirNwWIZCg2lYCMMO6sF
Glb4ROZ2KUWngzfkTp85FlcKAfWCKVLX57VtlLvOyJA0HgKf5zpZ4Tcr1BRqookU
SWkJD565Cc3VUJtz9U2hjjjEmzG+s/sAwiNBAUXNXHwwzfVkYIb2cbW4R7iXCVFX
kdK58UZ7oUc0lsZ3v8Y2aieSgSPKPSDQtZ152T9IBcIrSVCinFQCG/65iacghzwJ
deIK9nFP546eDZ/cPyFMWhJMtSOd8q9pl2r92AylItiPGbMnorOCwiCQW7xcP/v2
WMVxtQ77ItoQfFhivrjXCLf9ZwM9nbqyBPf31sSiK7Zd0bxbwMG34y1XDg5oB9i5
zKwgGIwJzahyQZxyF4qCf+QMMuIvPrzIRWUfL6/UDvEtAy4lepIFObSFkMRjvIwf
8hfomFRSjAdo92Gt7HwtQaKTGhV4EVeVpl6QRW46HHC2RvhZZDSNgJvc3mCd0sPv
IQu8T1DCBhLBhseFZ9eMujZbqN7nLq1UpxJx7ZdJaLEy3E1OyVU=
=ZnQV
-----END PGP SIGNATURE-----

--yBmy8yhmLjoVDE6U--

