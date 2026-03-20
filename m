Return-Path: <linux-renesas-soc+bounces-30039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG7XDEi8vWnyAwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 22:29:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6642E1651
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 22:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82E52313CD46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 21:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D353A7F66;
	Fri, 20 Mar 2026 21:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iuaHDYlz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913423C5DC4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 21:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041934; cv=none; b=pfwyHHgJXn+cTO7eePPdRvB8Z8FzeY6HAAJ6TnmS5/EYr3Z0J05JfiZMx0NPqMh4Mbpopa2undZwV9938UERoBQCL/AzxAwiUmcESFlEFUva2Fzi9sstpKOSy2NYV6JXSTyiLwSGFIdg3FuV/KbDa4qEviRK64sxHPTjZTPR8yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041934; c=relaxed/simple;
	bh=sAgiFG031bElYipESixIpj24GpWwr1Ns7a0BOIHYcHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKH28ZWeRTdghYHH4EKtGEk0XiCFHK/XB7nI0HzATDBgdBraPNe1p9enFS4Nh/ZrbqfIYGtzOnGEjTgVZNouYMYv0z/AKfU5PAma9QXBHSb7GWTn7indSSSYQ7wgslwbgBt20C8fZXhFGBju9Y5W8ElZJnr5MWv8CixYrqusBbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iuaHDYlz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=sAgi
	FG031bElYipESixIpj24GpWwr1Ns7a0BOIHYcHQ=; b=iuaHDYlzT3bP9wjmvTPC
	VOICncWG1ma1b5dAMT3PBbMOzS5M8xltNPps9kRqYn8ohJe8Sp04xwY0eprxjzhp
	5X+gHOXwoH0Hq0abox7POGWZxSDpoZyediBTgg9PnIXFILTusBHNNiKNeW692Jdp
	CygLH/YnA/OxrXcpZkBmCu70rKoiTXBWdASQuLDM2gi9L9lNbqqUIgMGgcPZuDcG
	7fd67lNVS3fbycj/2E3Uua8ex5m5kjFIk+ve7Wkz2hoMFx7/YuiehqpWUlHCR5w9
	HpgoQirJ0tQLpwAUCgwSR+V9K+/EGTXI8WKVkJ0DVa/AOm4cGepk8FGwL7uGjsZM
	vw==
Received: (qmail 1700833 invoked from network); 20 Mar 2026 22:25:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2026 22:25:29 +0100
X-UD-Smtp-Session: l3s3148p1@bjwBU3tNBMwujnsL
Date: Fri, 20 Mar 2026 22:25:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju <biju.das.au@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document the R9A08G046
 support
Message-ID: <ab27STFXwgOLr5Xc@shikoro>
References: <20260304071732.5864-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zVZR+CFJbEFFPASI"
Content-Disposition: inline
In-Reply-To: <20260304071732.5864-1-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-30039-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: AA6642E1651
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--zVZR+CFJbEFFPASI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 07:17:28AM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document the Renesas RZ/G3L (R9A08G046) RIIC IP. This is compatible with
> the version available on Renesas RZ/V2H (R9A09G057).
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied to for-next, thanks!


--zVZR+CFJbEFFPASI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm9u0gACgkQFA3kzBSg
KbZj2Q//ZKGxH2CW4HrGUd+n1EPLjZEBCIaDr5rOE1S9Dbpf/08kB2/5Ppz5AizB
e9+CngsaVGJKWfv6p4lubRNQbGhwwNyMHWQv+FcPU5X0v6JYjvFkoXUBd8ITMM19
qNdURDem2YaNGZAKyQLr1bqsLAN6q7hIUA3/yew3df1gr6qxo7v/h+3QjZW+wXdA
99Ea3y9V34KankNSaCQkYFKGoZN3f3Qc9MY5N4J2fCMXmC9kiJsKOt4DOCQ9583v
3f4noXNKEJcufm576j1W6JlPo9kEM5lASdWEIYEOjLyFXFRdVWm74LPTIm3qcGu1
Iv9//M5ZNqvwCcRZg6RE0ZRbBo78O91kyJT3RFUwZ1SjR7U2zOYVbHb+O0PxGgJp
0kYYSnCgKqQP6Q84hgHxZCD0OOvkcUpxf4Kj198YER6WvEgNMrS58pUCz7AJSUfm
Z51U3dAKsj2A755f2QM4IQN9H0V19rS9c9pHqfnD9VNoguWERtnWxfFHx4TlCGCg
F1SH8DFL8BYq3N62vPjwllKzWNeNZT/Dx67x1w80lF/dfvuZeVb3HAq/3Ek3kOuB
xsYptmwHBUM9CSPrZzXjvdDtbvdmuguqztG8JV/YUvNgcvuCuTzUQO/wuCNeHXXT
eu0TbIdj9rlM3F584sW5UbqGoQ/CSKhqK7Lwng7AScdAkYgr6vw=
=yMuc
-----END PGP SIGNATURE-----

--zVZR+CFJbEFFPASI--

