Return-Path: <linux-renesas-soc+bounces-18130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8E6AD5C58
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 18:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DDA57AE1FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 16:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D16621D3DD;
	Wed, 11 Jun 2025 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPB7cStP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A63121CC71;
	Wed, 11 Jun 2025 16:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749659700; cv=none; b=sNLkwXnz5PVR7hEZkGzAtnwiBo3HYFLMOgD0icPN6a4x8TCIBlmPqveBiFfA+JGLAG/+rYvtxaGSwjQKf6MvFRMTWCK2W+gBAcaTBJARDUYhM3cH3oLPYc0t65nKsWLR70UQkoqTjgeeqkWnWf6KMaXb37jBbGPAL6JFcUy9M2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749659700; c=relaxed/simple;
	bh=OP4h1eDhXUPEY+AGbAU6rFlICAMX4bumPauxNj7gIkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uM2J7gZbixdqj93lmYrZ7+5rntx3g40JApx4Yft4P44yInmby14KRjiuUSiyxrtQwmUUxxsk4+hi5OCPSwWs3pzv4nAO+r6rb9BVLRqklaad/dQzo5th8B/BJygsifZewSHfyNZH9t96Aun1QTk/FIkFQJ60O+t+PFB8ysCfJ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPB7cStP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775E6C4CEEA;
	Wed, 11 Jun 2025 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749659699;
	bh=OP4h1eDhXUPEY+AGbAU6rFlICAMX4bumPauxNj7gIkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPB7cStPWtZPmIFZTSApq6xdkX000GBEFqzxhkPFEKPotXJjkl7FI0nKyN0S1dVc/
	 6cnqk0M6dEdsnUl/3HNJnkKdIQ8cfi5PIDj3dQyya2LBrg2uTuYKdQzrcriPIF+j1l
	 VWjUuy84vKXsoQ+0KT0jFZ2ccLfcy5EWwkml2nJLkewdLPhhfi6IWhuEjQzRbihZub
	 OapnHujslY3XlEuNl+LUXOVUWj7kNW9P9aIUPWBxnvinj0DqQbLiKfOcJcM2L139Je
	 TK5NWGZVYka+XB2Vg+mG7XCdO4CuF76O8XFs5g2VVUjKJKqILRv2RN2GewqklstM8c
	 XO9M1L8IYAnQQ==
Date: Wed, 11 Jun 2025 17:34:54 +0100
From: Conor Dooley <conor@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: andrew+netdev@lunn.ch, conor+dt@kernel.org, davem@davemloft.net,
	edumazet@google.com, geert+renesas@glider.be, krzk+dt@kernel.org,
	kuba@kernel.org, pabeni@redhat.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
	biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org,
	john.madieu@gmail.com, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: renesas-gbeth: Add support
 for RZ/G3E (R9A09G047) SoC
Message-ID: <20250611-lushly-watch-eed37703b92f@spud>
References: <20250611061204.15393-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kw187fJ1qkVK7A2k"
Content-Disposition: inline
In-Reply-To: <20250611061204.15393-1-john.madieu.xa@bp.renesas.com>


--kw187fJ1qkVK7A2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 08:12:04AM +0200, John Madieu wrote:
> Document support for the GBETH IP found on the Renesas RZ/G3E (R9A09G047)=
 SoC.
> The GBETH block on RZ/G3E is equivalent in functionality to the GBETH fou=
nd on
> RZ/V2H(P) (R9A09G057).
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviwed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kw187fJ1qkVK7A2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEmwLgAKCRB4tDGHoIJi
0hJxAQCPqhlyriyyP1aSi+WgGIMgpg+7uNLM+44pSHu+dtE8ggEApyhN7DXybSKl
/HL+MqZroKdVMoHcwf8K2A2BerYe9wI=
=0vPR
-----END PGP SIGNATURE-----

--kw187fJ1qkVK7A2k--

