Return-Path: <linux-renesas-soc+bounces-3925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E90880C14
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 08:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C72671C2278C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 07:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF76E2208B;
	Wed, 20 Mar 2024 07:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQIUn5CV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8222093
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 07:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710919918; cv=none; b=DsPfTnern3zP2NGC1CGmrHPGQvjQJjN2pSET3RKHBH9uqhNtkdodXnTM09n9xWrJ5AwdPLcJA/ONKWEz3gK6I7yh+EpDkhFbpcZ0Tru0WO30vN7GtNrg53NK3ix8kwPHVjDS7OgUpsLpAnbH1ank0A871T0vxQe8fjpGV639p0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710919918; c=relaxed/simple;
	bh=vMchHIQ2y5NZsJfBdPwh03yhgPP9cZEyknrkZGhNFog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AS/KmG4nZtKzIT1dB10OHtbZpMtXg/h4ir7r5zu+Q0JS/tj3sRXPO0SS68PTi89d4Nj987yh1E9b6XDNm8cBVQD+xZlCwUfeHFWLUPB+dv/gkbbPKn9ytxZCTy1l1zixzA+icy3/MQTLD51CHGpZLsyl1eDPOR1ZP0Tm3U0ld74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQIUn5CV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B51C433F1;
	Wed, 20 Mar 2024 07:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710919918;
	bh=vMchHIQ2y5NZsJfBdPwh03yhgPP9cZEyknrkZGhNFog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQIUn5CVLeDMHAotz+0Xg1Pur7EBT5RgQSLtN2Lf2SPK78iym0+q5yqcyDpLXeIEv
	 JVTjK9FFeqmn7l6VH3BlPPyJzSR5NOacErwis3+uKey/QGsOW47iyTK0sr6Wy3W5RT
	 CtNmdEZs+DUvPVTVcj824F4FWJu82mcrqd6GKJeqctFspwVxiKW0v1qqzhrf3QD+EM
	 B+q35ARjLqOkZcKWfospYBPyhtqRQc0BCcFaVc9pPZh84FOpNeqHMDMFXfFEsQuXrM
	 4ZBEb3fGhVcxQmA17leCRzHmsRBmSO9S9u2c5SEX/yACwHi1+tmQZ13HVVvtCzBfbe
	 JKkLqm0luQ2Cw==
Date: Wed, 20 Mar 2024 08:31:54 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: renesas: rcar-gen2: Add TMU nodes
Message-ID: <ZfqQ6uReMf1PUKPy@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <cover.1710864964.git.geert+renesas@glider.be>
 <7efbc8dbac6876f454011563edc1ae8eb50c95db.1710864964.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HnCL/whh8p52OFdV"
Content-Disposition: inline
In-Reply-To: <7efbc8dbac6876f454011563edc1ae8eb50c95db.1710864964.git.geert+renesas@glider.be>


--HnCL/whh8p52OFdV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 05:29:07PM +0100, Geert Uytterhoeven wrote:
> Add device nodes for the Timer Units (TMU) on the R-Car H2 (R8A7790),
> M2-W (R8A7791), V2H (R8A7792), M2-N (R8A7793), and E2 (R8A7794) SoCs.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I don't see anything wrong here, i.e. no obvious reason for TMU3 failing
on M2-W.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--HnCL/whh8p52OFdV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX6kOYACgkQFA3kzBSg
KbYqpg//SCvWhm+2X+C1qCiM6NJR8oKMc+NGXw3RBIAO3yWbLTGNXKpkG6AHx+wR
ZfX+QjiJtMZLU3Hn3PLKU3qfl1wIM8wv0xXqkQJsPe80C/x7XGnxrYmRDV1mJdvq
OANdFwV/5X3cTgJGu+mUHIre8AJ8Qlom6jRWSMJkM5mcpRBTOcbAmCj8gh102t3h
iqrPH1nuqVcesDADZMqviinBpZKEAcvAt1B9av3BJftX3E8vJRyMu90jG5p5rE2G
M/KH57qklELF9oHfLNprLrG2q9nopyZkqhzBjkPQzl3S5v5QjRMklRtlTZM350eG
7a24qTTsoKJEn/S7mAF47Uk3YIQAvWS2OGHmyYnVioLEBkYBANbczSWgLbXFQUUV
zux/5H5xT6nwYAuDj4BfCmr5E5xFxElWqf0P65HFKCR8am5ygYkRqXe8uFI+oT2h
a0WHFh416Y+v0zVl7UbKfXjC7gjaXZq0npRwXaC6IxAl8fTP1f/dbKcRrXf5PFdx
yr0I/HKsw5OctCIBCJ4S98ufUVwjM1rcZLyWP1vq5K3CTmwp0K0lFJC59thJwzKG
gbUEFzCICVguA3G5tPyjsWMNUVBaHniizk1loIQ+dpYWKlCPkvxc0Vyr7PnTkxyd
wzYMzLiDpuA64t3nBpyuReVYwH5JPMeHUtwL0wz8EqUbQsjnaB8=
=k+Ur
-----END PGP SIGNATURE-----

--HnCL/whh8p52OFdV--

