Return-Path: <linux-renesas-soc+bounces-30189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qtNDLG7kwmnKnAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 20:22:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6F131B6C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 20:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9423831E63AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 19:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D97392822;
	Tue, 24 Mar 2026 19:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IM04QPsg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E1B341649
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 19:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774379600; cv=none; b=tFHbRGWOLkl01qwWg7+k/YzxGFrb1VA9ZIJqXPfcUsB3TpiL/cCLjtnvB4MDOyYMVo9h05/x44Bf/aCgIKw17mjw6kHb7a69wWCHcjTEwyETc+kk7vTJWlDq1SHiokMziwPr5JDcxOcZONXzqSCHJeeWyxT5g3EGxscYgod5ID0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774379600; c=relaxed/simple;
	bh=doSpzr7GQNs64l+WMw9CIzzxvGgIUbXmLL7KSOyLyag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l44lfjRaL3qj5dqlQxFWMLUJxoYSoMzyWBfoHrlVyNNfJDqNXLb76xVc2vrk0WFoAsiYRuhzbcaPEtmHrLNIKWjB21Zro65YSEHBDs8NUYgd0wBzJYbGfEPS2hHJGYyzCheUdOxFWL7p4vdOYJeHwHM4umESYwSNAscL0tDmGY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IM04QPsg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=doSp
	zr7GQNs64l+WMw9CIzzxvGgIUbXmLL7KSOyLyag=; b=IM04QPsg0CAAmmYQ1YTS
	lMqEVp42ra5rl4KBuYzWOdGGewQtt/8IjHd03U1/uRjZPHbGlX2yK+KTe3U0+R52
	U69/d+sTXtXx/vIIqBEQy0CpS2yuqtcg+4J3M70VYk9Mi1th8S366VDey+1inRSm
	p7ZVZjRXT+OGr2lfwJwdrTkIw8RdUuWIusXI+fgncNxCG7SGpsb6rvGPS0hDwySl
	cle/GzSJgIzLJJ9Xy1MXPSSlfzPWMbDi9cWM9VoQM1rgPIkfaUFQuzgBW58cHwAf
	reu2WNhXZF/P4mtpIDzSHHi2/yRP8rJTklvRdst1//PQ0JntVusDQYWxvwKGicAI
	7Q==
Received: (qmail 3242046 invoked from network); 24 Mar 2026 20:13:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Mar 2026 20:13:08 +0100
X-UD-Smtp-Session: l3s3148p1@MR0J8clNBLsujnul
Date: Tue, 24 Mar 2026 20:13:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: r9a06g032: Add #address-cells in the GIC node
Message-ID: <acLiQ6Wh1CvhViFE@shikoro>
References: <20260303102029.147359-1-herve.codina@bootlin.com>
 <abEotS0ZbGwqEmO5@ninjato>
 <20260324101707.7d1011cf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4JLPZTVfhqC/jBKe"
Content-Disposition: inline
In-Reply-To: <20260324101707.7d1011cf@bootlin.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30189-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org,se.com,bootlin.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 2E6F131B6C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--4JLPZTVfhqC/jBKe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Should I keep your reviewed-by tag for this v2. Indeed, you don't have seen
> yet the new commit log :)

I trust you ;)


--4JLPZTVfhqC/jBKe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnC4j8ACgkQFA3kzBSg
KbYOXw/7BKiWpBOoHVDON4cowdN8c+JdT0a3v8F76p/8ukCnTmQyGR3Bdnwj3Zc6
SSqPdG34pVUR5E2trGftehOhcg302WOu8QRFYPTeAcNz89w41yP3N8ETwHwYsxzn
eItPsezQVfdTDmk5il4kUYB0Pxkj0RltjFxxLllPSq8XWBMDMe3WtVbb8RmlOMa9
Rd2c4zu9F/SDFULLJxcd6ouB33T0LZHleEJBVg//NycbKhxDuF1aBdY4+R+zEDAd
tZgk9J+2xRgCCez/UkHIlsEKefHiXCiYOUNQ9mD5cusxGEKbEFcCmMJHV+CUnpR/
v8Y6NMpTO5asHKdmr47oubuns/jIiExqA/KMjtavmI9iQPo9rhe2WV7MnKW8Pu0F
NdoKra+YksaTgLHpOU4PX5lYJYGBNi/p20P3Dm/l+uLyD60VtgWcilbj07N6toGr
wsP6qqizRDi85wx5ig2EPLtIsZH6VRg/EOGx6Yr6yHMWviXC6voAxc7f84aPwrku
IbakbURF18ry0Ox1e7CQPl4ttwIbU8sVJx3RmQZlpQBHCkdervPkmfHbrJALWnut
ptI9di2FCdb5o3YIrI0z7XMVdi+ce2MBu0XZUcoXVkldTvNxr2YHYrkXnZT4Cbee
qRsS0urI4H5fmO2sDI2KCHc4YRjkZCEbcwQu0UBULhqUvJocvYU=
=tigr
-----END PGP SIGNATURE-----

--4JLPZTVfhqC/jBKe--

