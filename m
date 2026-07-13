Return-Path: <linux-renesas-soc+bounces-35119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ez7ZD8rkVGqgggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:14:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A911974B696
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:14:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=qQ6Zy14E;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC87830D9615
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1AA41734B;
	Mon, 13 Jul 2026 13:06:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F9641C31D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947968; cv=none; b=sR5JWidlJt8zCjo1L91PTGipc2T/Eqj1xwTypmEUNO6uoVI0HV0rwHRCkQW2YkVvATm1h1qzTDvNvmbxi+aJSNRb+PDrMkkRl6cZIa9RLz8vjbufXrMErMRxB76vVhDyrYKcp0Z3yJ+eTCZlntNqNpy00U68UCp0GCbIUOrD3hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947968; c=relaxed/simple;
	bh=j0mdqsjf7l/Aiz7CrwnVZ09ouS0ggsNZ4jEVw2RfbME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0rBldCrC5JZfPP+BfJP/9RWh19nebiKE4TnN/15vLBvuzYCh5FwBxTkzQgAkUXDL3TldJHWUsoiEIB5TBIZdOI7hpgmVgNG8JXYxfhoKFijmOo+CGt/d0cQOqsPxdsxYHa5ixhgp5xHji8db7t9F8/O5IPqfktCtpXROOmZFKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qQ6Zy14E; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47640541585so1467695f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947965; x=1784552765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGkn37O2dLecAyAReq+7VIvOrR3e9Bs6vVNAB3QPbCQ=;
        b=qQ6Zy14EgC+euI/FgX+D/SkQgcI5c5KvVht0/KgucRHlgHNkj5HWxMiBPrfJdZ55r0
         uEgUAe7g26bEvOs2DWCQgFIVsGNcJzpWjtvURVidvJUAD8Z4AduoSWkHzO7HBohpVDjF
         Vc69EErpkf3Wki6nR5kQlE7ZIHLY0DOcN4BNQTC7B60kL9fjR6RbhWvf9Er4oKv/BDQ9
         SQWq3GGPfv62WC/WXgOgxfmHxG7f/T3ymSIO+ixsg3tmuTatlI1rJN+HbiO5e8ao9nOR
         WouPfklS7q8F+KNn+AmZpAAQUeKdVXT0XAbE11IqwkULrptLNajgWIxIDyICbV0SPMmo
         o3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947965; x=1784552765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGkn37O2dLecAyAReq+7VIvOrR3e9Bs6vVNAB3QPbCQ=;
        b=QFufcat6WRimpel9VGu4JXYLYELV93AmU06zqmhWPBUTIeNh0aAx8sFZ4lTGeO3mut
         cXzpEUCfae7qY/8coyJ1Cmp6sZjuCOudSdnSuMMQ1SEZOmW4Yy06BN5X5/u0D00xjFgh
         0jgIjYQQ6zvYtluF6BP96P7hHjoDb2xhDzA51QP7DueQ22gLAMV+bXG+RXmtV7kElgv2
         STHl4tDRfOJoWtthrYwhiDmUmLgAxgN9SCWoy6dwfZae8/hpcSvOjgrmAVqH4IuhMMWN
         fb587++nn3CAauLQrwuA87pl9Sta3VRCnSZs5zCa+iUPg1iw2/EiF/ueOpb1yPKFKdiP
         tKDw==
X-Forwarded-Encrypted: i=1; AHgh+RrwqwfvoNLmgs5luU0jaa3afYdD1w3UVpCaxOUg/nuPu4x7qoG9nMbKMZ4CWOEvd+phRTpfWP/rt5TcrWIvZKV2IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEu1B87cHhFToTUXJfVVk0q1NEOUmnNRk4/BObyhrP+dr8dDG4
	SEwAKFOjkfquv/RVuAIGiiZQ5Ng/oGtrpDnoHVayWu0C2qvzCU8uylm1+V5oHHmcP/0=
X-Gm-Gg: AfdE7ckkp/GUK7NpYXusaCA02j9j0oW7VSe9V/vuAy/jHi29KcW3PiqfHQVCbMRtZnV
	p4yG2veYKsShGkJ0Sn8kL2lDcZCMG0g1bIsfjtVDt+ur/CdP8ei6YICGRbS1kirRg0rqDFm9n/W
	jeUifdwGtbF3HxyxwfRtA+KGnfus/uCxYWJzJVRE7VKEjLyWRqMk9Ac0W/9M6sudgcVpUWvJ5k0
	7i7ilAegs/XUk8orpzd3aBsICqUgHKWgPfxRBYxe5Kd7VkQfwSMNHhAa9H78IRfX602FFkGONyB
	KgWAGUux+GwD6RpAfzfDNMSyjPDsPJkvBK2pjIZyoVLuVU2EB0VAKxMTg16AGAvwjKt+wdxderA
	q5pU1+aEQ9XBmkjAdtnbtN5qcEFFWWHD6eCiGKEsRQeKyXpzPL2dUdDCH8LFHB8NfquKzh9X9Nt
	q+qvTTqKlw8YU4XB4m6eZFW0OhhPW4I90hlICh3ae7j75e2fbpGVP2RVsCkgdHygiRTQ0VzB4=
X-Received: by 2002:a05:6000:460f:b0:475:f0f0:9f04 with SMTP id ffacd0b85a97d-47f2dd0e4c1mr9446685f8f.59.1783947964734;
        Mon, 13 Jul 2026 06:06:04 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:04 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 09/17] i3c: renesas: Use reset_control_bulk_{assert, deassert}()
Date: Mon, 13 Jul 2026 16:05:37 +0300
Message-ID: <20260713130545.568657-10-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35119-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,vger.kernel.org:from_smtp,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A911974B696

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use reset_control_bulk_assert() and reset_control_bulk_deassert() in the
suspend and resume paths to simplify the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none

 drivers/i3c/master/renesas-i3c.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index c459e40fd5ff..915090d0ad37 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1437,24 +1437,22 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 static int renesas_i3c_suspend(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = i3c->presetn },
+		{ .rstc = i3c->tresetn },
+	};
 	int ret;
 
 	i2c_mark_adapter_suspended(&i3c->base.i2c);
 
-	ret = reset_control_assert(i3c->presetn);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		goto err_mark_resumed;
 
-	ret = reset_control_assert(i3c->tresetn);
-	if (ret)
-		goto err_presetn;
-
 	clk_bulk_disable(i3c->num_clks, i3c->clks);
 
 	return 0;
 
-err_presetn:
-	reset_control_deassert(i3c->presetn);
 err_mark_resumed:
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
@@ -1464,19 +1462,19 @@ static int renesas_i3c_suspend(struct device *dev)
 static int renesas_i3c_resume(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = i3c->presetn },
+		{ .rstc = i3c->tresetn },
+	};
 	int ret;
 
-	ret = reset_control_deassert(i3c->tresetn);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(i3c->presetn);
-	if (ret)
-		goto err_tresetn;
-
 	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
 	if (ret)
-		goto err_presetn;
+		goto err_resets_asserted;
 
 	ret = renesas_i3c_reset(i3c);
 	if (ret)
@@ -1507,10 +1505,8 @@ static int renesas_i3c_resume(struct device *dev)
 
 err_clks_disable:
 	clk_bulk_disable(i3c->num_clks, i3c->clks);
-err_presetn:
-	reset_control_assert(i3c->presetn);
-err_tresetn:
-	reset_control_assert(i3c->tresetn);
+err_resets_asserted:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 
-- 
2.43.0


