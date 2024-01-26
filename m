Return-Path: <linux-renesas-soc+bounces-1879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF783D925
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 12:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 220FCB25554
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 11:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE60134C4;
	Fri, 26 Jan 2024 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyPrU3ii"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251F6134B4;
	Fri, 26 Jan 2024 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706267278; cv=none; b=WpcGeP/TuQ/T2rx+kVvLAVNB4joQRVxsfE6NIFuy+doU3lDD8YtGMhonPFQIvXn8oJUmsiWZaE49r+Ks38JPZlU+LE1NB7WjOLsTTB5DIXcfYQejm+XByVz4KfGzXXvQCBR8ShovOb5PZFi0Cz47fDeOnSsz71XmpDq4Pts0m9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706267278; c=relaxed/simple;
	bh=q+dqTqt7InzHPkyO79hxQipEdniOmfm9ufBpEc7VkTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZTF8w6YS+SYJUmVRtg6JvH7a7JezrsH2Y+Ms8eRsEg5+FA/6nxj0d8kzhPL4XFT062QrsfvwMTwhYsnG5Y0lcOPK7OlzQ8igtU4a5TGfvUuvxnyLF1P8e0OEfWSPHVZRmezFWhEgEO+36lc2Gj1EJYNqu4QoIeXtbmeARj7rpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyPrU3ii; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B18C433C7;
	Fri, 26 Jan 2024 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706267277;
	bh=q+dqTqt7InzHPkyO79hxQipEdniOmfm9ufBpEc7VkTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyPrU3ii2WHerEjyE74EXmW/jipk42etjjwe4bsgOReLqm7djjUv6g38njbHGoT12
	 Uxb1G65KM+3UAZrcJmI0f9nPFSyayOeQvSqjJI2nYrWHDy98UD9OdLWFhLXNEh02kq
	 afQugah/hsW/oIK2c3YTcL+7GUveTKe2TYb4aGgVdXx+CTY7gghNMRwvrJGaYgt4Ei
	 Ny5TMgv2P/doVUmLGaV9+OSm6y2K7VxP6dbFx/1+JZylKHoFJFF9it6E6vyc8+CpBl
	 RP/TkdZU8GdfS1+QgzAOPsLvPzZ8rkSPoK9MII3gq6oCPf9E33tEBdxljcOQn/ZKIr
	 loY7qi5ib/gwA==
Date: Fri, 26 Jan 2024 12:07:54 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] arm64: dts: renesas: white-hawk-cpu: Factor out
 common parts
Message-ID: <ZbOSiqRgtPvvZOmg@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <cover.1706192990.git.geert+renesas@glider.be>
 <50676e7e9ac1c50ab450c030481f60ece4c3947e.1706192990.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bRG1744Tu9Hgc1Mm"
Content-Disposition: inline
In-Reply-To: <50676e7e9ac1c50ab450c030481f60ece4c3947e.1706192990.git.geert+renesas@glider.be>


--bRG1744Tu9Hgc1Mm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 03:48:56PM +0100, Geert Uytterhoeven wrote:
> Factor out the parts on the White Hawk CPU board that are also present
> on the White Hawk Single board, so they can be reused when introducing
> support for the latter.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--bRG1744Tu9Hgc1Mm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWzkooACgkQFA3kzBSg
KbYM/w/+OXFJ4SrZZ7EsD21V1UW84vcZfXrQ9WXSWw6tRgx967IRCS4j2YVZvZ6k
NmkU/jDIYbj8qQhjERL4wf+Z5ndKarojXoUH42/qwyTTbzu9zKh6L7MKzPbw+4in
7Qa36+LizxVRKttt7miRbcpwbjZiOAboCum1AxyZNyKVNu7oojl4qSQ9q8+WA6vm
IzAA0ZbbP69JCCR87EqQgeZAr/aROBsMK3mPevRbAQxdcegPZyJ3j1YnnBvWBws8
3xEI1QXz+dVy1qldvBw115GyxeD0sLBkiAH1KSw56b8LP0yT/b5d8G+y3ATo6pY1
wNVAz0TcynNoWIw7sWiEBMYnrkgSAOnBLTjhd0j21gC71oYQmiuY1Wu1xjBqWZOR
QuxdH4WFF4mwYZfpbQbMh8Dn9bxw/1VCOJfFYmcVeiPZfl7oqPrifvEEK7Awgm+t
ioamDlk5Qh2H8fMPaTw/KOBN71c/kueDxqDIXfGpRhnkqLw6EybKbBSkKJugcY8t
4ZEaBSrB1IXkSsAaI4fMue0Hiw2iUKaVYsjXnukbRBAsKuKchf8P2JCpLCGx7Gsm
96LzHUQOvA2JjKYJ8DxCD1jKyZpXUHL41Mv9YCKOEzNAKzdabby5MDC24kQOL0qR
zFNqINLhMxm01OqtgjM+k5J1XLVJtQ66cjHjccXcSuyOqMblaCg=
=MFyl
-----END PGP SIGNATURE-----

--bRG1744Tu9Hgc1Mm--

