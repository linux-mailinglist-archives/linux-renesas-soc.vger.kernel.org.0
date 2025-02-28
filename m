Return-Path: <linux-renesas-soc+bounces-13795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8525A49594
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 10:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7F5D1648E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 09:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29822561B7;
	Fri, 28 Feb 2025 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SdH6uKqk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0442571B6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Feb 2025 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735725; cv=none; b=ZaNiOVOlRUOJftPPt8HTjYzWVOZ4SP1aTUm186a3ZaojAP+mECtVNH1kzUEzd6mbnqlPWbSPkZIl9HdJ1Lede/IYq3SQIA5WPA6K44lIhcGyWkLrNXHoNkVjQrRB/cD1TygPIYB542r8IOyH7tuK8vM2qEDYHmh5mcVl53OKIGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735725; c=relaxed/simple;
	bh=Rk+R0zS5jhBcajlns+/geG3AiOAZBUWGIdTDCfcrhpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsdLYDh5PY51lHs3ymB1q9Cek0Z0aB4rYZvt8WV+PsvOAvKqJNrbiUI+JP5+S8lZo9Ivwi45JjQ04S5KaJJ0UGGdCCMsH7SxKHUaoed33qdAPNgCqa1GnsLBQDlWLcHmGxBFXN6CeAPBwnSkSDoFtUFMky0QFfcq/fi1MseG5m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SdH6uKqk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QX0w
	lTfLevkzlmRZF9imM2uFC9U5033boPLPntnbez4=; b=SdH6uKqkXy9EyWTWNno3
	IiZWgmFsWn3SjH3U0oczFkyKvmDjl1N3zadCzvKGML69QQq/uvwNdvlpw+Mv3x/D
	9EmBmiHEKSt74PoaSc7OJuyEMJEJFTgsciockKoRwbi5NkGtUYm04i8/zygluL2h
	Z2SncWWPHjV/ObWxRRzze2P/eq5PJyE+6bnvN7ZhsPPRljzQQCnKeB/dnvamGF1b
	87QByZnpG0wMs2U1Rh7Tmda8bx9PjvD9Y73sVChCjzKz5hDpKwn7290prJ9D8DD5
	WPqbQyDJvPNk+WlMj+KGXqnD44oJS3DAdwgldP2PWIDRb+nwlrhjiVAQWi3fzPsF
	tA==
Received: (qmail 1243242 invoked from network); 28 Feb 2025 10:42:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Feb 2025 10:42:01 +0100
X-UD-Smtp-Session: l3s3148p1@CndKnjAvjrO57tsS
Date: Fri, 28 Feb 2025 10:42:00 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Message-ID: <Z8GE6G4TXC7dOB6_@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HpoTkOiCXtn2yMmb"
Content-Disposition: inline
In-Reply-To: <20250206134047.67866-4-biju.das.jz@bp.renesas.com>


--HpoTkOiCXtn2yMmb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 01:40:27PM +0000, Biju Das wrote:
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

Okay, since I don't see a constant state of the regulator, let's just
restore the original value as you do here. I mean it works.

> +			if (priv->rdev)
> +				sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);

What about introducing sd_ctrl_read32? Or ask the engineers to move
SD_STATUS_IOVS to bit 15 ;)


--HpoTkOiCXtn2yMmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfBhOgACgkQFA3kzBSg
KbYmjRAAoc8WVWJlRBYVVb2ebJFZVgr2TjzcLLophjOg/6VX5zDYMMcrZvoeXYp6
Hm14IuP2WG53HLNXFnJ0FCi3ZgsKH3kZbKXbSh1u7GvXrINJMOGz0P1JV1QnmGUN
oZ+6JrKwBkeEDkMOeTqZ2NDHbruyHPdVxVT/5axKsKy44UJIn5LPK/6yl4PcbV3E
V92n5ZGdmitoTNZLNp6/3Qzc8EefV2rClVgaZe0vBpcSA44H6bOGcxdXugyf3pn2
i1B41YGLZ5oK5qXgMmE8vP3yWPpP8aEjLETn7KvqLt3BHv12lFcJIR2B27ymuvJ0
MPJZadllC6S7huAGl8cajN0aGMMrFZvrGCBpiyQFi/Qt2cOonMj6AzUcQZ/7pe32
GzIkYY079Z49yK7nJ0aH68ENS7a6/Al+Lf0BVGeRQ2xjeCAgQ1NrCT+caz73+7Cy
IDoFWFEWKoZdx8hq+nQ/HC2Ic/BX+tC+kYV9VAACplDs7fz2w7MFYG5cDxL/fhnI
OWPplYcVt/ctz2TFdVJc0DWim0uebXNWwUBPceZ/aSsiASCxXA/slpALNbpxYQ90
vB7BuPZY7GDpcqik+ZKE7czZ051ViPebe81Vc+HukGZeJuX9PxXP+delLzB0k4/w
G9c1CONKEEJUccj5/Y2CLTL9MV66/q6KP5R/fmllIL6Sq5ZkOSU=
=i+uG
-----END PGP SIGNATURE-----

--HpoTkOiCXtn2yMmb--

