Return-Path: <linux-renesas-soc+bounces-21050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F094B3A8B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 19:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C845A1C84237
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 17:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B734C338F45;
	Thu, 28 Aug 2025 17:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubBGyln4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8480222F01;
	Thu, 28 Aug 2025 17:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756403423; cv=none; b=RWUcB1P9Emn3axlKVmRvmU2fzct6RUWZTWg/iZG8Zi8V5jC7ajgqZDGU106YaZLWr42SktjFyQ6xVcwE6ycl0bJfJdIC7lVyEv9OhIlHDNf2ktSBFcZ4oCP99Hg9ll6BLo2V1FZLHur6UubgrUVvaXyP2c0A/qdXj4z+8l6Bs2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756403423; c=relaxed/simple;
	bh=4EcMhgv+smJEIcL0LOjzXxw2V88u4J/XojO/U6xvpO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz0CiiM5ZRGHG32FSH+ZIgMHgeWkG/Kl9sX4e3gPBoPLyrNSYquYXv8SAGFjncidncji+MGD9ma/lkiJZr4IFaksgGMgUKeZ9WCGWINuJFafpItbrJu4p2VxHo8RSLfAfI7sGoN47ZpDIkmGfpFkdDLsewNQSx0A2MlHkS+G08g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubBGyln4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E5DC4CEEB;
	Thu, 28 Aug 2025 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756403423;
	bh=4EcMhgv+smJEIcL0LOjzXxw2V88u4J/XojO/U6xvpO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubBGyln4X3CcQR9KkDvPr60ZxPLluwErH3YXaIt/5AleJLJsH2ugAQ177KHpxv/EE
	 6jB2PpcPLOF2J4w0tIdUHikq+GDZxfSDFDym4k33YnehWvepDLG6O7/fKbG0l/fYtO
	 jEVkQKaDSIby/+kRnqZml4CdYmOfkNKL4T9IQzDygmVrF9SGPIVnZ91rgalhi7C+yU
	 UMeI//AzISRviE7QVr0PTBTD2lJBQ8TItZt6EIiA2tNQNMQX+v+p9z7xAHTWx08cJX
	 LHwVx3rWWevJEffaxczBLAoyySTZ4qPec88fUZjR0DOD0oD7kWBm7bfjlmJsl3HDsi
	 naZePTDqLhIQQ==
Date: Thu, 28 Aug 2025 18:50:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add
 Ethernet and GMAC clocks
Message-ID: <20250828-duress-rewind-3e70e4a69195@spud>
References: <20250827181944.2750142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250827181944.2750142-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z+fHD5A5X9WBmqjw"
Content-Disposition: inline
In-Reply-To: <20250827181944.2750142-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--z+fHD5A5X9WBmqjw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--z+fHD5A5X9WBmqjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLCW2QAKCRB4tDGHoIJi
0gRoAQDfO8iE/gVXehfoMmwu5ymvx0fyRTAEdD6Hvx+ybKsBZgD/YrQuL6Ta7NEe
2m5EasITxDBAvLZZoL3AtAino4evwQs=
=eA87
-----END PGP SIGNATURE-----

--z+fHD5A5X9WBmqjw--

