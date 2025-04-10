Return-Path: <linux-renesas-soc+bounces-15798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 436EBA84E38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 22:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F3723BD1C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 20:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B2A290086;
	Thu, 10 Apr 2025 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TgVZqirG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A4128F945
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 20:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744316958; cv=none; b=t7iBAGVXMFhsBVrNgdsEUS/fz076EKlkp5Hr9ApQsm5c6bDFCVgSgJrD75725Kje/mJBl/O1MFv0GxFDanfBAwXvEuiHW2yAY/d+2RaGTQF3v3Av9dva+WV6NblDhHwzcFVW48EhX751n5Q2goH0MPcyI5+Uf20AFup990rqnhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744316958; c=relaxed/simple;
	bh=fWMuX5tWEPqP8+GoEqMljo2h2Wk3PTAfB96Lst5Q/0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpiupYI6HRr0YqOVXH7mPWcz84vPPrE+gcPHwV2ukImcB3bGXX5VC+rmLYWJ84v11bQHU28ObVHaX5j9plyTwcTbof5VNZz5JK6JHxTXlpsw29pkSwoJmyyFAkBeTgOUNuGT31wZEoIuMUr62hxnF/rmhYFUbweS68wAYVQJ/i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TgVZqirG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fWMu
	X5tWEPqP8+GoEqMljo2h2Wk3PTAfB96Lst5Q/0Y=; b=TgVZqirG56j0ELYEmtr0
	BvEfyZlEW9ogD1axdxGlPfK7GksFinH+4RjaAgYqFlPVGnN1nkoM/l8fXnKHPcTg
	fAagmfpFlGC1rpQLp8cBSxC83ukWg0wtcXhKac+tB3VkQok/RcgQ8HV9fGs3xq6Q
	lADVf+fm7I0EXKujlR9TsyCb5Cun9APd392Syomt0/OYEhG1MafTmlBPvzcm49uY
	0qlqrBGw36d7laZjVQJiBEsvS6RiAPoNeUVmjD3G0FZCkWfuRVWzv4xOOfyiExFf
	wLlo8w4by5SJJNxdhkGwxKm5k+9f0F4kD1o13pNzJhIot22mj+Ap/aC+CWYdCIeH
	ZA==
Received: (qmail 1034242 invoked from network); 10 Apr 2025 22:29:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 22:29:13 +0200
X-UD-Smtp-Session: l3s3148p1@MPRmcHIyVroujnsS
Date: Thu, 10 Apr 2025 22:29:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less
 RZ/N1 rule
Message-ID: <Z_gqGWN4SjI0uD08@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>
 <Z_eCV8aTmr4t1_xZ@shikoro>
 <CAMuHMdV5w_9VpVrJPHy_EtmXoWV9fdBBO_YwhPt2TcX_D4TUxg@mail.gmail.com>
 <Z_eRTafA9mjDC175@shikoro>
 <CAMuHMdWqrJzzEfD0SePdTGDPyW0x5venEvq-aXw5R=+G2kzvJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eFTvLTwSQPlKrW8+"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWqrJzzEfD0SePdTGDPyW0x5venEvq-aXw5R=+G2kzvJw@mail.gmail.com>


--eFTvLTwSQPlKrW8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The watchdog bindings do not have an extra rule that lists all
> compatible values a second time.

I see, this only simplifies the 'if' condition preventing the dma
properties. For me, that is just another reason to drop 'r9a06g033'
altogether because that would simplify both occurences and make it all
more readable, not less.

And I still think the other two points which you decided to not quote
still stand.


--eFTvLTwSQPlKrW8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf4KhkACgkQFA3kzBSg
KbaUMg//VUwJwuBf3SXC6/rGPcOHgwxWUovdwbFMLvWdOgC/DrHB7yfa4hJfvxdh
WNGphtwMAx7yrkrOf+r8kDUMR/1WUM5Mr9R7pqiZXntdQ9LYlxhI77lzrbZA7WwZ
BXdv3EuOtnJq0bgk5HD0i8S3FWdWipU7EPI6Fjvq2bBI9jwXy2RRWUTY/tLvo32+
vBQYvNbNPCUxcV0L3c5VMl5kQ4aKC8+bdHn6K0U9wAk4L3vRGWv/pMXGcM8+GBLF
HKc3U68JO2po9sPitSVXLnlvsKbV/fp2ccR3PpTUw/a98DAZPMgO+3vl7yyiCn6s
RPBivOqHBJ++0evfJ7mU675aTp3AE+qSN5H0KPTPxdTF1nV6iV+hlLEcGux1/6Df
D7F09A9pExChur/t0o7SWLC+yLCleqGAA0P1Fzm9LamqIURcxb8kNCeWOznXip9r
BKbZWuE3pKA9FKQJL64AFXaUpiKJ+So4NaB9AJMHpAbWOOPREToSLBy7f9tpNROz
G7qW9TFF5319PiH3mPmx9i2Q5NPTj4vuNMeBD3x6ROy5aKY1vQobX7RRqYePm+U6
dn9mmHMSbk7qIcRdCnHqrEdgPZvnNvK36D+K83k9TjSEVF7Toipxqv/n4vO2OqY9
zczghZ1YTihB9IUvYG+r6Gb7h1iCunb2oYLecdndKR+iDAgpOhE=
=6gpm
-----END PGP SIGNATURE-----

--eFTvLTwSQPlKrW8+--

