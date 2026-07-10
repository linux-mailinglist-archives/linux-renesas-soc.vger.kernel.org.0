Return-Path: <linux-renesas-soc+bounces-35039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qEKIHW7ZUGr56AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:37:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9DD73A4F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:37:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7096A3040D82
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32504229B0;
	Fri, 10 Jul 2026 11:37:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4C63F7892;
	Fri, 10 Jul 2026 11:36:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683425; cv=none; b=jJA9ND1F+U3BwcjcYJjl29aHUXucekJXMjztExWAuRCXpoGT0LZkjupar4UmhIQ9u/8vnpQ+sih8m4p62QOItH5PoPNqQ4L3IWp4V3+PZSP5CdjRuWPrjVlSbtLyDaeONiDbxV2LGhVSuJnSFC17Nwj9S9t85VDSb4wvZ1e9luY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683425; c=relaxed/simple;
	bh=eGxCYoI+XcfE3OCH6uZe9UJmHRIwXQu1FxldtqcBP/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5exlT8Efs8f4uVq5/VGGnvH4GF8WOhl2ICN+ZzfSgxpOlgOerHMEk8KIiphm87NUfPqZ2vroQpNMwEMUlGuKhfYUAqiQeiJtL9d+NHtSCHa/S+Lx7DFMfbS0P6oPnLDv4e3Gv393+pYnxWgfZP85ZZLYeodR6ZVkN51TFXlSkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3246B1F00A3D;
	Fri, 10 Jul 2026 11:36:41 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/5] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
Date: Fri, 10 Jul 2026 14:36:32 +0300
Message-ID: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35039-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED9DD73A4F2

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
clean I3C support, cleanup patches for the pinctrl driver were also
included.

Thank you,
Claudiu

Changes in v4:
- dropped patch 1 from v3 as it was already applied

Changes in v3:
- collected tags
- added a fixes patch (patch 1/6)
- dropped already applied patches

Changes in v2:
- collected tags
- dropped patches for configuring I3C standby

Claudiu Beznea (5):
  pinctrl: renesas: rzg2l: Generalize the power source code
  pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
    power source option
  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
    power source
  arm64: dts: renesas: rzg3s-smarc-som: Enable I3C

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  18 ++
 .../boot/dts/renesas/rzg3s-smarc-switches.h   |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 254 +++++++++++++-----
 4 files changed, 204 insertions(+), 74 deletions(-)

-- 
2.43.0


