Return-Path: <linux-renesas-soc+bounces-2310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C75E8487FC
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 18:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F7A21C20B7C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 17:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E415D732;
	Sat,  3 Feb 2024 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOHs/ZUg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9225F86A
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Feb 2024 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706982144; cv=none; b=Go4LUm2qas1A2Q5vHSJs/wIqMvUKhvH7bwEX/m7CNoou8jfqlMybWQT0ZsMFk7GGfI6Lk1d1b5cR2w3PFxhzV3dIjkgKfaN3PfoAMo+hL9zXfzxISnP4uXMSk6pDfTGw/PQA1M4qSy3mJJcHVMBhuXTwpN1UAt3751h520FXwas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706982144; c=relaxed/simple;
	bh=X87H50YTk+VOQg/vSoEcYEVzdtSEXuUxi9PNsX8rOSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVLu7Z6ZsARIWYGW94Ue1Y+y/TXuLKJAWVTTE+SExXaIR8+WQs0idUEQ45q+4KXrmfOS4iM1Mi0YgXENDqTC1kNlcOYo8y6fOiUSw4y5+VonK/wzwRVp1BaP+HyF7kaihXXthuJDkyRGk/vMh92i0P4ZAjCOfnDvHxz2rgmSRZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOHs/ZUg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7702C433C7;
	Sat,  3 Feb 2024 17:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706982143;
	bh=X87H50YTk+VOQg/vSoEcYEVzdtSEXuUxi9PNsX8rOSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOHs/ZUgh8h/16LWFYaruqdYkwVhunu2iROEL8txAElvQW4jASUHcFjNAnyZ+b3nm
	 CMb4r4o70P1Ai26YsEFWmpDNA5uREYScAOQHcQAAVRVTqDEZ1Ct/bThmrrBTzWvMxs
	 Bzjl4iN5jem29G9IN/tL9Plm5vUq2Swx98dtjKIQXQcnce0JdomZR42jwiexkqAgpp
	 rBLqO3de5tuCJgC1+OZikYlgbdXylQ4ngVbGrouO+04aGstWKGWbCXzgWf/csViBHR
	 zR5bYwmYb1UE2U54vqhe5Jx3V0Ny2R+mqXsm+o1xvQs/S07wIz29rjY+zNkGGEmdzI
	 LGr4cstVedLUg==
Date: Sat, 3 Feb 2024 18:42:19 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Minh Le <minh.le.aj@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add RWDT node
Message-ID: <Zb56-wfc6emQuXfU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Minh Le <minh.le.aj@renesas.com>
References: <cover.1706790320.git.geert+renesas@glider.be>
 <43bb03f3baa87b4be8ce953b1955df6b89387e4c.1706790320.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P/b0kZelRhq1EDY2"
Content-Disposition: inline
In-Reply-To: <43bb03f3baa87b4be8ce953b1955df6b89387e4c.1706790320.git.geert+renesas@glider.be>


--P/b0kZelRhq1EDY2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 03:09:16PM +0100, Geert Uytterhoeven wrote:
> From: Minh Le <minh.le.aj@renesas.com>
>=20
> Add a device node for the RCLK Watchdog Timer (RWDT) on the Renesas
> R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Minh Le <minh.le.aj@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--P/b0kZelRhq1EDY2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+evsACgkQFA3kzBSg
KbbXzw//ZPKk340jixuh8F5A5Vwbd+5S2ZTAhLy6UUrn5qTr9+tb7QXTcERpFwAj
TJkcW0/smAIGvZCFiWlmE9S4ElG8+qyvmLRonzv15hj0/48K8Pgvlf53EI+cenTS
hyudlcVo0i3KW4+RUJrG5PqrqDcdu+OwLj65lhVHgBB/l3EWS3xPNhz+wUKq5t7+
7wRvAmrhze52mbd9HCVT9NUt/kPa+EZGMscncwZEJC5KqH4/tCHYIkDl9YaXns7x
wpz634B0F2hpP+v3f9CzhJVqLmCGOFlefArO4c6b+vo3G8btUPxMpsClQuev/lie
46ypR0ZImVG6BVNU0q43RkCVWu1ITgGfsp0WNMg+HvGms+Wg+m+9y5rbl+W2pR6e
S46MHNg25wrbxrJTvikRondvtEWb4hYeyBeYuiHGbbd0VbS3F3XnQzJh6Z3J9hEK
+wqAOVXJAdyK86Rsy5VMEyI9tV6XTSvQa/uB38DhTtdXq/BcnuBvny13fj8pKtjF
8yA/wBapDg+fe+qqLCcvxwHjFtagbP3Tqzmqqcis4kGcPdXw7sgnrrtHk6WlXOY8
vhNN0CeQl/P4KqLXVHLxe/EimtxF9nngIA+G+EpkV5TsUzB6VqbQ7a5boUCARr1+
GT87OwMLA7x0H6lpu/kqrpBbjjiZuxLoEXh4RZMiFL/PTgncNfg=
=r54V
-----END PGP SIGNATURE-----

--P/b0kZelRhq1EDY2--

