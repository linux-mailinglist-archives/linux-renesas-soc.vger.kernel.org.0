Return-Path: <linux-renesas-soc+bounces-23023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6ECBDAD63
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 19:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581F71925A9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 17:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A26296BA7;
	Tue, 14 Oct 2025 17:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzNI8Gsr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0013D35948;
	Tue, 14 Oct 2025 17:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760464126; cv=none; b=UBYoPIGKA92A5ZlKjC1IqSSpxG3jMl6sYqPXdPsI+aimsbriLbk1zaFwdRf9L6rcXjjm2Vd7OJ4p/9SU9Y+ZQue4tU+pBBxEdrWRusEkw/ELQH7q0nu5bzLhBTmn5toJvP954aYhYE8CGK8JqjXc8Tw6i6FNscsiv9dPFqJl69k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760464126; c=relaxed/simple;
	bh=wbftGYNhKoYWLRqME8ZofabBhLkIsOcpSWlpA7M6FPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWDbRbhV0p1earivrECR6vL4KfHk9sZwJkO5wj+GxbFbpIAWX8QGCCCUAF53m760mqeauuazOemGvZVOPjUs/aZCLdrucdv+Jsr2JLe6etvfeFxxnN+MK6AcAuBR/xg0+JXbkEWCladuOyAYnK/NhHg2GNYuRvAr97rflukdnF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzNI8Gsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC23C4CEE7;
	Tue, 14 Oct 2025 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760464125;
	bh=wbftGYNhKoYWLRqME8ZofabBhLkIsOcpSWlpA7M6FPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzNI8GsrFNrEub0BvD9o7i66EW4HCx/C/R0rKbpYm368klPrIEfTdkp/wRkFynOL+
	 s2zeM7Kb/+KHPOGP9uaosk2GcU71gbGuJTPy9c1Ghvq8F9iFhDubsWFMEQlwlOE5Bt
	 zcoh6tMURiYWW2P7tfQJzqPNOLp6AKepN470/4DSsGMm/cxkaeV4E1ORrYJZB3/FUK
	 4KmIYv9hnm/UzWYYOKJpn6gP9i6cAPrkD9cJlfxdbrs54GEd1VAQDLs9/dGVIEGFxU
	 3ZMCVJ+tqL/nEySVqj4u3feyOvXrGHiCoP8fuSRGmZ22qLfQwcLXTHNkPzMNEFWwIC
	 21znlWXNeJ+yw==
Date: Tue, 14 Oct 2025 18:48:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add
 XSPI0/1 IDs
Message-ID: <20251014-emphasize-savings-5456a59f62ab@spud>
References: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014151325.160062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/sKAZk5BI9NvYP7l"
Content-Disposition: inline
In-Reply-To: <20251014151325.160062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--/sKAZk5BI9NvYP7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/sKAZk5BI9NvYP7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6M+AAKCRB4tDGHoIJi
0gPNAP4vHeJ0rCWCEb594UGNl/AkjvvmlsNc+rIOvXgbqK/myQD+L61aa5QcZcpM
vzIuXDySLGITMVLT4bLE+xlnBFBKxw8=
=w0RP
-----END PGP SIGNATURE-----

--/sKAZk5BI9NvYP7l--

