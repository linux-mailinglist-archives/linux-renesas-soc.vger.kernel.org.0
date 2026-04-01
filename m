Return-Path: <linux-renesas-soc+bounces-30684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NkMDb3lzGnuXgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:30:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C7258377A37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63B0D305D9E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 09:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBDC387363;
	Wed,  1 Apr 2026 09:26:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7893CF056
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035580; cv=none; b=JYYWdeaMGGtjRWHNkznLXb2CsPgxHovgeryk3iZ/kKI9Ex0soLz1kUiENqfkYTdtMWhrJ72SR0KFa0n9DJWCd3N/O8/t28EZsV4CNCXummekcpTh8dBRJrU4zRgBzr+Hv5PY/3KM2oUNOKc+3jHodaVF/Lr5Zo5wNBnBPml7S6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035580; c=relaxed/simple;
	bh=1ZzhXfoR62bjPUAvPDpbOr6kvGwlk9a0xMMI3cXMjC4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SU4ZM5GW0V8d04JjK6XZAJkU/bs9s8laBpHmEYN/rcvsQMuZNsV6ECI6K1jeLMxAmWuMFIgxHZ8GL5RYvEL6II1H/etL5jwsp5hs2HnbwHAJDfN+4Da4o4zl2EYuJu+lsz8fbwQwH07J3b5SYz8DK1qI5SB3e7h7H5Puo2EhuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7rph-0000mN-Dd; Wed, 01 Apr 2026 11:25:53 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7rpg-003BY8-1X;
	Wed, 01 Apr 2026 11:25:52 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7rpg-0000000080F-1atZ;
	Wed, 01 Apr 2026 11:25:52 +0200
Message-ID: <7b5c5300921c9d7c931389400cdf6fb2b74ae3ea.camel@pengutronix.de>
Subject: Re: [PATCH v9 5/6] reset: rzv2h-usb2phy: Convert to regmap API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@axentia.se,
 linux-renesas-soc@vger.kernel.org, 	biju.das.jz@bp.renesas.com, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>,  Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven	 <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Josua Mayer <josua@solid-run.com>, Ulf
 Hansson	 <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 01 Apr 2026 11:25:52 +0200
In-Reply-To: <aczhCMdmi9cpkGkM@tom-desktop>
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
	 <0259040014396ea03d58a87c2ce2a3f9eff2b0b6.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
	 <283a6336658045be8906ee219620c994e85c7fb8.camel@pengutronix.de>
	 <aczRo8HVUFqXKfG_@tom-desktop>
	 <0bad9579a953cc069e17a7075a45c9eb9c7a6d8d.camel@pengutronix.de>
	 <aczhCMdmi9cpkGkM@tom-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-30684-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,linuxfoundation.org,solid-run.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.876];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pengutronix.de:mid]
X-Rspamd-Queue-Id: C7258377A37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mi, 2026-04-01 at 11:10 +0200, Tommaso Merciai wrote:
[...]
>=20
> Then we can have:
>=20
> static const struct reg_sequence rzv2h_init_seq[] =3D {
> 	{ .reg =3D 0xc10, .def =3D 0x67c },
> 	{ .reg =3D 0xc14, .def =3D 0x01f },
> 	{ .reg =3D 0x600, .def =3D 0x909 },
> };
>=20
> static const struct reg_sequence rzv2h_assert_seq[] =3D {
> 	{ .reg =3D 0xb04, .def =3D 0x303 },
> 	{ .reg =3D 0x000, .def =3D 0x206, .delay_us =3D 20 },

This will call fsleep(20), which maps to usleep_range(20, 25).
Please comment on why the delay is changed in the commit message.

regards
Philipp

