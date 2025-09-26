Return-Path: <linux-renesas-soc+bounces-22405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED1BBA3169
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 11:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 797254C6CF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 09:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4E729BDB9;
	Fri, 26 Sep 2025 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DbfUQMZD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAAA29B205
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878108; cv=none; b=jN9JsQOit4E5JHvC6bfLCEMWiH3djo1+eK21UJBGBlwa67g1hilNyIfQr4rvZdIuP1ikHJ2/isa6YHhM/h9xGsCDBwbg4ylnynFkh30u9zb6EYO35eI4WO3wGWXVSr6tu5g5H6GrbGHC2IvCUZdceQNqeSGm33wgOcRF5ExOGns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878108; c=relaxed/simple;
	bh=kONY/WgDIpRHcTB+eEvoT0XM7fNHfY7Naq/HZbdUMRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5zGF5JqpduBX26O71TXbTK7RaFmW8S49ORoo8+qWtpKzpPP9vI75DdJtz4VUgvaIr1axS14TD1kTAfN7nmVbt4RVnCEgEbuOfsyBTzDK0S+72zVVI1LIDf19Ylh3G/2t3527MpuHBYYdVdIeQjtBlbeqzrkGEbAVAZk7jSZiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DbfUQMZD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QKtp
	8zfrVj6u9HY8qxhEQCKZKJ2UZhB0qJu9a4h5+s4=; b=DbfUQMZD8RuWwnbKGwWz
	DrVnhP6i/k4ksyxKTaVxWUwkGP+5s8sZlO67KqPn71a2D8glHOWqogZXyUNKnl3B
	pPl5CtC0t2XcChnBp+RP2LKXp94ADLF/cNBr9YRxJR00/YtrtbI7gcdj3pEL6hF4
	Xhz7DENZTeB9C3JJGQce60A3+2OLxbUahRhHNkqWuX2NNV/trnVeZFnpLBjBC3Ay
	LhrwOb18//7iE4u8dWvCyAQH0wk7Kagvi+OIPNbcomYsbCKDAmFzE2v3OVO37HcN
	z8f9tEwW+uCrNuRvosX0ilwW8V/ruby1xkj0UIXUcgcCvTdl/P2dfy+twaARLhRi
	fA==
Received: (qmail 2198339 invoked from network); 26 Sep 2025 11:15:04 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 11:15:04 +0200
X-UD-Smtp-Session: l3s3148p1@bHOguLA/dN8gAwDPXwQHAL/S9V79e5yL
Date: Fri, 26 Sep 2025 11:15:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe
 LEDs
Message-ID: <aNZZmDAAdLkISA9F@shikoro>
References: <20250919100740.28429-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVGthcw94vXDErZTissJ1wVPvJKaLb+j7D8Y77-E226PA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L18wlUVkSYcJ/5Jb"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVGthcw94vXDErZTissJ1wVPvJKaLb+j7D8Y77-E226PA@mail.gmail.com>


--L18wlUVkSYcJ/5Jb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > This patch depends on "[PATCH v3 5/8] ARM: dts: r9a06g032: Add GPIO
> > controllers" which is still in-flight. I send this out as RFC already,
> > so we can discuss the introduction of the switch dependant settings. I
> > copied this approach form RZ/G3S.
>=20
> I am not opposed to that.
> The switches are needed in both the DB and EB DTS, and in future
> DT overlays (if any).

Thanks, however, Rob didn't like the idea. I have to add we actually can
read out the switch states via I2C. Dunno if that's different to G3S
etc...

> > --- /dev/null
> > +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h
>=20
> "...-db-eb-...", as this header file applies to both?

Ah, I forgot to rename it.

I agree to all your other comments but we need to decide on the
principal approach first.

Thanks for your help,

   Wolfram


--L18wlUVkSYcJ/5Jb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjWWZgACgkQFA3kzBSg
Kbb4ZBAAqTBN45BjJuLRM6hzBQEUr3kQ7n0BOoW/YP2CNbXNfTEiXkvDppT2aiDg
NvNExSZOoPCVk+pgTNSj6Jcm/1nWiwSpg+f7QEI6WzKT89phhGbZzDRneoE8+Yo+
n+VbN5HpfQLE8OQPlimxBAoPNKPiVn+Jwbzl/D3uQBsU4Zzff3L4fJusFnlKUwnK
I23hOeUjuC4IwdH9Pg9BVFgxgXBAo4Zm/uvjHqX+mQFhXAXedoUv9xZi4bIYkk3u
IVgj3Rc7KcWqUAxV0wNfnEIOy4a9WBG5IToS3XnYy25xJGJvZlhzZcjJAKEowcny
Ug0ngnq/YI3ZySFt6g1kTpYVdK7MLVj2avZXh7y0Ij9LQN+Rwth0EGVDRoMBq679
3K7LJCsxRii8L4tNM+bav+wGhih2MEWvPfglOyK1dLNmsZh+40cAJpTUtY/3YYPs
Zu1B+cwz4syP1iBdB0IqKESx95AoJNq3MfFKLqtTNinhfdRX5B8ceWjoWUZvrqKq
vvYjEz0DY13A2JsHAEDJu83WaFSv5zo+lYN7gbyrwnSaAjU6ksYSl9oVQ0HFzRX0
9XFf9u5EptfDfCTEjr/lx30iPUF82peJZIdGa/BS6F6vwQb2O+uITzueVwd6Ndxm
Z4vD+aY29v3KgbuZpR9Ihpsxi5YPKWHzYgzvAlTgdWMAipHb4nA=
=f6pg
-----END PGP SIGNATURE-----

--L18wlUVkSYcJ/5Jb--

