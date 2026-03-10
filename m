Return-Path: <linux-renesas-soc+bounces-29139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBdbBitWsGkJiQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 18:34:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B8255A76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 18:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38752309F472
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 17:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024F13D7D8C;
	Tue, 10 Mar 2026 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kVKvo+Zm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E503D6685;
	Tue, 10 Mar 2026 17:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773164001; cv=none; b=OYFoaeTa32DDS3w/q8Y15LKi5/yMs+RSYHSQcIYZQ5p6mv8wnTsNuHPIZ2Pcnmmih1XLUUbBeo+rZOcVBGvGzxMwaDgEeTiL7ISwVZbTdRr8C8j6xnz0WxXbP2A/FIAelTXRlp6Ea+Gre4PYHFSE/X5Isk/aqkG2/7rcztX7nfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773164001; c=relaxed/simple;
	bh=uTxcEX9dtGW13fmgVaUG0TJvPmOSE3Up0iusG94HGDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQY7IBq8wbK5vC0aeqMujssQqOJZCBhqrIrtZ5OvKLNPYiWF1Zz0+ZDXZutqN71Dvjzi7tUj4RnayuG2SqAapLXW+tDv3gVt3hmwYoEhV92YGxlb0igZDDy0nqT+6Th8BGvnoOY0u7c3GfwWr6wAA42aAGdJV753zo9zxG5zdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kVKvo+Zm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 52BE21A242D;
	Tue, 10 Mar 2026 17:33:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2848D60002;
	Tue, 10 Mar 2026 17:33:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE2C61036987B;
	Tue, 10 Mar 2026 18:33:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773163997; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QMk4xKL7rwkuDzgFTLggs6bTGets20VvaMmysYufXCE=;
	b=kVKvo+ZmV7YIFp+k4mo4GdYzH11QVgENz5yaPJhCW6d1hvMyvr7pvybDtMT2eGfWY2+aQu
	YJbwZs1Ro/7nShbvmvqB0h69b07vzVHxNgQtusxPxLNDYytA1PJbH06GcLkqbgzStTfIYe
	vPOPXjc9S70LSYK/dTB/OmX9lgesrcXOmePFF2Iu2gRehDgNuIzB15qqoBClvolIZkMLF3
	FyNDSzWPyYm07cQp4pNJOzMfUeKV/fEq7vj1JS8Cdvo4nOagL7HGA9uwDM+lS4HPk+2zbG
	kQYdOOL9hs9+j4nHWsrOFqFOsNpZYU3AHCWSwJ3fs9vo6oB5Wq+UentaTjN+xA==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: [PATCH 4/5] clk: renesas: r9a06g032: Introduce a helper to set rsten register
Date: Tue, 10 Mar 2026 18:32:45 +0100
Message-ID: <20260310173249.161354-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310173249.161354-1-herve.codina@bootlin.com>
References: <20260310173249.161354-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 8A0B8255A76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,glider.be,baylibre.com,gmail.com,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29139-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Action: no action

The rsten register is part of the system controller address range.

This register controls the reset sources allowed to reset the system.
Among them, watchdogs can be configured to be able to perform this
reset.

Introduce a new helper r9a06g032_sysctrl_enable_rst() in order to set
specific sources in the rsten register from the watchdog driver.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c        | 32 +++++++++++++++++++
 include/linux/soc/renesas/r9a06g032-sysctrl.h | 12 +++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 7407a4183a6c..517d46ff150e 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -705,6 +705,38 @@ int r9a06g032_sysctrl_set_dmamux(u32 mask, u32 val)
 }
 EXPORT_SYMBOL_GPL(r9a06g032_sysctrl_set_dmamux);
 
+int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src)
+{
+	unsigned long flags;
+	u32 rsten;
+	u32 val;
+
+	switch (rst_src) {
+	case R9A06G032_RST_WATCHDOG_CA7_0:
+		val = R9A06G032_SYSCTRL_WDA7RST_0;
+		break;
+
+	case R9A06G032_RST_WATCHDOG_CA7_1:
+		val = R9A06G032_SYSCTRL_WDA7RST_1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (!sysctrl_priv)
+		return -EPROBE_DEFER;
+
+	spin_lock_irqsave(&sysctrl_priv->lock, flags);
+
+	rsten = readl(sysctrl_priv->reg + R9A06G032_SYSCTRL_RSTEN);
+	writel(rsten | val, sysctrl_priv->reg + R9A06G032_SYSCTRL_RSTEN);
+
+	spin_unlock_irqrestore(&sysctrl_priv->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(r9a06g032_sysctrl_enable_rst);
+
 static void clk_rdesc_set(struct r9a06g032_priv *clocks,
 			  struct regbit rb, unsigned int on)
 {
diff --git a/include/linux/soc/renesas/r9a06g032-sysctrl.h b/include/linux/soc/renesas/r9a06g032-sysctrl.h
index 066dfb15cbdd..25542b49eb55 100644
--- a/include/linux/soc/renesas/r9a06g032-sysctrl.h
+++ b/include/linux/soc/renesas/r9a06g032-sysctrl.h
@@ -4,8 +4,20 @@
 
 #ifdef CONFIG_CLK_R9A06G032
 int r9a06g032_sysctrl_set_dmamux(u32 mask, u32 val);
+
+enum r9a06g032_sysctrl_rst_src {
+	R9A06G032_RST_WATCHDOG_CA7_0,
+	R9A06G032_RST_WATCHDOG_CA7_1,
+};
+
+int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src);
+
 #else
 static inline int r9a06g032_sysctrl_set_dmamux(u32 mask, u32 val) { return -ENODEV; }
+static inline int r9a06g032_sysctrl_enable_rst(enum r9a06g032_sysctrl_rst_src rst_src)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __LINUX_SOC_RENESAS_R9A06G032_SYSCTRL_H__ */
-- 
2.53.0


