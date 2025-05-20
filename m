Return-Path: <linux-renesas-soc+bounces-17270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01FABDFEC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 18:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3A1C8A3464
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157CB25FA3B;
	Tue, 20 May 2025 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCYApDKk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE9252297;
	Tue, 20 May 2025 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757076; cv=none; b=dkvsDZ8p6bB4rs9BS2B0yaF6Mu23WAGlDL6dr3EL97/yo3YOFgDUIrsllQPpT4Dbvh9NXBf8kPxnxG4hpRnSpuEgzbIIDOHD8rTgJZeI8hQrdBH46rlZrGAnDmWIQsyU6rpxLI95i/Vstf93qdQnRjh3hEhB4kEghC3ZMXnGb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757076; c=relaxed/simple;
	bh=T8djPkiQ161lybXxMJx00BJYl2fbFkyUwvaxa66GR0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnZAEk6jZXpKVgVn/4BXENRbvVcIWkL8FsOpo7mtPjeF8ez/B27SIJDC04ipO1QcHr3LU+TeTdo8tEYJL/K06yN/grlHGdwdbCoJoofgiXMqMcnvnWpSa4M2JF0Bqj3si+8ZAQJNI50fQrEt2F72l63o9kD0I/TtjCzCJtov0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCYApDKk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819BFC4CEE9;
	Tue, 20 May 2025 16:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747757074;
	bh=T8djPkiQ161lybXxMJx00BJYl2fbFkyUwvaxa66GR0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCYApDKkKbQ8RZcHcYsx+1rBYlRV7fQdnAVx9yRyY+NPFYoz6kHYVyW+Jh6L25OmF
	 Uzb3T4IFmtnpC0nH0jxklZne5MvPbi9thxqqoGL0yoKWrdW9dP8nlx9hgiJcgWNLni
	 kOK1s4+HXnzN5dj2OHyCI43Q2e38DDMfzA/wJIrN5C+ZfyUepuds+sCdkfH3ucwP6O
	 AYieyxsxl24AP3uJ3mcY4zqfbz/50G8Jj517bXuxP5M6X4R0IqI6cCJSxwEJJWX/1K
	 7Pm0i+JDkPoauHVYiNEEEkLAoc2P++oCZvz015+pf1y7WsM2gsJgJ05WHO994RCpKo
	 HcMIVdeiWhEFQ==
Date: Tue, 20 May 2025 17:04:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
Message-ID: <20250520-varying-empathy-42a2e2a6a017@spud>
References: <20250520151112.3278569-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I2SZYbhisflRuX3q"
Content-Disposition: inline
In-Reply-To: <20250520151112.3278569-1-hugo@hugovil.com>


--I2SZYbhisflRuX3q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:11:12AM -0400, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> Allow to inherit valid properties from the dsi-controller. This fixes the
> following warning when adding a panel property:
>=20
> rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do n=
ot
>     match any of the regexes: 'pinctrl-[0-9]+'
>     from schema $id:
>         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
>=20
> Also add a panel property to the example.
>=20
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--I2SZYbhisflRuX3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCyoDAAKCRB4tDGHoIJi
0iIqAP98S0xKvMAlh2ZWVp+/y/p5FSrNAgAPPZFxpVcJKPWGpgD+M+6pCwtsw3it
k0J+4a9xCAW+39d/eRtypgwUC9cXfQ4=
=he3N
-----END PGP SIGNATURE-----

--I2SZYbhisflRuX3q--

