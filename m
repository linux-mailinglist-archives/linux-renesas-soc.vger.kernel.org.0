Return-Path: <linux-renesas-soc+bounces-23335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E264BF2B8A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 19:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 61ED34F0F7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 17:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A04330B15;
	Mon, 20 Oct 2025 17:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVf/5gWI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C829AB1D;
	Mon, 20 Oct 2025 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760981492; cv=none; b=IOFGSNpGyAb1CPLP/+iaNjFUXF5Kin/tNv+JUnz/SQ+VcIlAfbOM+f12+SR/7BRsfq/N+WCHZyrIfWAZAH1ZAlwXB9tR3MLrkfvBRWuBDmVf53yR3pyvShungpDEPNR1sBNffER3Dh4TCnIi+vaUwsRquRhZ6xdT/7Merl7jLGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760981492; c=relaxed/simple;
	bh=Rj8TnVP8wPWGT2UvO9eiDZL3aqksBHrM83YzLn2wHRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y67J+SGMsXI/ZO5Wu+JUtqKWZVY/H8VwK3jCDcYrQ/qtwvz/RKOXZmCj4/cHjTiriLqGUwc6ofaPUVp6+9Y6EjszZFnuZNGqAddIa3/LH/FnTZ1xO8KYqyDa0K0/qXl3FTrgvLYj9NQtHuXIXWAztK21+g5pP1UytiQcoaSfECU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVf/5gWI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDDFC4CEF9;
	Mon, 20 Oct 2025 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981490;
	bh=Rj8TnVP8wPWGT2UvO9eiDZL3aqksBHrM83YzLn2wHRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVf/5gWInfOxWLr9UCSHl+uXjgtqZ+92BuMAJPEsB+6mbaoMKbY5mks735Na5ATlB
	 yZMr3d96jcLPL9mbv9/p5XtJTtpHaRDaow9e0Tl+uKnZljkNc0QoBvBztpcJPaJ4nt
	 fWaRGHiruJAl3HCL18abEJHPCgSdeJclmLzacOHSqDo6JW2LmQ4HfIADjEBJmvUg2o
	 wXR1e5GfNtWKdIIQTsjY5l185wyD4rJPThNJM2RRHYYv0ut+SC/7JGRhILjbKxYirJ
	 qrKNxzMHBjDmmg512MlFcrlRXZVrV3EIBGDha8dKCAeIP0+v5P9uJoIgdnVhMLaL6Z
	 z+5BGuKDHz3hA==
Date: Mon, 20 Oct 2025 18:31:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <Frank.Binns@imgtec.com>,
	Alessio Belle <Alessio.Belle@imgtec.com>,
	Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless
 power domains items
Message-ID: <20251020-freebee-asleep-702062240cbd@spud>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <855fdfad-1df7-43de-8a86-a938cc56a202@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pg9U5fLbI3MpnTw5"
Content-Disposition: inline
In-Reply-To: <855fdfad-1df7-43de-8a86-a938cc56a202@imgtec.com>


--Pg9U5fLbI3MpnTw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 03:15:14PM +0000, Matt Coster wrote:
> Hi Marek,
>=20
> On 18/10/2025 14:00, Marek Vasut wrote:
> > The power-domains items: list is not very informative, replace it
> > with plain minItems/maxItems instead.
> >=20
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>=20
> I would R-b this, but I want to wait for feedback from a dt maintainer
> to make sure this is an approach they're happy with. In the meantime:

I mean, yeah - they literally provide zero value over the names.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Pg9U5fLbI3MpnTw5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZx7AAKCRB4tDGHoIJi
0skAAQDWz7xM6sOMHi+9ICDux0to/OJRLITPWezXMx6MAzC0wgD9EGjMakpX6pVN
XvM7QU3Rz7z4I2zFS+awmJOC0RKSOAE=
=btcv
-----END PGP SIGNATURE-----

--Pg9U5fLbI3MpnTw5--

