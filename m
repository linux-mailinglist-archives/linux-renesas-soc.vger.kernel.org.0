Return-Path: <linux-renesas-soc+bounces-28981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGtxIP31qmlaZAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 16:42:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F7224107
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 16:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16D9F3014635
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 15:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E406D3EB7F1;
	Fri,  6 Mar 2026 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="M08shIKU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441873E9F77
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811763; cv=none; b=FIwlAT9s22AysCe1ugoowdAUnLQUuAHwI6AjQArx4jhZZuq5DRKg6VU/LrsWDmyzj70pKMD51+hKb+XCGhRTUpZ4OoasR25issGMnqoBPP/zExjmuG0/aTkJsN6+gfmFqcwCO5VHjYZtuG2nNcq/FaTGfyrNc0scq/4y3tSUxMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811763; c=relaxed/simple;
	bh=onEJ81qGY2AW2N0YMWWlPa8vRRg/8S1ANGTbnXewNIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRU1sL5xTFyQsSU5tlEOsdG9aShuieLtMilwti7AIRUe8ZSgOUA2NayLnna946XLXzrqgkERH/neil0JjL3HJXKtb4zDKrMpJyuGAInLsEHYzCNFziW7fm1K/OK2BCwLhxyGkNfUIKnOu1d1f+8gV/Gc5RTYDE173ZAddZC2eA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=M08shIKU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=onEJ
	81qGY2AW2N0YMWWlPa8vRRg/8S1ANGTbnXewNIo=; b=M08shIKUacRjSAzH+Xr6
	RPrDhsHxyn/zVHwkYvGROBbHbI9mPMXH4XJdmuoWLszRGbg8+SjyhI0I82t0Q8kV
	tTxe7xSJPyUGDeWWViqJV2az5Hu/FO2gwD2Dtf8a3gOOtJqDyoEWd+TSiiebeZqP
	ild1nBcuY7jN79/sYTW0JhN7psT2PkLv8njR3hJdKKSnXiYD1mtgqaT9RVEVVmNs
	oGlDiJcDddoaX9trwWD+YA8mjqYCeETLWG3E4iQv/EIyzuiCNqAMhPHWglR5IVxn
	NoJKIPF0wHm1cJb490C+Tt7KDXFdIYBleyi7EMlC5o7E+1ogyXvNYeEFNMVRWDVb
	cQ==
Received: (qmail 1693041 invoked from network); 6 Mar 2026 16:42:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Mar 2026 16:42:40 +0100
X-UD-Smtp-Session: l3s3148p1@Gag051xMAtMgAwDPXzF+ANZpdrMKUeLI
Date: Fri, 6 Mar 2026 16:42:39 +0100
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
Message-ID: <aar172nNXoSMv4Hj@shikoro>
References: <20260304071732.5864-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pm1gDmtCKFiKbxkW"
Content-Disposition: inline
In-Reply-To: <20260304071732.5864-1-biju.das.jz@bp.renesas.com>
X-Rspamd-Queue-Id: 2E8F7224107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-28981-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.969];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,renesas.com:email]
X-Rspamd-Action: no action


--pm1gDmtCKFiKbxkW
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

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--pm1gDmtCKFiKbxkW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmq9esACgkQFA3kzBSg
KbZoeg/6AxONSLx+5pPcPydzAOr9LunJ7F0wAaUAmzgiQvtHSnrw1TYgHFWIGB1J
Up7fuo7Gg9MS4Em+aN++rxKl8cys1yj6du+GnFHSs2y72Utj4YfKqEIRbbb7rdnU
s1rKJt0PmhZJfJz85E9NYrSIttAMPC/Fm7TsAxf/27KAjrDV+vFaFDIZ8NA/78dA
zIJauEeSVNnpDE9l1KEaC/TXyVpN774Pwm50jHgb/Nm6XWPF4o3AbouNNhWH5aPL
ZnZutJGD4J9nIlxSe+e4hdUDF4wVj5FfHwuyd8xXLB/yja/l7QwyyTt7klDT5izv
h7yis9zmLZ7czrysBnFoh7+uPGsm15zHvBAdwpA+nOHhFnm1qxH0S5bsMMCLFRzK
rCan9dsLf9Sddf18wTPjc8ln8PwdD7nqMh5x95loY7ngqrHnyrjh+X63X23542sc
U46OVHTp+mlmJV/9Pkns0mJzTUqoLsA0b+3C0gue+ev7vk9iRSgVOxneWE7rn6wF
bc/UDdqUSylOQwKheJB3kfBfl0b/p3z9inWJM2i+2djlsP3zaS77gsY37hcmdeSQ
Z2xr8tKfQXEUzyj8Y6lQ7ZP6EmoNpBqv9JYHuQmSJGUZr+yMQoX1utrtqfcHDhyU
2rdbEUa0xrKoxuaL/uGiW4HzYFpW4nKJcDQ2Oc0uQ0r5V/cxqZI=
=XTLx
-----END PGP SIGNATURE-----

--pm1gDmtCKFiKbxkW--

