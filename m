Return-Path: <linux-renesas-soc+bounces-10686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC86F9D8C83
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Nov 2024 19:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B301EB24697
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Nov 2024 18:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B251BAEFD;
	Mon, 25 Nov 2024 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFCF6+cZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDF42500CC;
	Mon, 25 Nov 2024 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560761; cv=none; b=Wi49aw2xMEV4kfkSx8lxeNMTE6rv4315AJsKkgFOQ1uADtZg+57NpwVoyC+ACe69XTfaTVQ+DEbeI6ZosvdDpOosbqm3JFrd3YC/7bQQvUGhzc1K7tbRhtbYg7AACN27ZCXdDL9BXR+FinUDlHbibMOa5uVFtV9Q9Ba2Upr6gns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560761; c=relaxed/simple;
	bh=TY99x0IpbFO6YvRlx+38xE8lgcecMaQXkkhNXzicSLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKO41FPCBYZYfbT7tUhsHeSrjqy5u88kx0z3PIcpuOMxL+n8RcnOmAScjNPFSbIMrJ9cKGdqfjLiEvloEhhdh2Jc/mp57vlQx4UKWYrUHCpRMsqtHxTY+YYxNNdfbTeBJLe+dcOJ1y4ITekfQDgRiGeKFK6ERqRX7ZED1TCGFdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFCF6+cZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2264C4CECE;
	Mon, 25 Nov 2024 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732560761;
	bh=TY99x0IpbFO6YvRlx+38xE8lgcecMaQXkkhNXzicSLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFCF6+cZZWhWGxlmbnGL/sZL20MZ3Z/PG4VK8v+gEoQFyoVXFLwKzf0tWQZ6aaLHv
	 KdxDsTQ1qSQfFOH2jl6JCIs9AuxHcvKKIXVwWtPajFnui4ZjKSrya/JYhFO2cGxUiW
	 BApU4wgd4WEKnyOcG06PKbvP84EXUuhI6H582ziohWVaAJRnY07M3WnrRnAae61UGH
	 HH5huIkEJuVvYgw5QooOono/BdN4kqdLmMGpBpx0fwwnoI4mK90KIClv55ipP3Pmi4
	 6HqyccXoOYwuZ1nB+cCCndDFEGrTeUz0EuZIHAK41E1uOVPlkiOOlZp7ckSnbVQNA4
	 RHltR0B9IQazg==
Date: Mon, 25 Nov 2024 18:52:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 04/12] dt-bindings: clock: renesas: Document RZ/G3E SoC
 CPG
Message-ID: <20241125-kimono-disloyal-3079f20c5e76@spud>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8X3esi+6+p4mCx3X"
Content-Disposition: inline
In-Reply-To: <20241122124558.149827-5-biju.das.jz@bp.renesas.com>


--8X3esi+6+p4mCx3X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 12:45:40PM +0000, Biju Das wrote:
> Document the device tree bindings for the Renesas RZ/G3E SoC
> Clock Pulse Generator (CPG).
>=20
> Also define constants for the core clocks of the RZ/G3E SoC.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--8X3esi+6+p4mCx3X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0THdAAKCRB4tDGHoIJi
0oJKAQD9qynagjUnwORRJ9HoYTe1ctoGF45/085LRM4fsvP7aAD45U7p65MgUxKt
FMHx1Sv5ZklLuQ7SeXOn1tIdWErBBw==
=RVe4
-----END PGP SIGNATURE-----

--8X3esi+6+p4mCx3X--

