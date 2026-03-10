Return-Path: <linux-renesas-soc+bounces-29140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGxNFz5WsGkJiQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 18:34:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C1C255A95
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 18:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3391130AEE5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 17:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BC83D8118;
	Tue, 10 Mar 2026 17:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xi0hJaKR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A363D8103
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773164004; cv=none; b=oFCVMYy8Ltg6Z2NW4Ri6jskkFgbQ1jcPbySAXWQRU3OBgXqWCgiroI1E1qs92fy0i0lV9pLgtTxRKSdFzbR12ZJEon4gprICzGprW2upBq1lFR4G/U751v6NmwnmlgfOiPQAaVU5ZYWcx4O0NkkH4+5b5FkSR8nxgRBk0U19aLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773164004; c=relaxed/simple;
	bh=1T6p5KsN1pwB4Ol/pVJRcapshgNGqQS39CqJTyy02ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxDK4x0iLonEzW8moYfQ0eTC1ye/rHpeIQZsNWi5FVU0NmeAUFsY2kSQ2U/5eBl1X5EeSK4AEfnXQGHubhh23ErSpWtfGB1zr1j6/k+FuEliC65FB/iPFBYqDnNcPaH/iUVJtN42k7Yl9n2d6bHKWItxDlQFkttbIPQ4/pOTYWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xi0hJaKR; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 97172C143E9;
	Tue, 10 Mar 2026 17:33:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B207B60002;
	Tue, 10 Mar 2026 17:33:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49381103698A1;
	Tue, 10 Mar 2026 18:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773164000; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=J9cp/78Fdro1XhRiY6Ly7bl3/c4mvPbQyBM9B+ojKn8=;
	b=xi0hJaKRKzm5xF49hPsj8rlOmQqoFdCP4Q6LjhoI7YvQHmDUZE4aNTDfxDnV2px4Q4BVeE
	NNVsZ3Hb+rgMIafsSchpXwnrV4/hzJWRwkutQe8AwPON0Pv6j8yW0A7bjgmDktTQ0xwZ9V
	1usfhYsfg+CH1g5ELzodj6PtCYdkljsGWjiRuZFnK3K4A4CfFbyRb86YLVRphy+pEoWty0
	eHyfAbvxakggqxX/AVEW3xd8AUC5KQENP/0jEeOKsPe94w6mh6XA5CC/2RzIv+OoVXJseq
	N5S6dbGwy/gQmusDcHAOh7sW0wForrQoZVon9slnB/oFbrNg4ytVqyhaygvdSg==
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
Subject: [PATCH 5/5] watchdog: rzn1: Add support for direct hardware reset
Date: Tue, 10 Mar 2026 18:32:46 +0100
Message-ID: <20260310173249.161354-6-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: C9C1C255A95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,glider.be,baylibre.com,gmail.com,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29140-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Action: no action

The watchdog timeout is signaled using an interrupt and, on this
interrupt, a software initiated reset is performed.

The watchdog is able to control directly the hardware reset without
any operation done by the interrupt handler. This feature allows the
watchdog to not depend on the software to reset the system when the
watchdog timeout occurs.

The 'renesas,reset-line' device-tree property has been recently
introduced in order to describe the hardware reset line used by the
watchdog on its timeout.

Handle this property in the driver and add support for the related
direct hardware reset.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
 drivers/watchdog/rzn1_wdt.c | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
index 98978b5cc5b4..bf623ea31be1 100644
--- a/drivers/watchdog/rzn1_wdt.c
+++ b/drivers/watchdog/rzn1_wdt.c
@@ -17,7 +17,9 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
+#include <linux/soc/renesas/r9a06g032-sysctrl.h>
 #include <linux/watchdog.h>
+#include <dt-bindings/watchdog/renesas,rzn1-wdt.h>
 
 #define DEFAULT_TIMEOUT		60
 
@@ -98,6 +100,41 @@ static const struct watchdog_ops rzn1_wdt_ops = {
 	.ping = rzn1_wdt_ping,
 };
 
+static int rzn1_wdt_setup_rst_line(struct device *dev)
+{
+	enum r9a06g032_sysctrl_rst_src rst_src;
+	u32 reset_line;
+	int ret;
+
+	ret = of_property_read_u32(dev->of_node, "renesas,reset-line", &reset_line);
+	if (ret) {
+		if (ret == -EINVAL)
+			return 0; /* Property not present -> Ok, nothing to do */
+
+		return dev_err_probe(dev, ret, "Read 'renesas,reset-line' failed\n");
+	}
+
+	switch (reset_line) {
+	case RZN1_WDT_A7_0:
+		rst_src = R9A06G032_RST_WATCHDOG_CA7_0;
+		break;
+	case RZN1_WDT_A7_1:
+		rst_src = R9A06G032_RST_WATCHDOG_CA7_1;
+		break;
+
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "Invalid 'renesas,reset-line' (%u)\n",
+				     reset_line);
+	}
+
+	ret = r9a06g032_sysctrl_enable_rst(rst_src);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable reset\n");
+
+	return 0;
+}
+
 static int rzn1_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -116,6 +153,10 @@ static int rzn1_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
+	ret = rzn1_wdt_setup_rst_line(dev);
+	if (ret)
+		return ret;
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
-- 
2.53.0


