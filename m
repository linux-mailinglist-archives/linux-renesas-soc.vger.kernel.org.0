Return-Path: <linux-renesas-soc+bounces-14786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CAA6E618
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 23:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100B5189AAC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 22:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834281EE013;
	Mon, 24 Mar 2025 21:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="D518kiaT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3471F76B5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 21:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742853399; cv=none; b=IdcTcsRY7Y5NnUhT2AaWNOuvu7MUN7Sq6hebpYyKAJtVrKVrtx2SpNac1/ViRPrv3W/Dar5H37I8D5Ov7Af1XMotGh40CC314JDgVpwQoolGp1V1xA6aL3FJl6hzx3B0dW0DnR3KkHg5ehZ6C5NkwSrBSNYQ+qrsaLxJxfEHgts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742853399; c=relaxed/simple;
	bh=SM6sdY5T+QKz+/fiVZHNjwvpk2/9yKPvmhdaPHMDHXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diXfERxERTI59DFX0/d1cZDjDG4Oad8zvI1rRoDeig1lUsGQ+ggoHDym+HVLrP1riz+TqxFDibnji+rBKuurfFjswrfIhTLkpP/+cPzEhcpAFhqUHWTMkboXHNihffP6jkXbIwKJ2/xDfMv/dlabuCsPc8jugvg1MSiTvl7TUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=D518kiaT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MY/c
	Jdj3HHeJ5FKGqJtcRT28eqdbI++lt8ZBUFbMbDs=; b=D518kiaTkYcrHgHKVl8p
	nihk+goEO4bFjd6Lrp+83kZyA9fP4+1VI0D1UGLlyzbjaQBWKfqlxZrWTM0BDe98
	gf0TGcg5zsJ0wSIq8KSpJFpCRxMh5tgoOau6K0uGgDwpuoEyYutkLmXPnqCkCEhv
	3dLDabLSjz3T6HOWJGAhsE7zv8XoIl3c0HbSK/pWQ4C0aRmtdb5cTMftLUfrO3Rl
	31eUqtbUUjhacMA09wrItX01EZB942FSuyOYJHBUGZh1/omlNNAIyYLJxL2w3k+I
	w+8Bn8G6bnVWKGfP+hfepZRaWdkbc6bll7KWlxyhBVcExk04x9QGfHScCSGkh96K
	Zw==
Received: (qmail 2752366 invoked from network); 24 Mar 2025 22:56:32 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Mar 2025 22:56:32 +0100
X-UD-Smtp-Session: l3s3148p1@QpVTrR0xAOcujnsv
Date: Mon, 24 Mar 2025 22:56:31 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <Z-HVD6w6ivYR6pt5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
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
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VNk6bS00O/5/s11l"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB114922CBDC2911E2F644BDADC8AA42@TYCPR01MB11492.jpnprd01.prod.outlook.com>


--VNk6bS00O/5/s11l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +config SERIAL_RZ_SCI
> >=20
> > I think this name is too generic. Most RZ-variants so far do not have t=
his
> > SoC. Would 'RZT2H' work or is it too narrow then?
>=20
> This is too narrow, because for instance the RZ/N2H , which is very simil=
ar, has the same SCI

You know the differences better, what could be a suitable name?

> > >  #define PORT_GENERIC	(-1)
> >=20
> > Does userspace need to know this port? Can't we use PORT_GENERIC?
>=20
> Userspace unlikely needs it. But unfortunately, the port type needs to
> be checked at a number (5) of places in the driver, so the definition
> is needed.

Yes, true. You just keep consistent with the driver. OK.


--VNk6bS00O/5/s11l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfh1QsACgkQFA3kzBSg
KbYojQ/9FB5gvB5RvOW8xCsWQjBt9kBNA/r6jPiJof4cC6pgXwKUadKOPLO/uK9k
G+XdjU+i2rX/sMxw7MQwvg5n+9q9RmPu6gpb57WMezAfitEc3lvVyDu/FReLAHw/
QX42qa3Fd5sGg2WM4NLKlek0BIUO96bdAdhmGkQd825EjNfESTJ+8tKFbJDESKp8
bHssgSpAUVmSDjCby4h0IgKuRG8kdPLus7wQul6/olnA0x0wArFOeKqrYrocOxmz
E29D13zfVPQ0PtArkKc7ThAmw2L1R1DXDDWdO7SJ3Tau52aCVweHewSKoX4UPv4n
nQBnNG1IWytG2dTHBN8Vy8o8KKxxmuWOi8ZcjQFhXXTDtQbT9LCnJaMf9wlZoO06
emLUolu3rgHdQzqsm8T1DHHGmaTte/8rjtUNtRI3ZxZwn/gtTR8u62UTcOAGxwts
woXtxBR+FX7tsnAnmSzahO0BMiBxG+mjLI3eQTQznkL/wtyRz8EvS4zm/BaZAQrP
3EeF4e/pc9n7g8Fk/o24XaYyB5hrc0jsKyDRRTfnNTts4G6hIgF88w8Ol4+/WNWo
oopRL2Bbr+rqxbI6b5deafTY8tZSgJYuJxkJUjey5pkUQvjL/BIuDp6S+NYAeiaL
0HasqeVoQiu1NYpNT0EuhM+N3fdZLuxKasH0iHx6QteoIksSAGc=
=rVjt
-----END PGP SIGNATURE-----

--VNk6bS00O/5/s11l--

