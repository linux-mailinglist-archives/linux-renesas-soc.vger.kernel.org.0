Return-Path: <linux-renesas-soc+bounces-33466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zNzeHfVEH2qtjQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 23:02:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C7631FA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 23:02:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=OQ5k6o0S;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2641300F178
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 21:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CE339769A;
	Tue,  2 Jun 2026 21:01:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6314135E953
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 21:01:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434104; cv=none; b=Dl7E1vWMOGso/JSWhagY1xwyjSY7y67W4ZxsMkkM+RCauyiOkx6Z/3XteVB4FFifs0FrOvjkE0QWe5uFpDUsijZbT00Ym6Cxy0shqYTb0nDHseM0BP9tLp5IrGuwjh5aSAAuW4EGDVS8PyTi+kgUQLcLTvU5IiGzaGxLinsLhvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434104; c=relaxed/simple;
	bh=xGSBBdZRO7z7VI/FAZc2A0j9OplvL/xNRGdcbNke2nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPIYANY4CVWXMvQ0Yo+VPhjsOqWGTJOZkKbK+VmHd6r+ctUR07fKJ+hOfeEQWD0ywDxPlCc9f1G6gKdMEbzfSty4/aa9VCyKDmXGQ+hDyC4XZBKAznHWAoAicy5ZawGsiA37R/do5cbCL4iuXjX5sW0GOFyiijSp3nfoskTuoVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OQ5k6o0S; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xGSB
	BdZRO7z7VI/FAZc2A0j9OplvL/xNRGdcbNke2nw=; b=OQ5k6o0Sun3RP1zH8B7n
	wvkGP3siNud8Q0w8mbWkBk/gRODeUL96RfpqVgLGnJxDgGcDyiGvwziMd1OSKRjY
	qHyAjrzvbnmrQdZrGEAfX22iFPTcAeI2RBlA7KrWOR+4k04e/tthjLq4uRuuHw63
	btJM+0RbyU3hrZ4UGp4EJpJrvyXchPmsNulbtBPBF506F9HzDcU95erJJOBTErFU
	IzQQ2KXDjmpA8w/D2KjnA988XyeJuu1A7JntNpBtn/s4vmZ3egeb6FHBggFOCeVg
	uuQAfPR2bKQT0EZkBBUqXoFXdFjYm843sDQqjlEhYQCy/OZnXiSStOa9GHSYqeLd
	7A==
Received: (qmail 3022471 invoked from network); 2 Jun 2026 23:01:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 23:01:41 +0200
X-UD-Smtp-Session: l3s3148p1@TssknktTwugujnv7
Date: Tue, 2 Jun 2026 23:01:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 00/17] Add Renesas RZ/G3L SD/eMMC support
Message-ID: <ah9EtYNGBiyms_KY@ninjato>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kmXOm/pm/MaYEqtK"
Content-Disposition: inline
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:p.zabel@pengutronix.de,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33466-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sang-engineering.com:from_mime,sang-engineering.com:dkim,ninjato:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E38C7631FA4


--kmXOm/pm/MaYEqtK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 05:07:54PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> RZ/G3L SoC has:
>=20
> Channel 0 supports SD and eMMC (including HS400/HS400ES).
> Channel 1 supports SD and eMMC (except for HS400).
> Channel 2 supports SD.
>=20
> The SoC supports a maximum frequency of 150 MHz. The SD0 interface does
> not support IOVS and PWEN in the SDHI register (no internal regulator),
> unlike SD1 and SD2. It has an internal divider for all modes except HS400.
> It also has a 2048-bit divider compared to 512 on others. Moreover
> RZ/G3L supports HS400 enhanced strobe mode.

Sigh, so many HW changes again...

I want to review it but I won't have time before the next merge window
ends. In the meantime, could you resend the series properly in just one
thread, please? From patch 14 on, it gets messy...


--kmXOm/pm/MaYEqtK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmofRLQACgkQFA3kzBSg
KbYUGxAAmN83rTxKy+OCAttjLLPMw6hdhokpkjA7yY1gwiAB/WpP0KH1JOG4+E4p
5aaJYTpLdY0/t1LXELQM0GWjDgPXiQ3qlUUOrtDcDYYaFIYp+S+QbIW2iX8kcppG
ZMVl/FthfXXwSAm/3qm/RL0+whmBxjTe2uzeZB/Ptrp09xOIdRYTo/lCIdhI0ig/
j39xSoj22xrvady0lkIfHJfnHnxs82Qmj5CXvmUFJ9idypKQVSwMOT56oF+Fd3lZ
ks6JzW6Lq+uTOb8OqKvN2SP6gduBUMx21SSXgVP5MfEGEdeNYxn8yDS/rShlYKP9
2Az1z+qiT7T45j0xBe7scH8yOxKU1FS4JKWgr/Spnojk3/B5S0Yi1Kcja28UvRx1
fD7eC6ApMwCOc5SkeansUuxRDHjbI5zo4au1kkzbQn8kVbMV7gZ8KagWxqKNimiK
oCKhAjJ30mnrHZOcCfxIKm698E4ZOwpGmtBaxUVieFyVZwf8IGNynNY8v6WsRj+L
uNh452vvAEhluQCtsjBsYvnng5Go6bBZ34//rwYHUSXpFdcsY019E7b8EBGPfqX0
nSsbD3QC5MS37NcYffcrBRNi6gNCyU4KIS1kLn2M/5KGPvL6ptncqtpWIkl6zFK2
wTuHpJ8s+dIlZhJht6dZ1Ek9AaN2qw2tVb4NLSJ4V8s7QaI28/k=
=xUEP
-----END PGP SIGNATURE-----

--kmXOm/pm/MaYEqtK--

