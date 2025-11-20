Return-Path: <linux-renesas-soc+bounces-24881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96082C7449F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 14:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 389F435AB9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 13:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493A633B6E7;
	Thu, 20 Nov 2025 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hYWksjoG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C3B2586CE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645537; cv=none; b=q4/AtX4fHMjCP8szqB4tf9P8Cly9tXwjMAOEjSzYzlwW75JaUVoE9qoMaQOT/XJIYD8oANn4371JIChdDWf0aZ+7u03tmFnscDoB7Bs9ePFTTPEKj5FqFB3ps8aLRd/COyynCtJMWoPKLS+0Hq97OXW/17MDlrCb3qAdWBiWFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645537; c=relaxed/simple;
	bh=HT2dsCW4VnjrogrIv1Ap43hH1evmMUs9ZWigIAKQUng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuNuQI93R+Zkx07MJTJOweO+Ficvhq7OozaFqhUuYGTRs7HuM0MnIxTVZnfpRaHr4yRK8avWJMu5fO5qgm8MfEzO2IAFw36wZDdqmFX2a7HaHWEnmbfgkSXMYbcJCtFSWt2hwWM89QXfTETUBWp1/ZZ1kcWNXf2fra01Fj7TJWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hYWksjoG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HT2d
	sCW4VnjrogrIv1Ap43hH1evmMUs9ZWigIAKQUng=; b=hYWksjoGWpJnHMX7GAnW
	EGFEm+tJdgNATY1jsuKJ/ndhRbWB0TzBosfwAC+bJzCUrNVWZBsI2RKY0/IQkw/K
	annqgrR4UCnXyAUO/OJOeHacH8JJem7uvkZpXPYqNvQphuY8N5JdFEz/Jd/6h9uI
	6QhuWGrFgD6q3dZ948GMQ0W0BHJbsx8/90F2VCtSavoZjau5IWrA9B+FpUjxv6Hw
	1xvTjzNbHyDrOW629AjYfthju2O9ojNsCjfLehxtBJx46ztPmiAntAwY09w79dnS
	ck3xKDLG/5aixS9UA/hzzTv2f9WDwWq6kU0CW8Pm2OiAq/hOZd+VpMkiJ0EfioTu
	aw==
Received: (qmail 388819 invoked from network); 20 Nov 2025 14:32:09 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2025 14:32:09 +0100
X-UD-Smtp-Session: l3s3148p1@1VZJuQZELLgujnvV
Date: Thu, 20 Nov 2025 14:32:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
 support
Message-ID: <aR8YWQ0m2tZpONG9@ninjato>
References: <cover.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
 <9d1cf2cdb1c11f24378404142e4c8aff680c6961.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8In1Xu0qc9ZJg/Go"
Content-Disposition: inline
In-Reply-To: <9d1cf2cdb1c11f24378404142e4c8aff680c6961.1763638659.git.tommaso.merciai.xr@bp.renesas.com>


--8In1Xu0qc9ZJg/Go
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 12:51:39PM +0100, Tommaso Merciai wrote:
> Enable I3C on RZ/G3E SMARC SoM.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--8In1Xu0qc9ZJg/Go
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkfGFUACgkQFA3kzBSg
KbYyYg//YZTVyaYtoFRL4Ao7Gc5/1fA97jLqn6yHDhPEzjd9mwHBy0UakCWIgpqz
LAQeIrciKU2tjONfn2GjGGfEMnYjjzx5foUh7p5Ad2BaltDwG2ActG/59RB3XJQW
i+RfP6cz/0I837cxAiA9CaQ5QeLBjoM3pSln+ji8H/2jCpu7ZT3tkCQ+PK8MW+c4
9B2n97T+HzOg6+r+rmm/rEC1KtUdxGbvk3hBAejEL2swDEngfScbuX0MwpzSDR0X
QG65pW/PxEW1Tm07v7xIpVn/VZ09YzRqKMyFqvgyjV+4bji+MiKbyhQFWU1QUUYp
1/azp/sqBRlOREIkMi+coT55Rno1zFZC75+Q3s59w6iO7ckMku1vBxNvdgBrtFt8
pKv/knKy/rmMeqCYtWvvMQGgw+q7KhC8v6wQYMlrDhup5ezNOMQmChLlmtJ0KhH0
l6wRMfHiq3dKRyp3RMngF07YdZybV0PAAoyz8uliosm4MsmaraHdXWICzUHxPp9Q
MA0+QYmOjZrTqlXJPOO7HzCWgrQ1jF4Xo1NURhYxZg11JFrzobZGR28EcNfItkwj
TzJznzgAfbvJGfvI1mhDxh6JEKHOSWwk8X6s3MJ52d7RsJAf45DSMmNyWGskSzQv
3lSo7U++wngn5TtMngD19kGllCpuoX/AvI3BBOlau5KOcVP5sVQ=
=LdXr
-----END PGP SIGNATURE-----

--8In1Xu0qc9ZJg/Go--

