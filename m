Return-Path: <linux-renesas-soc+bounces-30739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNQnKPpjzmmXnQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 14:41:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4AF3892A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 14:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48C2B302D5A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 12:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3B73D566A;
	Thu,  2 Apr 2026 12:35:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1016344D85
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133337; cv=none; b=LVAcWO+6zNEX6QzancC915j8uyfIrvzQQ5LNzYNmpqJB0zYN0VwdSm29XXhBcO6LvZqpR6wXf0tXQAl0UW3YCIjFfq4zNzeh4yRqTdXsx9YMMULXb5DUXBiS+rNMss8mss/x2BITQKy0Yof3cYDcsTTykACXKoZZmem0JL03vXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133337; c=relaxed/simple;
	bh=sJdvW6MLp8yBgH3UDvbpSEu67skPh2aEa5Orm+cvDOY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W0C2T3pO1Us6KJIR+en9YxRk6bM85XYeUtXsuTE9HlpqNPa+HflfnKZKBB4IsWJO/OC3pzLnOaadRwx66MtlfAR5cobB6qHc5XDTsu92lbcpcYl5BQ5UfxbpP2dWH5tmhQAWDHHoS8bdd+Y/MmYO3AUZaGPs0fA5G52O5X2M+UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8HGY-0004sU-7C; Thu, 02 Apr 2026 14:35:18 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8HGX-003NKC-1q;
	Thu, 02 Apr 2026 14:35:17 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8HGX-000000009WP-1xQg;
	Thu, 02 Apr 2026 14:35:17 +0200
Message-ID: <be36f3adb1cc0391035d45d273e132b95caa506d.camel@pengutronix.de>
Subject: Re: [PATCH v10 0/5] Add USB2.0 VBUS mux driver and extend
 rzv2h-usb2phy reset for RZ/G3E support
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
Date: Thu, 02 Apr 2026 14:35:17 +0200
In-Reply-To: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30739-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,axentia.se];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,arndb.de,linaro.org,solid-run.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_SPAM(0.00)[0.080];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C4AF3892A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mi, 2026-04-01 at 17:16 +0200, Tommaso Merciai wrote:
> Dear All,
>=20
> The series adds:
>  - A new mux driver for RZ/V2H USB VBENCTL VBUS_SEL
>  - Updates to the rzv2h-usb2phy reset driver/bindings to support RZ/G3E.
>=20
> Merge strategy, if any:
>=20
> - patches 1/5 can go through the MUX tree
> - patches 2-5/5 can go through the Reset tree

Patches 2-5 applied to reset/next, thanks!

[2/5] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' pro=
perty
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D6a1b6f7e56dc
[3/5] dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY re=
set
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D63be00249dd9
[4/5] reset: rzv2h-usb2phy: Convert to regmap API
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D890628c8d0f1
[5/5] reset: rzv2h-usb2phy: Add support for VBUS mux controller registratio=
n
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Df62fcdf8ab82

regards
Philipp

