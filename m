Return-Path: <linux-renesas-soc+bounces-34653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2rsnI3taRmrxRQsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:32:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF936F7A67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:32:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=tLMsQTMg;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 513E8303128C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 12:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DD74921A9;
	Thu,  2 Jul 2026 12:31:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E9480DFD
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 12:31:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995502; cv=none; b=iTrAVnYUHitzpM+3GdGh5LsdI33pSbTCCG4q/v7Km988nun/jZrwbVM+w+EynGKnkfErjMBOpGMwMC/QCNSMWVH3Uq1LFDLf33ddbxbjifCyUkzAQeklVkYqbnCBCPMHB6+sDijJp++fASlh7fb7v3+48P5C5IWbAFSPATTbFLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995502; c=relaxed/simple;
	bh=xos7in5Tx5zjrpPU8l6pvfEG31w4lotqHqq8+a6Gya0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VmtiTaJQZSQ7wMne7egaG7PVeAWh4GDsESH3w0qWTrUaYEQ+xE2nU018onw0H50NYUbds9baJrf8mnVRoHpCORMPoLEIeyKVAst1R3O5ph/SLrZSVLSwrZ0WxlVjyjtQwPDcvbkJGhGstOKR3PrMGmEcNyqXV47st5u2JBSn/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLMsQTMg; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c59f740cso4249815e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995490; x=1783600290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSc0cDIDo1ZXEmAON/XiNWuduFFW8ewj9EMw/32lW/w=;
        b=tLMsQTMgR5OiW254DFThrfMEqVwgSv5X9RP7E926YGgn8hZuU9NbK81qi9+uln57TG
         c9WXWuYBgnx9JwFHT1/i3Iq/o5cnwnO/bJq5dK9Jms9NESE/zdtJaBSbQBBHdbUUyOkX
         iiaemvBSLgqoGYS3/WbF4h1LIwzHv596J2jotIY/aSP5m/8jQFT1iEj4psEJpM2riYLt
         YiMGfe+SvwUqdpVh9e5iqiAEVeKbpqY6/RUJcCB5eO8FzxY6O+Au9PqL0FuXwVz92GXB
         u/K0RdSIfbNdLAOOQO7TyJu1Vt09YrA6Gcnp9eZa5eh4jPpdGP4/q1aq/q2UTofrpPLu
         9e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995490; x=1783600290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pSc0cDIDo1ZXEmAON/XiNWuduFFW8ewj9EMw/32lW/w=;
        b=ZkafZ/isFs1T8Ob50qmNq8SPNkzXS4owN6NfM7MtPM2Ou8k3sC4N9AiispgW2P3R1h
         mEzVO3amD6VumZLiY+kRDbHxHUIr245s45l5xKIWcFE0nUrc30rmozfNWuYDoUgL/ubu
         m/YcGiacHtWaN/8pxKbfwX4HcRRxcSWXGFvMevigvJglF1M9hAFR/B8lYbhjtmguoais
         zgTytP7Y5lmi3+kVJNVoBgammE7YDFZ7n2mgtp7CI2MllqRgOkrKTa6BSNRbaAnq09Uc
         8DAqb897BXvboCD9SM3PQOOQSqR6GhCvwCU0mo85JZMn5NpQ9LONtC/5aOWoPoZP3uK8
         GBSQ==
X-Gm-Message-State: AOJu0YwjUg+iNymMghcgCkLmTITZL7DMu1NPQgwT+V8X/ow1l4ldTrfN
	9sSjOL2BXh+PXQ8yZVBrVanf6OlsBl2Ij2g8V5dbhwr472OzT/sJdAdb
X-Gm-Gg: AfdE7cnesTuSpJm/PhlhLFPA+oUWWRsTv0IRUkz4/ftb/kgpYzxbsSwk12X08euwcn3
	qSGsJ+T3ZVvQuGwRSHTch8ttJUxSo27bkSjXa+S9cajTZHydySNrWIAmW+iLacKXPfd92SbUtlr
	T1T6I6/7Naf6UBlW+hdT454mkOOJXDpRWZKYNp9DLxdaIQSYqNdQVhI/lCvXSnhkR+3D1VQhxQ5
	iCwbuCMmeF9ICi6/W++tHVYgLKH5Mg14eBwGBr9L+8vrA25CBlxBGha0zPy3AcfihD2bMmTpi7h
	g6TamB0VzLL5aAoaHmqp8rfi36HmJ3V0PLw2A+keeJC9zzZD2Ui17ElGv0Hr1lixXQYKdh33JVp
	ea1TXYhihamwGiSDid2p25h4QcKVuSzkYCdtZBnGipxWQJK+uounUcs7IzldcGpx+7U1Ohwz9cC
	iU/kp5x0Tamf+gAkla7pgzDnRMf1Q7LGcJVlkqMp1M42ibzMf8TObYiz7lpCD/SY82NF+WJyOC3
	5NklrDmnyndL6riIC85oeRfExZN3bKKWIlCVA==
X-Received: by 2002:a05:600c:4f48:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493c2b5400amr102965325e9.15.1782995490018;
        Thu, 02 Jul 2026 05:31:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 6/9] watchdog: rzv2h: Refactor WDTDCR start/stop handling
Date: Thu,  2 Jul 2026 13:31:09 +0100
Message-ID: <20260702123112.161160-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34653-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FF936F7A67

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the WDTDCR start/stop helpers by introducing a common
rzt2h_wdt_wdtdcr_count_ctrl() function that controls the WDTSTOPCTRL
bit based on a boolean parameter.

This is in preparation for switching WDTDCR access to regmap-based
handling, where consolidating the control path simplifies the
conversion.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
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


