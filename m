Return-Path: <linux-renesas-soc+bounces-1981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BE4842033
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03D1F1C20FA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 09:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018D466B5F;
	Tue, 30 Jan 2024 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q17YMMQg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB1D67726;
	Tue, 30 Jan 2024 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706608394; cv=none; b=MeyzCQLxE6xijn3BAIMmyhQYvCC81shLJi8LX1fUtSEiZFSq5ETndPa0w++5Ad+5vO5PXsPrkQk1njL3+2evqwHRgANmUqdBX02lt2Vze0kiZ/YTEPPUFRhc+IEONYE6PHjilH7C2AqUsBpel9UsateqXEY+YEm2llEaVCqB5Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706608394; c=relaxed/simple;
	bh=aH4QtpQL+AnXelMo8WKWWufmhco7kLrBK4zmy20fJTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLuuZOuxzjzzyqeZqJWdh11thPLX3GjRxd6DqgFyUzfJHNex416o/opcVbuMEV1e2qPpWxVApNbROO9/Bp+6usgJ5pdj1lYl648wC9uixhjN9MiFQf41n8VKmoSIEbWDoXds54i79mcfcsXCBX2cRGKpJpWCnTCfVqYzn7jS134=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q17YMMQg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDEFC433C7;
	Tue, 30 Jan 2024 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706608394;
	bh=aH4QtpQL+AnXelMo8WKWWufmhco7kLrBK4zmy20fJTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q17YMMQgiuAU1jEP/KuGwknZt9O2FGyBEV2J4hXetYhPAA3n4hifin2XoYyZRjVlK
	 rXm1nTXSEp/qihgNqgeYCw29N/nxAnQ8oR9cOvdk3xJkzOx3gmwdvtVKQzLNVSYqVr
	 2qqtFE/ilBkUSBvNjgAZvHBUaWBnfx/7RpC+7TSE5FGqL0FY76HaaA4aZv3VygyH4U
	 xJ3NFjbLFmy/tFiI2UUuKkNVj2r4yaeDu3bctL0bvg3qWTZ7oaYsUWOdOPKmCRKib2
	 uSnlyWp37MKJXWSVh/J0yf5+Q6I8uyTVeZ/X19pe2KG4mQr2NYQKGuH1OICip6aRTK
	 mi75GcC0fQNOA==
Date: Tue, 30 Jan 2024 10:53:11 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a779g0: Fix PCIe clock name
Message-ID: <ZbjHB3dFonrg1tFD@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <f582067564f357e2183d3db67b217084ecb51888.1706608032.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q1rakYIcTsiwcE9R"
Content-Disposition: inline
In-Reply-To: <f582067564f357e2183d3db67b217084ecb51888.1706608032.git.geert+renesas@glider.be>


--q1rakYIcTsiwcE9R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 10:47:49AM +0100, Geert Uytterhoeven wrote:
> Fix a typo in the name of the module clock for the second PCIe channel.
>=20
> Fixes: 5ab16198b431ca48 ("clk: renesas: r8a779g0: Add PCIe clocks")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--q1rakYIcTsiwcE9R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW4xwcACgkQFA3kzBSg
Kba2/hAAl7KJvoqh6UXtR4oI04XFl84IFVVCoUrGEI7mNcH/KTQx74rN1e8RQDxo
A3DcD58pHkWj0uNmrl7RN8B+yuH4PTv0SCr8kN96Q5uCGPe4c2EFCDkPZYjDwIsW
3WVShXdKzUptz/evqaT9PewGu081EY8Af2hpa0F6ksbdT73V19W5O4aUshU8iPVy
jdGTglSqOKGNLwkSBxaQllw9AB8y/zsyWMkO5/ooolkvaaiXyHXwsA+7dmFaVHzy
yFcn4/96PYzWeAIZotNshdnSxn94rbnuIN1h2UZ3hiD0WHM1G6++ZYX0n4oW10er
nmD7BJHgkAnyPNKCO8Z9CxZ/UNyzhIS7Zt7e3bVQs5LXzPOrf1zwaEwRYp4ngr+3
ABVuKh0iFDGZ1n4GtLmf2TcFoNO9eTppbzRf8BpvalhrcnNAeBf82FS72mERV4dJ
n6AfaTJpO0zITPCDxBRGQAO4QhAizllsFURYZfrhUOrEn6rPzFTuAyC+G7ajznvl
BTu4PUyoKhI+yMexiNKXmhfsVwf+HEFeR0/msvYpTPvEEQ3BC4pABDGhrWwfHJgH
TVaVYkqhaMsqfLtI4P8q/2vFt8d7PL1hhmx2OHSe/SQSufnfPnPgxulSxcMyhDqF
PQ3mfZ7n/DxYZjaapUCWUk6xm6CFq/UrMikfTi0wqjrg1xLB6iE=
=QXmu
-----END PGP SIGNATURE-----

--q1rakYIcTsiwcE9R--

