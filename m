Return-Path: <linux-renesas-soc+bounces-6581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A509112BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 22:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55A861C20C63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 20:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489CB1B4C33;
	Thu, 20 Jun 2024 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lNiLjWGj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2552230F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 20:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718913951; cv=none; b=WpnbipBOYy1zVCu0L2z90KY72v0zv83+Ywi0eh9DHeTvhCOjVHOw6SalWVe0RX4odpEjNyFSz08LEZe5EdKqIE3+lGdRYkDU/dEsxDN/V/KMdQ3Kh/3zze7jlQ4daRAmJGkdcLOCxeTJ8OPvDpefRB7pfdHGjpYVqN9T+02vUxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718913951; c=relaxed/simple;
	bh=WQVXoqUv11YINPHRUM6Bz/ijbfTuHJQj0JCz4T1nshA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdrvcUICeCopB1ULo2pPLvFDinKdl2yEQI1z1o+aUCysG+glxaeY1dV7aHoXBHTcRTPfaN8ZgoiyK3c0XdYtqqPJGrr6Eo8BeVXd8V5ahhJQnjPajjAr+qCqB90uPlZmzPALmt3abG1AdDe/QRSq6RKtJZjrgylAPCpeDAQm3VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lNiLjWGj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WQVX
	oqUv11YINPHRUM6Bz/ijbfTuHJQj0JCz4T1nshA=; b=lNiLjWGj7d6d/NkFZeg/
	dfMjzrAFuvKeip7Fd3xsUogRT9BftzUviSxIgv4z0cxi/wrpyvLpE4d/4r/ZHnBi
	a1ydlqz7UrlF49c7XqbN2PX7/A1ezOJHXnqKxo0jL3dvDuZCU3P8//FAuigKxTON
	yYFo53Kib0gXu5d/NYN8c2ofpNt1EvLCsbgPmSQm8KBn2MnbB1OCJKkyWxb8+uxJ
	eOA2m2FDhixwwNnapiJJ7rNpFh0GCWW+Z3yC7sMlPHmDnkcIMLuAKXUv4esBTanF
	4xc/hjKqsWynodNeQhq1kU9JQ0B6njaTE3Yx1fX+nIV7lJKu30YUrdGDXBqaIw4E
	Pg==
Received: (qmail 1134172 invoked from network); 20 Jun 2024 22:05:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2024 22:05:45 +0200
X-UD-Smtp-Session: l3s3148p1@7XUX11cbGttehh9j
Date: Thu, 20 Jun 2024 22:05:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: tmio: Remove obsolete .set_clk_div() callback
Message-ID: <7iq2xtasjbhpef4g5tfycnjdvtgjwxhjyhwgpkrhy3g34lvd6z@l7h5pihpt2cg>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718897545.git.geert+renesas@glider.be>
 <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vokds4cbxec2k4qd"
Content-Disposition: inline
In-Reply-To: <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>


--vokds4cbxec2k4qd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 05:39:45PM GMT, Geert Uytterhoeven wrote:
> Commit bef64d2908e825c5 ("mmc: remove tmio_mmc driver") removed the last
> user of the .set_clk_div() callback in the tmio_mmc_data structure.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--vokds4cbxec2k4qd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ0i5gACgkQFA3kzBSg
KbaJ3hAAqVmveXSykFPc5VUFjfB/buFe5/bm4QfpGU+iRMWygB4M0e3T9I3898TH
Vn1nc7cbI72OgLOYqFD1C9ws5m6YQHqj7FsWRMQxgOPlRa3cWxD/IlLrzeqpMeVD
tWj14K3VEJcpi6eploE2myuKsM98HQNPI7IlFJ1qowUJB7YBriNAyWviMAK6vuBN
ebLvC1ypqz1NoW+e3G5oQ/bX09w9wwMpv3S/yBx8t9oPliytgUXGzIGHo0hJBs6X
N/xrauss4Xvtudu64ScV1iv8VtGV/O4k8Y1/sWaYLRKVPooJz+4NfgD8jHEY18Xu
KOzggxmicwXnbTrTYMoYizT8/kXXqXkHLKvnjxUL7Xt5hlZtS35Ua9DZW1q/BqEM
pCemvWhaKnxN3AfGr9uYs2z3ZBfipOBq+O627U5s7gVrcUsF9qe2V3DnmyLPhRbr
ROgPXXhvkdC+hViYm5nlZOX3Esj9666L4nmErnlYBE94GaOsakT70WJW8zPiVs25
5LA/Slc1XxHC55UcMzJHN/NtmLg+oAX/ntZwc1HAeDMS8sw9+QojZQtxghpBIm3f
RU+ew/7VusmYmrW/G4Jv/fmwf0avaqW7RHYLeKEGOAWJrHeaJRpnSYm1z5bnjNyz
6HsvK0bpj2DzRmdRz4rQHyLJo2R4Fenkv5YonKKXJY4USfGB34k=
=Agmg
-----END PGP SIGNATURE-----

--vokds4cbxec2k4qd--

