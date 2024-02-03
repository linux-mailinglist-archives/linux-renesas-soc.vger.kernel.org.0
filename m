Return-Path: <linux-renesas-soc+bounces-2312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 954E8848802
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 18:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B4682855BA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 17:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC07D5FBA0;
	Sat,  3 Feb 2024 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2Di9rtw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A25DF19
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Feb 2024 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706982773; cv=none; b=u/YIooaLErEV/4mTNm2fMnEJ72zZqGcKLGZNZRmvi53QcPubm/F9Dttol5pibInZA9+0SVirXfExj4MdlCfLeumgs9udYk6IFoWpXum3Ep3OGBdvSShq8KcG/mb6tH6XZMzTVspkhS7op+mqhFnum2xTNjoimmiJqB20PJwibvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706982773; c=relaxed/simple;
	bh=Adv2nyFa664GwHXamqweKgUjaNS/5d7gkxK3hQoC0hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXsjtLykDOFxIXnj8YfTdHZ5PtwJUvkJ4dERhZCtIpEtmSj1icJhYZhINMyrn5oUw9+A4Bt3SAulypYXKNpDRilVlCBIcGwP+oANmx8QGAimLics8Kgw2jBEURsvOtcp+EF0ekwEgpoUXuO9KI/Ga4zCCchg7egAd+Wfy94TQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2Di9rtw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD1CC43390;
	Sat,  3 Feb 2024 17:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706982773;
	bh=Adv2nyFa664GwHXamqweKgUjaNS/5d7gkxK3hQoC0hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2Di9rtwW1fpV7fkzTy+ySN1Fs7et7dl6GOBW82hT9moYIeSpGpQrxCncTAcI8Uya
	 N1j8owJ8TCv+NYo0HE/993D76Wagu3PYzX3sLrXcPZP+saWk6ydVxFxBxA5WY3PBYr
	 FqpUNK4pl4DsVekYJLxo2zIXJ6YSLfLqWMZSXwFdJs5wo2ipFFi9T6F/dwicxt63Zg
	 HVqyrtts8sYO6JacpGKGbjlUTNsb4/8OzU852c4UjSWeIT3OKeEYrx2yCAANNPJBLZ
	 azd6JgM0SPgkJhk7Fr7bSJCK6YdZjKlrOa4Rp+Ld3xdoRzmVJOGE9R1clkJyi4xIL9
	 iifuvfJpWjhkw==
Date: Sat, 3 Feb 2024 18:52:49 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Hai Pham <hai.pham.ud@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add I2C nodes
Message-ID: <Zb59ceHI7FrUqjhg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hai Pham <hai.pham.ud@renesas.com>
References: <cover.1706796660.git.geert+renesas@glider.be>
 <7dbbe13428273c5786ddff6ea7af6724fcdd4de8.1706796660.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ry6Ve6i/Y5NaHIAM"
Content-Disposition: inline
In-Reply-To: <7dbbe13428273c5786ddff6ea7af6724fcdd4de8.1706796660.git.geert+renesas@glider.be>


--ry6Ve6i/Y5NaHIAM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 03:14:33PM +0100, Geert Uytterhoeven wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>=20
> Add device nodes for the I2C Bus Interfaces on the Renesas R-Car V4M
> (R8A779H0) SoC.
>=20
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

So far so good...

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I assume DMA nodes are not there yet because you use these nodes for
testing DMA when you enable the DMACs?


--ry6Ve6i/Y5NaHIAM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+fXEACgkQFA3kzBSg
Kba71w/6AipZP2Ofy2B3Xp9Y17hhPd3/jHzk/0pruZmUf6N/v77XQKDA2jX++dTJ
44DV/+QAwlPiOV89tLqnqXlgAVQlHxZm238jgym4Iq2XwKKntoYo3PYX01VlSXLq
9Z47VSZkl1rDc2EAsGQ6m58UJChzKPhGJ89De8mfYQlj2qDCReAULZAh9D0D+T9P
4tnF1jGprMrhQrykkChflFW5vMMM9rvDB9qWUftsv5OxhSVpRhnMSlmErwxQEdP8
NMHbGEoLevIjfreVO7ytvbbPVutJqJAwulLGDS/IP8GVnolhUhsQlhEO9RSDpDQA
qMRL2N18upoNg2Y67qHVD+XAbzlATEvY+7uilNF5KNyYKcRmXKAHZHm6nWsShYGZ
fJ02wwUVqiaTshpQrq6690Ul43U5pFXSA4/NACr5UBtujObNtU+NMlzXOPKCpWdK
uFfD637/mXHkPOrgy3OznZ1rc2Upiw3JeG1e/8Af6IOcANbnZNBiKhiUaFDA8FW+
pBeBlsNZBMGvrNAo9ii4GSQAPzx2bjO9TrBdgdBmurO9NOqU+5vlY8jVppPv5IUD
A9FhD/CuTGVE2ERcr2RC/IEayGHsVBc4mtWTeUPglBdd7KuNSeUO7RsA13Fs/poF
WTGW4qbaX6WjE9Fzpe3T5582ZkSCdNM6MTwFoTeB9oJs3xT3Ewg=
=aTHN
-----END PGP SIGNATURE-----

--ry6Ve6i/Y5NaHIAM--

