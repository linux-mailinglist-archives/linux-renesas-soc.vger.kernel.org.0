Return-Path: <linux-renesas-soc+bounces-25304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D79C8FB55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 18:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75FD23AD927
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F379B2EC561;
	Thu, 27 Nov 2025 17:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYR7abm2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BBE2EB860;
	Thu, 27 Nov 2025 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764264676; cv=none; b=Y/7OWSMKUIXJflYxRktSZsv4ypVwMblGUoH+WJpTuQXick7utI3S6B4+WFi8axJ1Iq2TZj6IvkRBbGMbHk+qkey7dTdDnoU40Rb2B9Hrw51A4OV9NSEC8T6GjHYOvlEDCBCAsGFPd/VhOWevE6MKyTzBKzKePXjsIg7MSxKVw/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764264676; c=relaxed/simple;
	bh=wUcXdIsiEEagJtStys8Odb0pSWI1Ax2l6FDJnACAX9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAKfKEc5CfspYAHDXFCGmbrnnrc0qB6fEcvye6Sa6S4HrqLD5oM2ARXrA7byjeb7UukDYAeyPPwtdSw3CUbuFkx9QSyUMb5Tsd7Dxs4uAMyBIFPAePvC75XeECPPFfaMu57sc0FS0o8B96SKC80kW2h639YugFh/9qJx6a3xZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYR7abm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A971BC4CEF8;
	Thu, 27 Nov 2025 17:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764264675;
	bh=wUcXdIsiEEagJtStys8Odb0pSWI1Ax2l6FDJnACAX9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYR7abm2fikSq1EfQz2xU5NX4iLItxa/9cg2kfB4IjV6ONwSjRz06u7DExboW8MU6
	 c00mdw22RaBJcS8/miyGEN7yONIcL33LkKDLLizyc8ES8JIrVli6bUXlXcV+MEbgP5
	 V5ylB5B4s1valT10l3qyhsNQXJHrn2Sm1YnFXYGiN8A5+DVb4z63BSC9u8Cc5d/dIt
	 k1CaCneUgo8BdTiiobeegBJAfMckQqvgrcOSgiKZcpRgBxDJLOBxwRoad6UPqsfmRr
	 KbC8Y+8FTwt4i0LDPXzBmaEBKJcyCmzRl8CdPv4lEcE5XZdJSc2DUbZLASaBL449xn
	 +rOQ3ZFwVq8ZQ==
Date: Thu, 27 Nov 2025 17:31:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/V2N SoC
Message-ID: <20251127-thread-remedy-c85aa8beaa69@spud>
References: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251127162447.320971-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DvIK2ntBJfJEIysa"
Content-Disposition: inline
In-Reply-To: <20251127162447.320971-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--DvIK2ntBJfJEIysa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DvIK2ntBJfJEIysa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSiK3gAKCRB4tDGHoIJi
0qoKAP9mfpUBW8fW1k4irxN+mpvJYkTjxCtDoyhEqHnM4nw8YwEAl8EeEcY0uvOX
wjJXjPLTj4aH5mdb6qHuEeauOMbYeA0=
=l0iI
-----END PGP SIGNATURE-----

--DvIK2ntBJfJEIysa--

