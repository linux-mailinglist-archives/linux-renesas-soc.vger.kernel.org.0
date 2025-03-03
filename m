Return-Path: <linux-renesas-soc+bounces-13939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C4A4CD5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 22:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB14A3ACBE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 21:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E561E9B3D;
	Mon,  3 Mar 2025 21:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Rx4YJvKO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CB123535D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Mar 2025 21:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741036450; cv=none; b=UlLj0FL/4oc1Jcy0lduTVI2tTHQUvZLlh/hGG33UVewZlBcAb3NRpKulsY128qfko3NkVnq9+c0/JBNy2rf41EpSTYfQSWVgXQY0o34znIMCVW1YjFDrKzPhiwN4899jw6I/861gU8a9grkrpwuBcaegQwqrT5263M/YZt/+oMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741036450; c=relaxed/simple;
	bh=mDBzmWK3I8axUWvM9woFA784FHYmqHhL8aBgw+A6tUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLZOGrg27NBgWBAe/Ujpveev6dq4dnYssyNQGykjsN0m0XTgtsWYeggatYVPlesJC7RsSo60xUJ5xXj9G4V0dTDo2e2NhOwsCJmzpeiq4p+PLJRIdZMaiWvdHsESunRSlYjQikpffxdNjUCvOrVGb0srnwexWeTWGKY1tdPnSEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Rx4YJvKO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mDBz
	mWK3I8axUWvM9woFA784FHYmqHhL8aBgw+A6tUI=; b=Rx4YJvKO0W6r0LLNEenx
	4mnUuW941ddvQFK33oUQILjbpLKP8a+T0FvAMVaf5YP1Lw+xdEnS6d371NBcCf1g
	z6d06p6TVO0EXxtdHRDOoDLNoTofmy4pqo4TlPaLVcg/GpeGuyu6Kqoob3T38rjv
	Q0mmkhwAOS0GQvOHOiXeeWZgDLueqRU0iQZ2OekGupwu9CWK97uPVEyW5QyJpDXZ
	YHPBpLTiGP6RvMTripBAEKL/OhxTwaq7kPyK0GvoDK+j/qdytkYJv4e8gqLL/zqm
	h85hzj4SCbPmeqny423pgV1q6WefnbJQbDz8ZioLFav1ewg5rn4kUBSjdwUtupSr
	Lg==
Received: (qmail 2350727 invoked from network); 3 Mar 2025 22:14:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2025 22:14:02 +0100
X-UD-Smtp-Session: l3s3148p1@HhesonYvzMQujns6
Date: Mon, 3 Mar 2025 22:14:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v5 2/2] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Message-ID: <Z8Ybmol4j8wn1ARl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
References: <20250303113812.88014-1-biju.das.jz@bp.renesas.com>
 <20250303113812.88014-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P+WspBq8aIzrweOF"
Content-Disposition: inline
In-Reply-To: <20250303113812.88014-3-biju.das.jz@bp.renesas.com>


--P+WspBq8aIzrweOF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 03, 2025 at 11:38:08AM +0000, Biju Das wrote:
> The SDHI/eMMC IPs in the RZ/G3E SoC are similar to those=C2=A0in R-Car Ge=
n3.
> However, the RZ/G3E SD0 channel has Voltage level control and PWEN pin
> support via SD_STATUS register.
>=20
> internal regulator support is added to control the voltage levels of
> the SD pins via sd_iovs/sd_pwen bits in SD_STATUS register by populating
> vqmmc-regulator child node.
>=20
> SD1 and SD2 channels have gpio regulator support and internal regulator
> support. Selection of the regulator is based on the regulator phandle.
> Similar case for SD0 fixed voltage (eMMC) that uses fixed regulator and
> SD0 non-fixed voltage (SD0) that uses internal regulator.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!


--P+WspBq8aIzrweOF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfGG5EACgkQFA3kzBSg
KbZHPw//fUxiJAY1/f05JLkfUnnIyqDTQa8Mq2QZ6D/KvnagJcaXSjb0PRPtPlrz
7Uf/3hjoDfKAWDNd+b5WyIlyVt/FWq+E8i5cEuWTSpcCK/49J3secbnkjCabiMzr
w5BxPFTPjex7qz2RUjkMT+pZ+M08Jrkd9qTa41nmJsv5d4R+Kx2WjKGAp9Oz1Scp
XLAqPC/xwUl4Umq19m1yYXSlZGhdJpnGaqbkxL3g/n3cUPg+YF/wQCK22UJXWbn9
jU13vd2E2dsX3TjiuPVu5JNtAqQmswKOxqm540LpdGXUHB2/Do5em9qYf4L88ESe
u/Om4D6/fquA42buFba5Dr0UL5iNlBIjQUhs43vcbkACBXfRTSHBtMMbtdQtqz6U
pfwRSbBp4Ch8S477nT9uH792tME5LCbTj9pHT5GVgABFFSM6WaqlDprTJy2/FjtH
rxNZ5mfl1Rmh/XQ0gTIOog+QZpAbegf5sfKRz5HVi1EWU2XhroUxOuLcVfVRMNik
iyJUN20Kcl+qVWG/jmMxL36Nl3QtNtqaiT9DOHwpaTcuNxxGW+Q52p17yYkn+8uK
+b8Xfrgr0snI7+aAYI4Siuo7mU66ydeyPtojMHsHpaobUC/oKra8tKeOJRxV6v1V
UGJUbkwOEEwGoOyps/5jlUywDVg4EhOxhTA2LnC+qfWmbiJJrOM=
=fyAj
-----END PGP SIGNATURE-----

--P+WspBq8aIzrweOF--

