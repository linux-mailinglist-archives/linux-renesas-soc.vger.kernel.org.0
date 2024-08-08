Return-Path: <linux-renesas-soc+bounces-7781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFAF94C0DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Aug 2024 17:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC276B27652
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Aug 2024 15:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D66AC8D1;
	Thu,  8 Aug 2024 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XOe0GqSN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A242718F2D3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Aug 2024 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130433; cv=none; b=qvnDMwFK34ZFDT+i8i3MmP0LHlcTkZjCIPv4WKSBuZ1RPbHKeNAAIaMzVBFMiiBSQU1ClFYK5VtGnj2PSyhNDSmLseYE8qg2LN7hjlqvkoh7Z9vg5vWw8y6xZeOiFLjZSJ9uYRG2K+4lf5aIRJ1SJjj7jgD9fqZwrVw2S9ruzm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130433; c=relaxed/simple;
	bh=bB4+diLO3Dj8yVZY3CQ1shLKPGMbkRUtx3klNZi+i40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8Bh+dwZBHR8zDIhNA3NndTT2blOcicoEl26m6gFrR/v26hYSvs24UNuBuoUu91S6rrcPwelCbWvvtngUpMHxtlbMBE1tlbnlaPdjWjFbLBfkkmrtWeGshNE0WtYVePzaKwZ4mkzv8rzwRMyDUOyDvSJ1J4eEhwQMQrKepx/z88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XOe0GqSN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bB4+
	diLO3Dj8yVZY3CQ1shLKPGMbkRUtx3klNZi+i40=; b=XOe0GqSNNsCdeVrU7s79
	SMTvd+Ly99GoRh2WCcuB6mX5p8JCLCtC17bld5WOb0BHl0riS3TGPqiUhyneMAPV
	aa9n8DkrxMv9kKoaLewVwxXn0aV5pbJd3lmRC/UrjICxy2Es3ixcMvdq+nWFYjpl
	EibajGyHPsnJdWwSlWjBX6s7Ban/n+gfixPzwp3XmkKmAKy9wd9VO1j5i/Jk2qkx
	iV62g3qX1zrzJw/SY7BfKuP8tT0IoQi+JDQP/doPAvsixd0+G+nS7FEhG/ybs/zP
	5yoMm1VOgJUVbbsVyU/JkxFle7JLXcT4pCmZkC9asWl6AqJf1hK3ZYLFd+5SjYDe
	ZQ==
Received: (qmail 354866 invoked from network); 8 Aug 2024 17:20:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Aug 2024 17:20:29 +0200
X-UD-Smtp-Session: l3s3148p1@bAwdkS0fJGttKPBr
Date: Thu, 8 Aug 2024 17:20:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 06/11] i2c: riic: Define individual arrays to describe
 the register offsets
Message-ID: <ZrTiPFPb7HZOsynd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-7-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uuS/sIuwaFYQIF1a"
Content-Disposition: inline
In-Reply-To: <20240711115207.2843133-7-claudiu.beznea.uj@bp.renesas.com>


--uuS/sIuwaFYQIF1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 02:52:02PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Define individual arrays to describe the register offsets. In this way
> we can describe different IP variants that share the same register offsets
> but have differences in other characteristics. Commit prepares for the
> addition of fast mode plus.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Looks good, but I can't build test it currently because patch 5 does not
apply here. Despite that:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--uuS/sIuwaFYQIF1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma04jwACgkQFA3kzBSg
KbZMyA/8CBgdnWPiI3uYixlud4f+U8nD79e3Jkfd2NKthTs/3GY9kMWcg9V1mcdW
lmCByRY73MJ+mzoQkPNTFKg62ATw4cTdIBQHURqLvvB/pzEiB26qfRxxaTBanKf4
NuK5P4m1vNCcD63wpcNgpt8LKgbdFSNMq52vG8nP/qWu9V+Mfee3Y3UWE4wMKTEY
EiUVlvcGBV7g7Molnr3NVEFtqT15r5wKh7+hA8h6NUy7Jp+1qgBpJGPdi3GKRyAZ
VbivkPIrhFDrcloxazPj3AoPs+8Q8h01T3Q+S1UKS9cblbeGBILWX4FHg7lfLNR8
ip/yLjXl5K3GT66Oq6c3/gy4wglkh5fsNwDp16VfsHDmDg82/TqH0ra7g9yEJzwh
BrwQ19n2WBnMRXf7q0kUJyDoUNvApCcLthsyHnB+lecBrEI65pTpKDQhkW1UF8wX
9yJl5ehSEwOdBpUwI1iwXp1zeIMnrqU6FR5u/1B7de07ziqjLPv/JDboQRE2GKvz
NOeRwTv/0kBsqwDplgYbk37LcfpkDxExOdM0XD0ix0OVsmnKFuKkZrQd4NePVDOf
xJdReYyMRIbov63IoApinTjaHORZCSVtm/sNiHZyrYQe0VdcNPNvPdumXW/RXkUa
UI2H3PimKk8EGoO9wNBJ8N75P5pQxdVWtVSEHBrKUrD8efN+KYg=
=3q2P
-----END PGP SIGNATURE-----

--uuS/sIuwaFYQIF1a--

