Return-Path: <linux-renesas-soc+bounces-18034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1918AAD3D42
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 17:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 364911BA2BB3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 15:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF83242D79;
	Tue, 10 Jun 2025 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naZwS8LK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A6239E84;
	Tue, 10 Jun 2025 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569058; cv=none; b=RIsiT9Fk4VRH4bN9OR0rHh/9SjMvWULCLPDxN6JeGuOhFvoUY4UwJvNtnxmENmNHFWWfa3FJfZoudlqgNoODfndP+hr1b74sJpsPRSHb3syprjaNiFnPtee6qulfbe3KYHCNeH85+C+v4l/wQQwz5/n03aThI7oVR/O2Nzm+5JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569058; c=relaxed/simple;
	bh=7RTD/hKazwSOcIO51Bw2eV5ROVv5ZTuBKh3I5QbzMuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKn/InwhvuCphA941ljbXFOmPBkwGqbfB0B8Oq7dD9g13ClldyUez7O+I6KjdEJVXMe4FrSXs58+nl1FlDZsqUZtS2FBSoZPZXPQ00AI+O0xfgggGF+MG/eUVfLe/UQE24/82Ni/vnVNZzj/LzGH1VYLQ245DjZH7Y/cuT/SE3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naZwS8LK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A54C4CEF0;
	Tue, 10 Jun 2025 15:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569057;
	bh=7RTD/hKazwSOcIO51Bw2eV5ROVv5ZTuBKh3I5QbzMuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=naZwS8LKVimmMLixNrt5XdGdIawylg25FquFXREt5tiUz7YXPiQku6aXRDwqnyc8e
	 KXLe1vVv2x2n+blKcfonTqsJ6vzFMlChGyzX9SySskStHiyeRYt37FDga8rD5D2FaO
	 g80ufAtVOIHXhkAuzb59hdXDa1V5/VYcW+dTamqgqm6lh8u8iTEaJLGl/jJBeIvNfE
	 uiwTYQR5B4UBuSUq0ZAsYKfs3tkd0n0QtqC+kE4+lyx+E3B1xKUCLwyJkF+o5b986n
	 lO3O80/XI8IjkXxgEQqoMoVSpxjcpdpovrvvVOfq6rGtQemsacOK/rSwo13h+ONlCF
	 8micbStOP6SQA==
Date: Tue, 10 Jun 2025 16:24:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/8] dt-bindings: clock: renesas,cpg-mssr: Document
 RZ/N2H support
Message-ID: <20250610-sizzling-onto-60238d9d5658@spud>
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250609203656.333138-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CSDeHKHMQxmnViqQ"
Content-Disposition: inline
In-Reply-To: <20250609203656.333138-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--CSDeHKHMQxmnViqQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 09:36:51PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for Module Standby and Software Reset found on the
> Renesas RZ/N2H (R9A09G087) SoC. The Module Standby and Software Reset IP
> is similar to that found on the RZ/T2H SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CSDeHKHMQxmnViqQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhOHAAKCRB4tDGHoIJi
0s/pAPUSom8POJPMO6VwBEytFqfxX2fx3sj4VrUMjrFNamSVAQCCho07QZ6+R+dm
gYn4cgk2x6irpyUIbVJ4596Xc6rqBg==
=02Qs
-----END PGP SIGNATURE-----

--CSDeHKHMQxmnViqQ--

