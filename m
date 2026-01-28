Return-Path: <linux-renesas-soc+bounces-27569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNMSOdtzemng6gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 21:38:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086FA8AEF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 21:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53AD130021C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 20:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6482371073;
	Wed, 28 Jan 2026 20:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlMCE4so"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F11328B78;
	Wed, 28 Jan 2026 20:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632728; cv=none; b=Ujehft3IMibauRQDKx222XKLhwgVm7EaECi1fWBMXNytqs+XoAFl4vRhrYXvqiuv69daIlW1NKwj3F+YsQDguoblh5gGDUZYx4SA0hge/hE0fkI4X7xv03dwxpeS1aKgCCmyDxHvUSdC+uG21o/o8TVytR84k1XUdM5Jr5PSfyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632728; c=relaxed/simple;
	bh=dfc1N7ViUHGp4fRo+qqLxJ8zHf5TLAc/0Wkx/NXqYXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmNeoqs7OdMgrXVK6pBRKvTYDCTCqQ9CjgfG7m3abFPRHgwIfkMOpRMgqEXz9A6/8vrpoZh6LeU0fL5fbqyQPabWWnZoijVKP3EH83lKY5bQfzFhcSBZNbOsKT/UvdT7Vt3tpPuV5fFmy767Wfei9js/zo9UdQWJrl+T0bf3lYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlMCE4so; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A30C4CEF1;
	Wed, 28 Jan 2026 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632727;
	bh=dfc1N7ViUHGp4fRo+qqLxJ8zHf5TLAc/0Wkx/NXqYXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlMCE4sogw8jt03huT+FO9LWIGnStr9YpnOZZMMmeZRY3FqLiTT5xnkV9sYOMRZpe
	 lQgdGAl8zNdqAAV2ZreH8tbcSuPdJFQjFfT7qKqV7Bvjw4aOQTJ1MRtmTex5Z0cC5a
	 i0HNSfT3WjUrFXE5+TH34jKoS2EszdzbH/yVJKkNAdgHwfQEfJZa2qK7adqAQBY0IF
	 jdQweKpeYAqBQfAB2e6nUxnMK/72llnwdJlPUCIPx4QnMg+4Kqi/1oKagMzFFPOzkk
	 GhWOVlnk4C6j3wddJDBsYE7Bnb50I23ZFjw3Chu0hdN+83q6iq8/pI6sVJrhu1yhsu
	 NJFv3v/1U1isQ==
Date: Wed, 28 Jan 2026 20:38:41 +0000
From: Mark Brown <broonie@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Santhosh Kumar K <s-k6@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 02/15] spi: dt-bindings: cdns,qspi-nor: Add Renesas
 RZ/N1D400 to the list
Message-ID: <379c490d-2bb1-4c1d-98ef-3fb057fed4ec@sirena.org.uk>
References: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
 <20260122-schneider-6-19-rc1-qspi-v4-2-f9c21419a3e6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tLJ4+Rk9aZvhe1MX"
Content-Disposition: inline
In-Reply-To: <20260122-schneider-6-19-rc1-qspi-v4-2-f9c21419a3e6@bootlin.com>
X-Cookie: APL hackers do it in the quad.
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27569-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 6086FA8AEF
X-Rspamd-Action: no action


--tLJ4+Rk9aZvhe1MX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 04:13:27PM +0100, Miquel Raynal (Schneider Electric=
) wrote:
> Add support for the Renesas RZ/N1D400 QSPI controller.
>=20
> This SoC is identified in the bindings with its other name: r9a06g032.
> It is part of the RZ/N1 family, which contains a "D" and a "S"
> variant. IPs in this SoC are typically described using 2 compatibles:
> the SoC specific compatible and the family compatible. The original
> Cadence IP compatible is dropped because it is unusable on its own.

This doesn't apply against current code, please check and resend:

Applying: spi: dt-bindings: cdns,qspi-nor: Add Renesas RZ/N1D400 to the list
error: patch failed: Documentation/devicetree/bindings/spi/cdns,qspi-nor.ya=
ml:231
error: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml: patch does=
 not apply
Patch failed at 0002 spi: dt-bindings: cdns,qspi-nor: Add Renesas RZ/N1D400=
 to the list
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort=
".
hint: Disable this message with "git config advice.mergeConflict false"

--tLJ4+Rk9aZvhe1MX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6c9EACgkQJNaLcl1U
h9B1xQgAhbHZOnguL+lXBdBjm1JplNdcINTyVpYI7dBtbiJjFwv5ttmxLsV336DE
v8YUh/qFY2cDOZ9MKrPvHBJWQiPQ9p00EO0uHHmRNscVh3hGjTdHp5U8J+20X8MB
QCVkgyZ/oswynOQf1i2Owu32wGbBEXPyCySHCop/JmyAhdcYxNzj73BfoVkKJbZs
Ag1+QsYCXm/7ksh0abOpM2abIrp47p1sMjOPAaMfp15aOPXGQ6Y30w8v/P1iSML8
ley3VG8Ryc0GXjWYSGSG3bc2jjN3qtGtLVbSrrpCcTgWebSh4gYQP46tT6suUhzC
gWaswUxFl7uRHuNqx+RfYjVSQ/onXA==
=D0Pr
-----END PGP SIGNATURE-----

--tLJ4+Rk9aZvhe1MX--

