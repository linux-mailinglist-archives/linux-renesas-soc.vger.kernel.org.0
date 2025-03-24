Return-Path: <linux-renesas-soc+bounces-14746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5658A6D7D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 10:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E1647A77FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 09:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC75B1A5B84;
	Mon, 24 Mar 2025 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kfbWEBfw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A031F5851
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742809461; cv=none; b=e/ZKvjap+SKkoFwgD9lSgLLNlpBLmSljn6IPLEfem0o/5V/NwWkUz4VVoC1Jpjr51OhCJB9IfqIDYrZhRu5PS2oITsVd5JjbKU/l9QTZhcXIwzbGD0udU7mdzW8k7W7iTVkrPYjerODtgUq/cetQqgjBdWiM69F87iqwTPwEi1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742809461; c=relaxed/simple;
	bh=ZwZLVEC883iMdJgNsdYSpUpFPhWJPSZZ0C3e4RfHTgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjJNBj3QzIQf57KNeqe70QcuiugHddNo90PlUNS84lTBY7ERuv9ZrVYPdquz/c5AVIIT7BB8e3zlj7rxNfd7puyOuAmLKUxGXfU8SY0QgJQ1sGmhdP0FCACkhFJNRlin12tzieRGYsEGca7kBFAz6yZq1jIoAmFMU6dyqFak2tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kfbWEBfw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZwZL
	VEC883iMdJgNsdYSpUpFPhWJPSZZ0C3e4RfHTgs=; b=kfbWEBfw1SIvZlkQv25F
	M0iJPCs4vIaupYGmIm+mOHtw5pllyYBHgc//W6jKN9QoKm0MFHxd8ZIOVE85cJ75
	mjIr+HQciaLasH0jt5/+w2iiavgLughMFvv0VejbvoXfKOK4jp/YrWsittHxv1q3
	6JnEYkj3CQSN6tdJfRXsmCZXnmqwnsuEiPxokSq7Qn9XL8ZjSGRC9fTyCYypfth4
	1tVkXzRiiKRMYcholPO24QRi0MboWKXp73ZSMw4uTI9y6hrW8yMLQUo/wTOhjqCm
	w7FilVtlpPgboFX36WkcjevbEB/PaM6ReIt27hEhe7Bn8KLDPBiW+tFGajHnCqKq
	YQ==
Received: (qmail 2486927 invoked from network); 24 Mar 2025 10:44:17 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Mar 2025 10:44:17 +0100
X-UD-Smtp-Session: l3s3148p1@66acchMxkjRtKPH/
Date: Mon, 24 Mar 2025 10:44:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/13] arm64: defconfig: Enable Renesas RZ/T2H serial
 SCI
Message-ID: <Z-EpcXNXhSZ4zo2N@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-14-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uCRVzdt7Zbst7U5c"
Content-Disposition: inline
In-Reply-To: <20250306152451.2356762-14-thierry.bultel.yh@bp.renesas.com>


--uCRVzdt7Zbst7U5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 04:24:47PM +0100, Thierry Bultel wrote:
> Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
>=20
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Basically OK, but as said before we need to find a better symbol name.


--uCRVzdt7Zbst7U5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfhKXEACgkQFA3kzBSg
KbYN4Q/+N3koHF4uMmka6PokDDctb2ON5DN2pTLTVBF/LpuoznWskAdhzQQ281H4
psoKCXfAgXjgp61Dzfv1CgwG6i7ufyw1AIePI5562Zv/o7JJ8Vvvn+ERR2MIqUtB
UlldHS7kBQ5818jvJ6W27kDC8qdE6aMta2+OFkzuiO6rtOR94Dzx+O5j+IiXlFJ9
rMasjd5WIFA0Vg0kUCB+/NKloTeuGyUV0UOLamd0YsQSpLwlMc9CHPv8xSZcU/CV
fVtZGK/G+Q3bnCkKxh8PYWry3vbCiesRLUCIirPJS6rCJKsRlSJsDl5GYXviYvx7
1fV9PvzNIkjS0NYgbUQfCrmPP53Wl6atZqUScXwuIjSohbWrdVVPJiWYvHHAVbUC
QauVivAuBWJHDgOSx1GcNZBoQSxPW4Xf1jfEDDr/pxqQ2CmjLJWoNMR1LsFrKRdz
dcZEPCBSeH+8nZsnfSejgEcLYBJaw5uUdK53OMHXE6n+VY2lHYA+EG0B9Hk4nx6o
6mtUoCuLf5kyNqKHBsMNc1lAz4bx/rB2HtmHEgPVX9lGRKN2RI59f6u+ydLP08BG
L8LG3LXY9i/qpqVZJJ1bbFgO6y350l+U9EqAvPf9wkHKvGhuSiHSelJT/rS4a9jc
Uexcdzq9htGH8FtmJhIir6AfxLNH7cP61QWrdWQVhrtRpR3qz1c=
=PYQp
-----END PGP SIGNATURE-----

--uCRVzdt7Zbst7U5c--

