Return-Path: <linux-renesas-soc+bounces-34668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5VgHB7aORmopYgsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 18:15:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4B6FA088
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 18:15:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pwEAZgGo;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56CF630FA246
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 16:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33FF340410;
	Thu,  2 Jul 2026 16:05:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39916318ED7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 16:05:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008314; cv=none; b=BWIwx9OrRXBqQlFHt/nt5rV7Qdft9f3AHZgl2aAxPjI8U2xeP5i77wLTa94r2nUkst4nQLrztDYDKzlE3ORkrpwvgRhufQXsg1fUF3Qz+kn7bST12SJv030T8CDPC0+0M+Ol69gAuQLeE+ZoauzeuM+MPwgCFINlGzrVeicmkUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008314; c=relaxed/simple;
	bh=nDJAbJCFuUB7OnJXjKjnKvBkXflAc5qn8SUxoJPyYn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwKuxJBbjLkASs0Hv8NvQ3FrKmi88NpJ/f1aZj/3peY64QqovGRBPhEofgO4h9+ldHxTOBzojCkP3dfjHMrPogbqdC0W9RLvTveMxhVYrJVsRD1kqKVoYGb2drjwPvmK3QIyUFcauFFuLRv+YxksZVQ1h/qxSJBsx5CEEmm/FOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwEAZgGo; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso12094505e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 09:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783008312; x=1783613112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Av9KMOeHNoLZjJvkQ1HtWMUmgg+DhH4RllPkn9qKDs=;
        b=pwEAZgGo+aJVKaOMSA+BI4DL7U/LgVBrDmWkbU8sQZovQb6Ush0lx/LVr9x56ga4Xi
         +hwyMWunrGoXPa4IdXMWhrBAIIOtgN2qn4URSG/b8sJe1F/2Ux9iw6BEK1P3fzUeXLkG
         PBVVHyXPSzPAF1IZgEPn073HBqWr9EXUlm1CMsz2nTVyEfvbByE5IBD8rrMuCGsG3qCn
         TSJTDB/nVWmVoZc95CmE+8uvkvdrVpPJyVKdnHux/2WhBWe2r/dlJGTg9w/HppENtoYP
         onUPd89pIycPbe+y004uKJdJnbkTz2RcaVKaDGKfAZW8j38iOI2Flm2J677mVf6ShEH4
         IeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783008312; x=1783613112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Av9KMOeHNoLZjJvkQ1HtWMUmgg+DhH4RllPkn9qKDs=;
        b=RvU1Umk/gE0odwnEWevdXoDYZF9Xnc6teErvWqXvoWDOft2LiiRDzwmvTzktBYklPM
         6+nfNQ8R1/zPkJGcL0Y/7hIwa9+yGNnfzxlecS6huDXrCUNHC/84TR4yVk+vkbM4dxkk
         Nt5mbJbGJHq+5SVTPyBGBF58myBddIay1HKp3qgmv52F2Mvsp4H5nxZtgKpjDz/cNYJI
         i8qFuyLX2YfZbEiDaEq8BA8Aje6KzM4vUuHCObJUjvWeoPvDaY0fIIsHES7JJgjyePTS
         VbpC/RaHaiWi5SlGbgtRsn4BW5NlkuzL9jetB9tl6c3zIe8hHMENkbDGxDsCJ/PVhu89
         teXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nytG2OW8KYYzjCWCvZNUa/TWHiplZpTWXl70NE9XrgM2YfR+mDE0WXZnjACDRUxukEAQ7OlWgzZ4JriYywzu2kA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5wzUBPM7BXu1UjWn+AZ/a2HTA+a+24tHKzw6Lqk9bSPhanN2D
	npMghDFpH5RiE4dJtYtVa1nFCFyB3Ao109defXV0JJ9OyCMFUGmiUkwn
X-Gm-Gg: AfdE7cmBdidMy8MQmbW316KPhwyCFewy49czbNPbn1oMxUuTWn14l7Vg1+GBIpYiQ6u
	bNDKjuNSA/cz2hCT998F6hU6wi5r3T6n7DQkIgrjcA2FiHcA9dLV/BgHzKGhigUIEOJskOMZWjI
	zhYbHoq/CuignIb5gEwA3BA7+Q539gxZo2451I7gnobn/fyJdsMiaEaW6ZN4keEYqw/D9X4NHLA
	AA06HQMurKjk9A0SavrBAcqY22VmC2HDs2wtOVNhSCtCG3FrZF4XS7Vzb52X+Pr0YPUU/rLFKRR
	VGkJgugOWbgnMmZnQafZxTRT0K6UzSdEH0Wy+pi6CTe+sP446Pvn/uucNq/9tfcQfE9W50Q5h7G
	F/76Np9WN1Bnixr7T7OQ6JITXD+jOrBcVpyIqVTy5fSi5yBCYHGrKNMtnVNTFRm8El2avS2eYVA
	kF1BbLdXN5ZawxdmiMwKD2CTh+IPg326dV1eWDIKQLrt5rUioJGK0gC6H4ygdQPja++p2c/4hRW
	KmZj9X9u5HaSq22cL2Q9ItCxgQ=
X-Received: by 2002:a05:600c:524d:b0:493:c82d:f3fb with SMTP id 5b1f17b1804b1-493c82df4e8mr25197755e9.28.1783008311282;
        Thu, 02 Jul 2026 09:05:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm85444715e9.7.2026.07.02.09.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:05:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-watchdog@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] watchdog: rzv2h: Refactor WDTDCR start/stop handling
Date: Thu,  2 Jul 2026 17:04:55 +0100
Message-ID: <20260702160457.1884345-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702160457.1884345-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702160457.1884345-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34668-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:linux-watchdog@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DC4B6FA088

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the WDTDCR start/stop helpers by introducing a common
rzt2h_wdt_wdtdcr_count_ctrl() function that controls the WDTSTOPCTRL
bit based on a boolean parameter.

This is in preparation for switching WDTDCR access to regmap-based
handling, where consolidating the control path simplifies the
conversion.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 3b6abb66a1da..e9545b8f5fd0 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -89,18 +89,26 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_ctrl(struct rzv2h_wdt_priv *priv, bool start)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+	if (start)
+		reg &= ~WDTDCR_WDTSTOPCTRL;
+	else
+		reg |= WDTDCR_WDTSTOPCTRL;
+
+	writel(reg, priv->wdtdcr + WDTDCR);
 }
 
-static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, false);
+}
 
-	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+{
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, true);
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
-- 
2.54.0


