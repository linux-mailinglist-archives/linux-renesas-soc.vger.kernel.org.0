Return-Path: <linux-renesas-soc+bounces-29494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KcdEDcRuGmIYgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:18:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FF29B314
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8442A302A186
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA70E26E6F8;
	Mon, 16 Mar 2026 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LU4FUYp4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA1D13DBA0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670661; cv=none; b=PJVBezQZuDQeBljnGJvJeQWMI/yI5aIyuTLStztWnN1d5rO6ZVEl6kkBiQqn1B//q9DsBi4bH16m0z6T4c5ZOs8Kbq2phiLo1vzhzfCrTXQcvE4Wj3Xo28ZcjhOODPoBOyPQ0Epts02+ouswKbRZ1UTInWJTyVBV4Jvg7JCyN5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670661; c=relaxed/simple;
	bh=HXyby1fC1woD0aOW+X0r3xZY4aiybILZs4zc4kb404o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoTxl+yrjV57/D1mXUQdb6tbqWxeggJEf4uVck6TdjMHxTsAv6phSbAR7Dxj5W+7T3+nG3FPy9Eq/vX4fsz/qh5HeOwgm0oUcHSOiDQzC1LZsc50BSwvxUuvkzV//jbVguvJp2vELuNSCTBRoo8iBQ3S9ei1z2/aHBuhyMpLgMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LU4FUYp4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Rg+/
	J3EnrGFEOVXzIPjA7aMXCL8SqvKE+yvSPuZjfM4=; b=LU4FUYp4WtOE9Gmri1pX
	EBTZ7KLGbq95t5cy2XsAukdYdRVRhLcsf5/V3D+zw0ao0/LECtx/6LzWyX3w2E3R
	4fKeHK9SevvTF2hUSJK5odAAOasaPCmwbsSnT2+S/N1HZ7CI16owrPZqa0nUNmKK
	m/Zt/GWO5NUF7iPqFjo1i/uVfECqvx7ZNuaMcR5TOXyS0zOa15ST179HbL0sXbTI
	sIF4Tp169UN8piHhCG0UrSJ5YHtGDC0vtsO9XyjCUChB+znpgyZjHVY1cEfQ7B4R
	BrURkwIAFwlm0soSJUGyN6iyjgQy3qhQ353TJlITnua2eF4nQZl8R6zb0J9ebfjB
	Fw==
Received: (qmail 1454690 invoked from network); 16 Mar 2026 15:17:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2026 15:17:37 +0100
X-UD-Smtp-Session: l3s3148p1@y0Z24SRNDrw+XdJ7
Date: Mon, 16 Mar 2026 15:17:36 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] memory: renesas-rpc-if: Fix duplicate device name on
 multi-instance platforms
Message-ID: <abgRANFdpr3rEUQ2@shikoro>
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260310212927.3372410-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="28MoejGXT0OM86eb"
Content-Disposition: inline
In-Reply-To: <20260310212927.3372410-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-29494-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC0FF29B314
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--28MoejGXT0OM86eb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 09:29:26PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> On platforms with multiple xSPI instances, the driver fails to probe
> additional instances due to duplicate sysfs entries:
>=20
>   [   86.878242] sysfs: cannot create duplicate filename '/bus/platform/d=
evices/rpc-if-spi'
>=20
> This occurs because platform_device_alloc() uses pdev->id for the device
> ID, which may be PLATFORM_DEVID_NONE (-1) for multiple instances, causing
> all instances to attempt registration with the same name.
>=20
> Fix this by using PLATFORM_DEVID_AUTO instead, which automatically assigns
> unique IDs to each device instance, allowing multiple xSPI controllers to
> coexist without naming conflicts.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sounds reasonable to me.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--28MoejGXT0OM86eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm4EP8ACgkQFA3kzBSg
KbZSKw//UQfVwpbk/u5gXDzzHRT9ApAYtCDR7TnxgKav8zKE+t++ECleHANll9+O
+8k8a/R/vg6kFYJUPvcgjTASQ3CNTAwNKWGLZgYc/mezongVk4ee0Bpe1586CLxd
SLDr7kB3xuEgXe/8MP6f2h7LQx99swyHCz4yygrXjSNsC5USCG14bGTagd1dN7kl
b9+07wooMVkdzLRjsirLltf7wB40E/mKVwY5IFgULGawVnrAoCJPgTP/HZysw2Du
zW3gg3CeO3qsiSGE4GkdW0Ssy78L4BjsXsmeKHNZveHYHYUvvqz2aqWYoNrLVuBV
FIg4wm/nR7M4aGrq7RWYEMsnBnCZfa1rIGpPWmz1L5ryI2rs1T+UntFPQVr1PBQt
CjWRGXVhC4oPFqtCifXh6DuJnMDwGjJNfuKzM8ImroFO+WD8PumNnaFuEs8VRpds
uF3GiP4K1xNJnE5CkVn7AyXvhQpkzP2a4ghCP8RyACFpZ0odGko0jmdHIykVJ3UA
dixjWKAOCsBY8ArbiiC/6l6TJ629xjjE4WbJzDLLzt7pnxfN1TM4iiOb+K6yMpLN
+XjigoX3nEHn7BC8KvtmuUkxhh9eWDpywhPrqmyYyhqYA+rWeNmp0xmGly3xumnV
2tn6N+lgGBzRUvfBcMBwXucQ9y3fyBQUIKxDJF3F/GfQ7i89ikY=
=bjah
-----END PGP SIGNATURE-----

--28MoejGXT0OM86eb--

