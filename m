Return-Path: <linux-renesas-soc+bounces-29378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NGyKWdGtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:16:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA51287F47
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96C8A303E1C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E450A3CCA0A;
	Fri, 13 Mar 2026 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OU08illl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394553CBE68
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422152; cv=none; b=dvtHREEEU+mt3gHyTA4ZEMQjc88yK68TlgmNmYiNbc3CUIblcfM38FwTBvbjBb226Pis8Qy13WlqnO51vU7SQUqUMI2BvDUmsf9vGvfX+lliZd8MKDdRvXlDyYQ8s3GPVkdCgZ4Y9rAeMSGII22bFTT8d+wfPG2R27DawLhbpiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422152; c=relaxed/simple;
	bh=zyT6Zx5rNV50Rhh8bUFkFd2y8cLIMemeRqCKnGHnYiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohpPY5NdqUEABAfH51tcKyCH87mxSrmjHCqceGKI1c0QDhd5pG//7LJ/FqxrPcA4lcD5xkIwjR2Ky+v9IXdHB5iL+QPphNOWpC9QZRVxlyZx83sbIbE/LdhlcIvtpj28geCx4goQ2XQO94k90zz1J+GfqJ1cmp5COHPj7MGfVq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OU08illl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0PcF
	b+tQ9rRKPaXrmOZYoCpIjOKlfnAZ5E4w+nFuegE=; b=OU08illlKHQcsueH3JMt
	DNh9BpDX0/WjFbo5UUL8/sLlnSROEfaTzLnDq2X/spq4UtxWOW/x0ysWn6RAIO4C
	hk1j1pEaa9BcKcGvVrwE0rdPZRrYz/JG8yy7HlS8JgENsPvzpE/RhAAIzoit8H2E
	4TQ4vOtJiLQVwa/BUr+9pRrLAD8CvrSVEve7/xonMAB3z0puspsMCQVCciKLQoTR
	Drgs9EfYGKbPLaurruTY4JHnSTz9FPPUg+8vYKU8vCBkYo3FOUcLq3WrA0PAVvXd
	Gtcjj6BHy06ph2urYklpJssmEF/Itwmy5YKpLVoZUFyg/CN+jP176kAtYmDkpot7
	dQ==
Received: (qmail 389448 invoked from network); 13 Mar 2026 18:15:49 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2026 18:15:49 +0100
X-UD-Smtp-Session: l3s3148p1@8Lg4BetM4LoujnuR
Date: Fri, 13 Mar 2026 18:15:48 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/3] clk: renesas: r9a06g032: Enable watchdog reset
 sources
Message-ID: <abRGRJwSJ8fxh9ep@ninjato>
References: <20260313092417.294356-1-herve.codina@bootlin.com>
 <20260313092417.294356-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d6FdmM20lHNxqtsr"
Content-Disposition: inline
In-Reply-To: <20260313092417.294356-4-herve.codina@bootlin.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-29378-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Queue-Id: 4AA51287F47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--d6FdmM20lHNxqtsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herve,

On Fri, Mar 13, 2026 at 10:24:16AM +0100, Herve Codina (Schneider Electric)=
 wrote:
> The watchdog timeout is signaled using an interrupt and, on this
> interrupt, a software initiated reset is performed.
>=20
> This software initiated reset performs, in the end, a hardware system
> reset using SWRST_REQ of RSTCTRL register.
>=20
> The watchdog itself is able to control directly the hardware system
> reset without any operation done by the interrupt handler. This feature
> allows the watchdog to not depend on the software to reset the system
> when a watchdog timeout occurs.
>=20
> Indeed, when the watchdog timeout occurs, the watchdog requests a system
> reset using its own hardware dedicated line but this reset source is
> disabled at the reset controller level.
>=20
> To benefit of this feature and be robust against software issues, enable
> watchdogs reset sources.
>=20
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Yes, much more elegant than v1, I think:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> +	/* Allow software reset and watchdog resets */
> +	writel(R9A06G032_SYSCTRL_SWRST | R9A06G032_SYSCTRL_RSTEN_MRESET_EN |

Super minor nit: I would swap this line...

> +	       R9A06G032_SYSCTRL_WDA7RST_0 | R9A06G032_SYSCTRL_WDA7RST_1,

=2E.. with this one. Feels more ordered if MRESET_EN is last. But I don't
insist.

This patch should have been sent seperately, though, IMHO. Mixing
watchdog and clock patches without a dependency only calls for unneeded
negotiations of involved subsystem maintainers.

Thanks for the series,

   Wolfram


--d6FdmM20lHNxqtsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm0RkQACgkQFA3kzBSg
Kba8LhAAnELBg2B8m8ROgz/VCsYjX/d3Ud/iSsGQYxQyvYUSRm0Eqjry42Nr4EZC
4rrTPPxHBKntLHykoHhRBV7XN+RUF+5BoBNP7GPZxtu5EJKIxETdiC0rOvaBy3Py
zYZ6kQFc9RMptFJ0w/OXItyqLV4sqfwztGcWKj+KyretLARVN2rUEKc85QnFA2W7
zg+GyuG3b9Viwp/R82IbyGRdm0J+LKU9zqbCyk8rtrugjLWoRj0CQRh4kxvXltck
mTDG4sfEg/4OpNolNLetcOTc6eHdufmGohNvzYrfLwC6HxP0aMT0DOVQckXvxKG2
3qE8EYML1LmGJMBTbXdV44B6lmHOfAPVPoR+5/NG5Lr+qhp/3AqDXSb6ptAG2uf0
wf6Jv7/z7CyLtfrw7aQHYnUyfqOYtrCqSKRoi4dsGIyg9pfLboBp9eYjNfmm1nbe
i7VI1u/zeIRAhIAyB+sLOuIMAH31ZOw53jyR+OexQjmWKRvNGOtN6pF3ifetIL22
HEnP1Tomdereawef9zjDd2iKdj4mh7+lUeiWl8v7azswl9DOeyZ0tlTKcwK1jYBC
4Wmr4JiDVGbNPvOkkZwBSmTEteTMNgtDznW7FYZaoeVCM+wkB+dxvbBzMZEQHVVF
v3YcFEeHGyhZZ/7Obwj9RKfVfUsm2w9VnKq3ILNQxrtSR8uotao=
=PS6Y
-----END PGP SIGNATURE-----

--d6FdmM20lHNxqtsr--

