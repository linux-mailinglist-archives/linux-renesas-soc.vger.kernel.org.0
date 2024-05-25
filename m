Return-Path: <linux-renesas-soc+bounces-5477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EED8CEFE3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 May 2024 17:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81BDC1C20B9B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 May 2024 15:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878CD84047;
	Sat, 25 May 2024 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qegSTkEa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDEC29CE5;
	Sat, 25 May 2024 15:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716651854; cv=none; b=vF31GLzwEgdHrjMDKytCryrLu4T/oOCZYqhJ5I1OG0JYHB8B/Kbgx6Y0WLzRaRLA54hp1KRQaTX3ODEKITan5oalCye1yxS2sYU503Gek20xNUX1Ngw8QVWxF09fN5HaP1hjXSR51piQi46NQ1BLoHYPDjnD6Sam0aI5guzAzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716651854; c=relaxed/simple;
	bh=cuVshlMXsAqf34jvzFJQofX9XkszRt+S7vCOc6cWEvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gK0T8EXfl/gnyJAkH9W80K4eIAcUFxTOpiHtCli/72vmcdXlExGq7qCx4Wt4PdKzMYl4QWsNQtOB0P/STasn9iWJzORUMTN7qSOEwmZkW79feKMPHSDX9O2wkVd0PBsh20a32Wj1VSEG7U3/qydziH7iq1/uC1W4tcm41aog51Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qegSTkEa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D57C2BD11;
	Sat, 25 May 2024 15:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716651853;
	bh=cuVshlMXsAqf34jvzFJQofX9XkszRt+S7vCOc6cWEvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qegSTkEaYyj5Iw2zEaZ9R98WysFMah833NfA8+dLuZMp9aielw+HHfkAFELMzFki+
	 vR5E1vAn6jM28lIVBJ/kQclswVnYd5n9AIwboJhjtlgeNuBDNaJ4z4GmwIULz6Qz0I
	 Pvow9wunh13dP06rNLM861QGmdSmstBwNfKf9ZrTPx8WTXbFijwqcJnxw2uIbTo1wV
	 2xdCcL3hfffK/z6Ez+51sxGEqem7LqAT7MCtWOVYJ6+SgmNuv6FnFZX8+sx5OtOUN8
	 PleYnjf3el0pLK/7DdeuxRmYEeOUbUCZF/kPQUjsPhYSoslpHdSPQzVSDTDtC5x40d
	 CUuHyp6LwW+Kw==
Date: Sat, 25 May 2024 16:44:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add R9A09G057 CPG Clock and
 Reset Definitions
Message-ID: <20240525-unsealed-paramount-804c82fe14ae@spud>
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gSz3PYicA2lVa/gN"
Content-Disposition: inline
In-Reply-To: <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


--gSz3PYicA2lVa/gN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 09:27:58AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator module clock outputs
> (CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registers)
> in Section 4.4.2 and 4.4.3 ("List of Clock/Reset Signals") of the RZ/V2H(=
P)
> Hardware User's Manual (Rev.1.01, Feb. 2024).
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--gSz3PYicA2lVa/gN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlIHSAAKCRB4tDGHoIJi
0vjaAP4kcVgCEXvHhpIDA8LFpZvhIfTiy+I5jRdZrrMCzYuSuQEAt9m3z6xph+aU
peJk2KDLBfhrCUYmt8Qz1T6+VWYC1Ak=
=dDEg
-----END PGP SIGNATURE-----

--gSz3PYicA2lVa/gN--

