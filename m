Return-Path: <linux-renesas-soc+bounces-17745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A784AC9ACD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 May 2025 14:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BE7D7A643E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 May 2025 12:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78619239562;
	Sat, 31 May 2025 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z78M1p4V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52357238C39
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 May 2025 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748693368; cv=none; b=VDoVUtaU/XGdtS8MGxkaAba3k4onaqaR15TX/RkJqLJ+2tcRbxbjBD7KB7w36xAowbGCfctOInW2B4pd+BoEsdK+Gper3lQZCEnWTw94+cZcXtWxXI+ndVDe9yz1GJxIS16saUmm4677Oq6VZqZ899AGo5SPq6sZqmU3bzMde5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748693368; c=relaxed/simple;
	bh=n7wWJCased/X6Q4yYoEfM4pu56HoohPkE1nQd/iu6QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMMyPkwJWT4qDTRCwxc1fkcPjYTcm8O425AFakfpOp3tr92F2NszYQPfWaBBqIybv23SUsfKpz66tIGMlzd/9ZKmFPbs6LiF4xtzyTh8Wsi4QorIo028A4pSlyzUbZVWdve318TJlCrXVC6ds4R7PXKmbWsnk24ciB0MViJybB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z78M1p4V; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=n7wW
	JCased/X6Q4yYoEfM4pu56HoohPkE1nQd/iu6QM=; b=Z78M1p4VzQPxgoadfkJS
	IzsLN9NTqJMqTMHnHBLngmDg7fu6EDcNFAJGFkTsCIILhDGk+MlB+S94//xHll3Z
	0nBkQGx1JlLjdrr3bcNo2fhiugFb52VYfI0CmYoQuTs5rmI4UbOkUBHvoxVfYvm3
	Xk+s3vUHQlTgrGby7Sf6ZgN7884+mDKSoPbYJCrM+ekyh71DRxQ/6iH8V4bXz5d/
	mNrE78nzeuGViqowtse+/ntdO/GLkwQTtfJ85ioPuMvyN9B63NQ/qkBjk/UBK3ek
	Fu5QK6dOo7odpDaql+hsmMzPEBiJrPozUFi/RejAbtd/yhdDlpUrIK1EtlvGR0IK
	NQ==
Received: (qmail 2657626 invoked from network); 31 May 2025 14:09:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 May 2025 14:09:19 +0200
X-UD-Smtp-Session: l3s3148p1@Mdh4Zm02biVtKPEF
Date: Sat, 31 May 2025 14:09:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/6] dt-bindings: i2c: renesas,riic: Document RZ/N2H
 support
Message-ID: <aDrxbYDvyWXkXQlE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bBxDD11VtxK9pPgH"
Content-Disposition: inline
In-Reply-To: <20250530143135.366417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--bBxDD11VtxK9pPgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 03:31:32PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> RZ/N2H (R9A09G087) SoC. The RIIC IP on this SoC is identical to that on
> the RZ/T2H SoC so `renesas,riic-r9a09g077` will be used as a fallback
> compatible.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--bBxDD11VtxK9pPgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg68W0ACgkQFA3kzBSg
KbYUZBAAjdkeYP0JYQbYhVU+p2o9rq42ciltQR8VxNq5h2rVMh1DYf5TgXmTDPoF
jrr6OB49bS8RM0O10t73VSFTrTlRcpI3QWwxeU7AB4rVCZNukaTMQpoOGjjJJuQL
3aynlNVudceKVHJPws9RhTZh7u8ZnWzZ44wIvc4R3PDWgu8zEFCnmI4GiFYviddR
lNrwpuPJnH7SMwPsNkYqIcDKFC2M1X7z3WVgYrwr3+wuvGGLY4SvDzkIgWw3eLja
b9dtwFQl8AGINas3Je6jDhtRYe869SuerwO5n8SPmjmYneYZ4wvyLOOH0wqkdr7J
+gaOBErHVLEjOPw8gFBeEEKOKczvGawzaYCgIIq0Nlb+oKEbIoZG41g8uYuAK5sQ
H9WATkHbiq8u7cTGRolD5SN9QN69Nb/Dxj7aLH+x7gOA5NFzY6ItOKnP/k+RsH+C
WyQk2BHwMOhp0QXofTIFhKbYCyvng7hpoG/kAHKNA+pX1VYeNq2/dhBZqHlbSC+l
u4DKNT/9gIPWYR5kqHh2lH3nlL8ZOO5i31NRoOmb5GmvcPPzZIHnQt/dsLYBqt+/
BoqixJ7SKWbvfLLLjsITmgMrPkvaLDiUrEW31S3C0jZDs6Y1XGg+drhATJS7BwF5
LElu7HNimtV1mVPuExPYrt/5YcpB5pBVpbLLyX3hVx8x9T3MBLc=
=GG8A
-----END PGP SIGNATURE-----

--bBxDD11VtxK9pPgH--

