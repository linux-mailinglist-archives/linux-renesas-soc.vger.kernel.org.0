Return-Path: <linux-renesas-soc+bounces-32820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMGTJIh2DGqihwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:41:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DED61580B33
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F7023037E4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D812F348C7D;
	Tue, 19 May 2026 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Mscudf2z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E4B19B5B1;
	Tue, 19 May 2026 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201364; cv=none; b=QkEBdkiBX93N39jtKH1gG5i9AKAcx+HT04uK9km+XYQr30sew8I23VFOeJFfw5onFGgypluO78UQnFI1+25OvobQ1oWABQKQVh0FQQZ9mzgUslztdA9LMsErK08woZ/Sf1Ai2ZvjvPGS47j+FLCSH7RXWOUCuqHMc/+b3qb1s4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201364; c=relaxed/simple;
	bh=q1TNuvcCaUQ6Gc9kwjiRMGXAIYJFY3rB9DDo+YuZLjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WgyyqPmPSS8eqds3rzpBxrvOrrh5hltfiUzt6U9Kx6MGSVZrZUcImS7F82FwCTU7U4ZKiRvgPegU4kxfmPWzL3zvMrBv+ABGHWtyOtuO11tXxIyykQCUrEyaVrD6sa6hP/EvYXedJeZA4sEq2HtkFRfgHoW24Pu8OG9nPHCq/gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Mscudf2z; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vo1Wkn9Q9Yi+rEuSZAgffOMU0CLdX5BnjN/6P4181c0=; b=Mscudf2zUIY6UO0zgo3eOvO19h
	Wdd4SvcqM02kuxZoTzYuBPIhGGwDfomKgXtrRWboagLKtkdUQiALDKky1bwRkJ0dna2q36IdaZ5z1
	LZtH4KicmiUrwllBHM2A4IpTJu6VYYWXYHH3IYzJIT8YtF248ekMzW9FZazpngRTH1+lklM2Mh+7n
	ZH6u7BLCbMP4fnOiRa4GMBLqdSBj+qf9EbFJ6ObMSpzotKA5RPthCfrA+zUMd5NChniqzeS0FzVGo
	lEOjCC99Jbua7qsMWinmvsBYBV9Jv1kGl0sjaV7+ImENJAeqO8kxYzh6dh+kHEthL86ti58EH+VFh
	8961wucA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wPLA3-0000Px-10;
	Tue, 19 May 2026 16:11:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wPLA2-000A6s-09;
	Tue, 19 May 2026 16:11:06 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 linux-renesas-soc@vger.kernel.org
Subject:
 Re: [PATCH 2/2] arm64: dts: freescale: add initial device tree for TQMa8MPQS
 with i.MX8MP
Date: Tue, 19 May 2026 16:11:05 +0200
Message-ID: <5102480.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <710ae855-0f44-4b2d-8afe-415b30afd37e@lunn.ch>
References:
 <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
 <20260505063346.1799500-2-alexander.stein@ew.tq-group.com>
 <710ae855-0f44-4b2d-8afe-415b30afd37e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4736401.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28005/Tue May 19 08:25:42 2026)
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32820-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be,tq-group.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,ew.tq-group.com];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,tq-group.com:url]
X-Rspamd-Queue-Id: DED61580B33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--nextPart4736401.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 19 May 2026 16:11:05 +0200
Message-ID: <5102480.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <710ae855-0f44-4b2d-8afe-415b30afd37e@lunn.ch>
MIME-Version: 1.0

Am Dienstag, 5. Mai 2026, 17:02:12 CEST schrieb Andrew Lunn:
> > +/* GBE1 */
> > +&fec {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_fec>;
> > +	phy-mode =3D "rgmii-id";
> > +	phy-handle =3D <&ethphy3>;
> > +	fsl,magic-packet;
>=20
> One of my FAQs: Has WoL been tested?

Well, I can "wake" the system per WoL. But resume stucks after CPUs are up
=2D-8<--
PM: suspend entry (deep)
=46ilesystems sync: 0.000 seconds
=46reezing user space processes
=46reezing user space processes completed (elapsed 0.007 seconds)
OOM killer disabled.
=46reezing remaining freezable tasks
=46reezing remaining freezable tasks completed (elapsed 0.001 seconds)
fec 30be0000.ethernet end1: Link is Down
PM: suspend devices took 0.040 seconds
Disabling non-boot CPUs ...
psci: CPU3 killed (polled 0 ms)
psci: CPU2 killed (polled 0 ms)
psci: CPU1 killed (polled 0 ms)
Enabling non-boot CPUs ...
Detected VIPT I-cache on CPU1
GICv3: CPU1: found redistributor 1 region 0:0x00000000388a0000
CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
CPU1 is up
Detected VIPT I-cache on CPU2
GICv3: CPU2: found redistributor 2 region 0:0x00000000388c0000
CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
CPU2 is up
Detected VIPT I-cache on CPU3
GICv3: CPU3: found redistributor 3 region 0:0x00000000388e0000
CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
CPU3 is up
=2D-8<--

=46or that reason, I would keep that property nevertheless.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart4736401.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmoMb3kACgkQaS+g2M0Z
/iXlegf+Jah/HxtzA8FMQx4UsXpxX78jUNG5hFcKoA1eMRtaVk+YHJ/ULn/kGr/l
2RsVe5e9IuzB3VyOqnX1P2U8oEBbMj4plC1VZI8MrU+gDEW989eX0RAJ98y4TW9X
wbQqMG93B+fUZc15khg9MekjJeu2s4wgm0qsGDjZd799NtEof6vDH5nB5dqekI9I
yt9RO81MMxpxfpmyC4sPPUiLCoE3LQlmLQ4sG+oP97mjPfKidplrWNUZbuFkQMh4
3tTsBJETKIuuy+u/rNnDh0n/EiSAd41wpNvQrwCKNGBL1Y5QFJKIkPyRKe1M1OoX
nzHArj1V/uKHScvzjX7xdQSgFFzsFw==
=ozu8
-----END PGP SIGNATURE-----

--nextPart4736401.LvFx2qVVIh--




