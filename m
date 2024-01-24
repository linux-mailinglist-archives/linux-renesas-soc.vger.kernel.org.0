Return-Path: <linux-renesas-soc+bounces-1778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2CF83AA44
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 13:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB67329189B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 12:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0923B77634;
	Wed, 24 Jan 2024 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+C9TrLc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D665276918
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706100502; cv=none; b=nS0eOFJpzDtsT1LOaS3eocIldbAtWDlSJ4jwSB38jKZm5Plg0lcazC+cbe1yk9uefPuOA7gdl7pECX9bWjjmwe9JT3p+0Dx4bOus1rP0RukbdzxJ3exuOZsXI3BivsIDcVre1ROJqyW/stfRuJVjyn1gPSBldW8pum/pYZvThlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706100502; c=relaxed/simple;
	bh=Z665SgPq+B6WIhtNtl4xiNJVBF4QzVmOt1e1jaUpra8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2YSALIEw9SRI03zadN97wh9bLu8elF6MFCm+7AcZResDK+3jdLd1rHBHUHeuA3tlylMcwHwbDrZE3GuGyaLirPMVyQr8OHqef+EqRor/tMu20PtlPPpfcrDC7h+pT2Wsi0Q4KCh6AXotiZwNFCcGb/SQ//9qngrkFhLd2c0S1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+C9TrLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CC1C433F1;
	Wed, 24 Jan 2024 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706100501;
	bh=Z665SgPq+B6WIhtNtl4xiNJVBF4QzVmOt1e1jaUpra8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+C9TrLcYoebidbXqr65mfdpy8KGE887pwPy10nVD6wFF0vCgWCe0FzsqiuCfKkXI
	 q2JYygANsLtHqzAFLtbNeFKRhhAJnjyxaVm9AvlU/tIvYugpq5rIYGotmE0IG+CN8E
	 X3qDMrVi9wr+KLDLLiFVz8KmC3tUF/pOnVVlzj+IZWHbre2btwJQWvwNgijzw3WyH4
	 0psSL6xy2SZ+dG5wylLnTaz8dX3iByDtqS4WqKFLF0R++yANctHFNx28z8IZCGBc2u
	 NEdTpyZuzJbEEOBBhQDRbSbs0qImFqQYFWJpRfJtdSgtNGzzss287L8D2KWQLB3G96
	 EGTUJr4gfTZ9w==
Date: Wed, 24 Jan 2024 13:48:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 2/7] arm64: dts: renesas: r8a779g0: Add standalone
 White Hawk CPU support
Message-ID: <ZbEHES9F1zBjGsHY@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
References: <cover.1702309604.git.geert+renesas@glider.be>
 <80ff74b0f2a7cda1187bcbc14ac6993f8ebb7971.1702309604.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CUgh++1Zpc1VuV0D"
Content-Disposition: inline
In-Reply-To: <80ff74b0f2a7cda1187bcbc14ac6993f8ebb7971.1702309604.git.geert+renesas@glider.be>


--CUgh++1Zpc1VuV0D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 05:01:17PM +0100, Geert Uytterhoeven wrote:
> The White Hawk CPU board can be used standalone, without connecting it
> to the White Hawk BreakOut board.
>=20
> Add a DTS file for supporting this use case.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--CUgh++1Zpc1VuV0D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWxBxEACgkQFA3kzBSg
KbY/XhAAjgRoVXMSOEPCsR5riubHSsj0HVOLXwh3a5zAojg0ylTayXd0SpQT6EfM
4EX6Npe+P0GbPTj1BmHEeArll2Y6f3Bmeaw5fpVk67TVXsRtOVTfqvBKS3iGfS9p
/HoHzeExnHgvpdhjmCHRJ6Cq81Cl/t7uQhs1LhfEiTuTDD9KDUtwmOXKDSIxfr0d
ag8uMuLQptF6XHA1nDc/Odv15EIDVS4aYGLRrYh1h/EvJv8ONfJLmxawKFS3pcmc
ViznYkQnKhYi6Wr3SdAKYxYq3ndz4op73ssVyBZgMIMHTIFWkdmVokjkX3/4HaHv
FvkExeKj5lj/DVEOhPdNVtTnEPfW96KtHyPRjc2ofu44B+E8AfSsrLUnXXRDMGWg
sxkh5FsFjntJz6eAHyOdnFHTX9ltryhoh6pmFeq/aTxYybSrv05Q1R3sZ+FQG4eZ
dumhBvvKw//o4dWI3fcRRIpyYgElV7Qh7y01zqD6UrwV8R7XdsANC8lgcr/qCisZ
uwLmchX8nfNo9bIWb11pcKP+BqlzitRKKoGvVb4ES2KPYy4M5tmsQbb+czDG0QBg
F0DYF6WI2ZSCbgpO0XA+cHmbJIVgEm2yXgfTRBQBpOncTYf7U9rqtZkpGE+mzdob
yFmW2MhNhF4mqR+/ZjM0pIFZFy0paOIBTGAuOjOTeji2NFCsDfk=
=bOus
-----END PGP SIGNATURE-----

--CUgh++1Zpc1VuV0D--

