Return-Path: <linux-renesas-soc+bounces-34684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bX+7DE6rR2oBdQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Jul 2026 14:30:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E99A7025DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Jul 2026 14:30:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=AtJZgW0b;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 253FA3024454
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2026 12:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB083CC7EB;
	Fri,  3 Jul 2026 12:29:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8647C3C3C12
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jul 2026 12:29:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081748; cv=none; b=IW6YtP2eQDXCu7gd/uFjsTx+aYpwux3sWP87PbzGcMtyUJjTfBsJ3cLw9l00ypyr4G/DUmWqkXWN9A5EulG9gEJw8LIhPzErUTWj8U50QJDmqNg5mV7sKe3D6wDTtLEUxT47dYjW393845/iqMbhpARgQh2dofQBUI/U/+2K6Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081748; c=relaxed/simple;
	bh=3XErzmFomReex+cqqDTCDX7Zj24XI05YTKHxfHkfJgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMrIw/QXHzZKVJXn9Z03h8jWA6f9nolNgmUFBywXNna8XzwyAWkxtfO3Srz656dlVH/W+BGM4ns84c5uQqqAzTXd3vF+K6d03krdoH/WfP3ZLdYtfGAH0gXhLvCTGNLqIZOXMtVKFisOsVdG/CwrrDQjuf9z9SUe1lxSVVbSnB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AtJZgW0b; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3XEr
	zmFomReex+cqqDTCDX7Zj24XI05YTKHxfHkfJgY=; b=AtJZgW0baIQRZm8YFpq7
	/5RWSh/EEjvz+1o5meQq2eRT+M60xKQNrgjy6o3UlVfQnJ+BPFmmXKAphzDCNne/
	+WSNfrtmvpz903avvZG62y8wFTLwWJ4/AfE9HZexIz4t86uosyimplL8eM/LjvrX
	mvUiUXh9oNfww5aQsHJ/Bzsd97gk82h0kYSLcfSJcT+0jrocmu70oikqLx4AE9A8
	YewEOL+OlTbK1urIW+wyvA+1p86SqLp6VdAX0RUy5+jYs9hKV9FteT38rb9U3bCv
	ptR80+Gm2vrmbJ/qwU1SoY8yNJRF81OwG1IF8+TNlgDZTHLlKKGz9fc+gvUBBtCc
	lw==
Received: (qmail 1514229 invoked from network); 3 Jul 2026 14:22:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jul 2026 14:22:21 +0200
X-UD-Smtp-Session: l3s3148p1@zkbo+bNVnUxtKjD6
Date: Fri, 3 Jul 2026 14:22:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-spi@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 0/2] spi: dt-bindings: snps,dw-apb-ssi: updates for
 RZ/N1D
Message-ID: <akepe9TXn07NrkE1@shikoro>
References: <20260701131248.4545-4-wsa+renesas@sang-engineering.com>
 <364d2f57-db58-4ba1-a12c-025233fe35c0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hG9EEbx0Ob4UoHPd"
Content-Disposition: inline
In-Reply-To: <364d2f57-db58-4ba1-a12c-025233fe35c0@sirena.org.uk>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linux-spi@vger.kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-34684-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,glider.be,gmail.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,shikoro:mid,sang-engineering.com:from_mime,sang-engineering.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E99A7025DB


--hG9EEbx0Ob4UoHPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This doesn't apply against current code, please check and resend.

Looks like you already applied the previous patch series one day before?
Sorry, I can't find or recall being notified of this. Anyhow, patches
are upstream now, so case closed. Thank you!


--hG9EEbx0Ob4UoHPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpHqXcACgkQFA3kzBSg
KbY+2g//a7vwyNZqUB8NIBpuGwN+dmP15atYIcp5VZvVOH/0/XMo2OBAhleo8qqD
Hjq4KX0jpAB+EoA6ejShYRoDYQOHR7HGFm3eq2eJesyjnRxMAzq0whBboaDiw7Dg
Tx8BA6sbf26pTLaC+rErSwCzkp9NRnwXl5IZyDoMRoAA4b2hs1afMrGQdle7wESR
6sBrwmmGj1w7MSb7+4ll4qFixegrOfdItkQJFGBjfb75RBC4Ibvz9hwpiEK7Guf0
A4fuC+m/Fls8ucl23WbOr3ijJKr97nxAOzYDdP1qbyNEASipgrTCm2ME9kZiLQ+H
94nn75z3/ysx5JVBpzfv8kV7jE0QNFB7g8j3dWGn0krd0yL7XtuRfwmxyiWMGnfD
Xe149I9FVHsJE2fwsm0Ipq1YdDCleMvEB6yjgx3dkRoPbCbX/509LISNojWyCK4K
Swj36WKSiD4+Clkwbl3kx14+9aP8Wuc3mIUSoBZn1X6E+dp3UWKCwnINBqB7Abz0
pVZDQxjGtrHT7kDbGsmICdBzWKKFxfDm2JZnZ76IBa/zl89zP5gMuZsZqB/4bgi/
38I8iKAjnwxa1w5JyBuaY0E1c0fZomdggo5qiC0B1Br+9+wIcbQtWzM6zyi5Exsc
chp/LAkPVbN8a4rnDs/4RVqegxJIIEG9/XA6GyQCYadHRJrF71w=
=gWLp
-----END PGP SIGNATURE-----

--hG9EEbx0Ob4UoHPd--

