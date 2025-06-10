Return-Path: <linux-renesas-soc+bounces-18033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF90FAD3D22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 17:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DDA11BA3E01
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 15:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D886224111D;
	Tue, 10 Jun 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oksrL1/Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81D6238D53;
	Tue, 10 Jun 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568888; cv=none; b=YE8YdMGotkSHvU7EKFr6jHYK8zhzaSP0hTFHhC6XGIsMAyRh3xbAtPj6diMunr+/CHrtAH6j4i0zx1zK2NjUVcq9DN0JOWiX2U1DK8CnNelUFG11LRZxEdtBEr0A+dSUrDQPbtyspkcpxVJ2FMlOz0lFE29Rvak3Ei8C2F/I91w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568888; c=relaxed/simple;
	bh=E1xqj+u3vf1FQ4JfQQLgsK2d1JGFFQy+vq6VMPj9YVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5wnh0raRJ3T0TahjkBZzbjHEA9sKllwPU7GdoW3j3QULVYbWGc5mu5LXKZjqf5KBbgsWs+u0AhDhidmctFp0ORQCtNR/bf0kAefnQ2GaiMpk/BWTFXvLm4W5C7m91N6JCLXc1TqxOjaJtTSMOski+3q3/lSJ1u6aD/L8e4e5eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oksrL1/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18015C4CEED;
	Tue, 10 Jun 2025 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749568888;
	bh=E1xqj+u3vf1FQ4JfQQLgsK2d1JGFFQy+vq6VMPj9YVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oksrL1/YngNECF96m3avQ+YGC7rZcfdVOSkr1F7L17EpDj7HxIjIU6TuJfabOslPm
	 2kSVH0OmyaJf6II4wLaQ2Lewmx1ZcqauQ680kLk0dpw0ZjFpVysUcGRaZC5Ku82B6y
	 ljkYQ3d/3EdV/tI7XmtDh/o6YJrsKtQty2p/ZwPSeHzgelbN+yJGxFA+BFBNIl1Ne1
	 XSfSAb9xi3CUrtQAg3ld+EzBT7YzXeV82JBy10eeYra56J+WirDw0XNyl5I1GP9hOA
	 53DT07/IoNQ1drNvCqPqptH3qNe5YmWLoOgF7tf+lYKYSk6ASAMS9p+xT779oNHa/e
	 j+b1V38mqCkVw==
Date: Tue, 10 Jun 2025 16:21:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,rzg2l-du: Add support for
 RZ/V2N SoC
Message-ID: <20250610-outgrow-reputably-a2141617d2db@spud>
References: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="glvRYTcO4HsikMOq"
Content-Disposition: inline
In-Reply-To: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--glvRYTcO4HsikMOq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:19:05AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the DU IP found on the Renesas RZ/V2N (R9A09G056) So=
C.
> The DU IP is functionally identical to that on the RZ/V2H(P) SoC, so no
> driver changes are needed. The existing `renesas,r9a09g057-du` compatible
> will be used as a fallback for the RZ/V2N SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--glvRYTcO4HsikMOq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhNcgAKCRB4tDGHoIJi
0ihBAP0caHWmTlCMBGf10BqmonncXuuqquzAPIjevbfMbJqjpgEAq1e/Lwlsz3zH
nPa5REoaGnuz3tHm/EBSbKhqaJWDkQ4=
=I3B8
-----END PGP SIGNATURE-----

--glvRYTcO4HsikMOq--

