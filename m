Return-Path: <linux-renesas-soc+bounces-26954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC3D3936D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 09:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74D7D300E00C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E630284669;
	Sun, 18 Jan 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aNEhv4wk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54223280CE0
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jan 2026 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768726752; cv=none; b=ePHuAyqGZDA2mpA6r4vLEgallhKP2HeaTbwoQJT2rPnlaLvNzb0oRKZmrdNWnfP/DjHiE1XAAGl+dGRwZ1ZhDm31C9Iy7Iq5lswux8g/L1AVMLGdx24mz7BV8j5Y2Ebum9M5ir50tjVxN/S9N6+V59+Sw5Eeuf6NIUiGdKncRB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768726752; c=relaxed/simple;
	bh=2wt4FXitjx7He11KhFEMJjihW+3VNXLwrK+DkNf2WDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J94sb2Qs5CsnKQh4lvuBkhiwhL1+sQjF44RxmvYal/qg7CS3OjNqJGqvJORIcnjBNFFJi28F0JoQmJi1lq4wbKDxMrEj7R36sZATLVqKvpVqtShbvNVFM/CEBlCUrFXK+8NPGeLS9q3NhmC5NXih5HY+QvIlNyehS+K26FTKun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aNEhv4wk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fanY
	txmRuuzXQJ2K5eQ0PcI2YHGrm1FfDB1ug+eYXF8=; b=aNEhv4wkxZm/KQTFbLjJ
	vIQB4JvMZCwqcxYMzOiJ/0/P0zCMoUZxo8NfXTv0WD0DtyX0XZZpPoP5JkD3Og43
	K3d8sN92HzqFQhXUsapi3z17Dw3wXGpUW23ZYRMpLHcoF96l/ssolDetvpnPweza
	blLpOqnQ7ycaqgJ9KvuyTd0W9Xb47Odah5YZOd7FRCLyXymS5bGNynqu8wzFbADz
	dA4ZWb9tP6ldrDGugVmUhWskAIHOQ7O1eM8iu2TnWkjynCFWoQFLKATAQI+eNk1E
	TnTM759vIjCMw3xSR67OWkPyPoga9nU6KCD9kD1eC/zrZWm0gzBu2jYJFZk52Q6h
	MA==
Received: (qmail 3539292 invoked from network); 18 Jan 2026 09:59:00 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jan 2026 09:59:00 +0100
X-UD-Smtp-Session: l3s3148p1@WZsKyaVIZIQujnst
Date: Sun, 18 Jan 2026 09:58:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: add QSPI
 node including NOR flash
Message-ID: <aWyg0wP89BCaN1tN@shikoro>
References: <20260116114852.52948-2-wsa+renesas@sang-engineering.com>
 <874ioltu94.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g9immr4DKGlvpLxW"
Content-Disposition: inline
In-Reply-To: <874ioltu94.fsf@bootlin.com>


--g9immr4DKGlvpLxW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The tuning values used came from Miquel and work here as well. An
> > interested party may try to tune this further but I will go the safe
> > route here.
>=20
> In case you feel adventurous, this paragraph made me remember that I had
> noted down some slightly more aggressive values related to the DB board
> (which I don't have) in some of my notes. A bit of digging resurrected
> the following:
>=20
>      tshsl-ns =3D <30>;
>      tsd2d-ns =3D <3>;
>      tchsh-ns =3D <3>;
>      tslch-ns =3D <3>;

Yes, these values can be found in the BSP and could be deduced from the
SPI-NOR datasheet, too. However, I got -ETIMEDOUT with these. Didn't
investigate further (and no time to do so).


--g9immr4DKGlvpLxW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlsoM8ACgkQFA3kzBSg
KbZtTw//aq9SAageg8A9YN/ePHvDnnWqA3UMyvR4lu+uV2ZD2g9Hdd8dRlsGZiV1
sf98povhfW6oMYV7u0liJgPEEE9wdda4bkr6+VTtHSxrQ7koODHrzt1U3HGXisdY
0p7AdjJ9eBmi7jUYGYDBVvv7I3Dsnrvg5BiXHCuN/mrLSDkb/k2yytUJbvV3WiBP
rBHEgnrB5r0c37GSvCHuYFhDbntLMAtod7FkeAZLrO1L9oXsiRpfpWcyM0AD2DhW
VMsCNk4AqKY/FentUzSJ4A4lrcldYUvWP6EXP9+3Wpw8GjVDhhNdeevhKreK1M6n
T/jBWO8URIh7gsRkLAOKj5WLb/G/zBKXh600i5n8IOZaE9swwWkwAXkfoK9XpnYk
CtMTvFaZtp46nJfN9AS6UIj6J/XHqMJJyDMFuRPzIiMzx7OZzLOi8usHHh3tPg9z
qdAmImCcpOqAi+ZNBPKnKKfj467nviXYoN4cG/EWEQa4gnHwzzoDMhzdoM4J6rvn
6Ujsawk58ZpA7YXflBntSZfXLhHxZZNGm14vD2uKn29LgmtNfIIg3xjncW2f51Jp
QV8G7BHpQ9DFdmcmHUAXdx7j0fHSRmQ6XlmxXRf8x+iEAlBS5i1TR/G4xSNvc0yV
X8w20rfXYjHZs4x4UWANU6Lg1Ahpdra2thKAq1+nGwpomEPzeHE=
=CZuo
-----END PGP SIGNATURE-----

--g9immr4DKGlvpLxW--

