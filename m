Return-Path: <linux-renesas-soc+bounces-31152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKpnNDkp2WlumwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:45:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 746F73DA9D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C075330718CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C5E3DE445;
	Fri, 10 Apr 2026 16:36:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520293DDDAD;
	Fri, 10 Apr 2026 16:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839000; cv=none; b=NdcKNh42ofuTaOr3sULJBwWkQMW+ddki6tie1PLQ0h+nN2ZSSjoYnm2BIj4/oDR+ssBXAOyCzaTGF4oLl2XwJtjs828sJ6xtGaa6A/x1pmIaqz65divsewpV4GIBW3ROe/Ws7CepLDBOGoPofbuMWr+fhJd7GRtIyXZehh1b1oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839000; c=relaxed/simple;
	bh=XP13TavRqncbnzZii8QKSdiH96sPJ0mpHdniWjxZF7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ph5yu0Yp/bZnYHkvF+0fhh4qclJdgLcQOm7K7r3eLz9H9CFktKYiYuYW46TKBIidOP1LI1vf96c9J19RMk4Uboj6fJxnI+f45CfI0ysS4+Jxh8k/56AIYvf6BJ5xA2v8Nkc6580RJZLBMvt1Jr1RymDM1Yp7otY3ntXXzakOLO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Ol4vk9UYR2SE0VH01/+jjQ==
X-CSE-MsgGUID: 0FeSHw9eQwqqq8IA7I9k9w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2026 01:36:29 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.85])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4D23B400CD4E;
	Sat, 11 Apr 2026 01:36:24 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 01/10] clk: renesas: r9a09g077: add MTU3 module clock
Date: Fri, 10 Apr 2026 19:35:21 +0300
Message-ID: <20260410163530.383818-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31152-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 746F73DA9D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a MTU3
block connected to the PCLKH and with a module clock controlled by
register 0x308, bit 0.

Add support for the module clock.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * no changes

 drivers/clk/renesas/r9a09g077-cpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 93b15e06a19bc..f777601a23b93 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -257,6 +257,7 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("spi0", 104, CLK_SPI0ASYNC),
 	DEF_MOD("spi1", 105, CLK_SPI1ASYNC),
 	DEF_MOD("spi2", 106, CLK_SPI2ASYNC),
+	DEF_MOD("mtu3", 200, R9A09G077_CLK_PCLKH),
 	DEF_MOD("adc0", 206, R9A09G077_CLK_PCLKH),
 	DEF_MOD("adc1", 207, R9A09G077_CLK_PCLKH),
 	DEF_MOD("adc2", 225, R9A09G077_CLK_PCLKM),
-- 
2.53.0

