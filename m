Return-Path: <linux-renesas-soc+bounces-20979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BC9B371BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 19:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFDF3205BC7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 17:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03E92C15A0;
	Tue, 26 Aug 2025 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQkC/elY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D1C267B12;
	Tue, 26 Aug 2025 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756230759; cv=none; b=u6+82JKhXr8XkYyjEHq5YYvJmTO1yva/Ny7uAGhxt9dIa+FByxLldCUUdpHOcN7puREQLJi+XMA7hv1ORb9LILQTdNdDj4mZBOLT6IVlYXhDVqa0KD9IdUEBEl0CzvHdYirz/7odLsKGd1UKrzONPXBUBjsFcCLUxFRpM5EpL6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756230759; c=relaxed/simple;
	bh=oizSEEq/z+YVTXVEzLfBBRowKU+lLpUg/uomNVtoSWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mylKxbWT1oJ4wJkx2gYAUS4zYHxU6fGq6jfk6HO0QAOueg65s/nkdjyG0qdN1OkBZsKiUpnrOt8ZX5sV0r1sSjqWGTSGvNnTko2pFnWmIfLah7g3s5FYAVRBcYREh20g1U/JuEF8hHirNZx32WjK0q0e2H27oVaGJyl28wjX298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQkC/elY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B250DC4CEF1;
	Tue, 26 Aug 2025 17:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756230759;
	bh=oizSEEq/z+YVTXVEzLfBBRowKU+lLpUg/uomNVtoSWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQkC/elY2ev8wajchnqboeJ7vgpaUB2PEb7sx78CJQ/Jp+E5MldHOwsM6fvRnQEP8
	 mNuJ6jTjT6xo/A+BnCvlJFtCsChPcAJJV/oSDaHyUM3dy21Vpp/Wmbx9dMHYGFR8/6
	 cWvmIRNrsqct5THX2aF8jr893qF5x8mp84Xr5sPKEPbmT0bG75O6/7EfkVLFyUl/Sz
	 pIwxyXv7tQpBtm5NoicxGgnKtM132kmy2v9FTTXbidqZSL9obZx/+RKqI9ftIXBJvL
	 kt0CfH3jE5p2JR/TYw+nprmoKKvCtol0DZUjv6blVHhWvBnLhjLSccTCvzI0H4eOdR
	 K+C9IAr7MPYMA==
Date: Tue, 26 Aug 2025 18:52:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: renesas: Document R-Car X5H
Message-ID: <20250826-pelican-facing-971a7bac1cf1@spud>
References: <87cy8jx7yd.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/jvQFSyTk2/xUZbq"
Content-Disposition: inline
In-Reply-To: <87cy8jx7yd.wl-kuninori.morimoto.gx@renesas.com>


--/jvQFSyTk2/xUZbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 12:06:18AM +0000, Kuninori Morimoto wrote:
> Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> Hi Geert
>=20
> I have been mentioned that I will post DT-Doc when I post board
> support patch, but I think it will be postponeed.
> So I will post SoC part now.

What's the value in posting it alone, if it requires a board to be
actually used?

>=20
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b=
/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index 5f9d541d177a4..6838070369791 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -473,6 +473,10 @@ properties:
>            - const: renesas,r8a779mb
>            - const: renesas,r8a7795
> =20
> +      - description: R-Car X5H (R8A78000)
> +        items:
> +          - const: renesas,r8a78000
> +
>        - description: RZ/N1D (R9A06G032)
>          items:
>            - enum:
> --=20
> 2.43.0
>=20
>=20

--/jvQFSyTk2/xUZbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaK30YwAKCRB4tDGHoIJi
0mcdAP4gFMPXkOwciNPU/BNFNxJ05Vk7/Yqb7VOGh0i4+TPCswEA32yKOFw8NE/a
sshZMJ4Z8U+cnao13ajv6TtCH/8/SwQ=
=ghbs
-----END PGP SIGNATURE-----

--/jvQFSyTk2/xUZbq--

