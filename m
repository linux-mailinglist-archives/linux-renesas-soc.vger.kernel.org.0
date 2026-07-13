Return-Path: <linux-renesas-soc+bounces-35124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l+1DAuXkVGqoggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:15:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE874B6B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:15:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=cSXyCrc3;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A632531D84B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5712423A83;
	Mon, 13 Jul 2026 13:06:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E74229BB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:06:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947976; cv=none; b=D3zyRZOMPpbTHxl4tNkgCxylm8agRh1Y9EvMfVZA25w5z+n1oEx20Pu2AMz4n8ZcC+lJZmlpZivpZy6ONT6cZS4FRSAZ+szFug7bGZmZ4CgNivDxf4SVV1tMjM89m15TYmapZhlz3zW6IT5aFj5M5Zm4aoRt1DLMW+ExJVr45F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947976; c=relaxed/simple;
	bh=ZlSglwTcsX8rRyvAipc34c0CDSc1nTrQpRYLPO7inoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHthMDZpNXNJFefUjE1beQkacSG30va3gHaSCOEkkKuamd6CKfil2jbP0bHZkyxAoti8QdrY6mprGImuApoUNoFM9cQtMMN7fvkD01e9bCfvyS7LpsRFviCa3NnJvVsWHofkMMl2roZAEjuswa0M8hdWcQlE6oPQh/lOve1apVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cSXyCrc3; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so16509595e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947973; x=1784552773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ka2WRcxeR+5lBW53fFIg0AOmhGbckfoTmT31bECGwZU=;
        b=cSXyCrc3pYB4HEvlv3k52rLVq7xYdweBIXXXqNfm5Vjq0dLhfUULlKW+p0xUt+Mju8
         1SmHdPdZs8J2D2mTEjC2XVFMJHYgxGg1V067kbUfBRFHnOAtWpA0Y902NwakO79gtTcd
         XAOcUZPYCPxBkfroQOwf4YXRHC+8VjSH6Y97e93L+9PpCDRO4RSSpfSViyhpztNso/WS
         7HnnCvjLOIcA0gREqr1jsQSFra/lcLwNn0IZ7DUQhfED73dd8NPhIz3XZqla5DNf4rw7
         xv4L/9vXHk7OiM0BdweoJnmUxoZifY/LTQOAKKZFg4mYaWnX+ErpFFtzytzYfyH1atF8
         G+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947973; x=1784552773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ka2WRcxeR+5lBW53fFIg0AOmhGbckfoTmT31bECGwZU=;
        b=j4vilBk/QhurrhnBLJRj/tGOsL9p0JR13/kSWwZljxKIaUtspoqB5I3D52uMm3IUJ8
         jkEvHepXnQHOQTT1j7MXyHJE5PLCccLq14e2Tlr4hhhk4f2zvJDvTIEPrFbIUsPQ8Ldh
         oWrzjKR93yHaz/SRItGtq6BimnRIlOoq9Cb6oYfrbCf+nFXq7Ws0+/6x+6WwV6sBQlCx
         8lJNiFkWupatbZjHTL3WXLuiFTq1zVCXhVcL7+BIX4ID6Jw1Td0U78gbxBUyCXKx4/Gf
         ETk/9Wh74totyGjIKw5WOd1WG0msy7lNrZTNajddwB8ln8itn8cAhHrcLCtddL3u+Wt8
         NnHw==
X-Forwarded-Encrypted: i=1; AHgh+RrDeEGidkeb388qaZI9OQclqOlZLwepZLpzabLVLR18x4S04zXIOl7GDXOkOPjWwtqYUs0vDND1qusVxUx6uQkELw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhhIQ6fFiuFOkmnLw+gSs8HVdxkrohogVo7fAJeGQ3CLTFYz7n
	3h3nV4YMTY/2BpnC4T8QiFpBTN+wj/MBgB1yqQW91t3dAT/JwiW+mRxBZYw99TEoFwI=
X-Gm-Gg: AfdE7clKNAbzFxncO90Yj3C7AooGGU38QyFoDUos10+37zdx7mIFIXNgBCzWkmo79+i
	6iVsUkOSFgoz8uwbLvU9Axe0j94NU8ua/jC9xlImJEfGcgoIF+kEanVRrde/PNG7LuWwTVsRdgf
	yGwEXZpsg0Gtbm0DTz95AMEh1OpXE1+LN9G/izB/MuUy2Zu/3ZrOTw2SAERYiSzJMaaBOT2OOTo
	QBipOdd3peTA/qXJD24DDSdo0lB6LWWk1wv4D6M2X28BMsFo7QCoxtsUdgNtOA+iJLMacYxADPP
	+mhu7fLoD/zhcKDMBUvZvX4mepXXn6EhJ7M6U9/HeyYA8P0wTH8o0tirTU8w5QxMTb8K/Dy/nve
	694wJBFPSF0CGaeYqQMsMBUI+cVBW1FNFCM6hMxcTlEMSzScoIXALj+FsBzND4+nYhamesnGzQY
	J1LG8e/6w3Qz6NzO7pBGVPhU+cg68iQh4mJQPpuESl4T2jYDX8/zYkziJmAM8FoeiVkuz694c=
X-Received: by 2002:a05:600c:3143:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-493f87e9f43mr90709465e9.11.1783947973694;
        Mon, 13 Jul 2026 06:06:13 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:13 -0700 (PDT)
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
Subject: [PATCH v5 14/17] i3c: renesas: Organize structures to avoid unnecessary padding
Date: Mon, 13 Jul 2026 16:05:42 +0300
Message-ID: <20260713130545.568657-15-claudiu.beznea+renesas@tuxon.dev>
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
	TAGGED_FROM(0.00)[bounces-35124-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxon.dev:from_mime,tuxon.dev:dkim,tuxon.dev:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56BE874B6B0

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reorder structure members to reduce padding and improve memory layout.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 2cff7c6ae369..a54c20ef5f6e 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -221,19 +221,19 @@ enum renesas_i3c_event {
 };
 
 struct renesas_i3c_cmd {
+	const void *tx_buf;
+	void *rx_buf;
+	/* i2c xfer */
+	u8 *i2c_buf;
+	const struct i2c_msg *msg;
+	int i2c_bytes_left;
+	int i2c_is_last;
 	u32 cmd0;
 	u32 len;
-	const void *tx_buf;
 	u32 tx_count;
-	void *rx_buf;
 	u32 rx_count;
 	u32 err;
 	u8 rnw;
-	/* i2c xfer */
-	int i2c_bytes_left;
-	int i2c_is_last;
-	u8 *i2c_buf;
-	const struct i2c_msg *msg;
 };
 
 struct renesas_i3c_xfer {
@@ -253,21 +253,22 @@ struct renesas_i3c_xferqueue {
 };
 
 struct renesas_i3c {
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
+	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
+	u8 addrs[RENESAS_I3C_MAX_DEVS];
+	unsigned long rate;
 	enum i3c_internal_state internal_state;
-	u16 maxdevs;
+	bool resuming;
 	u32 free_pos;
 	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
 	u32 extbr;
-	unsigned long rate;
-	u8 addrs[RENESAS_I3C_MAX_DEVS];
-	struct renesas_i3c_xferqueue xferqueue;
-	void __iomem *regs;
-	struct clk_bulk_data *clks;
-	struct reset_control *presetn;
-	struct reset_control *tresetn;
+	u16 maxdevs;
 	u8 num_clks;
 	u8 refclk_div;
 };
-- 
2.43.0


