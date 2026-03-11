Return-Path: <linux-renesas-soc+bounces-29180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFJqOCcrsWkBrgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 09:43:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A55AF25F90D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 09:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BAC11304972A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 08:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C827C3BD64F;
	Wed, 11 Mar 2026 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FODQ7j1b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1F93BD25A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217977; cv=none; b=DQ5dAZqxws50z+q8arBjWwO4i49mJius5MLGja8+S2eGoDKWvR7fe/syDEEsabz+mhlP/V2W7dNiQmpq0ihLQG1odiAOnlmXBM7oE/mx5cF7/JCneXVj3De+T3I/QWKegNxpV0qb/VbCdXlTy31uqXUMBmMc11KsIQ3xgUQVi2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217977; c=relaxed/simple;
	bh=CCxrS9skmRpl8jND9v4vYlK+FQev5wTRfod1SOCisDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWQ5EQmQc+I7wGgnzVP0YMWNJCUTbR8kdM8VCQoaf8UbFXaJaGTc/LYo+YO00KXX2k3fevwm31N4qo6+LjxopnFiOPlhjk79Jb5ARKl15ep+LABwy+mkvddyD8VKOt5S3A3/LYWY0IXeulRNZ439NelvJHt+9pRG2x3/t+GXoSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FODQ7j1b; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7LG9
	PxpeOLthDVAZ4NlKI126O57wQkSgQ5aDzvQFM5Q=; b=FODQ7j1biQ3Qo31WrK4f
	uShRRzabA/dPwrPNza0DQC0WyM5sj+agS9Cx//q+xT+5ZE0YNCQfZ02Oi7tWEXe3
	W1w9MUkThwyLTRTThd1A8d4nYZUZ7Spu7mA3qGxZaPR8Lukl9FDzM/B97vn3XxuH
	pX0xA3OnVhxTeX3Nc8akwmA0DaicvFAdNz4AkE0y1khFsreH6bdeXfY2KoHgZUYz
	RSpxoVrIH32f6nVdgCmY0iO0mQrRGVmsnOIzHEB8n1+7QjnMKbo43RsKBHHwkFT3
	+bCW6u0DaF3QstmzbCSv959BVOTvoxJTiQxSWBy6241X2M5+8Y2rLcjMoBEAa5q/
	Qw==
Received: (qmail 3564918 invoked from network); 11 Mar 2026 09:32:53 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2026 09:32:53 +0100
X-UD-Smtp-Session: l3s3148p1@2G5ue7tMousujnut
Date: Wed, 11 Mar 2026 09:32:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
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
Message-ID: <abEotS0ZbGwqEmO5@ninjato>
References: <20260303102029.147359-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m42m2ThPRCHUbJ3r"
Content-Disposition: inline
In-Reply-To: <20260303102029.147359-1-herve.codina@bootlin.com>
X-Rspamd-Queue-Id: A55AF25F90D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-29180-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org,se.com,bootlin.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sang-engineering.com:dkim,sang-engineering.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


--m42m2ThPRCHUbJ3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 11:20:29AM +0100, Herve Codina (Schneider Electric)=
 wrote:
> When checking dts involving the r9a06g032.dtsi file, the following kind
> of warnings are reported:
>    Missing property '#address-cells' in node xxx, using 0 as fallback
>=20
> Indeed, #address-cells is not present in the GIC interrupt controller
> node.
>=20
> Fix it adding the missing property.
>=20
> No functional change.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I like Krzysztof's explanation "Value '0' is correct because GIC
interrupt controller does not have children." Maybe it can be added to
the commit message?


--m42m2ThPRCHUbJ3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmxKLUACgkQFA3kzBSg
KbaBjQ//d28BBGk3XivQJnpk2guNJqhhbJ1ai8OE+9mvi4M1+O8DrB0zOkLDcVM2
4Lymij+KVDppD2TTQ9uNYxK10YrdQ4w2oKG/5+Inp3z6mdD1ntoI1HkgdFVd6CkA
r3u/PWNrsN2VMMnrp6z6tdfeC8cM3SucJX2t1BxOVfjHxR1WKWuXFwIWuTHXnOw8
hOTuckx+G+cWwL6Fvukzliqe2aOf0p9RvewMppeaymM27ik7l1RQbNvj/BBSqHj7
AL7LviBWUoTnhl4P3pzKnSw8uA+8woK00xbs0TCU/lSLmzm8x3DDBe++3YTnHJe/
Q7TqkO0gzRXQ1jue7MevhaunG8P6IuuiBEv2qbFf53Od37rwhFuGBAeknSYpGUFJ
wOMO+6AFt0+9l45KTzjBuZyvaCeXUViW2FgS0XHa206jdmuk2Vk/3ps/LMhMma9W
6S9ucoZvLQ6WGySfSUjxNwvglCKnjkIJshN7a6O9jn185kFv6HqPxf5vnmvjJVSq
6Buon7j/t0HsO9FLOxDQAfy+wHKcN6ZTNR+lNccc6Tb0P6Lgoh5lxkxUbn4Q7/Ys
MkfRx5PS6Sm8VyBuZmmOclJvU0i49dz93SovIa2RJvdHuz8wiHna6PMMvN+AQdjE
XeCN6DDXSnxTF3srZiWE45D1zDOuS1lUBp35kQMYaScnUHB1SYE=
=WsKJ
-----END PGP SIGNATURE-----

--m42m2ThPRCHUbJ3r--

