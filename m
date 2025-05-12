Return-Path: <linux-renesas-soc+bounces-16970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2478AB3449
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 11:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64C48169D10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 09:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F0525EF9B;
	Mon, 12 May 2025 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKIZxZgU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE00425A2AB;
	Mon, 12 May 2025 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043950; cv=none; b=Cpr233+0Pzbl1K1zCIt326sNpC2nIWJujEEwJq2pMBp2NE/3MzXxOhOzv1KIA49PsAHwGvH9CYHhHVu3WKkifwrGUj7OmTcE916UoMzJfUsiDIYhui6YJ5s/mtalFA8Na1F9cxMdlX2aD7bohks2gFZ28wl4loj2ARl3ZBJt1Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043950; c=relaxed/simple;
	bh=hQq4dgkefAJ7TlKM+qmR+trX2qmtOXQN1XFTxNeYjv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJsO2QegsOGFABZaqVRn9TAQtS8UWZe8zKDQ/rIAcDJgwT6sYpJa2S5A8OaGpVoAoyZ0sVo4b3bLgmeRsAAjyV66Q0Auz5b7O6b+a2n/LkdG9dGqeeOQMETMWBdR+xBDHckWQ3N3nSCeq47LmKa7QVmdtYoWoUkRVHffBygIxVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKIZxZgU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2088AC4CEE9;
	Mon, 12 May 2025 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747043949;
	bh=hQq4dgkefAJ7TlKM+qmR+trX2qmtOXQN1XFTxNeYjv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKIZxZgUcpIdJIgPHWL0aesXJ2smhpbgLsD6Jr6VKaT7jbdAkX49iBGHc58mzpD2i
	 gWmtaagi/Hl12iaVzIWdyOxu768wRILascShFnYhipazodOmQ5sP4/CuPIRPzJWL3g
	 /QEYv8kSKIyeOlhiWYXdor0VtlmO3fgs6CAnC9e71fB5pdY4Bg2XOYdbbeHw8aMk8i
	 mnU+lPNu+pyAGbCscGXMk3sRFdybT1K3r6r3E0EqxxbZEm0x2a9IR9TGuPfFQUpcsI
	 0IVrKa/+JDUcZYgl6lKm819JXi9Z1XfQqDNmsdMxy65e9GMGpOYTh9ttE99zMRqO3B
	 HIXs8lszHhKvQ==
Date: Mon, 12 May 2025 10:59:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
Message-ID: <20250512-disaster-plaster-9dc63205cd6e@spud>
References: <20250509-sapling-exhale-72815a023ac1@spud>
 <20250509-dwindle-remold-98b3d03d0631@spud>
 <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NMTCdSap5S5GkUZg"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>


--NMTCdSap5S5GkUZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 11:01:26AM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Fri, 9 May 2025 at 17:39, Conor Dooley <conor@kernel.org> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > When the binding was originally written, it was assumed that all
> > ax45mp-caches had the same properties etc. This has turned out to be
> > incorrect, as the QiLai SoC has a different number of cache-sets.
> >
> > Add a specific compatible for the RZ/Five for property enforcement and
> > in case there turns out to be additional differences between these
> > implementations of the cache controller.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch!
>=20
> > --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.ya=
ml
> > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.ya=
ml
> > @@ -28,6 +28,7 @@ select:
> >  properties:
> >    compatible:
> >      items:
> > +      - const: renesas,r9a07g043f-cache
>=20
> This name looks a bit too generic to me, as this is not a generic
> cache on the R9A07G043F SoC, but specific to the CPU cores.

So "reneasas,r9...-cpu-cache"?

--NMTCdSap5S5GkUZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCHGaAAKCRB4tDGHoIJi
0h8xAP9xn+oRWIL9u932ivjRElxLh5Z6yxeCLMgzrNL2ZuQIVwEAxGvRg0THrVnD
gBIkCnCEprfllLwvU04AG68v/uxxAgY=
=I1/M
-----END PGP SIGNATURE-----

--NMTCdSap5S5GkUZg--

