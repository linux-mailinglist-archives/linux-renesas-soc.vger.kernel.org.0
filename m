Return-Path: <linux-renesas-soc+bounces-14564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0983AA66F59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 10:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65F1242169C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5AE205ADC;
	Tue, 18 Mar 2025 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hxOlWZgL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE82204F85
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289074; cv=none; b=XEK/9YrYjgV/s/dugcsvvKVHHyo/MknnF3EZNLptJ4LoblC+QhlbYua0i0zy/H7o7iI4dPPoqkPDM+83Ykzo9X14g/Uzp+2RIJfRtN5pEnpV3gzcukr6QkxpLE561s0rcnaG8xY2DwEYwd6BGGSwqM/Y7RKZC+x4JrTlVdXTaVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289074; c=relaxed/simple;
	bh=VpS5HxcQdtuSiPOO23jqoui+K6HeVqyZdROJMlSwZ4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lu6BYPoCnS5W1TxNZ53/+/GretOxpBEn1LriI8hd59GSvxA0eWn0kqd9PEoN0bN9t3Hsa0DmYQojy882R4F+giwJM70YZpELPFkS5lXs4MYkKo6S5TmwUFSsq0un6lncX5xFw5S8YgTqeMX7fzx4/AMPUiH7sHCNo5RtQ2e8dkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hxOlWZgL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/aXg
	Nd5UqKHD15CM96xVlyMy+rAE8wtbTb393XNceSg=; b=hxOlWZgLcZiGRCcHZ9hr
	c4Br7AiUqFyEIZqvALnQDgS3pNJPsH84RkhL/eG2BE44pvNqDwJ4bh8W8u0mIQ0H
	W7r66myWfFQEq/sItiDAcuBOYnSRisuZmjEhK17jQ3Zc4iXVeNR7ty90akZDo0r/
	NOCjfvhH0c9kLYH7YLDtOEjuP0kOnSiFpC4fE3l5U1JI5OHfRh7dyShJ/TvKiZ7t
	C4PWId6kXeUSnM2MdLS1FyTTqTvaDxc9h/099lJJd5R8DZjxg00gS92EoLXMdSjB
	6BbgbX0bUCuqb+NZADi6Fjn2Lq4eerms9fNaisx+YLCMLMeyIU6jGFp1fzzChbPx
	qw==
Received: (qmail 3659959 invoked from network); 18 Mar 2025 10:11:06 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2025 10:11:06 +0100
X-UD-Smtp-Session: l3s3148p1@rd3mSJow2MUgAwDPXyTHAJp038nK7dx+
Date: Tue, 18 Mar 2025 10:11:06 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: document RZ/N1
 binding without DMA
Message-ID: <Z9k4qrFXCRf23MDo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20250318085353.18990-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWP8a5eR_1sk2oUe02KdiDaibHnqAHbn2mSyBHzP1FNJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BIXx9JssLH5VvoiI"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWP8a5eR_1sk2oUe02KdiDaibHnqAHbn2mSyBHzP1FNJA@mail.gmail.com>


--BIXx9JssLH5VvoiI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +            - enum:
> > +                - renesas,r9a06g032-uart
> > +                - renesas,r9a06g033-uart
>=20
> I think you can simplify by replacing the enum by
>=20
>     - pattern: "^renesas,.*$"

I still plan to remove r9a06g033 bindings from the kernel because that
SoC cannot run Linux with only 4MB of internal SRAM. So, all this will
become "const: renesas,r9a06g032-uart" in the future anyhow. But one
step after the other...


--BIXx9JssLH5VvoiI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfZOKYACgkQFA3kzBSg
Kbb9UBAArc9LM3SQlvOhkaeRjrru1zzB1QDY6ohrfuU/C1NgIp9BjFuY81S6l/0l
evnPvIWAqd9/R1XSm8GzMPoxjDjNAUvatq6NGL5YKGVinNunM47lyyRqbqYnqqMX
QklkXesPbd41KHgFg58GOINju0KKhnNsxvwpWBxJ2UG/FCEvaYw6u2eIZFI3B9aT
iROl4e+8kUiYcLaiMRwcPjDTUbCKNHMwURNC+ypZIeydQvKFNTHXmwpsjcBkVjob
3M48j5jkJRyQXNk/vSpJx3y89GZwcuEb07ru4LGEd4FIMFzL4zHZ9MwGrhzriFSw
R74cuFlsyd93wMLFuPv8Ab/LHtPiFAbsgzgWvOjBni+X5lGOBGii31Hn61SGHHza
w57/Y3+nzTQHCFvrHGp6XapNfs0mwg5N7/LT7dwRCN1PGqUEerHfkkytYifPxdc2
gLgvWqgXzP1oFXp8Gq0CK6fXrUHf3c2OPqX+I97Gzi/PXMT4FlTlb34AjmDxg07S
TkY4D/R0V1vqNIe51oBvFvt0ZMxfC0AU5C14IV7MXHdO4QeuP2mqhrEOvmqOB+a2
zCKl8WZQrgDka+7KlB6OMJLisUO4gT9lPUXohLID3ItX0hANgWS26wJpHBaTGc8/
C3s+jV79gYfcV8RIIILsqKasCBKZrp5CyfdDZICRFht04YXnH0o=
=FOio
-----END PGP SIGNATURE-----

--BIXx9JssLH5VvoiI--

