Return-Path: <linux-renesas-soc+bounces-20545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2088B26FD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 21:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61388A02C1E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 19:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E0724677F;
	Thu, 14 Aug 2025 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snY8DzlG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ED41FDA94;
	Thu, 14 Aug 2025 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755200970; cv=none; b=bTEdxPYU97FRJ4Nj50xe/PRHyy4GIi2VolcD3u5RrbhTdZD4icskL1lZFuNcdmrl+1qJHh+3AtbakiZtfJtxdxaDUCYKGPyCqSd9b3rQrNIoDUZ0wNIPAjfX88kN9C07R7IKFphGbR7rEmTRCEx9bZZprGsZbCdxy65mzC8O+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755200970; c=relaxed/simple;
	bh=FDZFQC0aLlMCsIRJIiDYmFrxp1l6sILU+HNXJsM5qQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ry7JtpG3I7TydS87ZR+HUh08A+TedFKBS6d9BX1R6TUtKQjW2XIrkJbZ6+TEt9c47D37m8sXtgD55pzWoxRbMi4tmtyyu80E6yuEARXxoQqanwZudtp9DH6ozfOO2mH0kjuCEaYJuukMVH25iJLVrVK0qedWdIqsMRmd4ZSJ6/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snY8DzlG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EA4C4CEED;
	Thu, 14 Aug 2025 19:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755200969;
	bh=FDZFQC0aLlMCsIRJIiDYmFrxp1l6sILU+HNXJsM5qQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snY8DzlGq82nc4Ja2q23JAy1iXFU9FyOEhT6NkRparTGnSKde838KDBMHolIE2M4i
	 lyoC1/7jigkjUc5A3LqXutWd7ClVZeUYxLIIDbEvtonryqonrwf4yB3Pr5Pa2067lc
	 3DjNUvpcDi/bDcQydscUImb0ApGeeA2E4ChKpo0KVrcwUuovzOLh8PF8EQkVUyGAzr
	 WmV6bLeeQ/7X75pW6JCXWWNaANclMCo1slzO94hw6AIIi8gT5NPeAbt08eRWUbubTy
	 WGNQO9OS82ukPQVKnBWzxvuVqMtFhDrvdkT/K5vvOjJk2mX/40sqiirY1g01exifDF
	 hSE6XTysWrvRQ==
Date: Thu, 14 Aug 2025 20:49:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g047-cpg: Add GPT
 core clocks
Message-ID: <20250814-rehydrate-pamperer-6844756aa66f@spud>
References: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
 <20250814124832.76266-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u1t7YverpT1duXok"
Content-Disposition: inline
In-Reply-To: <20250814124832.76266-4-biju.das.jz@bp.renesas.com>


--u1t7YverpT1duXok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 01:48:26PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add definitions for GPT core clocks in the R9A09G047 CPG DT bindings
> header file.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--u1t7YverpT1duXok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ49xAAKCRB4tDGHoIJi
0rdUAQCyYiH1QQZND0PtUekndQ5DZs0IBFb7DYR8oJXraerWBgD7BCuc+6qLGwoJ
fmWWzXvxD8TTQrsQgTAVLBfPkyTMkw8=
=i2eG
-----END PGP SIGNATURE-----

--u1t7YverpT1duXok--

