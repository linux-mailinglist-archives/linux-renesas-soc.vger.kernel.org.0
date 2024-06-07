Return-Path: <linux-renesas-soc+bounces-5965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 479DB900AAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 18:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E671D289853
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 16:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF410199EAD;
	Fri,  7 Jun 2024 16:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8S0AVWr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F97134B2;
	Fri,  7 Jun 2024 16:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717778872; cv=none; b=MBUWaXM0iuzcXIb+6Qh9aAC2UkpZx5NP0xBP/6STc8WACV3ImfoTcNCeXyRcYCR87kcUVZUmX3QmZnjwAmtbpOrF7sAYR8BVlDuI+yZ8vkpw+8QeeGdqluc4btLYr+R1QNHBUT7pMsBgE5WOKa2Ofls+qLW1r9QdSHTBynjrqEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717778872; c=relaxed/simple;
	bh=svWhuSe6Hrl0eXx4SJrwTVnmUobplmwTGkLB4/Na6KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGNIWz7XSDMKxBB0QcEKEOaflsIA/ZY1z/KsOkMXF8kAF6qj8XNHHEliUdFehsta+QtosHN0iuBzfurzC6ybhdt6BtgTClkNwyOnIdp3RSwkeoKVMICpvKf0bR//Zyja7nUjmDX1ThT75TmGNlmVT0sfl1H7bVWC07Yd9wHshZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8S0AVWr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9329AC2BBFC;
	Fri,  7 Jun 2024 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717778872;
	bh=svWhuSe6Hrl0eXx4SJrwTVnmUobplmwTGkLB4/Na6KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8S0AVWrPFHSgXJJ739HJDnv2EMybJ5gls1mXjix5kVjAXtv+CV7OEuufsOhcMYzf
	 vVHn3Lb6psLzQatma7AURo2AtX5Yp5BUzQJPfC6O/XHO0swL0Z1sz51MQZcJX++mmh
	 bNXHTvmHS3ptIBgfXbpbPhlXfWJa2ymqdm7d+ZlFeJBo78HmS4ohqtmzMrMZzXoCrw
	 IIhsR0YYoWV9i+qjqzy+qMyO+dsVtdPh6dd4YtMXVK8RTOZqRvt+F2joXXyHf273bV
	 1mpqNVAWzCy2ujHms5AqPA2JHn9dFmSMI19P+YaEBuy+EumSUX6WzkncBj5SQt3LV4
	 hcU41cEXkKkSQ==
Date: Fri, 7 Jun 2024 17:47:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC v2 2/4] regulator: Add Renesas RZ/G2L USB VBUS
 regulator driver
Message-ID: <ZmM5tL1SaO-mOEpd@finisterre.sirena.org.uk>
References: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
 <20240607113745.73934-3-biju.das.jz@bp.renesas.com>
 <ZmMntvriR32aqI-m@finisterre.sirena.org.uk>
 <TY3PR01MB1134695C9D89C84EABF7B2E2E86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JlAvTLCTi6tEcdAx"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134695C9D89C84EABF7B2E2E86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Cookie: Your love life will be... interesting.


--JlAvTLCTi6tEcdAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2024 at 04:20:10PM +0000, Biju Das wrote:

> Is there any atomic regulator API's I can make use of enabling it?? VBUS detection
> happens in interrupt context.

There are no atomic regulator APIs at all at the minute.

--JlAvTLCTi6tEcdAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZjObEACgkQJNaLcl1U
h9BVzwf/XOiV6LYyk5220RvYSefkL8UfteoyuuG1vMIoPKlEjHvlhwmTZI/rX/lN
8Ttekx1UYFlnJlApvc2oHJS97g53NQwpswHWEYzeU1TaAI7YflM+rIEqd5TQAIRV
1en5LUdIzSK9KY2F5cwkWfiNA31wC+9+4lTNdT8BPiggzZgkezrYMJSt3FFoxzDC
Es7pIv6HPKe+xorFwoktNn3yJ4nf+d7Bkzwm9xu6HwL+r3sDB/EoiUOp9trJ8y5A
fJ0A1kdnIjWEOJXQQQdjjGzNgbi4rFT0NbFnkRgq3HnYHHtYPoE3zvY5h3m5TWDn
pQGKcNZUsSFpmk4t7t/0yFlzyppWhw==
=yMzJ
-----END PGP SIGNATURE-----

--JlAvTLCTi6tEcdAx--

