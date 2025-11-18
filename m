Return-Path: <linux-renesas-soc+bounces-24738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CBADEC6AB82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 17:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0E0363A5D3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 16:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166743A8D7F;
	Tue, 18 Nov 2025 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DNn9RR51"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE4C36CDFF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483661; cv=none; b=WsesnQffNKmOFQgsjuFVqQhSdzBMYLzuxbA0suUO51tjafmEw3W7mGeqSWP2+E+ERXlfCUAAZYkS6n5fSiHkYP/DxgXXDoEl77hADXRvMmmWaW2+qvOWqMCuvjGnmYH1YqcWwpcV0DlUNOOb6Fmk8kCKvUWzkhr2ByKJhnApfmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483661; c=relaxed/simple;
	bh=2t8uoaYVlZoBVObR2LYwghnAI9+twITyAELvEEEA/W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQl0WibyxX90VMeLoiUdbP1H937wXbQZQpg/oxgfFUoxFznatNCBkmlJrnlhCAg1v8sBKHEn6tBW7/vg+vBRO2cuyoj0Zk18n4bZ1zTm7AennwJCo9kuoTF1xvNEIPRu5QYRUCJmvOj5WIdBKXmKtQfBhRM1Qr4I0ZcqZz1/Us8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DNn9RR51; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IMDQ
	zbEA3Pmm/pbQhRcVUkW9lATpvQvHKgsEkJ7iPWk=; b=DNn9RR51pu3YLNKsDJvU
	NdMX2KiMTtjNfqggYSLykWCAlhTqTmewVD8uCg/zkVyc02IKnFngdblikx967YGI
	s1Fm+Zrky0SZuxEhmBfrxI5qZbbz7WgTCFnHWwZs8FOogB0KbN7IkLHroNuZHeg/
	osR2nD0099lrkbq8AQ7bXZMAQyOEiNiGbraxtuFU8UabCu59EyGgvyWtUBVDeqiU
	zHmnittV8EICLLFiryR8oxiyuToA4ePt/nI3sTHToxPaDQuP+G9c3Gemg1OwyA2K
	3SI5Y2eqmblW6laXaPKzTz3xkha52XUn3ySMoPkBNleVYs85YBRzveFhzIo/+6SW
	mw==
Received: (qmail 3809866 invoked from network); 18 Nov 2025 17:34:07 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2025 17:34:07 +0100
X-UD-Smtp-Session: l3s3148p1@UA1gCOFDLJsujnsI
Date: Tue, 18 Nov 2025 17:34:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: rzg3e-smarc-som: Add I3C support
Message-ID: <aRyf_4U9DGRmssWd@shikoro>
References: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <96c503737c4e913dd3a934fdbbb4545e44455a68.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L3zzGIgboRab2eKZ"
Content-Disposition: inline
In-Reply-To: <96c503737c4e913dd3a934fdbbb4545e44455a68.1763475830.git.tommaso.merciai.xr@bp.renesas.com>


--L3zzGIgboRab2eKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tommaso,

> @@ -29,6 +29,7 @@ aliases {
>  		ethernet0 = &eth0;
>  		ethernet1 = &eth1;
>  		i2c2 = &i2c2;
> +		i2c9 = &i3c;

Hmmm, I am quite sure the i3c bus is not named i2c9 in the datasheets?
I'd suggest to drop this line.

Rest LGTM.

Happy hacking,

   Wolfram


--L3zzGIgboRab2eKZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkcn/oACgkQFA3kzBSg
KbaRbQ/6A18ZhuRlmvZWr+1IUKq4pY/2vjpkbxoMJP14oN6rnpogeHgDz2vn49AR
g0u0a7Lgvi+mT9PnQs7/6jdWNObUGSh5vxGLzGH4EC7P2+uZYs9Jzk6ngODlzCPQ
DQLhuxwW2FgU/2rHw1v3nJGdTAMGh6KxPxRasSPWwBMmuXF/R82MV8cvqEwUmz0N
dD679Oh5o+AmXH3g+XCPSzK2pZv5lIRZEhGZk/TcfX0ivuwgWMZPCsB1nYMFgiVe
Aj3oXUT3BkfcgG/4g2dRSUzOn4h4gweFzLOxm8Xpnn0oh9YizLWdmdcITGSbhYwD
3IbC9zQwohKUeoITtBVkpFkbWaYt6HJPbcmebCACEW7B9LpgFlYW1qNGbkdxg7gj
JvZtg1h7lEOmK5l9UHrXRkvLAw2LpUYB1OvdjwgkuFkUjixfGjtPjFc8VUXuRdYD
a6rPd/SdFWj3L8WUIn5kUP/24H1MmsbPv+MZ2IKcKruVLFsMXJo6ysUSJBFSsoxc
4pcbdQFK+sulijuaRORZ7A2KDyXFIAoajhOkjtc1IaqvaIKeizUimCwGhMkM2wYO
2mxqXkkkz3cg9WrY9TvJZy94AMDyuZL1BOszOo0a5IrVay8/blr5xDs2cVsdJRtq
iRKpkTanMTnQbeFDzBDku6sc7QFEttu/bAEqgP0IrogD47QP7g8=
=ipHQ
-----END PGP SIGNATURE-----

--L3zzGIgboRab2eKZ--

