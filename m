Return-Path: <linux-renesas-soc+bounces-24818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5B3C6F530
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 22999345051
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9401B35E557;
	Wed, 19 Nov 2025 14:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1vd4Dr0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B22E7165;
	Wed, 19 Nov 2025 14:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562331; cv=none; b=ZHVnq0iTsaieyQoAb7Fi4I7424g7f46DtGYcGH13QfWX1ZXvjDh9pZ/cc5xDPDXP/6uoFfik3JyEOojQLTJqwf/IyjzyiKTcEL7fndoda30KhfTVXiv49YWuyM/3ly6Y6eV2DIJj3yp9eKk5MCzWsVFoqxVv2XbnOgBLCY88FH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562331; c=relaxed/simple;
	bh=IPpllDroeIVWpU7coZYoVoMYcpJP+CsG5RsTB2e1Rlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpuEeSP/APRG9gju/g+AtoQfT0VYxZncrxhNHHPdEdhh6TH6HRh9i2Q7a18KdZmZkDqkznFL1K0DXf0v/tjWr1MNhS0tgF3eb5XJOL0flsXfMd+nnNWE5VICFqaPgt9H5LTtCvJAsEjSFQQxVDT7fgfC5XhJyONz/aW62XwLujQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1vd4Dr0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC34AC116C6;
	Wed, 19 Nov 2025 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562329;
	bh=IPpllDroeIVWpU7coZYoVoMYcpJP+CsG5RsTB2e1Rlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1vd4Dr0MtIh/wtzlg/lZ+jLOlAaSS2YeqVNZdtFyPL32YVGB4SeB3cf85TaCENtL
	 8TKL7AiVyq4xygYKou/UAr0qndmPedz3BOdTRSz70aHaUIrFVGYICc8XQXPcka04hP
	 L31FBN+qxccsZlsu9RHDctApiuctcfbth3gLPXgH4Nn9lKIwFI3MlIqLLWYE/5rrN4
	 HnuEjEi1ncs0d6HlRaVxwDQYtHeoIrX5qV7SW3oPC+Lln/t4fLFnZC0FEaqax2L7YI
	 l59T1byANzH3fbast2y8EGqixpflUygeizHlMRljJb3rc+m38aIPPRZp6pE8Vvj3vW
	 THA/Y6/QDnHCg==
Date: Wed, 19 Nov 2025 14:25:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of/irq: Handle explicit interrupt parent
Message-ID: <71a2ecf1-a6dc-450d-8d94-1d03294746b6@sirena.org.uk>
References: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dXrumqPCuqa97emu"
Content-Disposition: inline
In-Reply-To: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
X-Cookie: Microbiology Lab:  Staph Only!


--dXrumqPCuqa97emu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 19, 2025 at 02:19:11PM +0100, Geert Uytterhoeven wrote:
> If an interrupt controller is used as a proxy, it may have an
> "interrupt-parent" property, but lack "interrupts" and
> "interrupts-extended" properties.  In that case, the "interrupt-parent"
> property in the interrupt controller node is ignored, causing the
> interrupt controller to fail to probe, and leading to system boot
> failures or crashes.

This fixes x15:

Tested-by: Mark Brown <broonie@kernel.org>

--dXrumqPCuqa97emu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkd01IACgkQJNaLcl1U
h9A0OAgAgiqzeJ+/k2KHArbkPFKyn1BIrHCdXiP8+H54gFZtaofhRAabFCiSb8Qa
4xqve8UPhr+OZxKaJpSN4xPl9Xsw2/XjS+F0FzHOKHe7Y4yPZoRwsc5aZgcnS0m2
PJUimumr9oJ9BBL5/fOCYLoZB7WhgKfk9OR+0wx4Pbvw3QjoUOYqsZeKpKhATilu
XB9pOYFp3YeeGMosjOKj8MmsgnlRaXuEdDcO1nkk+yhY3jdS4j9QpuCb3oi0Yc4e
E+RLyO6wVjP20Twwg+o2QJAmBizEOuHfM1b8Jz/yoNeXSfXYaDH/8GOTY3WXGHnM
kAqWpJ4TsX/w5gr9aOxx9V6isaJ3lA==
=Nam7
-----END PGP SIGNATURE-----

--dXrumqPCuqa97emu--

