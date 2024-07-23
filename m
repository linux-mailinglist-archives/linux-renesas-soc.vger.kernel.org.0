Return-Path: <linux-renesas-soc+bounces-7468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4045E93A247
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 16:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70B3E1C228E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 14:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475CA15383D;
	Tue, 23 Jul 2024 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkW80ok2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3F9153836;
	Tue, 23 Jul 2024 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721743515; cv=none; b=gf5MCLNQmkLYLVOf2yA88zLs3+UTu0jMra0lO1dmOPI9KYjc+eEwbdOqzCuoHuvqV3AzsUIfHQcBAUpD259wnsVLZCn4rqtaePPl1qxETH44gvfJuQkaGEzGgR+hDf7FriUdHPt2sHIHjJanaKb4TnGCKKRcvAj3twpSWapvmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721743515; c=relaxed/simple;
	bh=S7HPuuj1Z8t/Hu1c8mgpM53ZVKsNmtQQvIg6jDwtLqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUom/ApwTmFsH4HVXZx+H8j64ZBArQLOpxRgxocuYV1jlIpp26Lfzxa/oSR9fNGr5NWg7A+7Qmdb/McQt/ncoCfdFXJcdn3ICzEcfMKsb/nwokzdWLr+jgmTuLR0xnJZSEvpAkSQGHLr5U0j9AsTP61cfLD4FKts2Q0mP5ttq7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkW80ok2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9468C4AF09;
	Tue, 23 Jul 2024 14:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721743514;
	bh=S7HPuuj1Z8t/Hu1c8mgpM53ZVKsNmtQQvIg6jDwtLqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkW80ok259n/qWMObUJzlRFMivvJ0y08Ayr9u5qWiS7wqk3wC21bX/7S8WAprx9P7
	 2AA6qbw4yzVqf41UAQYWjbXKtflmQXWrOOS8PT0lLo/WomJH3svKSWAK69lq+QpiFz
	 mbUeFWNZgXGtS36c0uTyxJ7H6XU2OpfYz3J9jdI26Xk28fjSYLMqNaxfM4C4dtSthH
	 WGbfspw6x0nqBQw6uiDUjNVu1IEujt6xdF69REQzGPEeMh6b1qjDayAomTXGK9VoI0
	 AZbvDEDX5IVEFntY0U4SvT0Wbju3VPwn7lisrJqnCwrO4QR8WxkW+uTJtclgwJu49M
	 xa1lzxOY+E01A==
Date: Tue, 23 Jul 2024 15:05:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 resend 0/6] Document r8a774a3 SoC bindings
Message-ID: <20240723-resolute-pavement-ef769cb0f732@spud>
References: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fe2l3gWSpjIEbZoE"
Content-Disposition: inline
In-Reply-To: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>


--fe2l3gWSpjIEbZoE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 12:07:27PM +0100, Oliver Rhodes wrote:
> Hi all,
>=20
> This patch series updates the renesas DT bindings documentation for core
> components (SoC, SYSC, reset, clk, pinctrl, scif) on the RZ/G2M v3.0 (R8A=
774A3) SoC.
> This SoC is similar to R-CAR M3-W+ (R8A77961) SoC.

Your commit messages for any binding without a fallback compatible need
to mention why this device is not compatible with the !v3.0 SoC.

--fe2l3gWSpjIEbZoE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp+4lgAKCRB4tDGHoIJi
0v4OAQC5oSOmpAvculvkjCGWZXAjQ5NzWXlwgS5ssMJx8rCplQEA9qjEBo28/44Y
5T7XecvGltN0SgPuf3l0yV7n2lb26gU=
=oGtj
-----END PGP SIGNATURE-----

--fe2l3gWSpjIEbZoE--

