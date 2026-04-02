Return-Path: <linux-renesas-soc+bounces-30737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI7lN19jzmmXnQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 14:38:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ABC38926E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 14:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE7FE3068A05
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 12:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3093CCA02;
	Thu,  2 Apr 2026 12:34:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D43D75DA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133271; cv=none; b=uJARD92j8kEqd2zZA5ma/YBMOwyecC6qmqRnuQy5l78I5/FskM3ZPopJBLIX+xqGupnKtbCZJ2T+Gdc81q7DhinwNYbsiZYE89Mt7a9zRtvxCadPXwRZ84XQxa1kUZ8uFp+NWC/g++LB+w0GraK3qEJmBneYRn4+Cwdvz4Mh4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133271; c=relaxed/simple;
	bh=vBVr1hY9zmi6eTqZ1irgBj8oY02q9+mPcGyT8biDgPk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IkMGC6uk0ueJPJVlPojzzTAb4zkowbIOZYQ2N2xRswWtbHpeeJwPB0LIpNwatKv63Vrem0dDS3vbPdtKqsudG6QODseGjgw9u8jYoghG4suTL2wU9HVn6MXIv0h5T++4fsL0+ODNWjoNZly7WGglfXUhG1rOwOoUwcJgMG3LgLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8HFR-0004fG-Cz; Thu, 02 Apr 2026 14:34:09 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8HFP-003NFN-36;
	Thu, 02 Apr 2026 14:34:07 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8HFP-000000009U5-3YvQ;
	Thu, 02 Apr 2026 14:34:07 +0200
Message-ID: <2ff25486a332ee3bfae1b30147445a44b11ff42e.camel@pengutronix.de>
Subject: Re: [PATCH v10 4/5] reset: rzv2h-usb2phy: Convert to regmap API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	tomm.merciai@gmail.com, peda@axentia.se
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,  Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Ulf
 Hansson <ulf.hansson@linaro.org>, Josua Mayer <josua@solid-run.com>,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 02 Apr 2026 14:34:07 +0200
In-Reply-To: <0732e1c53f21671b3a1a78db99fbbe3b78016d52.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
	 <0732e1c53f21671b3a1a78db99fbbe3b78016d52.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30737-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,axentia.se];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,arndb.de,linaro.org,solid-run.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.264];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,pengutronix.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: A1ABC38926E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mi, 2026-04-01 at 17:16 +0200, Tommaso Merciai wrote:
> Replace raw MMIO accesses (readl/writel) with regmap_read() and
> regmap_multi_reg_write() via devm_regmap_init_mmio().
> Drop the manual spinlock as regmap provides internal locking.
>=20
> Replace the custom rzv2h_usb2phy_regval struct with the standard
> reg_sequence, and encode assert/deassert sequences as reg_sequence
> arrays rather than individual scalar fields in the of_data
> descriptor.
>=20
> Use the reg_sequence .delay_us field to encode the 11 =C2=B5s post-assert
> delay, replacing the explicit usleep_range(11, 20) call in
> rzv2h_usbphy_reset_assert().
>=20
> Select REGMAP_MMIO in Kconfig.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

