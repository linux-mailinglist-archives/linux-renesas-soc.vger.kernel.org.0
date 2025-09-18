Return-Path: <linux-renesas-soc+bounces-22000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B49B83155
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 08:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AF1C7ACE4B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 06:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E038627B4F7;
	Thu, 18 Sep 2025 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WLE+fPns"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE02750ED
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 06:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758175743; cv=none; b=pOYTHG80azi3xww95zfyhuevZ8Nra3pdzdt7sVmpHRqqvYCa+29JOIaj9x9oJ+LKxJDvzIhqGrcdilImOeplR/idsoYB4zETuv1Q3K8WmC3IbodBDnwKxDGEYTYkQX2Vezk7NSRWEtEhku707Zn7BCpZ4y3GjUJhwDt8nEgyXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758175743; c=relaxed/simple;
	bh=1LRQ2H9cPe13w9gRpA2l1hedQ4SS7q8o5VCF39iJYvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OW1d4Joe1x/hrZDNfNLi2zk1k5xVfpfQ/TiGCEIhtPMENoCxPSmMqBU9biTz1Ipi3WgRv30Xjn+2q2BvWNFEz+4BCXdVeGlmQig7/kGr4UigLu6hG6tIyLIWnq19AfCoFYZ++MmxaHv7YHNis2MaLJncEvcO6EnEbOQ7gKGxhoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WLE+fPns; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VlC5
	2CkaNI45z+NSovczaAyaQDzPjc6pSEUeingwJsY=; b=WLE+fPnsk4k57lEm+HQT
	a9HRWN10IQ0cYCyc7Opel2PznirlK9WTKAquAiYD1dvIjJIJ/OSawppuSbIeGGj1
	C+eUpzbpu8iYLv4aRcd5Uu3QY87d2SrXkmoLKn65CvF6le2jG8MQr3lptJWdFAHH
	L+pX8nPtzc6UsRJYAJ/qgajly6TmES2tRjYLeBSKKm+b5ev7dDmQQ+OjFcqiD/md
	0uqghVvpZnN7QdMQm9yixvF3Sb2MFnR3bjN7vkHlJLMXNKAi/eqjVsMHR2JYO55X
	NU1lS+G6ULWsvabgtVZvrGuV2jsP2zSL2Z2BCQeq0E1Ju3uUWkjc9Z8tOCm6NtJW
	7g==
Received: (qmail 3395440 invoked from network); 18 Sep 2025 08:08:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Sep 2025 08:08:57 +0200
X-UD-Smtp-Session: l3s3148p1@tLY8MA0/CNYgAQnoAFD3ADc1R8rbk3v2
Date: Thu, 18 Sep 2025 08:08:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
Message-ID: <aMuh-K8d_d2GETga@shikoro>
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6aeSJXpp8NdYuP5F"
Content-Disposition: inline
In-Reply-To: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>


--6aeSJXpp8NdYuP5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

thanks for your hard work on the PCIe issue.

>  	/* Reset module */
>  	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +	readl(priv->pub.base0 + priv->reset_regs[reg]);

Maybe it makes sense to introduce a light helper function
'writel_with_latch' or something?

a) we can have a central documentation point to describe why this is
needed and for which registers

b) this makes it hopefully more likely that future additions will use
the helper right away and not forget to latch their access

Opinions?

Happy hacking,

   Wolfram

--6aeSJXpp8NdYuP5F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjLofgACgkQFA3kzBSg
Kbavig//a3u4yzneHGJ5Xmq76EuVxVv4WcSAqS3TZpYwWOZgKQVdYmDWV6P3QdDK
jp6+X+pT/5p1DEN9hktN/CbIW+YdAzLRJCL18hY5lnH5Vju5EbWwe1PaXTGZ4U6P
7bEuH8c9OU4YFaJQx4C8k2uYSwdw6V4WwABE4LKlPQbhMrWFaRQtZe7ljn1j6YWA
/Eo9hos0dYR2GMMCj3MUaFHoVRrbFAsNvmL94TDS1itJHKSFOHo6sRaJl0Snfa6M
CWw2pfw/Zj8B7vQgJDneuxthYNxa+umMhWKdCYu+acCegZhaMnOGn4YT5ena+jXN
CWrh33fXlx0uOFqFAGYCHYdPdjm3XOoNHkjeXJ6RyRDWevqhSd1QUFfR64sYUybD
Zhm//t73dfToMCZQfYMjumzsIF/yMTUtipbTijw9O4bGj70OPJNSZI3lcyBjkV+u
oNR3iJPtzivawMINm58GGDsv/NBFThP+ojxsgbgtPd2O+rEBtlNcetpsGPNHd9jl
M6knz/U4Ttm52tTKIFx7vH42AUe2k15ppYQHDuGMtefWERsup8IX6ddWdrhrBFkt
GkBhWaExOmi8cAuaegHVwqo8XJYEnFyNcFVBT1ZdsQP+fQEH2oSMGBxFBzPvx08j
/98E+JlPGNpK48jg+JW/Np1h9DXQSIgVRJxhYHy+2B/G8r44DxA=
=f2FI
-----END PGP SIGNATURE-----

--6aeSJXpp8NdYuP5F--

