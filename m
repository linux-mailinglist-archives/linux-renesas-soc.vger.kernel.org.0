Return-Path: <linux-renesas-soc+bounces-2314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D1A8488C3
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 21:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F39F41F236D7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 20:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01B6FBFC;
	Sat,  3 Feb 2024 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WMJq28W6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFC613AF3
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Feb 2024 20:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706993130; cv=none; b=LlBXiB4ENQHAuwbgn0Y4fn2BIn/IJpn1fKKlHoIfEG+HEVoRGhH076ONF723JljKR/DFQ93j0d6qmFQAa4TH47THPP3+6gvV4iKQTo9O/8xP5qdyzqJnGzZOLBo9f0BInin7woJW0YtWfxCp4aVU6fnVl/tNIiy8bmAkCv7TkE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706993130; c=relaxed/simple;
	bh=eQqAeYsRQkEwd2mqks3TTEvg18c6MGX7SIaOmWY9X3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dvh1UdUX/3JtRE7HbtNAdpOU/sDD5TchrMOBaUg0ZD6NSOpUp+AU4I+WBeE9NwKsOOx/d+wmdGo4GkVrSGhPYB/U7eNY3CPzcTLPyhorug8a5W+3A54fYJdfYe/7OQ/iWc/jrBzqhosIle1ASGzcNMrIkDP7BXN9ijFYX3L3bpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WMJq28W6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=V3Tc
	O0m3MJGbolHZ6yonazC2e8zsiMfbBe4010swlIo=; b=WMJq28W6paJwCT61HcvX
	GmDzoAJOs7f59n1uLPZWQmsr+FCTtAJrDI2HPHw6r32BKf5yrRafCAj9NBrgyR60
	Br1zkhg+Eoa4njKhbzSErv+PBe1gTO+LdFmAxZ2JhmNS8zPu12Q8AtX9j3OxVmj0
	1bHuxqvzwZuRRKkc0mWySX1z/kPQx4CmOTTs8LlqPtsoE6w5NLEZKGy8pXzfPI/K
	lw0/W4wr6egvWmgLoPjEp4dtt9yj2hj1ha9jwyZE15lryBjRHN5YQ+Ka9nKiNF0m
	iqU94WSuz/P/RwGHsTvovdytk7uxudijLHs0cEiyW1IJkvxoC52lQQ/gG/u5PYg3
	rg==
Received: (qmail 317273 invoked from network); 3 Feb 2024 21:45:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Feb 2024 21:45:21 +0100
X-UD-Smtp-Session: l3s3148p1@FjmkToAQbOYgAQnoAGo3AKaQ4acoehG5
Date: Sat, 3 Feb 2024 21:45:20 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4
Message-ID: <Zb6l4PbN3l4SPvRN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <bf7b105f7d9728ae5cd9fa99d1cdd278d71e7df2.1704723713.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yYQfSxAMBRmPkTiI"
Content-Disposition: inline
In-Reply-To: <bf7b105f7d9728ae5cd9fa99d1cdd278d71e7df2.1704723713.git.geert+renesas@glider.be>


--yYQfSxAMBRmPkTiI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2024 at 03:24:20PM +0100, Geert Uytterhoeven wrote:
> Currently, all Kconfig symbols for R-Car Gen4 SoCs select
> ARCH_RCAR_GEN3, which might confuse the casual reader.  Prepare for the
> advent of ARCH_RCAR_GEN4 by extending the dependency for auto-selecting
> reset controller support.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--yYQfSxAMBRmPkTiI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+peAACgkQFA3kzBSg
KbaIDw/4zF03lZqaS7yWml+cqkjAvwhlsiPZLFtVBxwUDQTbXuneziaWBQbPt5gR
MWnKxvKAa8yjfVQVV22xMeE+qc+zceMMiYneg/IsgXH507z3oIuuLYcf50aocwRd
XUZW6y9Ey6vq9atx/mnFUaziGEhyh2olO59ya/H83+xEA1O27jrK+3NEzWvoZY73
nvbXLfIdD0PydzbMFAIqwKG63HzKXVVkqbJLz0ucxJsb8g0OwytIcrCQh2VSibJB
oRlBI+VtIusYyUtaAnhXOsU/AtvCLN7gNkT3GisU7spGkIHgtlXYqKmJs+QzlMCO
mlfuSseTPJkauyOAFlo3NwRK4tJIS2RDjQn3bvIgJtz0k8KllJsr+5xi0NyRfj5v
Vod7vaF1FxlHPXogDRxvtXowxMYe7nmGb2JNEfxOwhhh3GG7PBXZg+Ce/kDTfre0
QofX/Nca9oel8yaI930ws56vYRCodliK4FI5gl2GBzQTDLtlXOOyHCN8WPYkXVyf
v0qwpmJaG6qd0mNeU9IoeFwGcXKo0lx1BIPloheDK65ZUXcS4rxs/jZIiSSY1fZj
JuM/uz03yU3F4u7+YZo6r4oOPZhsITi3FqBlPZuMEtOukTmGhsj7htl3IMJZxKFO
qDLeLAinJnKFWFFIA/TGocmtVO0h55/rcrvScnw3hftgr4g/gA==
=D2c8
-----END PGP SIGNATURE-----

--yYQfSxAMBRmPkTiI--

