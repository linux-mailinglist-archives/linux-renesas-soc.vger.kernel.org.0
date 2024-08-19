Return-Path: <linux-renesas-soc+bounces-7913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C519571B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 19:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24789283168
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F4417A59B;
	Mon, 19 Aug 2024 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ys22w7Ei"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21E14AD02;
	Mon, 19 Aug 2024 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087585; cv=none; b=Pzl+vCnAMI+OmMD2tfABz4VXu+euAdUTqb6FynAmXCN6bC+16SPpfIE96HLRLAARR8fiPCLJzvlHYS0PkPJzikSp2VOK2hjtgjIBQ4yYhoCKb82QDscMp5p2ZOfiJ5u9vE4zN+0EJ9jTqP8MCDZiwtU+e3VvsWn6x6/GDeowbuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087585; c=relaxed/simple;
	bh=1YUwhTkKQuYH/5TElmbzoXnn4fa4YlXoJnkDBxAa+zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rj0nfNDJ1RQYJfRF+8kjt28CwsxPCW1CqkuEKWN0D4Hc6JkzzxaJKnMQZEmbapZDaGyix4mr+fJv6D95AqjMHHi4HP0fWoTgH7+egtCdjeXoZFzaCZSE3KaAsf6m7UO2w14HVvprtz4czMOlxCVVl8Csz0zX46p6+l7I7jbRCA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ys22w7Ei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD86C32782;
	Mon, 19 Aug 2024 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087585;
	bh=1YUwhTkKQuYH/5TElmbzoXnn4fa4YlXoJnkDBxAa+zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ys22w7EiHHHRoGumTUbPFSawlSz7sDUgPDBI0K5FlkLh3SW923Fn+5EVdtrmy+1YM
	 pb1f9NB32raKnuvPQYOyNsVXt4Olm0h7cmBcwxvfsJbfChoGXvwFg6dv+poAKJhIRc
	 7jp0sDNQPYS2cccA81vdmR9dr11sAdZs+HNVKIzkKSJy7piE42x2qhOL8IcPAcaUuS
	 IuHyxSkIipFeJFRB2+Bem4+z28idh91eKVRlbvT/kr95jtg/ZPzifHq5sXx24y/5ZY
	 8elODxvlMXOPVT5zk9KVWXyckJrV1/0iYP9ZdXKqa67en/xKKvypriJrhzs9+ssvOZ
	 SVsnDifu1MRKw==
Date: Mon, 19 Aug 2024 18:12:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: renesas,du: narrow interrupts
 and resets per variants
Message-ID: <20240819-slam-pandemic-1e8464f8694f@spud>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uDC2vKcryAk+Ed2e"
Content-Disposition: inline
In-Reply-To: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>


--uDC2vKcryAk+Ed2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:02PM +0200, Krzysztof Kozlowski wrote:
> Each variable-length property like interrupts or resets must have fixed
> constraints on number of items for given variant in binding.  The
> clauses in "if:then:" block should define both limits: upper and lower.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uDC2vKcryAk+Ed2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN9GwAKCRB4tDGHoIJi
0qPVAP98hiUU5eVPGOTJ1UGLU2LGxJEw1yP/JSQO5PogiR6iZAD/RzmaR4O4KwZp
lvFvfmz3HHReF1QQAOG6BlAjM85Zqwk=
=/aZ7
-----END PGP SIGNATURE-----

--uDC2vKcryAk+Ed2e--

