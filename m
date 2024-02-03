Return-Path: <linux-renesas-soc+bounces-2308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 275D48487F4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 18:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA6691F239C2
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 17:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4CC5F855;
	Sat,  3 Feb 2024 17:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boQXCJ2M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448145D8FB;
	Sat,  3 Feb 2024 17:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706981823; cv=none; b=dR0QUbCT90maJIgy4Hse2CFvNDcJnIQzz++Ma0Q2TvQKboOCKtNrxQf4eeiE1r3o28dK91nlZ1w91dNgOX7Z99iuuyiPTG+bOugG5j1GQ+NgKwxA567up9QErIW1WzSHkg6c7Ap9TttL0yb04TxzjLZPMcFGmkaWlYcvMYRmVrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706981823; c=relaxed/simple;
	bh=6CIwMC1CajdMlU8LRM9E5jjOF9jo53Xs7p8jN9KVEYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rU15sgBhBM6bK8o3CdAZAuM6NuWlH4LFyjbI1bCVCwvxWOfHQ15TCmA6ireI+yWj2dvSUU4NzWe1/OVNXUvywrxKz7X3zpaolcL5qEINn3HvPRwn/WWSv7bVpMzbrCuCq6sTk+ENyMVygjnhwnr2U0Ax0K/lf/jQfEzEF/z4NPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boQXCJ2M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F51C433F1;
	Sat,  3 Feb 2024 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706981822;
	bh=6CIwMC1CajdMlU8LRM9E5jjOF9jo53Xs7p8jN9KVEYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boQXCJ2MHwtEZO0dvWiRSBhza1U2pxy33Dq6MJxqspVPB6D99GhVODK2GbMd7v3sv
	 sL8EKqkdEs0CLsqqjSCdgjPGY3gTkFcm29U5AI7qXBUBQw5SZsWN6Z7OWigLxSqboY
	 5299vB3fUOiN52inEwh68XUGug2JNdFxAxBvqPtJslEEgBF9IN6iwXlBC5NmNXdGkh
	 mFon/MbwhhbUH5UqCBKjhQocCr46ftKpeQG7nfESkSnwxk4oodDrzTTuHjhcoSRWJO
	 gAlc88mFRJP5drhT7Ld0XGiimITUsE8DFRCkEoGdn0UMtTimYFrtpUphB/cWfHBqUq
	 kSb7xA2ClQoXw==
Date: Sat, 3 Feb 2024 18:36:59 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add watchdog clock
Message-ID: <Zb55u82Bbf1QfpzO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
References: <f1dbf0f3f484015f2e629d78b746cf377d6f6746.1706790015.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SYoilqVqBl0N0AAM"
Content-Disposition: inline
In-Reply-To: <f1dbf0f3f484015f2e629d78b746cf377d6f6746.1706790015.git.geert+renesas@glider.be>


--SYoilqVqBl0N0AAM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 01:21:55PM +0100, Geert Uytterhoeven wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
>=20
> Add the module clock used by the RCLK Watchdog Timer on the Renesas
> R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--SYoilqVqBl0N0AAM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+ebsACgkQFA3kzBSg
KbZEpQ//RqWsWpqg3D1cbrlbTyOOBo+b3DHwiJq/MQRgXjOcdosiP/pCLgnYeWn1
CWXUYq69B+11g64SGU7RQSotprS3l5gqxKgNchWdiY0aSFmBPx/A5hgKc6TGw9aH
HzttemgUUlmoUQ9TEpzIoawapJQpbqszQgPOd+EKNuVpal17jJ2IFSwV9jyYwAib
MiAJ3ow+H5wyxPBhMz1iNPw6ltwlyyOGKBKBOIC8GR918GTNIjETtsL41i8EMwQe
2vmGsDV4xpMOF5FzaO6STUDrXRRQ3I6SSV8H8DQB/mWUh+isOx9p1CRomfatV/Gf
goODhTzqdaZ8eQnZDSorzNc5sOdlYUieXic+U3A3hnUncigJaH7mAtj6HXN3wPBY
Y2bJEtmrG0hxiGSewciCIBBEiZi0XnI/L0dJRcUFSMXL7ZJ1X8jQO4x3zdBIz4Dy
58Pnp0dfKVhq/xsEcfPaqXewhGg/v6fEBFAuxT8NSMc4xy5Mg984j8Jy9LTNSz2y
t21ccI+2Fx9ZlPrAfJD+JFMRUKYyWYW9t/Ti78v1SrLYzYEJrIUonBZWhVDsyVvO
Y8e4BOOWKpHDFRXGHQnlZwZn9KPJt4hYX2fjCbeqxPo6IpWykyYgfycozc5R04P4
HbprEB4swUIt3Cxr/hYq7PTzLANmHXYYZa9TNjz4RtBQAn+ddBc=
=lYhH
-----END PGP SIGNATURE-----

--SYoilqVqBl0N0AAM--

