Return-Path: <linux-renesas-soc+bounces-11685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D329FA6F8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Dec 2024 18:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C2691885FAF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Dec 2024 17:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A562190068;
	Sun, 22 Dec 2024 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kzwNSOnd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0CF143722
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Dec 2024 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734886817; cv=none; b=LalFTov7EN5cbX6TV5QCD5Rw8EVO27N3ytFUsqvm/rtHu8itLB9XgtTuAPhuk5YcSLo/V9jMOyqi7LUkT3aPBLaHtB1g0ZgM7t9a2zEpPRRm8icblLAtgLASy5MkXvmDP0hdv4cPl9JmS9ZBlb1MAUCr6YlGNTKWcZtXyBga6Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734886817; c=relaxed/simple;
	bh=y4U2dULs38xIpHiGAuB5+A4jhmqFZhDG6/e7kFDHrRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbDhRmGf1GMVj6wwQqkBvED9HdNVVFIb1n6jKrl9eWmcYnA1cm1Br46WvMzNV9PWiDUAz/zigO4E/BS9+9lggYua3eyWC5UIfY4JCZOjMYYrNkLIBMC7LvYe09Ue9MCetGuaNR8ZeTxYY/PKwA9xhJf7lStAeBo2exX1+RhdXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kzwNSOnd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=y4U2
	dULs38xIpHiGAuB5+A4jhmqFZhDG6/e7kFDHrRw=; b=kzwNSOndfClgnOTAxhBr
	SrCQUlyK17SxXjRxKnTxrm6JbkaXffi3/38W4JxgaaO+/Fkbt7CJqHzo5qOMSALU
	ElsL5Xr2JErMTP5tUHIErHyCbLnzhEIZMN6fIpB5Y7F7fWc86qbLhMzklRzKFvYk
	jWGsrXnoBzG6qU4uNBdKN3iyDAIJbMCemhBUlNonwQSXiSG3qAUH5UCRYjbkPBt4
	ocNzU0u93QlZOKYGzXKDuKlT50xXzAcZYJh4bgkGJT8UMod3JDeo8WhbNksGFbOe
	tB6qSRAeFsfaTfKDOlpgmV9foLJVFG+UFI9o6cZAhVi50M0sW/7TqtfXV91b1m9j
	0w==
Received: (qmail 1674470 invoked from network); 22 Dec 2024 18:00:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Dec 2024 18:00:10 +0100
X-UD-Smtp-Session: l3s3148p1@FdoD0N4pbOcujnsY
Date: Sun, 22 Dec 2024 18:00:06 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH v2] hwmon: (lm75) add I3C support for P3T1755
Message-ID: <Z2hFlmqCCljH3woc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
References: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>
 <103fcb15-e550-4d3d-a243-ea3ccf98e76b@roeck-us.net>
 <Z2gNyermLc1i3Tkb@ninjato>
 <0e12c95a-9677-47e2-8f9d-1fe5d6facb7e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ceFgec4ADrNuat2"
Content-Disposition: inline
In-Reply-To: <0e12c95a-9677-47e2-8f9d-1fe5d6facb7e@roeck-us.net>


--6ceFgec4ADrNuat2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I prefer 1) to get more rest time in -next but I'll leave it up to you
> to decide.

As I would leave it up to you, let's take your preferred 1) then.


--6ceFgec4ADrNuat2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdoRZMACgkQFA3kzBSg
Kbb+FBAAhbeNipiPTnAIP9boN0B9jkSS2dJE4vNCitfmzltGJLZiEs0yXWzNb8c/
KmENKP8h6QbWeKPBN9pYTt0wRwGuWNcxTtYGx5F1OGBDeBD3Fu+x/30mhV7KA9I1
VgqvtjTBgWQWN2TXjToYN6eeLuENJ/1dPzYoINTDStUukCHPs+hBTd9gcoPHofCN
fBTOTCXj9nulWQNInPDgQ4/MPMuvaBtZKXJFd1qe7jsUrN6Fdaw/r5b3+RpSop+i
eg3zTD7Z7A92pMs0ZGXVqPFx+GKgQ33ryJg2bsZIbxRLuq4Imd8aWNpSlojE4Aug
y4v8eqp98NLebrdsSotxwBDLojJWoNhr52dXSx+EJCXicE6pHDoED1/VZn+Pliol
85j1EmRxGId3Sc+IBTnl8VzJ5lEQh238iKfG0aCsL2FscgYoZhGpRxxaWusN8GtA
qs1OmA0xnES/6HttkS8IIom60wg4Fg/95aXK/3ztBA6uRX9Rxgj0rP+jmwBH+Rlm
N3xdxXxcf2jJd0K0EhStnL/W1HIOgX13wb+Zg301qF5UNigPNLQATmDz5xeFG7rz
Xl4jSTm7jxjdDtDfrxfbRg/nK7fG4FtUB4sMpqCyFexhy6D7Skt3tZitm+4PIBlX
eBxtWMJZRsI5MSk0zP26CQ5pGCFVOuHnKrPT23ipIQr6rZ7FHH0=
=ZU7i
-----END PGP SIGNATURE-----

--6ceFgec4ADrNuat2--

