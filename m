Return-Path: <linux-renesas-soc+bounces-14794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB65A6EEB3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 12:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4095A3B4F4C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 11:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FAA2561BC;
	Tue, 25 Mar 2025 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZAar6WoU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D43F255E2E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Mar 2025 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900813; cv=none; b=FH87DVolyd/KtsTs0gaatSxP5eh/M60zMU2ywSBmG8gbWOJ2nKBjkid2CYequF7rYKUqqv2jnxlwmQuhln+z9+m6Pqan1/CHp6UpZWyNweQuCSTnSTREguwrWwkz41M3L0aRN6+Eexqbzm5PEI52PhcUzj7GOm0PJiM+gR49s2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900813; c=relaxed/simple;
	bh=vmdMzRsge6rNZ1LRkzX7z+rHOWaV9SylfaktcIGnP54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+lDosGtmgaZwOPLivTHYayU8o21IfDqQwa5UYfI01LrBtCHarpclBjYj+ze34erHjNStYuD2cRj2kzh61zahOJBKPpB/17hamKe+siOxPuNBIxhFpUv5Hwvk4vDXrfciVtrAPixu60+Azjzk9RVwH9UoRLLyq8ovWzc03WNRws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZAar6WoU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vmdM
	zRsge6rNZ1LRkzX7z+rHOWaV9SylfaktcIGnP54=; b=ZAar6WoUSglQkwhOiy/3
	vOXLvs7Fc0qrbgMFtN9dLx4akox7ffQsmmqwuUEV8BJzjrpvc/aN0ELGg3rMh13t
	jAFxAivN6zDynI4X7mv2agNW7V/5LvXb7++fZG+kGmJtpnoO/wq83INRAofjhD9s
	6VHck9kdN0RRIgH0otyUfZloGezMx0jp1z3OUqRCcOiC76CgSjS5xu5X9g1pXTFF
	8kQ+LWAL/05W4mDlqWUcogRWMXmAQ6h3SWYqIkCB6Bm+qv3MZNDMrOAMheEqTvRv
	7pO/u7JQX+urkO9AJkMmF+DjcExaU4EDe4rVeAYZJcg5QZCZFJsWc6AinzAJ3kH+
	jg==
Received: (qmail 3018856 invoked from network); 25 Mar 2025 12:06:41 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 12:06:41 +0100
X-UD-Smtp-Session: l3s3148p1@/+catygxorQgAwDPXyTHAJp038nK7dx+
Date: Tue, 25 Mar 2025 12:06:40 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	"thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <Z-KOQMx9IHQXwrt1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-11-thierry.bultel.yh@bp.renesas.com>
 <Z-EpPL3tn54E8KG5@shikoro>
 <TYCPR01MB114922CBDC2911E2F644BDADC8AA42@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <Z-HVD6w6ivYR6pt5@shikoro>
 <TY3PR01MB1134602E988AD8428422E820086A72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z-Jgdi5_SizHzcO0@shikoro>
 <TYCPR01MB11492F2D6D73B2EC18E46D6B98AA72@TYCPR01MB11492.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lh4eZ0BfjukHNZUE"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11492F2D6D73B2EC18E46D6B98AA72@TYCPR01MB11492.jpnprd01.prod.outlook.com>


--Lh4eZ0BfjukHNZUE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Would SERIAL_RZ_SCI_T2 (and rz-sci-t2 for the driver) be specific enough ?

For me, yes. That means at least "as first supported in RZ/T2". Only
RZ_SCI seems more arbitrary to me. It might show up in non-RZ platforms
later, and then RZ_SCI basically has no information gain.

That being said, I see that there doesn't seem to be an easily available
better name, and we are entering bike-shedding area. I do prefer
SERIAL_RZ_SCI_T2 but if you really want to keep this version, so be it.



--Lh4eZ0BfjukHNZUE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfijjwACgkQFA3kzBSg
KbZlzQ/+Lsk+IZzFWOt3O0lk6Ng2geoq/7aFMUBTwOMXC5oyq09CoEkOcGS5mzw9
psN/a8WqMOu+4KZ6fwFMNvJtNN05RhDnfP0fiWrPkwPJZTfEr6+uoiBpHvaLX/5O
8caJOH9V/63DFnswv8E0pefy+3MNu2fktwMDsu6GCAf0L4A8YOwYevl8J3ApuEsz
/TgMX9rm27bs7h6om/iD0TP/3iph/UzCeG7Zf8/IxkjqGWHsVQKbh1YcP5F11ZF0
bQHJ0zUb4m1ZAkuN+/1DmKXHNFDgbBoRtnAZ47ytXscWLC4NN5wNu2cs+dW9l6Z4
ANDl6/+vOQdhEQ6qo0v3WGAr0hTVb1ppcA4pkKI4EQEcHTqq9ofwB/ohb7xYjCQN
BoW3fDv/d/VODrUjJRHqAggIVpXUKlAnDfW2A98Qi77uFYP3OCCNsa09JZ91ot8J
DkWJunQc42f2CpHqyD8oFCSrnTyvB1F9n5ozQJgnoxByKItrb6h09SWZrha0kDhV
e9xCsBe+xfdFOKrreKLeUAu2tzKaZ2X6Zs2xf0LK3es+oRgwdYY80Erm9TFsYuxp
3G48w42FCcSAJBMDpaFKSGzlLKn3VGv1KKUg1NLEs68cUnljs/8+D+MWwTdD3F9F
jQOPD5t6ywnhmY38v9U/rdGl4nfcpN5YchF541hqsT+cRldX9Bc=
=fMXS
-----END PGP SIGNATURE-----

--Lh4eZ0BfjukHNZUE--

