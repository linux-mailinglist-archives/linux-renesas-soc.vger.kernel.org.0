Return-Path: <linux-renesas-soc+bounces-24096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA47C3255C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 18:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E0F74EB857
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 17:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA303339B4E;
	Tue,  4 Nov 2025 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfFudseX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3EC332EDA;
	Tue,  4 Nov 2025 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762277230; cv=none; b=Bk/YF/ytCTvdowwmPklyzRdaKNeYUcFmeJrQBnqqAIpbM9AXSZBOBEglULsDnVqNH3F3D8XneLYnTCDIHvJUAndvBpCqY56jG4feulP4JPqGX7f/fFHSXplbElywGf+6z//ODCaIpwMMwMOaYWF4nanNgJBU7N56U1tSQKTc+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762277230; c=relaxed/simple;
	bh=U8gCXzMP81VDx7R5ep9+IFwmOaF4/VygryrFvlTNjwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQzwfaRKxR8NsOeMP4j5LuVQP2wgjAJoXeDSaLaNY9sz21/j796F0n1Ndk7w3U+3jqTHqiy0z1H0eRcF23B9/HYZt7EsMOYcJvH8a6ABzjbT2u9tqfm8EHrD/qAijA8NhJ8j2cp18CymTp/E9QMsAf1grWA1/Cw8k+h/LPJpDM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfFudseX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C5EC4CEF7;
	Tue,  4 Nov 2025 17:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762277230;
	bh=U8gCXzMP81VDx7R5ep9+IFwmOaF4/VygryrFvlTNjwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfFudseX+rtxOxkRHqjYGLLdJtjEiVIvpYtTH3FBW48o/J+u411kyaESBzlG1bFPD
	 ZqffpcO4NvRprHHDBfp9vShI3l7k8UUw2/G2Qb/63nCEGAfHVkhlMzxUK7Wg54A8Td
	 1aoztV/BM1kdWZK5ztl7n59Pwn6R842BbofJpkE+ulGOG9CykzGWRnR/3f+6M4rN7j
	 H6QUsdilCe25HmOkKZYaXHFZBQo/zwwrmzuuaXW1oNaJxgWhEQAO89S6m05cioBWxQ
	 goQuDj527MA3woO9IHO+PMWyHdBlpjdDp4yLfCXRGdx9k4PGEKWhIgf7BNOHdvPgc1
	 Vc9RVqvJLdZEA==
Date: Tue, 4 Nov 2025 17:27:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,fcp: Allow three
 clocks for RZ/V2N SoC
Message-ID: <20251104-eleven-limb-39d0b4bcb78e@spud>
References: <20251103194554.54313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UBnscqNXjA3VEOyP"
Content-Disposition: inline
In-Reply-To: <20251103194554.54313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--UBnscqNXjA3VEOyP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--UBnscqNXjA3VEOyP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo3aAAKCRB4tDGHoIJi
0o9lAQCHvnP/J1jGIRXDva9+95p4of7VdbZ4JlOqPrBfJ/kTZgEA5MOPfTaDdBdJ
j+ed3xjEbyFXw9mUHZ4PNwx7ZhCN2gM=
=rflB
-----END PGP SIGNATURE-----

--UBnscqNXjA3VEOyP--

