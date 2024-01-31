Return-Path: <linux-renesas-soc+bounces-2155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EE784449F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 17:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2EDF281AEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 16:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD9812C536;
	Wed, 31 Jan 2024 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxZE466q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E507512C525;
	Wed, 31 Jan 2024 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706718884; cv=none; b=rlrO6Jvd2brEVde9ReIx3nWrVkW7GmZ7FJqXMIHn6hdo5ELYQKufWHyqRhKZQyk4SqSeIY9T+RWDjUQc+y/iXNfdeW6avBHpL0pE0Th6APS8Vt8pgTJqELwUUTF0e3wvVdYLj0l8JZaAuy9l6p8wrbKF4djRuWX7K6Dv7alHOeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706718884; c=relaxed/simple;
	bh=HD1Yjnr4nWZ6pAzdwyIqRsLbA3A5jkLrkg58FHoyDsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxK1SGL0nVmOO6+koz0a5Lqw0bxkpWnfpMu25c3XBmmrCRwQLmyBTYWqVVhxzGTwf5kHimj+EG2Uz9/LEZ1Q3xsEg75qs9tR+owxYCqhrGptnB7QEoL+jSX0vWAuC0mOMRAJvIAPvn8Vuh72o5TibjBu6qFcPnyFyGjctSGvWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxZE466q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44490C433F1;
	Wed, 31 Jan 2024 16:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706718883;
	bh=HD1Yjnr4nWZ6pAzdwyIqRsLbA3A5jkLrkg58FHoyDsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oxZE466q5sEtx3BuwSSlJASSdSLAQz0Cqmle2AW5CkG+OCktFmvaEe7nyUo+XaP1z
	 diqfRXI+f4R4VtIkzkmAfGCqKn3gZgN05C2Ci+5aqpIkVtmEIszDBa7GkqmJC/a96y
	 HmyBxLm8VB2LpeYmpksdAoWutTg7Pd6QADAWqrPmbaGlNBcpHPVtauYTqap7ZhgNnV
	 uLFibVKz+vHJtsMo1KYaF6mGNcTDqX9G6xEtUXrWVIQYsDsggrR3T5Va255jnHZ5uh
	 pOR+KasHVsUJIexWoR3yKELOtbMIRk3xQvEIQJYpr1TfmuEx3OWzsltawfEWYoGfgD
	 IzeE1NXtkE3tg==
Date: Wed, 31 Jan 2024 17:34:40 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH] fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH
Message-ID: <Zbp2oJKXUbxP6upF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y83znHstnARIpLfl"
Content-Disposition: inline
In-Reply-To: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>


--y83znHstnARIpLfl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 05:08:23PM +0100, Geert Uytterhoeven wrote:
> Since commit f402f7a02af6956d ("staging: board: Remove Armadillo-800-EVA
> board staging code"), there are no more users of the legacy SuperH
> Mobile LCDC framebuffer driver on Renesas ARM platforms.  All former
> users on these platforms have been converted to the SH-Mobile DRM
> driver, using DT.
>=20
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--y83znHstnARIpLfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW6dpwACgkQFA3kzBSg
KbaoEg//Uclnx3k7U799e0P1jc2PvtUd+vb4R9z+m/EfciyNRgRnOvnzoPDiAwSV
p5BIiJYrkLH05uJu5fEJP59hysOVOXA7GGkdAdY+fCkkJzIROjh0vD5Zc70TQwg3
ZK7h2jDR3AXXoIsDvdGBIf8iETCpPKq38SUKsiDPTh8N/uxWhwrGUVCsZCaH7oOX
6RMsI102TA11KfvA/uOUEIGZHs0K8RJnO84NFZ+FoqAa88Nmg76SMAkCMmBqXO7U
xGA14+GX3EyKtehcje9ysqQZJ/50ubLxlfstqi/FkUutwB1HBp0VNzjAmGqqFc3+
6bKeGk9NEGZJmlPqEl2Bf6kNit56tmt/c0h4zxjcLhuG1eGDwtiRDjnG6TJ9xlCf
1TDdfL8HPwzZbpLYKf2CMsRLM8MwCO3Z9vMB3LpHQTH4ICfXX1ESa93KSPcOuTWY
nlXPRjBf+4/qornF2c0pQBTWYhIOCIc627wglwxJ9OxFoJzZsfMAMVi3LUejkqFA
gpJLAlI+GnP1pT7gkSDPhRBoO8hLXx34lBmU4/JL45+QsvIQNAAUQox5NatCI+Nz
utoEftEApEZ7ptEBkKKkTgb0/9hP5J4OoneAGVT0g8LwY7zfGiMMlkz9aMgJhi1z
xYCoKNIiNl7VmAvFcoJA77z3/JEfs6d+nc3VbzzYVOclFjVQgXM=
=YJDi
-----END PGP SIGNATURE-----

--y83znHstnARIpLfl--

