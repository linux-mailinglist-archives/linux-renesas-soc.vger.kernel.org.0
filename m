Return-Path: <linux-renesas-soc+bounces-16726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D29AACB0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 18:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F3DB3A883B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 16:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898162820CB;
	Tue,  6 May 2025 16:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j557xrhr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C826281363;
	Tue,  6 May 2025 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549193; cv=none; b=oj5gGeJU8IKH16lMylrOvjx4BMRJ80i2PrTATUFiFKY5UB7uVXk5ejfzcO8+XUAM/i1Y6qwbjnlwKTwGorxEQija5BioO6JhS9mJf6gYCcZ9RQgoR7tYBesbOOO7/23rElYQ3+fr79ksgTwDS5N7ZK83zCRwfIu3MXqVEXu6Fco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549193; c=relaxed/simple;
	bh=T5IwqVc6xFlXyQ8S8dzAZ6X4EgS5Ru1mHBEXNH45t/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTX/gsGC/8rehTgnReUomTrLnRn4pjAHkn1qYQFhbr8RZUjrpoXI2QU78YjdbDc8HPICcC/rWXaMQNBAcoMGPLnQwUFYZz9RWBhh7bD5xt/baCTBMQd79se5LYJNIaJMKeK+2IaqtZRq+KZWonNQGcz+ElLKxuXmHpPpDxgsLfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j557xrhr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DDDC4CEEB;
	Tue,  6 May 2025 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549192;
	bh=T5IwqVc6xFlXyQ8S8dzAZ6X4EgS5Ru1mHBEXNH45t/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j557xrhrILi2MnAwG8b+Vun0FgPtExVIsTvVw1RZAHUnV7mry6ggoagqoPe3R61bt
	 JPJoyOrQ1CLGe+dkWR/csvarBAWtpQM+zyjj+SgsoWF3hFKQnOz6WMnKBVaiT1uDHr
	 hLRAC09tpACodPknrf5H/yZW0hU7qn0pLDwRmr56/esoSen3HfNFXnalmWjUZj6Kik
	 LPckqFnXXVtbwGcs9Q9ASS0E+V9r7LUHJYK4i4ugfhIsTY2TPg3HpB0uB0uotiCpnS
	 1/6uzGGnsV4adsrCQ+HrypTqjXoXXUWKNFQxLzs2azgvzMDvd4Yu5CGhzlV3FC8y2l
	 n3Dfu70dY8TLQ==
Date: Tue, 6 May 2025 17:33:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/V2N SoC
Message-ID: <20250506-collie-rover-9e157c442748@spud>
References: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wuQ590LFJw1Dw6xo"
Content-Disposition: inline
In-Reply-To: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--wuQ590LFJw1Dw6xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 05:25:40PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add a compatible string for the Renesas RZ/V2N SoC variants that include a
> Mali-G31 GPU. These variants share the same restrictions on interrupts,
> clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
> validation accordingly.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--wuQ590LFJw1Dw6xo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo5wwAKCRB4tDGHoIJi
0pvJAP42yoslbjgKSBdNI1/TOdTQv+1AzQzyz4vG84MvPhN6QwEAl5hUJaIS8obI
Ijtv2fy6kUplbiuNHrDRhIpGHpWB7gg=
=S3tM
-----END PGP SIGNATURE-----

--wuQ590LFJw1Dw6xo--

