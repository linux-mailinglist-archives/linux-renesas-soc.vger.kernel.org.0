Return-Path: <linux-renesas-soc+bounces-23940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E2C21EB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 20:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98054427DED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D362FABE6;
	Thu, 30 Oct 2025 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS++9y9M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778082F83B0;
	Thu, 30 Oct 2025 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852061; cv=none; b=NsX+0n8kQV3YRCR+QAA2pKWOJwBeZViJdoKTmNzzm6UhzsCw2h6hlgZOl2FdHTDntmdS3BqD2okJ4bswYLszShHz/VsgKNyBpf5smLrtkJ6r6uTwB2qidq8JcPDVC6mXw2VFhnDSvluZZ0lQ2vtnToRLLwbhYoYI4+QHtuJ26S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852061; c=relaxed/simple;
	bh=0JkqsqS5tCb85gDbvwjqHeyedU+RjUbJ8rLIGtE2kmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGhLKyrSbqyr31Xk/BfwaUTnk5tKXQcpiTj0tk390UVNfyQFBhLeKKoCn/5JyGdvNXn0y+7T3vh/Dg/3ZmWKGNAER6rHeasa1bwhs+nw85q+H7c+LUtLiUqoH0ksVsvWLdAumugKM3Jn7XsnVkA6DvS7eKNzUTMZBXCBu3bLw9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS++9y9M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78458C4CEFB;
	Thu, 30 Oct 2025 19:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761852061;
	bh=0JkqsqS5tCb85gDbvwjqHeyedU+RjUbJ8rLIGtE2kmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fS++9y9MCF0ZiskBXTARq1lIm1HeM+e/3U8/QJfmn2XcKwOMoofX5P6ymKVAjS02F
	 2m9+5HqpYDLBS1l2PN9iq/lbOpNxjwvAHA4MIeQx/u8hoqoYPu+EEB+AHRPFeFDugt
	 s0g2w6zFLWu6ZN3jSBbXTtsPmV0XeMX843zaD4pCBfzgBe3HKgJL5AyFIbbQigOJ8S
	 4rFMNsdC6koU5YgJZ4xG6jd5FCREJhIU/6g2mCfAkWBcenxF+151cGUYu9p5S+nxFW
	 +1SpI4esnayb+/1WasIDYuQ9gt4jlyMkUblTBEm9DT9yYBOm5vkgEA6ININn7K4/Cr
	 Y/STOIT4slusQ==
Date: Thu, 30 Oct 2025 19:20:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Message-ID: <20251030-regroup-garter-c70c7fc6a71a@spud>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
 <20251030175811.607137-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="96gbhf6HoQd777Ic"
Content-Disposition: inline
In-Reply-To: <20251030175811.607137-2-biju.das.jz@bp.renesas.com>


--96gbhf6HoQd777Ic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 05:57:49PM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add documentation for the serial communication interface (RSCI) found on
> the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is identical
> to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage FIFO compared
> to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode operation. RZ/G3E
> has 6 clocks(5 module clocks + 1 external clock) compared to 3 clocks
> (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple reset=
s.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit message
>  * Added resets:false for non RZ/G3E SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--96gbhf6HoQd777Ic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQO6mAAKCRB4tDGHoIJi
0laSAP9pxMHyRXQYIgGpl3r62oKbo516FSvvC/GfT1XA/uhp9wEA+Q49sIHYp/5+
X+jJ+g5f4+/Fb8F2w0YxcF8RoaFMrA4=
=NK8g
-----END PGP SIGNATURE-----

--96gbhf6HoQd777Ic--

